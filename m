Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7774CC35DEA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 02:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F3E21D7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 02:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W8zLvSMi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N6TqeEdB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F3E21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZwWhLgmU/eF3oA3m+NtWyXi/vvgpIH0th2YTaRte4k=; b=W8zLvSMiFtPvCW
	gjyNysV7Uir+bi5ZOatYXlKw2FWkQE32MWVNR7ayL0vpQzj04XQKUHEoUJoazY6/S9zfsYEPPrApN
	zyESA+ROGCUnFdA5NSiQDmPIbWJAzynY+lZZuz9zzysiJtn6wn/yqDOmpdwnCtZ2W5xP+plEQtWIn
	ltq+/Egoqksy7KP0f1fXBqKLJuGwpuTQQlj2jtfPFGOS1eBlZBn58Deje9N6Xo4Cn0zcp8P0QNUps
	zQZE0Ee6mmTa9XLJn/YhTKiMGy/YBP6M3LLQMeDxhuzmTvv+QtF5t5vuJAVu4fERq954+c8sO6cMR
	mLn5k+TSUrwpWlTK0Osg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Plq-00016C-EC; Tue, 25 Feb 2020 02:16:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6PlN-0000YQ-68; Tue, 25 Feb 2020 02:15:58 +0000
X-UUID: eed7656bb2d2434d84ea8e692ce3671f-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1GkVtHnMOGUYvyU+Z3t+4TNCCd4NtYShAbetZq0c0zI=; 
 b=N6TqeEdBXrovHIN7+j91FZa6eCDCfPzFxjj85Io9UsSEone8wwmr4rexgCHVBqGTeHxPSxZ4A2q0Uo/o5b+gKvbT2zyBDJgL3NSn0MGC9/w0lXFuycanSgMEyvzudSM7ySzB0gEyacePOsanixfh4zJjbrUCaMFrp5vLhitmIQk=;
X-UUID: eed7656bb2d2434d84ea8e692ce3671f-20200224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 580559400; Mon, 24 Feb 2020 18:15:53 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 18:05:51 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 10:04:28 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 10:04:30 +0800
Message-ID: <1582596343.12484.6.camel@mszsdaap41>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Tue, 25 Feb 2020 10:05:43 +0800
In-Reply-To: <1582533982.12922.5.camel@mtksdaap41>
References: <20200221112828.55837-1-jitao.shi@mediatek.com>
 <20200221112828.55837-2-jitao.shi@mediatek.com>
 <1582533982.12922.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DF4CC5F84BD1563D748466E071B8B5DE1401EC4BA0F4ADFB867FD7306FEC15252000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_181557_239849_401B165A 
X-CRM114-Status: GOOD (  17.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-02-24 at 16:46 +0800, CK Hu wrote:
> Hi, Jitao:
> 
> On Fri, 2020-02-21 at 19:28 +0800, Jitao Shi wrote:
> > Add decriptions about supported chips, including MT2701 & MT8173 &
> > mt8183
> > 
> > 1. Add more chips support. ex. MT2701 & MT8173 & MT8183
> > 2. Add property "dpi_pin_mode_swap" and "pinctrl-names" gpio mode dpi mode and
> >    gpio oupput-low to avoid leakage current.
> > 3. Add property "dpi_dual_edge" to config the dpi pin output mode dual edge or
> >    single edge sample data.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,dpi.txt        | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > index b6a7e7397b8b..cd6a1469c8b7 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > @@ -7,6 +7,7 @@ output bus.
> >  
> >  Required properties:
> >  - compatible: "mediatek,<chip>-dpi"
> > +  the supported chips are mt2701 , mt8173 and mt8183.
> >  - reg: Physical base address and length of the controller's registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> > @@ -16,6 +17,11 @@ Required properties:
> >    Documentation/devicetree/bindings/graph.txt. This port should be connected
> >    to the input port of an attached HDMI or LVDS encoder chip.
> >  
> > +Optional properties:
> > +- dpi_pin_mode_swap: Swap the pin mode between dpi mode and gpio mode.
> > +- pinctrl-names: Contain "gpiomode" and "dpimode".
> > +- dpi_dual_edge: Control the RGB 24bit data on 12 pins or 24 pins.
> 
> I've find that in [1], there are already a property of "pclk-sample"
> which like this, but it only have rising (1) or falling (0) status. Does
> that property describe the same thing with this property? If they are
> the same, I think you should add new state, dual (2), for "pclk-sample".
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/video-interfaces.txt?h=v5.6-rc3
> 
> Regards,
> CK
> 

pclk-sample has two properties  rising or falling.
It means to sample on rising or falling edge.

But, dpi_dual_edge means to sample on both rising and falling edge.

Best Regards
Jitao
> > +
> >  Example:
> >  
> >  dpi0: dpi@1401d000 {
> > @@ -26,6 +32,11 @@ dpi0: dpi@1401d000 {
> >  		 <&mmsys CLK_MM_DPI_ENGINE>,
> >  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
> >  	clock-names = "pixel", "engine", "pll";
> > +	dpi_dual_edge;
> > +	dpi_pin_mode_swap;
> > +	pinctrl-names = "gpiomode", "dpimode";
> > +	pinctrl-0 = <&dpi_pin_gpio>;
> > +	pinctrl-1 = <&dpi_pin_func>;
> >  
> >  	port {
> >  		dpi0_out: endpoint {
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
