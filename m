Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B3EC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34571613E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34571613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUVQlEOxjTSYuaosnlW0v5Qh3NzDso3+0HUsfVeJOX8=; b=oPzgo2IQQxGSmj
	5Qu06IdP5ClcTizPYB6Ex/6pG+2/sMae7TMsHRorHjvRuGzxyzdPcTjPYE1UWYVL6PmGVCPqdPqPF
	hAnJRA3nDnF4QdAbiDiJ6M8in1VuMr5myUdTVyeFK3SS4syuEd2afleGpR28kf2JhD+8oN2CD+Dua
	v93jQNm2KMWzISzpDsDI06gZV3MpibWOSZLQSEHJ8MK2q33UqLF0l3/hNnC6UbnjSn4c9D36+azQL
	5oIUNXrp3VeejRj7CbXGem4fyY/Vg3T6y5VB9gus/AfMaJadfSR7gMegrqxGyhdmYU7fHQeU78gnc
	OnxLkCkBCnOOOx1EpjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4H8D-003JwX-Lp; Fri, 16 Jul 2021 06:15:29 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4H8A-003JvZ-Vx
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 06:15:28 +0000
Received: by mail-io1-xd36.google.com with SMTP id p186so9364283iod.13
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Jul 2021 23:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5Nw9v5MsWaDurLBbY+BcDcL+BDdTyOKPRaT2ACYHvE=;
 b=NxJniVE/k/2wgZOeb9DWJ3Q0FQoJ3J2ABv8rVvc1ZmO9aAcbXoK9jx27ceGGQiumbv
 cdSp/TQ1f7VFlAWyC45NUiqmLnGXhRQ1MU4rjy2TKuUt49UbbTzRTF6ay7NLOjMktCxB
 +uew8FvbsmEzy2Yru8+aCbIgqdydQ4B3tKUO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5Nw9v5MsWaDurLBbY+BcDcL+BDdTyOKPRaT2ACYHvE=;
 b=NbSiVwucZwvQLkHfnDtFMS3v46vA3FknfEMYELXZIgbrN4ZTkbWwCP6ry0gkV8V48e
 xP+9HhOzXsSSWQBCsuuAQ6x95Ke22gFdKC+L3Zgxn09cZlKVFHaOw97iCOFQXgyle49c
 V0GI3cibb/lPI7thggURdlq0jMKxzF1YrvS+lxHu2jWSrsgA2xNSZtRlpd0bALGi3YGd
 m6elHeASlBEUm0ucR9DAp5QlplwwBeKV+Xu24FJ99I8wjce1nrprrMYsq/a8ARzYUDjh
 mHNUkLxaBGJtArbNafL3av6Op3FTyeoqCMDia3X/E2aWz+pg7b2qDhyreFOn/oxApyu9
 0+9Q==
X-Gm-Message-State: AOAM531ZHgpPhSorowhbgfSAppxmCnwU2d9i7ZU61JzkR55KePOHFbQd
 T8SK2zbGA3aeZTIdWPzHbBeqiA5OZR+anQ==
X-Google-Smtp-Source: ABdhPJxSHXbCQKIR3heAGo7KGBEbQgPMao1452p09xxLeD19pHNtGf3TKUzj68TtBq/Lw7yMSNd9fQ==
X-Received: by 2002:a6b:d908:: with SMTP id r8mr6394034ioc.16.1626416125163;
 Thu, 15 Jul 2021 23:15:25 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id u15sm4739322ion.34.2021.07.15.23.15.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 23:15:23 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id b6so7285517iln.12
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Jul 2021 23:15:22 -0700 (PDT)
X-Received: by 2002:a92:6902:: with SMTP id e2mr5481520ilc.275.1626416122431; 
 Thu, 15 Jul 2021 23:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
 <20210715173750.10852-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20210715173750.10852-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 16 Jul 2021 14:14:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1niC1WKQwJ44Y1hqOyRm4FrwRWbCUB+Z-eHoObP3hTFRtg@mail.gmail.com>
Message-ID: <CAC=S1niC1WKQwJ44Y1hqOyRm4FrwRWbCUB+Z-eHoObP3hTFRtg@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: mediatek: display: add definition
 for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: chunkuang.hu@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_231527_083788_9C74EFE4 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, Jul 16, 2021 at 1:38 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Add definition for mt8195 display.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,disp.yaml   | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
> index 63a6bc975b29..910bb9ce61d6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
> @@ -54,6 +54,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-ovl
> +              - mediatek,mt8195-disp-ovl
>            - enum:
>                - mediatek,mt8183-disp-ovl
>
> @@ -82,6 +83,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-rdma
> +              - mediatek,mt8195-disp-rdma

Make mediatek,mt8195-disp-rdma an individual item to align with the dts change.

>            - enum:
>                - mediatek,mt8183-disp-rdma
>
> @@ -95,6 +97,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-ccorr
> +              - mediatek,mt8195-disp-ccorr
>            - enum:
>                - mediatek,mt8183-disp-ccorr
>
> @@ -115,6 +118,7 @@ properties:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
> +              - mediatek,mt8195-disp-color
>            - enum:
>                - mediatek,mt8173-disp-color
>
> @@ -124,6 +128,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-dither
> +              - mediatek,mt8195-disp-dither
>            - enum:
>                - mediatek,mt8183-disp-dither
>
> @@ -135,6 +140,7 @@ properties:
>                - mediatek,mt2712-disp-aal
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
> +              - mediatek,mt8195-disp-aal
>            - enum:
>                - mediatek,mt8173-disp-aal
>
> @@ -146,10 +152,13 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-gamma
> +              - mediatek,mt8195-disp-gamma
>            - enum:
>                - mediatek,mt8183-disp-gamma
>
>        # MERGE: merge streams from two RDMA sources
> +      - items:
> +          - const: mediatek,mt8195-disp-merge
>
>        # POSTMASK: control round corner for display frame
>        - items:
> @@ -209,6 +218,7 @@ properties:
>            - const: mediatek,mt8183-disp-mutex
>        - items:
>            - const: mediatek,mt8192-disp-mutex
> +          - const: mediatek,mt8195-disp-mutex
>
>        # OD: overdrive
>        - items:
> @@ -234,7 +244,7 @@ properties:
>    mediatek,larb:
>      description: The compatible property should be one of DMA function blocks,
>        such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
> -      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
> +      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
>        Should contain a phandle pointing to the local arbiter device as defined in
>        Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
>        It must sort according to the local arbiter index, like larb0, larb1, larb2...
> @@ -245,7 +255,7 @@ properties:
>    iommus:
>      description: The compatible property should be one of DMA function blocks,
>        such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
> -      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
> +      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
>        Should point to the respective IOMMU block with master port as argument, see
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
