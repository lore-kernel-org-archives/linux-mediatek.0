From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] Improve MediaTek pinctrl v2 and make backward
 compatible to smartphone mass production usage
Date: Fri, 23 Aug 2019 09:50:38 +0200
Message-ID: <CACRpkdY0+eQXknPPj2vz9-Zo9cQHJQafbUC97mOQvEuzbX-qtw@mail.gmail.com>
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Aug 13, 2019 at 10:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> This patch improves MediaTek pinctrl v2 and makes backward compatible to
> current smartphone mass production usage by:
> 1.Check gpio pin number and use binary search in control address lookup
> 2.Supporting driving setting without mapping current to register value
> 3.Correct usage of PIN_CONFIG get/set implementation

I rely on Sean to review and get this in shape.

> 4.Backward compatible to previous Mediatek's bias-pull usage

This is fine as long as the new style of using explicit pull
setting also works. It's nice to be compatible.

> 5.Add support for pin configuration dump via sysfs

Do you mean debugfs? You should use debugfs for debug.
sysfs is subject to ABI rules.

Yours,
Linus Walleij
