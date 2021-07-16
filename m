Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E7CC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 07:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A022613E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 07:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A022613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBa+kLuQfIFJK7+OJat2y7gcFMmMCehBXESbuJMF1C4=; b=jhXm84rMpDNsN+
	arXS16ERLh7dUeYKYGKbTFK0P3e5skAWOEfN9BVygwKH1KbXOMeQabhBsyWkPUOlm56YOVUTP9lde
	prfJkghyDqZ026Rer0oEBuH60KLuSaNVCD2bxYhN8vfTF698MHv6L6Ms8ZKgUVl/8YSgoI8qy685S
	EBvcB+WBGdne8WEIogBirghGgBaAUD/nResKQskx+dT7gY9vmsLa0di2xjHofL2dY2uUmmy7bo0vy
	Fsv8NU/HweCZ42e05C2w1RAAgDj8OGWBaZlzwNd53xBqsTlcfI6cyKVkIqNcQQkQCY3BJTCL7Qrzc
	f6mxSTyg7TYx2sL/fNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IYp-003Zsj-P6; Fri, 16 Jul 2021 07:47:03 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IYk-003ZrC-Dl
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 07:47:00 +0000
Received: by mail-io1-xd33.google.com with SMTP id g22so9621403iom.1
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwWxgkdAW3/KS/WFR7/3/xY5+SDGRuBv+QXp7L0Q0Jc=;
 b=b7VPouuaVZFV2I1xQmpob+1Hqg/StYVfW/pz9NWF/a3+T8/4J00vw2h9Arl+gk2dCq
 xUip6K9pfwy8/MQrvna8y8c4qldGM8QzomehwA9mLnNyGug2Mbbsb6jTkzcjk8RCS1AG
 P1VZZQRFKy2sqSjuW29XAXCC4iGIMvstLDaODMMf5apFzwby8A7oBlKVbuP/Qi3L1J5i
 x/bPX4p9mbYNBBeaTQOortsHa6Zd0Qp7RKI/nVVl+Lpl6rc9eh1QChtqem/ch9pylCYJ
 ICCxDTrSEa5cG3EcUEDbzeVi4NvTB7YIkRCGG+i5xVjxhZ0LL/FJZEP3aUgnaoV9LSn6
 MpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwWxgkdAW3/KS/WFR7/3/xY5+SDGRuBv+QXp7L0Q0Jc=;
 b=RrbzJMluSFfvMVV2kIYHFM6MF8ce77RLR4evyeQaD5/asJFENhxi+mqfpqZQRdiYZF
 H1ub8LqZ16P7tqFAsdZ4n39qYkjNxR280gDFlcjYxPvZ4fcSjm6pBIUluZRNHO4jel29
 CWfe8MRzvYoW4Uq2E37tY7wZq42wGBSEuVDzlKnP/DnPDYNBCnh29Cshr7bcA2jSA6b1
 3vnfQmYiDXHFqDrJVR8Eoc3upkNni6P27MFve1wYqW48HhedjbxgJY8kHckW37t/ve2S
 LJrP8PCzVVctXXydGRGwH36ppe2PwKT/gojDnLSU3BuPmE7qUcLYLNvbyw0rpp++y4rg
 D1BA==
X-Gm-Message-State: AOAM533wBO9XWZxgJ6ikrBCn8GKKxBLyC9cxpqZ6YquJBiacdB1ZUQOe
 NumQPG0cKtddzmBgiaoawUotAjt1O9HoPHfvcVhngQ==
X-Google-Smtp-Source: ABdhPJyzb04RlDtz8fruYXzmz4HTB1lgHoj+8WfjSm3y3QNBifOue2sUTRlKMFFyIt9KMpKVPlh9U4/0apYosBfVDDM=
X-Received: by 2002:a6b:6217:: with SMTP id f23mr6614522iog.173.1626421615310; 
 Fri, 16 Jul 2021 00:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
 <20210715173750.10852-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210715173750.10852-6-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@google.com>
Date: Fri, 16 Jul 2021 15:46:19 +0800
Message-ID: <CAC=S1nhi0rLpQznvUP1FVNtEDzdffFG_aMO7j-w4fHBY8ceJnw@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] dt-bindings: arm: mediatek: change mmsys txt to
 yaml file
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: chunkuang.hu@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_004658_541929_06AAD16D 
X-CRM114-Status: GOOD (  22.95  )
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

On Fri, Jul 16, 2021 at 1:48 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Change mediatek,mmsys.txt to mediatek,mmsys.yaml
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |  32 ------
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> deleted file mode 100644
> index 9712a6831fab..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Mediatek mmsys controller
> -============================
> -
> -The Mediatek mmsys system controller provides clock control, routing control,
> -and miscellaneous control in mmsys partition.
> -
> -Required Properties:
> -
> -- compatible: Should be one of:
> -       - "mediatek,mt2701-mmsys", "syscon"
> -       - "mediatek,mt2712-mmsys", "syscon"
> -       - "mediatek,mt6765-mmsys", "syscon"
> -       - "mediatek,mt6779-mmsys", "syscon"
> -       - "mediatek,mt6797-mmsys", "syscon"
> -       - "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
> -       - "mediatek,mt8167-mmsys", "syscon"
> -       - "mediatek,mt8173-mmsys", "syscon"
> -       - "mediatek,mt8183-mmsys", "syscon"
> -       - "mediatek,mt8192-mmsys", "syscon"
> -- #clock-cells: Must be 1
> -
> -For the clock control, the mmsys controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -
> -Example:
> -
> -mmsys: syscon@14000000 {
> -       compatible = "mediatek,mt8173-mmsys", "syscon";
> -       reg = <0 0x14000000 0 0x1000>;
> -       #clock-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> new file mode 100644
> index 000000000000..ea31c7c2792c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek mmsys Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jason-JH Lin <jason-jh.lin@mediatek.com>
> +
> +description: |
> +  The Mediatek mmsys system controller provides clock control, routing control,
> +  and miscellaneous control in mmsys partition.
> +
> +properties:
> +  compatible:
> +    description: |
> +      If the mmsys controller of different soc have the same function,
> +      you can use the same compatible name after it.
> +      For example, if the function of mt2701 mmsys controller is the same as syscon,
> +      then the compatible property could be set as:
> +      compatible = "mediatek,mt2701-mmsys", "syscon";
> +    oneOf:
> +      - items:
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-mmsys
> +              - mediatek,mt7623-mmsys
> +          - enum:
> +              - syscon

Not a yaml expert but I think it's:
  - items:
    - enum:
      - mediatek,mt7623-mmsys
    - enum:
      - mediatek,mt2701-mmsys
    - enum:
      - syscon

> +      - items:
> +          - enum:
> +              - mediatek,mt2712-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt6779-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt6797-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8167-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8173-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-mmsys
> +          - enum:
> +              - syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-mmsys
> +          - enum:
> +              - syscon

Just
  - enum:
    - mediatek,mt2712-mmsys
    ...
    - mediatek,mt8192-mmsys
  - enum:
    - syscon

Fei

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    description: |
> +      For the clock control, the mmsys controller uses the common clk binding from
> +      Documentation/devicetree/bindings/clock/clock-bindings.txt
> +      The available clocks are defined in dt-bindings/clock/mt*-clk.h
> +    const: 1
> +
> +  mboxes:
> +    description: |
> +      Client use mailbox to communicate with GCE, it should have this
> +      property and list of phandle with mailbox specifiers as defined in
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clocks-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    mmsys: syscon@14000000 {
> +        compatible = "mediatek,mt8173-mmsys", "syscon";
> +        reg = <0 0x14000000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +...
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
