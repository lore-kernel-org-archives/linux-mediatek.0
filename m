Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC819C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 06:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8CB208B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 06:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHB20QRQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n3dFh0/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E8CB208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ywj8/NS892Xgw2b61U+k1rUXockwkgQf+pn4Z0g/hcA=; b=jHB20QRQ3DXZ4t
	CL+P7HPwDReskLzApkPfjBUZGOcrB7eDdrAPxy4pCqtVbgyaHf1/T5yb7YPwEXcRC4nbYr/tWp/jd
	w4HYns0MwcTl21JW51EQL6Agchl+b+Neyp2t5uz/qu+dbA2OkkZIIMhV0pDbyZRVYHlPlu4e61WwC
	rb1lZvzlX+xaVOIAswWbudwR9+Y1tykchN/l3J4INVpf1sYsojOzv3JkPlLSwKCRrACCJDmQFuZhN
	VjP2YLHSk2oEJlw4BraPAFVakAzuPyHtGd3GO6e3pEIV3A+K8zlGWXYmPCxGwJxcZ2fCFRECOmFmJ
	Ya4PjTQDk2iX6bOaW+0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlRAV-0001Fy-GX; Wed, 17 Jun 2020 06:03:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlRAR-0001F4-Un; Wed, 17 Jun 2020 06:03:25 +0000
X-UUID: 249247eca5ce4a869c087b2685f7a491-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oVpXGg2U7AQKunA+hsmMzQqdqyO7uOh2s2YhRzJO1cY=; 
 b=n3dFh0/YL1jfparnTg0nNbCJj7ol7uWCxkILLFTr9oReUWGTFU49puGcj3oht+ZJ2K6a29STMArSvMVPvQZWle/sTrXpZqHXMMu0ryneXz3kezlJdA1fisxeNQORI//rQRcELmZsgZdqjq4QUrHafaHtbc5Lvk0OcLwMuznJmVk=;
X-UUID: 249247eca5ce4a869c087b2685f7a491-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 311147824; Tue, 16 Jun 2020 22:03:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 22:53:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 13:53:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 13:53:16 +0800
Message-ID: <1592373196.24313.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 01/17] media: dt-binding: mtk-vcodec: Separating
 mtk-vcodec encode node.
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 17 Jun 2020 13:53:16 +0800
In-Reply-To: <1591774707.21260.14.camel@mtksdaap41>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-2-git-send-email-yong.wu@mediatek.com>
 <20200609212102.GA1416099@bogus>
 <CAPBb6MXdbEgWtOx_b5ab3hOTdyPPaGDQ2kA21pLjoLE-2sjuTg@mail.gmail.com>
 <1591774707.21260.14.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_230324_000847_9A16E13D 
