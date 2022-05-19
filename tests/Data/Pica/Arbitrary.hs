module Data.Pica.Arbitrary () where

import Data.Pica.Types (SubfieldCode (..), SubfieldValue (..))
import qualified Data.Text as T
import Test.QuickCheck

instance Arbitrary SubfieldValue where
  arbitrary = do
    t <- arbitrary `suchThat` (\s -> '\RS' `notElem` s && '\US' `notElem` s)
    return $ SubfieldValue $ T.pack t

instance Arbitrary SubfieldCode where
  arbitrary = do
    c <-
      -- The following frequency distribution is based on an evaluation
      -- of 36,004,180 PICA+ record of the German National Library (DNB).
      frequency
        [ (906253807, return 'a'),
          (667064726, return '0'),
          (257368148, return 'b'),
          (88113262, return 't'),
          (84626978, return 'd'),
          (77701657, return '9'),
          (70031802, return 'e'),
          (69065585, return '4'),
          (61328378, return 'A'),
          (54838520, return 'x'),
          (54272758, return 'D'),
          (53994225, return '7'),
          (53342833, return 'V'),
          (53122587, return 'E'),
          (52560961, return 'H'),
          (51481491, return 'S'),
          (46754544, return 'g'),
          (43042661, return 'B'),
          (39457210, return 'c'),
          (34489490, return 'h'),
          (27377425, return 'f'),
          (25957448, return 'n'),
          (24677143, return 'p'),
          (20875688, return 'K'),
          (19484506, return 'L'),
          (18770595, return 'j'),
          (18589996, return 'm'),
          (17466569, return 'u'),
          (16589916, return 'Y'),
          (16248510, return '5'),
          (14563958, return 'r'),
          (13636217, return '6'),
          (13008440, return 'i'),
          (11690761, return 'v'),
          (11415175, return 'I'),
          (10830922, return 'T'),
          (10254059, return 'G'),
          (10103239, return 'l'),
          (8087233, return 'q'),
          (8048346, return 'F'),
          (7251404, return 'Z'),
          (6592821, return 'z'),
          (5231486, return 'o'),
          (4245083, return 'k'),
          (4048000, return 'y'),
          (3974880, return 'J'),
          (3491921, return 'N'),
          (2737530, return 'O'),
          (2479479, return 'M'),
          (1590378, return '2'),
          (1476197, return 's'),
          (1461367, return 'R'),
          (1331980, return 'P'),
          (734868, return 'U'),
          (472791, return 'X'),
          (455203, return '3'),
          (21692, return 'w'),
          (20308, return 'Q'),
          (6698, return 'C'),
          (13, return '1'),
          (1, return '8'),
          (1, return 'W')
        ]
    return $ SubfieldCode c
