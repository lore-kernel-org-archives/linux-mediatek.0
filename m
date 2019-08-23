From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 5/5] pinctrl: mediatek: Add support for pin
 configuration dump via sysfs.
Date: Fri, 23 Aug 2019 09:52:37 +0200
Message-ID: <CACRpkdbpsK08mYX_M5vvaExR2HCa8ct16zC92euLJzewYEDG-Q@mail.gmail.com>
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com> <1565686400-5711-6-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565686400-5711-6-git-send-email-light.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Light Hsieh <light.hsieh@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Light,

thanks for your patch!

On Tue, Aug 13, 2019 at 10:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> Add support for pin configuration dump via catting
> /sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.

This is debugfs so rename the subject "*debugfs"

> pinctrl framework had already support such dump. This patch implement the
> operation function pointer to fullfill this dump.

Fair enough, that's fine.

> Change-Id: Ib59212eb47febcd84140cbf84e1bd7286769beb0

This has been remarked on before.

This patch is missing your Signed-off-by, please fix that.

Yours,
Linus Walleij
