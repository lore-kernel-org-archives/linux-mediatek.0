From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
Date: Thu, 12 Sep 2019 14:43:04 +0100
Message-ID: <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com> <1567663210.1324.3.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567663210.1324.3.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> v2 is the same as v1 except that commit message is corrected according
> to Linus' comment for v1:
>
> 1. remove Change-Id lines
> 2. correct sysfs as debugfs

Patches applied with Sean's ACK.

Yours,
Linus Walleij
