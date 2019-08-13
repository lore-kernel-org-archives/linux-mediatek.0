From: Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 0/5] Improve MediaTek pinctrl v2 and make backward compatible to smartphone mass production usage
Date: Tue, 13 Aug 2019 16:53:15 +0800
Message-ID: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sean.wang@kernel.org
List-Id: linux-mediatek@lists.infradead.org

This patch improves MediaTek pinctrl v2 and makes backward compatible to
current smartphone mass production usage by:
1.Check gpio pin number and use binary search in control address lookup
2.Supporting driving setting without mapping current to register value
3.Correct usage of PIN_CONFIG get/set implementation
4.Backward compatible to previous Mediatek's bias-pull usage
5.Add support for pin configuration dump via sysfs
