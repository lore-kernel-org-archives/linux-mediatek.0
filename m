From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
Date: Wed, 11 Sep 2019 10:27:34 -0700
Message-ID: <CAGp9Lzqj_AwXL7r0nxh=9G5o7P4YNJaugCAm_ZpJyBoPZu9BtQ@mail.gmail.com>
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
 <1567663210.1324.3.camel@mtkswgap22> <CACRpkdY7Vpy-fBHSXnjby0kK_tDWBtZaCwjCGxFy4HWeJ1FgEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY7Vpy-fBHSXnjby0kK_tDWBtZaCwjCGxFy4HWeJ1FgEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Light Hsieh <light.hsieh@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Linus,

That looks OK to me too

Acked-by: Sean Wang <sean.wang@kernel.org>

On Wed, Sep 11, 2019 at 2:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> > v2 is the same as v1 except that commit message is corrected according
> > to Linus' comment for v1:
> >
> > 1. remove Change-Id lines
> > 2. correct sysfs as debugfs
>
> Looks OK to me, but i need Sean's review on this, Sean?
>
> Yours,
> Linus Walleij
