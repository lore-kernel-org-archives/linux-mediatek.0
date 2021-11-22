Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1503C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcFIVKoA/0tKHx+IyENzmbrCxfHkkM0EqOhFVbUpzsA=; b=IxWy5aLHhoI8m/
	ur0le3twG99RsZr+ZrPlDRUWxSWOJKHnK2SqBJpfUpw4LzAmlRzXON3h50CuCwdzshr4bM5Y7lWtC
	lS0G5JpEQtZZDI0sbTeV2V5Iy4yl2Oy4qUMgHsYTt4NBq+N59sSk73emSrDzVhrmwkGVoy/2y3TIz
	zegpR6bL/cW+qk0x04UUhk6RgT313nqWAAa0Y/nM+T3daZad19PdRJcInG/vzhpPiqqRriuFk00XF
	5zGtkDXMLTdubsYpWvMJ7YBfXQSajDe9z5BmNRUL4l+rojs24nzZOeJTIGFOnGRhbUqy/EfOzZUig
	saoZA6DeVupLoF05Ma4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8se-00GWYc-MW; Mon, 22 Nov 2021 12:57:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8ir-00GS8V-Pk; Mon, 22 Nov 2021 12:47:03 +0000
X-UUID: 41c76210380f493b9ea7eb15a5a84920-20211122
X-UUID: 41c76210380f493b9ea7eb15a5a84920-20211122
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 643103107; Mon, 22 Nov 2021 05:46:58 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 04:46:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 22 Nov 2021 20:46:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Nov 2021 20:46:49 +0800
Message-ID: <cc6e73ba980ee13f8ab29862140d0bfe44ed9d7f.camel@mediatek.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: mediatek: add basic mt7986a support
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Enric Balletbo i
 Serra" <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Date: Mon, 22 Nov 2021 20:46:49 +0800
In-Reply-To: <a4605e32-3af3-5636-6682-475bef8448d1@gmail.com>
References: <20211018114009.13350-1-sam.shih@mediatek.com>
 <20211018114009.13350-3-sam.shih@mediatek.com>
 <d411aec5-efa8-c71d-8179-54ff52c17039@gmail.com>
 <d299493d8fec0f34f527942f2cdedf15f2136c9a.camel@mediatek.com>
 <c5c0849d-a95a-25a0-11f8-9156770afc10@gmail.com>
 <59963509ec833009f5c10f0a1aee91670224c6c7.camel@mediatek.com>
 <a4605e32-3af3-5636-6682-475bef8448d1@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_044701_914393_066F6C23 