X-CRM114-Status: GOOD (  25.54  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Will Deacon <will.deacon@arm.com>, youlin.pei@mediatek.com,
 Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Joerg Roedel <joro@8bytes.org>, Evan
 Green <evgreen@chromium.org>, eizan@chromium.org, Matthias
 Kaehlcke <mka@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 devicetree@vger.kernel.org, cui.zhang@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Tomasz
 Figa <tfiga@google.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, LKML <linux-kernel@vger.kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-10 at 15:38 +0800, Tiffany Lin wrote:
> On Wed, 2020-06-10 at 15:46 +0900, Alexandre Courbot wrote:
> > On Wed, Jun 10, 2020 at 6:21 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sat, May 30, 2020 at 04:10:02PM +0800, Yong Wu wrote:
> > > > From: Maoguang Meng <maoguang.meng@mediatek.com>
> > > >
> > > > Update binding document since the avc and vp8 hardware encoder in
> > > > mt8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> > > > "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
> > >
> > > The h/w suddenly split in 2? You are breaking compatibility. Up to the
> > > Mediatek maintainers to decide if that's okay, but you need to state you
> > > are breaking compatibility (here and in the driver) and why that is
> > > okay.
> > 
> > In my understanding there is no real hardware using the old bindings
> > at the moment, and the split is indeed a reflection of the actual
> > hardware layout. Tiffany, can you give your acked-by if this change is
> > ok with you?
> > 
> 
> In my opinion, there is no need to change mt8173 dts for driver to
> support mt8183.
> I saw another patch that already make change to have encoder driver
> support both mt8173 and mt8183.
> But they done a lot to prove h264 and vp8 encoder could work
> independently and parallel.
> In this case, I am ok with it because dts should be a reflection of the
> actual hardware.
> 
> 
> 
> > >
> > > >
> > > > This is a preparing patch for smi cleaning up "mediatek,larb".
> > > >
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>


> > > > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/media/mediatek-vcodec.txt  | 58 ++++++++++++----------
> > > >  1 file changed, 31 insertions(+), 27 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > > index 8093335..1023740 100644
> > > > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > > @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> > > >  supports high resolution encoding and decoding functionalities.
> > > >
> > > >  Required properties:
> > > > -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> > > > +- compatible : must be one of the following string:
> > > > +  "mediatek,mt8173-vcodec-vp8-enc" for mt8173 vp8 encoder.
> > > > +  "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.
> > > >    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> > > >    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> > > >  - reg : Physical base address of the video codec registers and length of
> > > > @@ -13,10 +15,11 @@ Required properties:
> > > >  - mediatek,larb : must contain the local arbiters in the current Socs.
> > > >  - clocks : list of clock specifiers, corresponding to entries in
> > > >    the clock-names property.
> > > > -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> > > > -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> > > > -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> > > > -  "venc_lt_sel", "vdec_bus_clk_src".
> > > > +- clock-names:
> > > > +   avc venc must contain "venc_sel";
> > > > +   vp8 venc must contain "venc_lt_sel";
> > > > +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> > > > +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
> > > >  - iommus : should point to the respective IOMMU block with master port as
> > > >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > > >    for details.
> > > > @@ -80,14 +83,10 @@ vcodec_dec: vcodec@16000000 {
> > > >      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> > > >    };
> > > >
> > > > -  vcodec_enc: vcodec@18002000 {
> > > > -    compatible = "mediatek,mt8173-vcodec-enc";
> > > > -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> > > > -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> > > > -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > > > -              <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > > > -    mediatek,larb = <&larb3>,
> > > > -                 <&larb5>;
> > > > +vcodec_enc: vcodec@18002000 {
> > > > +    compatible = "mediatek,mt8173-vcodec-avc-enc";
> > > > +    reg = <0 0x18002000 0 0x1000>;
> > > > +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> > > >      iommus = <&iommu M4U_PORT_VENC_RCPU>,
> > > >               <&iommu M4U_PORT_VENC_REC>,
> > > >               <&iommu M4U_PORT_VENC_BSDMA>,
> > > > @@ -98,8 +97,20 @@ vcodec_dec: vcodec@16000000 {
> > > >               <&iommu M4U_PORT_VENC_REF_LUMA>,
> > > >               <&iommu M4U_PORT_VENC_REF_CHROMA>,
> > > >               <&iommu M4U_PORT_VENC_NBM_RDMA>,
> > > > -             <&iommu M4U_PORT_VENC_NBM_WDMA>,
> > > > -             <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > > > +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> > > > +    mediatek,larb = <&larb3>;
> > > > +    mediatek,vpu = <&vpu>;
> > > > +    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > > > +    clock-names = "venc_sel";
> > > > +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> > > > +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> > > > +  };
> > > > +
> > > > +vcodec_enc_lt: vcodec@19002000 {
> > > > +    compatible = "mediatek,mt8173-vcodec-vp8-enc";
> > > > +    reg =  <0 0x19002000 0 0x1000>;  /* VENC_LT_SYS */
> > > > +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > > > +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > > >               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> > > >               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> > > >               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > > > @@ -108,17 +119,10 @@ vcodec_dec: vcodec@16000000 {
> > > >               <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > > >               <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> > > >               <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> > > > +    mediatek,larb = <&larb5>;
> > > >      mediatek,vpu = <&vpu>;
> > > > -    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> > > > -             <&topckgen CLK_TOP_VENC_SEL>,
> > > > -             <&topckgen CLK_TOP_UNIVPLL1_D2>,
> > > > -             <&topckgen CLK_TOP_VENC_LT_SEL>;
> > > > -    clock-names = "venc_sel_src",
> > > > -                  "venc_sel",
> > > > -                  "venc_lt_sel_src",
> > > > -                  "venc_lt_sel";
> > > > -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> > > > -                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> > > > -    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> > > > -                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
> > > > +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > > > +    clock-names = "venc_lt_sel";
> > > > +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> > > > +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > > >    };
> > > > --
> > > > 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
