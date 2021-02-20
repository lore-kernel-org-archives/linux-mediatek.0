Return-Path: <SRS0=RVxU=HW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Feb 2021 06:33:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E167064E92
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Feb 2021 06:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E167064E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vblP6jM5fge/5Anv8XRbg1oivjzctOwbLfTBzmwJEqw=; b=AK1fwx3OXn9m81Ej49ZDU7OT4
	XIWh+35W8wm0hPC6EJrIjjcid0gr2wSW+8iQFWzm5OC1M7nGtCptAlduLSRh2zf4RSBvjbWvh+E1r
	kM7XuOgMZkFq+d08WUI6iGxWGzP04hoQwKYFahOegkqFMeZv7fhn+JbVXuaij7Jvxshj2Wz0pRHVM
	cAXD6cUidimxte0JHlzD9lJABU2C22Ubu5Dw2PXOSUO5po6qIvkW4m97xO/Zn4YfOMpNySSTU7OFU
	EYQ4nZhaEV3iuKYLsmlmdYydq6e6bPUwvUumJ7eiqDoWoyBWTvWpWZ/yvZTZubNWzWV0zQY349gv1
	YNcytMQwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDLpl-00066l-7v; Sat, 20 Feb 2021 06:33:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDLpi-00065w-9u; Sat, 20 Feb 2021 06:33:39 +0000
X-UUID: 43ad3b883b074d30b1c378ce8024eca1-20210219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vNvKWXaLVsNfYfp/yjKIyUMJfnM46rdL37hgDLSjDWA=; 
 b=hV8W1oh70kGIKWw8nlqIbK8ZHfazWdKPwyvGT/KifxUI5uTjHVmMadmEQglX1UuH9b8nd/ZG/41hXG4or9Fv9Q81oJPX2QQz7wyLOpO36xHsZuubyeeY2Co5dLYqGYPnQWgURdNP2xN4oaowary3XZWJox4c8zoU8ER5mt2h9wY=;
X-UUID: 43ad3b883b074d30b1c378ce8024eca1-20210219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 910580220; Fri, 19 Feb 2021 22:33:35 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 22:33:33 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 20 Feb 2021 14:33:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Feb 2021 14:33:23 +0800
Message-ID: <1613802803.896.8.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 20 Feb 2021 14:33:23 +0800
In-Reply-To: <20210209155350.GA3827709@robh.at.kernel.org>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
 <20210209155350.GA3827709@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 85AA0E7ED4C3C79C25C20767B9DC4302CF53518326B6918097B00A7D2E041E9B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_013338_590476_EB37A5CF 
X-CRM114-Status: GOOD (  22.47  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, Tomasz
 Figa <tfiga@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Maoguang Meng <maoguang.meng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-02-09 at 09:53 -0600, Rob Herring wrote:
> On Thu, Jan 21, 2021 at 02:18:02PM +0800, Irui Wang wrote:
> > Updates binding document since the avc and vp8 hardware encoder in
> > MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> > "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
> 
> This is not a compatible change. You need to detail that and why that's 
> okay (assuming it is).
> 
this patch separates the two devices, it's a preparing patch for adding
device_link between the larbs and venc-device. It's mainly for fixing
the problem:
https://lkml.org/lkml/2019/9/3/316

> > 
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > 
> > ---
> >  .../bindings/media/mediatek-vcodec.txt        | 58 ++++++++++---------
> >  1 file changed, 31 insertions(+), 27 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index 8217424fd4bd..f85276e629bf 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> >  supports high resolution encoding and decoding functionalities.
> >  
> >  Required properties:
> > -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> > +- compatible : must be one of the following string:
> > +  "mediatek,mt8173-vcodec-vp8-enc" for mt8173 vp8 encoder.
> > +  "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
> >    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> >    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> >  - reg : Physical base address of the video codec registers and length of
> > @@ -13,10 +15,11 @@ Required properties:
> >  - mediatek,larb : must contain the local arbiters in the current Socs.
> >  - clocks : list of clock specifiers, corresponding to entries in
> >    the clock-names property.
> > -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> > -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> > -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> > -  "venc_lt_sel", "vdec_bus_clk_src".
> > +- clock-names:
> > +   avc venc must contain "venc_sel";
> > +   vp8 venc must contain "venc_lt_sel";
> > +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> > +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > @@ -80,14 +83,10 @@ vcodec_dec: vcodec@16000000 {
> >      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> >    };
> >  
> > -  vcodec_enc: vcodec@18002000 {
> > -    compatible = "mediatek,mt8173-vcodec-enc";
> > -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> > -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> > -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > -		 <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > -    mediatek,larb = <&larb3>,
> > -		    <&larb5>;
> > +vcodec_enc: vcodec@18002000 {
> > +    compatible = "mediatek,mt8173-vcodec-avc-enc";
> > +    reg = <0 0x18002000 0 0x1000>;
> > +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> >      iommus = <&iommu M4U_PORT_VENC_RCPU>,
> >               <&iommu M4U_PORT_VENC_REC>,
> >               <&iommu M4U_PORT_VENC_BSDMA>,
> > @@ -98,8 +97,20 @@ vcodec_dec: vcodec@16000000 {
> >               <&iommu M4U_PORT_VENC_REF_LUMA>,
> >               <&iommu M4U_PORT_VENC_REF_CHROMA>,
> >               <&iommu M4U_PORT_VENC_NBM_RDMA>,
> > -             <&iommu M4U_PORT_VENC_NBM_WDMA>,
> > -             <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> > +    mediatek,larb = <&larb3>;
> > +    mediatek,vpu = <&vpu>;
> > +    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > +    clock-names = "venc_sel";
> > +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> > +  };
> > +
> > +vcodec_enc_lt: vcodec@19002000 {
> > +    compatible = "mediatek,mt8173-vcodec-vp8-enc";
> > +    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> > +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> >               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> >               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> >               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > @@ -108,17 +119,10 @@ vcodec_dec: vcodec@16000000 {
> >               <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> >               <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> >               <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> > +    mediatek,larb = <&larb5>;
> >      mediatek,vpu = <&vpu>;
> > -    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> > -             <&topckgen CLK_TOP_VENC_SEL>,
> > -             <&topckgen CLK_TOP_UNIVPLL1_D2>,
> > -             <&topckgen CLK_TOP_VENC_LT_SEL>;
> > -    clock-names = "venc_sel_src",
> > -                  "venc_sel",
> > -                  "venc_lt_sel_src",
> > -                  "venc_lt_sel";
> > -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> > -                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> > -    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> > -                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
> > +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > +    clock-names = "venc_lt_sel";
> > +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> >    };
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
