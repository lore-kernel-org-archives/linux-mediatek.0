From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] soc: mediatek: Drop owner assignment from platform_driver
Date: Fri, 10 Jul 2015 16:39:41 +0200
Message-ID: <2465585.M6dBSSGdRG@ubix>
References: <1436509789-27361-1-git-send-email-k.kozlowski@samsung.com> <20150710071524.GW18700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150710071524.GW18700@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Friday, July 10, 2015 09:15:24 AM Sascha Hauer wrote:
> On Fri, Jul 10, 2015 at 03:29:45PM +0900, Krzysztof Kozlowski wrote:
> > platform_driver does not need to set an owner because
> > platform_driver_register() will set it.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> 

applied, thanks.
