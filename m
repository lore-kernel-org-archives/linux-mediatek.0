From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 0/2] pinctrl: mediatek: add setting for gpio and eint
Date: Wed, 17 Feb 2016 03:16:32 +0800
Message-ID: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

1. add input-enable setting in gpio_request_enable.
2. add input-enable and direction setting for eint resources.

Biao Huang (2):
  pinctrl: mediatek: add input-enable setting in gpio_request_enable
  pinctrl: mediatek: add input-enable and direction setting for eint
    resources

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.9.5

