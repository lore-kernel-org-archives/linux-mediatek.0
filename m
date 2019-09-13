From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
Date: Fri, 13 Sep 2019 14:40:19 +0200
Message-ID: <CACRpkdZSAMmiZ6thznAR3GFSw170fV5d2=VLrs63O41ZE+x+oA@mail.gmail.com>
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
 <1567663210.1324.3.camel@mtkswgap22> <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 12, 2019 at 3:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> > v2 is the same as v1 except that commit message is corrected according
> > to Linus' comment for v1:
> >
> > 1. remove Change-Id lines
> > 2. correct sysfs as debugfs
>
> Patches applied with Sean's ACK.

Pulled all patches out again because they don't compile. No big deal,
let's just rebase and fix it up,

Yours,
Linus Walleij
