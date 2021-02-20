Return-Path: <SRS0=RVxU=HW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12B5C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Feb 2021 06:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 462E764E92
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Feb 2021 06:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 462E764E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VgLRM9eJKdwv7lRFLDqhhHV848M9jONwjN+usTraYTQ=; b=rXFFpP0u0qQtFxqYfTazXzuJS
	Vo4C4wNO2AFZ0jGmTE0lVAGvZsfS3Yp1l7O+r98SMBMOFJY0q6NeaLhvf2mLAdslGwRGNyW9wY1Vl
	5t5k1t7cX5maqDAu2uImrlNwXJmV2XYFw1ROlRbPqlXzT2ZgGtxO3yUKn0l4XUOqpoAIhP3a+c2Yy
	in+m/OldJqPP3XSR30JNNYYbRdUHA5VUkMqgShP81ZYaAYNNRFfwMg1w1iy1r/sTAM2+in0ZFdVXO
	vPGjkxPYUStSwkdQsBuy5MV/lHbfH2R9OgO8un+Wo15WmB+vsZUHvKN3jNT20rdLoFLtEyEhukTPu
	f63+DaVcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDLjQ-0005kL-3D; Sat, 20 Feb 2021 06:27:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDLjN-0005jP-Dx; Sat, 20 Feb 2021 06:27:06 +0000
X-UUID: 4ab33aacd5444e20abc0cb42abee142a-20210219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Hs3QMCbKs3lYerCS7naNEnRZUcwiVA4lX5e20BGW6G4=; 
 b=kkNvoaBCDAk2lPtMISb+oAm+4P/2+giys+pBzVdfsU16+zJn2IDbm333XAFK0V359Zln7eVFkLiyyZ9yRtopYW9/E91qBXgV6yPrVRs/049HFmYyn/rAn/dZVqWnkdp3lMYRE8pB5zFTg4HB1W0GEzS/CzOkemqDYDyEboUMvZI=;
X-UUID: 4ab33aacd5444e20abc0cb42abee142a-20210219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 372304601; Fri, 19 Feb 2021 22:26:58 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 22:26:56 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 20 Feb 2021 14:26:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Feb 2021 14:26:43 +0800
Message-ID: <1613802403.896.3.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Sat, 20 Feb 2021 14:26:43 +0800
In-Reply-To: <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
 <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 720A18DC9132338BE8BA18B4DE8632099806799CD4E7EA48D9B032C45BD5ADD62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_012705_628267_EF893355 
X-CRM114-Status: GOOD (  26.89  )
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
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-02-03 at 19:44 +0900, Alexandre Courbot wrote:
> On Thu, Jan 21, 2021 at 3:18 PM Irui Wang <irui.wang@mediatek.com> wrote:
> >
> > Updates binding document since the avc and vp8 hardware encoder in
> > MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> > "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
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
> 
> IMHO "mediatek,mt8173-vcodec-enc-vp8" and
> "mediatek,mt8173-vcodec-enc-avc" would be more logical. Also to keep a
> bit of backward compatibility, shall we also allow
> "mediatek,mt8173-vcodec-enc" to be an alias for
> "mediatek,mt8173-vcodec-enc-avc"? The line above would become
> 
>   "mediatek,mt8173-vcodec-enc-avc" or "mediatek,mt8173-vcodec-enc" for
> mt8173 avc encoder.
> 

will be updated in the next version.

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
> 
> Can't we use "venc_sel" for both avc and vp8, since they are different
> nodes now? That way we can just say
> 
>   encoder must contain "venc_sel"
> 
> which is clearer and also simpler on the code side.
> 

ditto

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
> > -                <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > -    mediatek,larb = <&larb3>,
> > -                   <&larb5>;
> > +vcodec_enc: vcodec@18002000 {
> 
> Let's use vcodec_enc_avc as a label?

ditto

> 
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
> 
> And here the label should probably be "vcodec_enc_vp8" for consistency.

ditto

> 
> 
> 
> > +    compatible = "mediatek,mt8173-vcodec-vp8-enc";
> > +    reg =  <0 0x19002000 0 0x1000>;    /* VENC_LT_SYS */
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
