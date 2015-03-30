From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3] Mediatek PMIC wrapper support
Date: Mon, 30 Mar 2015 12:25:16 +0200
Message-ID: <CABuKBeLYQjx1+1=EnAN+MLQt4pxnfnezJTsHbC1pFDJkw2Mggw@mail.gmail.com>
References: <1426587274-7810-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426587274-7810-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>, YH Chen <yh.chen@mediatek.com>, =Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

2015-03-17 11:14 GMT+01:00 Sascha Hauer <s.hauer@pengutronix.de>:
> This series adds support for the PMIC wrapper found on MT8135 and
> MT8173 SoCs. This has been sent several times already as part of
> different series, this time broken out as a series only containing
> the wrapper code. No further compile time dependencies.

Applied , thank you.

>
> Changes since v2:
>
> - remove stray debug printk
> - change MODULE_LICENSE to GPL v2 as stated in the header
>
> Changes since v1:
>
> - Remove #define DEBUG
> - Remove PMIC specific register writes
> - Mention other SoCs which contain a PMIC wrapper aswell
>
> Sascha
>



-- 
motzblog.wordpress.com
