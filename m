Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C6464F65
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C6464F65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zVqRtnyrKV0/beXq+c7swag8+wEsL4i4uSyI1Hqs2zw=; b=zJ7/8eWKgzIMSZDujpD1SMCaR
	0M2VAphRqA5I3PfNNhVq80qbjjBO8L2fxVsdF/7SKzcaS3S8f/1ik026HmLeNPTdKbPjQPATjKaVp
	SNMxTM3DtVp/uovV6HJBRBZYktQVqDgd7yndzeBuVrISgSsqb/zVQL/Z6hbTkEXpx+WlthUQuJ2gm
	l4F7HYOYWOGnysw0vhIJE1xKr2PJ4twRqTmNlT1NREM4LrWGwoJGtOzS4wOAKZbwX323VmDDUO9/H
	7ZdIdkdWFPwK0EBnJLaAkRd1dCnsxdSLsTlDrXzVBh5fVXsoBIofqwjRiBM+ocrkdOzK7uANja9XG
	c/HpvXMsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Fm4-0006vf-3o; Wed, 03 Feb 2021 10:52:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Fm1-0006v2-6o
 for linux-mediatek@lists.infradead.org; Wed, 03 Feb 2021 10:52:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id lg21so7601442ejb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Feb 2021 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVYgR0aHyH4TOhEE7rZV5p4LY8T3JU2tUPS7qdZdVJs=;
 b=Go7e9XN/EbFgTf9camnwQMfNtcYyFJXJGG8c3QHl29lPWMBBRzA6WyxcJCe6As6Rlg
 9jNG/z7bQNP7ZTelzCvVCdpYYE8BwNvBeGgNrYaXs8MfioVY/9IfUriRZdPcphmW+pUe
 RblYL+fzvfciS8bjPMm+ye163uRT+oMPHtBFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVYgR0aHyH4TOhEE7rZV5p4LY8T3JU2tUPS7qdZdVJs=;
 b=KJKGMDFRB2R+rpt7wqMWgdt80IuOcrT9cCu9NZkcB1kqzZ5dhZSQ1fL9V5en+stllq
 A9IGzMBxuZ9pDCAsIU8WHG5Y/A80Kh8VSg0ppVeXxvWh+8yaYAHLJYKyjCQlsfSFXa0s
 mfmZneQrMW0HHOPkM+Pue3NQwvyh6I3n8eBQtbyE5ixVwZp4sz+UURxltWREHzNrXmUh
 r+YIVU1xRrva6FT/AwWf04nkyBZr/200ESFPM/bplPY45nqTYT5kCq9P/UVngne+9HDy
 SSv6Ypaqie3/KKkzAyz9oIIJqc9jkeREYnQ5UF/IjTJw4L87DKueOsIFY8Zm2omnSjm0
 rO1w==
X-Gm-Message-State: AOAM531be2kxg3ydwSrM4Fs3EEhHssX4cWAXb92om1Z/5oPS99+RUhi1
 AU3Ts16zb6MVhfPilNfGPmQLfpxtFnR9gw==
X-Google-Smtp-Source: ABdhPJzB1qenZvKu9Sc/l1W1+d+A6ndyq/tdKJA5CKejwnVzp0SvcctXRJuiiKltFIr0McouTGHwYg==
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr2589642ejt.384.1612349555541; 
 Wed, 03 Feb 2021 02:52:35 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id f20sm673597edd.47.2021.02.03.02.52.35
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 02:52:35 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id l12so23658400wry.2
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Feb 2021 02:52:35 -0800 (PST)
X-Received: by 2002:a2e:8616:: with SMTP id a22mr1383065lji.237.1612349059539; 
 Wed, 03 Feb 2021 02:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20210121061804.26423-1-irui.wang@mediatek.com>
In-Reply-To: <20210121061804.26423-1-irui.wang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 3 Feb 2021 19:44:07 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
Message-ID: <CAPBb6MVqQ=gBb79Ey-n=WogXBC=Vr5iN7gwKPzVwLUu-9YkGRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: mtk-vcodec: Separating mtk vcodec
 encoder node
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_055237_278503_7AE0D5F7 
X-CRM114-Status: GOOD (  21.09  )
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

