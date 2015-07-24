From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH v4] regulator: mt6311: Add support for MT6311 regulator
Date: Fri, 24 Jul 2015 13:24:39 +0800
Message-ID: <1437715481-31528-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, henryc.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch set adds support for the MediaTek PMIC mt6311 regulator driver,
 which adds mt6311 related buck/ldo voltage data to the driver, and 
creates the regulator_desc table.

Changes in v4:
- Removed the unnscessary check before return on mt6311_i2c_probe().
- Change the label on mt6311-regulator.txt.

Changes in v3:
- Removed the struct mt6311 since the members of mt6311 were not be necessary.

Changes in v2:
- Re-ordered the sequence of makefile and Kconfig.
- Specifying the regulator DT bindings by providing of_match and regulators_node in the regulator_desc and delete the DT handling code.

Henry Chen (2):
  dt-bindings: regulator: mt6311: Add document for mt6311 regulator
  regulator: mt6311: Add support for mt6311 regulator

 .../bindings/regulator/mt6311-regulator.txt        |  35 ++++
 drivers/regulator/Kconfig                          |   9 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6311-regulator.c               | 180 +++++++++++++++++++++
 drivers/regulator/mt6311-regulator.h               |  65 ++++++++
 include/linux/regulator/mt6311.h                   |  29 ++++
 6 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
 create mode 100644 drivers/regulator/mt6311-regulator.c
 create mode 100644 drivers/regulator/mt6311-regulator.h
 create mode 100644 include/linux/regulator/mt6311.h

-- 
1.8.1.1.dirty