X-CRM114-Status: GOOD (  43.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, 2021-11-19 at 11:31 +0100, Matthias Brugger wrote:
> 	
> 
> On 18/11/2021 04:48, Sam Shih wrote:
> > Hi
> > 
> > On Tue, 2021-11-16 at 12:18 +0100, Matthias Brugger wrote:
> > > 
> > > On 16/11/2021 02:39, Sam Shih wrote:
> > > > Hi,
> > > > 
> > > > On Mon, 2021-11-15 at 17:27 +0100, Matthias Brugger wrote:
> > > > > Hi,
> > > > > 
> > > > > On 18/10/2021 13:40, Sam Shih wrote:
> > > > > > Add basic chip support for Mediatek mt7986a, include
> > > > > > basic uart nodes, rng node and watchdog node.
> > > > > > 
> > > > > > Add cpu node, timer node, gic node, psci and reserved-
> > > > > > memory
> > > > > > node
> > > > > > for ARM Trusted Firmware.
> > > > > > 
> > > > > 
> > > > > What is the exact difference between mt7986a and mt7986b?
> > > > > Right
> > > > > now,
> > > > > it's only
> > > > > the compatible, for that it makes no sense to split them.
> > > > > 
> > > > 
> > > > The difference between mt7986a and mt7986b is pinout which
> > > > described
> > > > in our pinctrl patch series
> > > > 
> > 
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20211022124036.5291-3-sam.shih@mediatek.com/__;!!CTRNKA9wMg0ARbw!0kseU8x1KnHHXDErh6Yj6MKqecufPEfGyeumtTBism47e99UFO2Gs-HfWjL1_jUv$
> > > >   
> > > > 
> > > > You are right, in this "basic SoC support" patch series, only
> > > > show
> > > > compatible differences
> > > > 
> > > > > It would be good to see what the exact differences are, so
> > > > > that
> > > > > we
> > > > > can see if it
> > > > > makes sense to have one of the alternatives:
> > > > > 1) use a common mt7986.dtsi which get included by
> > > > > mt7986[a,b].dtsi
> > > > > 2) Use on mt7986.dtsi and only add one mt7986a.dtsi or
> > > > > mt7986b.dtsi
> > > > > which has
> > > > > add-ons.
> > > > > 
> > > > 
> > > > In this case, can we use solution (1) to create a generic
> > > > mt7986.dtsi
> > > > in this patch series, and add mt7986[a,b].dtsi to the dts part
> > > > of
> > > > the
> > > > pinctrl patch series to separate the difference nodes?
> > > > 
> > > 
> > > If the only difference is the GPIO controller then why not go
> > > with
> > > solution 2.
> > > Create a mt7986.dtsi which holds e.g. the node for pincontroller
> > > mt7986a and
> > > then create a mt7986b.dtsi that just changes compatible and gpio-
> > > ranges:
> > > 
> > > &pio {
> > >      compatible = "mediatek,mt7986b-pinctrl";
> > >      gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
> > > }
> > > 
> > > What do you think?
> > 
> > Ok,
> > 
> > For this basic patch series DTS, I will send the next version:
> > - Use "mt7986.dtsi" instead of "mt7986[a,b].dtsi",
> >    And make"mt7986.dtsi" get included by "mt7986[a,b]-rfb.dts"
> >    (No dedicated uart1/uart2 pinout for mt7986b-rfb, status of dts
> > node
> > shoud be set to "disabled")
> > 
> > 
> > For the pinctrl patch series DTS, I will send th next version:
> > - Add "mt7986b.dtsi" according to your suggestion,
> >    the new include
> > chain will be:
> >    mt7986a-rfb.dts <-- mt7986.dtsi (mt7986a pinctrl)
> >   
> > mt7986b-rfb.dts <-- mt7986b.dtsi (mt7986b pinctrl) <-- mt7986.dtsi
> > (mt7986a pinctrl)
> > 
> > Do you agree above proposal?
> > 
> 
> I mean something like this:
> mt7986a.dtsi:
> pio: pinctrl@1001f000 {
> 	compatible = "mediatek,mt7986a-pinctrl";
> 	reg = <0 0x1001f000 0 0x1000>,
> 	      <0 0x11c30000 0 0x1000>,
> 	      <0 0x11c40000 0 0x1000>,
> 	      <0 0x11e20000 0 0x1000>,
> 	      <0 0x11e30000 0 0x1000>,
> 	      <0 0x11f00000 0 0x1000>,
> 	      <0 0x11f10000 0 0x1000>,
> 	      <0 0x1000b000 0 0x1000>;
> 	reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
> 		    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
> 	gpio-controller;
> 	#gpio-cells = <2>;
> 	gpio-ranges = <&pio 0 0 100>;
> 	interrupt-controller;
> 	interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> 	interrupt-parent = <&gic>;
> 	#interrupt-cells = <2>;
> };
> 
> mt7986b.dtsi:
> #include "mt7986a.dtsi"
> 
> &pio {
>       compatible = "mediatek,mt7986b-pinctrl";
>       gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
> }
> 
> mt7986b-rfb.dts:
> #include "mt7986b.dtsi"
> 
> &pio {
> 	uart1_pins: uart1-pins {
> 		mux { [...]
> 
> 
> mt7986a-rfb.dts:
> #include "mt7986a.dtsi"
> 
> &pio {
> 	uart1_pins: uart1-pins {
> 		mux { [...]
> 
> 
> Makes sense?
> 

Okay,

I have sent new patch set based on your suggestion,

Basic Part:

https://lore.kernel.org/all/20211122123222.8016-1-sam.shih@mediatek.com/

Pinctrl:

https://lore.kernel.org/all/20211122123552.8218-1-sam.shih@mediatek.com/

Please take a look at those patches when you are free.

Regards,
Sam

> Regards,
> Matthias
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
