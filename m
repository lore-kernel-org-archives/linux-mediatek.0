Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CEEC43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB430222BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M84FJIXV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tBIcmgqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB430222BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xsk2feMz5aJrG8ueZRrhjJsTbGtDxKhwc2jc/tIqfhg=; b=M84FJIXV5BdrAo
	5dnnWL34RzIgyoaw/ly4tn9T7jKqREBPGhf2FSUIW9zNdPZrRW3B81OJubJkAWftJ1BOdaOHIUYJN
	iAtxp+P9d+ZcOD5R6MmkXjDIntZANAo0stwaHpOhnqM+S+qWFflJ446O/kCO+ZDGu1FyyefW1SPjh
	t4HM/natp2MKbXu1Umr87Hgd0ikLiRjy+0pA+l9D0+yIZeTa72o2Bbc8TRn/mNzY4CfL3DBlxYkHR
	y6s2lzjhSxrt8UAVQKflKrmxI/gyS7ua5qqWxiBgsjBHSkJrjOnSu+cQB7/No72nSF8qCCXn1suf0
	Ypvd9Fr3sAspxQHZHwwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUjAw-0003M8-Ab; Wed, 13 Nov 2019 03:18:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUjAs-0003Li-QJ; Wed, 13 Nov 2019 03:18:32 +0000
X-UUID: e6c6cea4ddbd4e33b6951a39a34f3eb3-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1PTVv09MJjB2RKE9rgKvj5d7tEfBX8IFX331P3cJgFc=; 
 b=tBIcmgqJaEc0Gy26g3KLy0gQtohKXEKRom3/g+Edm/Ie2VO3BLK2COJ9RlKUSFsqweK4K62avpFgM65cOd0OcfpKib4KHzGpCJFiRIySqssgyfIsxz62ZfmtmrjWWqA1mI4+CW4C+EBQsfqDt45Lz7FDtXggpJ5pBMlUC9dUA8Q=;
X-UUID: e6c6cea4ddbd4e33b6951a39a34f3eb3-20191112
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1532790040; Tue, 12 Nov 2019 19:18:24 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 19:18:24 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 13 Nov 2019 11:18:21 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 13 Nov 2019 11:18:21 +0800
Message-ID: <1573615102.7173.9.camel@mhfsdcap03>
Subject: Re: [PATCH v4 11/11] arm64: dts: mt2712: use non-empty ranges for
 usb-phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 13 Nov 2019 11:18:22 +0800
In-Reply-To: <c23531cd-432d-1857-1e99-48d87956338e@gmail.com>
References: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573547796-29566-11-git-send-email-chunfeng.yun@mediatek.com>
 <c23531cd-432d-1857-1e99-48d87956338e@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A04EC74D93A3F15A39E1C1ED84053571B8EBB86F8A73CC07646E046490CADBC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_191830_859181_EEBA29D7 
X-CRM114-Status: GOOD (  14.85  )
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
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2019-11-12 at 14:12 +0100, Matthias Brugger wrote:
> 
> On 12/11/2019 09:36, Chunfeng Yun wrote:
> > Use non-empty ranges for usb-phy to make the layout of
> > its registers clearer;
> > Replace deprecated compatible by generic
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v3~v4: no changes
> > 
> > v2: use generic compatible
> > ---
> >  arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 42 ++++++++++++-----------
> >  1 file changed, 22 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > index 43307bad3f0d..e24f2f2f6004 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> > @@ -697,30 +697,31 @@
> >  	};
> >  
> >  	u3phy0: usb-phy@11290000 {
> > -		compatible = "mediatek,mt2712-u3phy";
> > -		#address-cells = <2>;
> > -		#size-cells = <2>;
> > -		ranges;
> > +		compatible = "mediatek,mt2712-tphy",
> > +			     "mediatek,generic-tphy-v2";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> 
> At a first glance I don't understand why you change address and size cells.
> Commit message doesn't explain it and AFAIS it's not part of the binding changes.
When Ryder sent DTS patch for mt7629, Rob suggested to use 1 cell,
non-empty ranges and provide the offset for v2 tphy which hasn't shared
registers between sub-phys, it'll make layout more clear.

See: https://patchwork.kernel.org/patch/10850925/


> 
> Can you explain why we need that, and update the commit message accordingly?

Just want to take it as an example when support other platforms.

> 
> Regrads,
> Matthias
> 
> > +		ranges = <0 0 0x11290000 0x9000>;
> >  		status = "okay";
> >  
> > -		u2port0: usb-phy@11290000 {
> > -			reg = <0 0x11290000 0 0x700>;
> > +		u2port0: usb-phy@0 {
> > +			reg = <0x0 0x700>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> >  			status = "okay";
> >  		};
> >  
> > -		u2port1: usb-phy@11298000 {
> > -			reg = <0 0x11298000 0 0x700>;
> > +		u2port1: usb-phy@8000 {
> > +			reg = <0x8000 0x700>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> >  			status = "okay";
> >  		};
> >  
> > -		u3port0: usb-phy@11298700 {
> > -			reg = <0 0x11298700 0 0x900>;
> > +		u3port0: usb-phy@8700 {
> > +			reg = <0x8700 0x900>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> > @@ -760,30 +761,31 @@
> >  	};
> >  
> >  	u3phy1: usb-phy@112e0000 {
> > -		compatible = "mediatek,mt2712-u3phy";
> > -		#address-cells = <2>;
> > -		#size-cells = <2>;
> > -		ranges;
> > +		compatible = "mediatek,mt2712-tphy",
> > +			     "mediatek,generic-tphy-v2";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0 0x112e0000 0x9000>;
> >  		status = "okay";
> >  
> > -		u2port2: usb-phy@112e0000 {
> > -			reg = <0 0x112e0000 0 0x700>;
> > +		u2port2: usb-phy@0 {
> > +			reg = <0x0 0x700>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> >  			status = "okay";
> >  		};
> >  
> > -		u2port3: usb-phy@112e8000 {
> > -			reg = <0 0x112e8000 0 0x700>;
> > +		u2port3: usb-phy@8000 {
> > +			reg = <0x8000 0x700>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> >  			status = "okay";
> >  		};
> >  
> > -		u3port1: usb-phy@112e8700 {
> > -			reg = <0 0x112e8700 0 0x900>;
> > +		u3port1: usb-phy@8700 {
> > +			reg = <0x8700 0x900>;
> >  			clocks = <&clk26m>;
> >  			clock-names = "ref";
> >  			#phy-cells = <1>;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
