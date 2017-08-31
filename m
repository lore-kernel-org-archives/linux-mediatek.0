From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: update PCIe mux data for MT7623
Date: Thu, 31 Aug 2017 09:11:11 +0200
Message-ID: <CACRpkdY6kiPRC9tD3joNwdcj63La06eKnFe_D7s4bpP4a=CO5w@mail.gmail.com>
References: <ddbc91742005abfc9083876fb976ecc511be98fd.1503026874.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <ddbc91742005abfc9083876fb976ecc511be98fd.1503026874.git.ryder.lee@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 18, 2017 at 5:48 AM, Ryder Lee <ryder.lee@mediatek.com> wrote:

> MT2701 shares the same driver with MT7623, but there is a slight difference
> between their pin functions (e.g., PCIe), so we update the different parts
> in pinmux table.
>
> Doing so, SoC could choose the correct mux setting via their own pinfun.h.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> CC: Biao Huang <biao.huang@mediatek.com>

No reaction in 13 days from any maintainer.
Patch applied.

Yours,
Linus Walleij
