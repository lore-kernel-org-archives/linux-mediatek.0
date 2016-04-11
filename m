From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] phy: phy-mt65xx-usb3: add support for mt2701 platform
Date: Mon, 11 Apr 2016 10:34:16 +0800
Message-ID: <1460342056.10419.2.camel@mhfsdcap03>
References: <1460106832-25360-1-git-send-email-chunfeng.yun@mediatek.com>
	 <5707B8D3.4070605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5707B8D3.4070605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2016-04-08 at 15:57 +0200, Matthias Brugger wrote:
> 
> On 08/04/16 11:13, Chunfeng Yun wrote:
> > A new compatible string, "mediatek,mt2701-u3phy", is added.
> >
> > Some register settings to avoid RX sensitivity level degradation
> > which may arise on mt8173 platform are separated from other
> > platforms.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   .../devicetree/bindings/phy/phy-mt65xx-usb.txt     |    4 +-
> >   drivers/phy/Kconfig                                |    5 +-
> >   drivers/phy/phy-mt65xx-usb3.c                      |   77 +++++++++++++-------
> >   3 files changed, 57 insertions(+), 29 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > index 00100cf..8d2a62f 100644
> > --- a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > +++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > @@ -4,7 +4,9 @@ mt65xx USB3.0 PHY binding
> >   This binding describes a usb3.0 phy for mt65xx platforms of Medaitek SoC.
> >
> >   Required properties (controller (parent) node):
> > - - compatible	: should be "mediatek,mt8173-u3phy"
> > + - compatible	: should be one or more of
> 
> If there are more then one, which value will avoid_rx_sen_degradation 
> have? There should be only one compatible.
> 
You are right.
I will modify it later, thanks

> Apart from that normally the dts documentation parts are separate patches.
> 
> Regards,
> Matthias


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
