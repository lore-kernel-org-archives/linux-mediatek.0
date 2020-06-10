Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BDBC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 06:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E2520734
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 06:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QbI1uhY4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="conjEMDd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E2520734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GpzHITOhiGU3kAatdrQUWrs2QalU7hMqCKYNQ4mJDM=; b=QbI1uhY4oI6ygB
	zfRIBdMK1jE6PwPub6Q+yGEtp6hO/Lq8a8QjnhiyetlxINQ2UgfomIz4xLroedgYTAdrct75lWLON
	pQBkdHdiSN9n8oUf/NkyWDKsIik80R9gglMZCGCVKpI5vSFNVUtEwqSt7r9z4gPgbS2/ZSeMYSHUj
	sBiBAJhD0IlNbcl5lOXaC+zzK1hnYYfKoSXqU7L7clSLgbxpLeNWxVKyL5pvjwEumEEcY0x2RFl7x
	2xCi56bS+a5lS+PqhVfQfGE8wfgOJ6fnJ6TWi+OKKJZf3I5FnRrYwy7TtZ6k8nzTeSPC9iqcHgAaA
	F2A2zcEI6Qt7FdyfoADQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiubj-0007c9-Mv; Wed, 10 Jun 2020 06:53:07 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiubh-0007bp-8g
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 06:53:06 +0000
Received: by mail-oi1-x241.google.com with SMTP id x202so1120437oix.11
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2020 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yin6o44RA9C2iY1zjLC7qjeyYuw8En/EwnMzkJfVbHA=;
 b=conjEMDdAu75471GYPOyD9ApfoQNcdTFD9u5fvVioxjXdiCBsEB+nmD8Z4w1ni5NPq
 p7/iun/lO83U7rEO6kET9GTPXj4KA38CjGV466+SVDXTidx3UmZTldHMfCYp6AQg43Uo
 rN/HEqG0rgkZQhoklfs8sI4eYaJqYh0RzM7uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yin6o44RA9C2iY1zjLC7qjeyYuw8En/EwnMzkJfVbHA=;
 b=JX35KiSvMJqu3fkhOKY5WTljYdNCeHf27i2OAzi2TYkwSjd2z/eOSg5UxoNzTZAQwK
 THdV5jEkn8RCqKPENWUz8z6QJFiRCNTa9Z9ofm2cKg6iAa+QDtIFVl036Z+4BuScAljW
 qo5CZ76ZvmDGehFkF3Mei8UaMvstHFOHgvE97AXV76ppDmYooWlaIE6H29diBJpmQec4
 L1mz+DLsy87xz0gQV2vAlwyrxmp6yto44M/nRZ/cDuGC1OfUc3InJzBu8ft+8MnhzthC
 6OrcYn2O8Pr6XquMY4EcuxN/kjE4yMdaLlLXjKP7XFvFjJNJupq+1iTvqnT7NmrSh6/r
 kgOw==
X-Gm-Message-State: AOAM530Fd+0Vu692lTMTiqWQK33CCqN3TAFTCNhla+XnLBLWUNo0d/M3
 sACvXVmLSPKiL/ZVgL6MdixWY72aLqwYDQ==
X-Google-Smtp-Source: ABdhPJwNcQMuiHwgKgnD2gajHSxcmlDSHWj2VBPlvZ36th7LCGE7NbRhrBR2KQqMfFQOr1rSY1ZFNg==
X-Received: by 2002:aca:b706:: with SMTP id h6mr1463363oif.121.1591771981716; 
 Tue, 09 Jun 2020 23:53:01 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43])
 by smtp.gmail.com with ESMTPSA id k7sm3479746oon.29.2020.06.09.23.53.01
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 23:53:01 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id g5so890114otg.6
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2020 23:53:01 -0700 (PDT)
X-Received: by 2002:a05:6830:242e:: with SMTP id
 k14mr1533456ots.36.1591771590799; 
 Tue, 09 Jun 2020 23:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-2-git-send-email-yong.wu@mediatek.com>
 <20200609212102.GA1416099@bogus>
In-Reply-To: <20200609212102.GA1416099@bogus>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 10 Jun 2020 15:46:18 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXdbEgWtOx_b5ab3hOTdyPPaGDQ2kA21pLjoLE-2sjuTg@mail.gmail.com>
Message-ID: <CAPBb6MXdbEgWtOx_b5ab3hOTdyPPaGDQ2kA21pLjoLE-2sjuTg@mail.gmail.com>
Subject: Re: [PATCH v4 01/17] media: dt-binding: mtk-vcodec: Separating
 mtk-vcodec encode node.
To: Rob Herring <robh@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_235305_330553_D43B9D05 
X-CRM114-Status: GOOD (  20.86  )
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
 Irui Wang <irui.wang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>,
 eizan@chromium.org, Matthias Kaehlcke <mka@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, devicetree@vger.kernel.org,
 cui.zhang@mediatek.com, Tomasz Figa <tfiga@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, LKML <linux-kernel@vger.kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 10, 2020 at 6:21 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, May 30, 2020 at 04:10:02PM +0800, Yong Wu wrote:
> > From: Maoguang Meng <maoguang.meng@mediatek.com>
> >
> > Update binding document since the avc and vp8 hardware encoder in
> > mt8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> > "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
>
> The h/w suddenly split in 2? You are breaking compatibility. Up to the
> Mediatek maintainers to decide if that's okay, but you need to state you
> are breaking compatibility (here and in the driver) and why that is
> okay.

In my understanding there is no real hardware using the old bindings
at the moment, and the split is indeed a reflection of the actual
hardware layout. Tiffany, can you give your acked-by if this change is
ok with you?

>
> >
> > This is a preparing patch for smi cleaning up "mediatek,larb".
> >
> > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek-vcodec.txt  | 58 ++++++++++++----------
> >  1 file changed, 31 insertions(+), 27 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index 8093335..1023740 100644
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
> > -              <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > -    mediatek,larb = <&larb3>,
> > -                 <&larb5>;
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
> > +    reg =  <0 0x19002000 0 0x1000>;  /* VENC_LT_SYS */
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
> > 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
