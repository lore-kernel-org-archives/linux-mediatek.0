From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: mediatek: add 6580 support
Date: Mon, 6 Jul 2015 08:53:15 +0800
Message-ID: <1436143995.15570.2.camel@mtkswgap22>
References: <1435647751-20422-1-git-send-email-mars.cheng@mediatek.com>
	 <1435647751-20422-3-git-send-email-mars.cheng@mediatek.com>
	 <1665353.lNSALdu3Cy@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1665353.lNSALdu3Cy@ubix>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: scott.shu@mediatek.com, cc.hwang@mediatek.com, linux-kernel@vger.kernel.org, jades.shih@mediatek.com, srv_wsdupstream@mediatek.com, miles.chen@mediatek.com, linux-mediatek@lists.infradead.org, my.chung@mediatek.com, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

> > Change-Id: Ic5c93eb5d1e6e23503dabd28d41c30a7f02e9c18
> 
> Please delete the change-id.

> > +	uart0: serial@11005000 {
> > +		compatible = "mediatek,mt6580-uart",
> > +			     "mediatek,mt6577-uart";
> 
> Please update the dts documentation about the compatible string.
> Apart from that it looks fine for me.
> 
I will fix these two and send another patch soon.

Thanks for comments.

> Cheers,
> Matthias
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