On Thu, Jan 21, 2021 at 3:18 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-vp8-enc" and "mediatek,mt8173-vcodec-avc-enc".
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 58 ++++++++++---------
>  1 file changed, 31 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 8217424fd4bd..f85276e629bf 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
>  supports high resolution encoding and decoding functionalities.
>
>  Required properties:
> -- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
> +- compatible : must be one of the following string:
> +  "mediatek,mt8173-vcodec-vp8-enc" for mt8173 vp8 encoder.
> +  "mediatek,mt8173-vcodec-avc-enc" for mt8173 avc encoder.

IMHO "mediatek,mt8173-vcodec-enc-vp8" and
"mediatek,mt8173-vcodec-enc-avc" would be more logical. Also to keep a
bit of backward compatibility, shall we also allow
"mediatek,mt8173-vcodec-enc" to be an alias for
"mediatek,mt8173-vcodec-enc-avc"? The line above would become

  "mediatek,mt8173-vcodec-enc-avc" or "mediatek,mt8173-vcodec-enc" for
mt8173 avc encoder.

>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
>  - reg : Physical base address of the video codec registers and length of
> @@ -13,10 +15,11 @@ Required properties:
>  - mediatek,larb : must contain the local arbiters in the current Socs.
>  - clocks : list of clock specifiers, corresponding to entries in
>    the clock-names property.
> -- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
> -  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
> -  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
> -  "venc_lt_sel", "vdec_bus_clk_src".
> +- clock-names:
> +   avc venc must contain "venc_sel";
> +   vp8 venc must contain "venc_lt_sel";

Can't we use "venc_sel" for both avc and vp8, since they are different
nodes now? That way we can just say

  encoder must contain "venc_sel"

which is clearer and also simpler on the code side.

> +   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
> +   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> @@ -80,14 +83,10 @@ vcodec_dec: vcodec@16000000 {
>      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>    };
>
> -  vcodec_enc: vcodec@18002000 {
> -    compatible = "mediatek,mt8173-vcodec-enc";
> -    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> -          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> -    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> -                <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -    mediatek,larb = <&larb3>,
> -                   <&larb5>;
> +vcodec_enc: vcodec@18002000 {

Let's use vcodec_enc_avc as a label?

> +    compatible = "mediatek,mt8173-vcodec-avc-enc";
> +    reg = <0 0x18002000 0 0x1000>;
> +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>      iommus = <&iommu M4U_PORT_VENC_RCPU>,
>               <&iommu M4U_PORT_VENC_REC>,
>               <&iommu M4U_PORT_VENC_BSDMA>,
> @@ -98,8 +97,20 @@ vcodec_dec: vcodec@16000000 {
>               <&iommu M4U_PORT_VENC_REF_LUMA>,
>               <&iommu M4U_PORT_VENC_REF_CHROMA>,
>               <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -             <&iommu M4U_PORT_VENC_NBM_WDMA>,
> -             <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +             <&iommu M4U_PORT_VENC_NBM_WDMA>;
> +    mediatek,larb = <&larb3>;
> +    mediatek,vpu = <&vpu>;
> +    clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    clock-names = "venc_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> +  };
> +
> +vcodec_enc_lt: vcodec@19002000 {

And here the label should probably be "vcodec_enc_vp8" for consistency.



> +    compatible = "mediatek,mt8173-vcodec-vp8-enc";
> +    reg =  <0 0x19002000 0 0x1000>;    /* VENC_LT_SYS */
> +    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
>               <&iommu M4U_PORT_VENC_BSDMA_SET2>,
>               <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> @@ -108,17 +119,10 @@ vcodec_dec: vcodec@16000000 {
>               <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>               <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>               <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +    mediatek,larb = <&larb5>;
>      mediatek,vpu = <&vpu>;
> -    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> -             <&topckgen CLK_TOP_VENC_SEL>,
> -             <&topckgen CLK_TOP_UNIVPLL1_D2>,
> -             <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    clock-names = "venc_sel_src",
> -                  "venc_sel",
> -                  "venc_lt_sel_src",
> -                  "venc_lt_sel";
> -    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> -                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> -    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> -                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
> +    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    clock-names = "venc_lt_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
>    };
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
