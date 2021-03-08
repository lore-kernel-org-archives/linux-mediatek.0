Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D561C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:19:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A066514A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A066514A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fSnRvhuDEAsrEgUEYTL7qL10KrT2Dx6pZSz/YWoeBBQ=; b=coY3xIr27oqTlE4SIQDUFfot+
	jC3frNLayq+lxXFkGyO+kXEmbGzWgBc+L2hDhiz/7Mr0uz1K2HJhCq/729Vu2+WYv0hXEZ0d4ZfJS
	xl0j1DDs0E0rnli7fdGae6uisV7wCWUSysiZE4NNnErzab7D+4T/qfr9QXzN7c7g8MeioHa9zqdy5
	r3zm659Y0jzKvfiQKzYX9O0uZMx/8drW6UstUIfPy3G6tP2UNxmgdT8mmiuzgyCnf34hodkC/I+YH
	Inx4Z1kDnlN34VO9f77P2OTrEuJbCZpCWHS4ORtdIVe8etuPjb26ildWtKHzw/Yvp777z2l8WvwjR
	h0nGw64Fg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ5U5-00EYIB-Jd; Mon, 08 Mar 2021 02:19:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ5Ty-00EYGl-Ui; Mon, 08 Mar 2021 02:18:59 +0000
X-UUID: 1fa8c31caca74f53a88b0330326d9194-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WARmp+G5Amaw16yL5UPtrSSIHvoPHKDE08RNLDiboJ8=; 
 b=dCnnAvZSo2dQtJDj3dRVN+k0WjH5KxWZfkhVkQE4mzabSkXhge7bHBwoN4OVA2vMW0L8E1i5wURCAmR7+kkbDYZJZQT3D5zqKPcMdXHwpKW/6nKPu662c0lt5Jwezqpcne3iAE+kqJc2e9JNXQTb9d+tvAbJOQrfRQIiDHVyZNA=;
X-UUID: 1fa8c31caca74f53a88b0330326d9194-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 537522247; Sun, 07 Mar 2021 18:15:25 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:11:30 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Mar 2021 10:11:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:11:25 +0800
Message-ID: <1615169484.316.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2,1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tomasz
 Figa" <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, <yong.wu@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Mon, 8 Mar 2021 10:11:24 +0800
In-Reply-To: <20210306204649.GA1177075@robh.at.kernel.org>
References: <20210225073603.5881-1-irui.wang@mediatek.com>
 <20210306204649.GA1177075@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6D00D0A912102C7618451A84A1BD2A78131A232820F02B87C660563313B06FB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_021856_265342_97B3979F 
X-CRM114-Status: GOOD (  32.34  )
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

On Sat, 2021-03-06 at 13:46 -0700, Rob Herring wrote:
> On Thu, Feb 25, 2021 at 03:36:01PM +0800, Irui Wang wrote:
> > Updates binding document since the avc and vp8 hardware encoder in
> > MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> > "mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".
> 
> This is not a compatible change. Please explain that here and why that's 
> okay (if it is).
> 
Dear Rob,

As the following commit message, this is a patch for smi cleaning up
"mediatek,larb", or put the following message in the commit message:

this patch separates the two devices, it's a preparing patch for adding
device_link between the larbs and venc-device. It's mainly for fixing
the problem:
https://lkml.org/lkml/2019/9/3/316

Is this OK ?
> > 
> > This is a preparing patch for smi cleaning up "mediatek,larb".
> > 
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> > Change since v1:
> > - rename compatible and device node
> > ---
> >  .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
> >  1 file changed, 29 insertions(+), 26 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index 8217424fd4bd..03209cbd7540 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> >  supports high resolution encoding and decoding functionalities.
> >  
> >  Required properties:
> > -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> > +- compatible : must be one of the following string:
> > +  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
> > +  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
> >    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
> >    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> >  - reg : Physical base address of the video codec registers and length of
> > @@ -13,10 +15,10 @@ Required properties:
> >  - mediatek,larb : must contain the local arbiters in the current Socs.
> >  - clocks : list of clock specifiers, corresponding to entries in
> >    the clock-names property.
> > -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> > -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> > -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> > -  "venc_lt_sel", "vdec_bus_clk_src".
> > +- clock-names:
> > +   encoder must contain "venc_sel";
> 
> What happened to the other clocks?
> 
> Seems like you are dropping what are parent clocks? That seems unrelated 
> to the VP8 split? If so, that's a separate change.

Dear Rob,

"venc_sel" is for avc encoder clock, "venc_sel_src" is its parent, we
remove the parent because we set "assigned-clocks" and
"assigned-clock-parents"

same as venc_lt_sel" for vp8 encoder, we split the device node, so the
clocks need split as well. or can we say:
- clock-names:
   avc venc must contain "venc_sel";
   vp8 venc must contain "venc_lt_sel";

Dear Alexandre,
could you help to give some more suggestions about this?

Thanks
Best Regards
> 
> > +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> > +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > @@ -80,14 +82,10 @@ vcodec_dec: vcodec@16000000 {
> >      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> >    };
> >  
> > -  vcodec_enc: vcodec@18002000 {
> > +vcodec_enc_avc: vcodec@18002000 {
> >      compatible = "mediatek,mt8173-vcodec-enc";
> > -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> > -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> > -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > -		 <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > -    mediatek,larb = <&larb3>,
> > -		    <&larb5>;
> > +    reg = <0 0x18002000 0 0x1000>;
> > +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> >      iommus = <&iommu M4U_PORT_VENC_RCPU>,
> >               <&iommu M4U_PORT_VENC_REC>,
> >               <&iommu M4U_PORT_VENC_BSDMA>,
> > @@ -98,8 +96,20 @@ vcodec_dec: vcodec@16000000 {
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
> > +vcodec_enc_vp8: vcodec@19002000 {
> > +    compatible = "mediatek,mt8173-vcodec-enc-vp8";
> > +    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> > +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> >               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> >               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> >               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > @@ -108,17 +118,10 @@ vcodec_dec: vcodec@16000000 {
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
> > 2.25.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
