From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 00/15] use devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 20:29:24 +0800
Message-ID: <20190904122939.23780-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: miquel.raynal@bootlin.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, mmayer@broadcom.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, matthias.bgg@gmail.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, marc.w.gonzalez@free.fr, mans@mansr.com, talel@amazon.com, jun.nie@linaro.org, shawnguo@kernel.org, phil@raspberrypi.org, yuehaibing@huawei.com, gregkh@linuxfoundation.org, david.hernandezsanchez@st.com, horms+renesas@verge.net.au, wsa+renesas@sang-engineering.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-mediatek@lists.infradead.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (15):
  thermal: armada: use devm_platform_ioremap_resource() to simplify code
  thermal: bcm2835: use devm_platform_ioremap_resource() to simplify
    code
  thermal: brcmstb: use devm_platform_ioremap_resource() to simplify
    code
  thermal: hisilicon: use devm_platform_ioremap_resource() to simplify
    code
  thermal: dove: use devm_platform_ioremap_resource() to simplify code
  thermal: mtk: use devm_platform_ioremap_resource() to simplify code
  thermal: kirkwood: use devm_platform_ioremap_resource() to simplify
    code
  thermal: tsens: use devm_platform_ioremap_resource() to simplify code
  thermal: rockchip: use devm_platform_ioremap_resource() to simplify
    code
  thermal: spear: use devm_platform_ioremap_resource() to simplify code
  thermal: stm32: use devm_platform_ioremap_resource() to simplify code
  thermal: tango: use devm_platform_ioremap_resource() to simplify code
  thermal: thermal_mmio: use devm_platform_ioremap_resource() to
    simplify code
  thermal: zx2967: use devm_platform_ioremap_resource() to simplify code
  thermal: rcar: use devm_platform_ioremap_resource() to simplify code

 drivers/thermal/armada_thermal.c           | 4 +---
 drivers/thermal/broadcom/bcm2835_thermal.c | 4 +---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +---
 drivers/thermal/dove_thermal.c             | 7 ++-----
 drivers/thermal/hisi_thermal.c             | 4 +---
 drivers/thermal/kirkwood_thermal.c         | 4 +---
 drivers/thermal/mtk_thermal.c              | 4 +---
 drivers/thermal/qcom/tsens-common.c        | 7 ++-----
 drivers/thermal/rcar_thermal.c             | 5 ++---
 drivers/thermal/rockchip_thermal.c         | 4 +---
 drivers/thermal/spear_thermal.c            | 4 +---
 drivers/thermal/st/stm_thermal.c           | 4 +---
 drivers/thermal/tango_thermal.c            | 4 +---
 drivers/thermal/thermal_mmio.c             | 4 +---
 drivers/thermal/zx2967_thermal.c           | 4 +---
 15 files changed, 18 insertions(+), 49 deletions(-)

-- 
2.7.4
