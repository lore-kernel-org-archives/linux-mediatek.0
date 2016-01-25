From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V3 00/11] soc: mediatek: PMIC wrap: add MT6323/2701/7623 support
Date: Mon, 25 Jan 2016 10:53:13 +0100
Message-ID: <1453715604-36856-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Changes in V3:
* I accidentially sent a V2 about 15 minutes ago. Unfortunatley the time
  inside the VM that i used was wrong and lagged by 6 days. V3 is the same
  as V2 but with the correct time.

Changes in V2:
* rebase the code on the MTK internal driver

John Crispin (11):
  dt-bindings: ARM: Mediatek: add MT2701/7623 string to the PMIC
    wrapper doc
  soc: mediatek: PMIC wrap: don't duplicate the wrapper data
  soc: mediatek: PMIC wrap: add wrapper callbacks for init_reg_clock
  soc: mediatek: PMIC wrap: split SoC specific init into callback
  soc: mediatek: PMIC wrap: WRAP_INT_EN needs a different bitmask for
    MT2701/7623
  soc: mediatek: PMIC wrap:: SPI_WRITE needs a different bitmask for
    MT2701/7623
  soc: mediatek: PMIC wrap: move wdt_src into the pmic_wrapper_type
    struct
  soc: mediatek: PMIC wrap: remove pwrap_is_mt8135() and
    pwrap_is_mt8173()
  soc: mediatek: PMIC wrap: add a slave specific struct
  soc: mediatek: PMIC wrap: add mt6323 slave support
  soc: mediatek: PMIC wrap: add MT2701/7623 support

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |    1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               |  560 +++++++++++++++-----
 2 files changed, 430 insertions(+), 131 deletions(-)

-- 
1.7.10.4
