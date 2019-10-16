From: Wen.Su@mediatek.com (Wen Su)
Date: Wed, 16 Oct 2019 17:39:42 +0800
Subject: [PATCH 0/4] Add Support for MediaTek PMIC MT6359 Regulator
List-Id: linux-mediatek@lists.infradead.org
Message-ID: <1571218786-15073-1-git-send-email-Wen.Su@mediatek.com>
To: linux-mediatek@lists.infradead.org

This patchset add support to MT6359 PMIC regulator. MT6359 is primary
PMIC for MT6779 platform.


wen.su (4):
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add for PMIC MT6359 registers definition
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../bindings/regulator/mt6359-regulator.txt        |  59 ++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           | 312 ++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6359-regulator.c               | 859 +++++++++++++++++++++
 include/linux/mfd/mt6359/registers.h               | 531 +++++++++++++
 include/linux/regulator/mt6359-regulator.h         |  58 ++
 7 files changed, 1829 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
1.9.1
