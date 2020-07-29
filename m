Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30023C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:53:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05CF207FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w+cF3iEu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIOC7BMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05CF207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eRmoozFxA47Lpu+saRuglnAIhRziPdZzwxYDg44orGs=; b=w+cF3iEu5mdP/vmKi6VH/JQy5
	7FCzO/02f+ppKIuwaxcgyaH+TzSvkZFG9si0/P4mTIQqWLEavOQRIS+g1KdN5Fqg5NrwBGNd9P+36
	FcDFUFaNM4xVAyNuc/orhuMavTGnwn4rv/49O7dShger03UYCCcHRowVjQ2FKLZFLs15G7KsPZufH
	qNuOc9fsUl2FQ4hixuw5woI0YJZpHGsgC5F6WKOuu2DNCeWUL1KUXt0oj2PjPUui2Hd3DRwBvFrJi
	DFZYqutpCNOyjmeKv2d+S7/Hw+anJ632RYlA7AXqDuJYv+5zn+PUgRvTIKQlNEplFDnzPTiecSr5/
	pk/UkLuGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0imL-0004UX-33; Wed, 29 Jul 2020 09:53:41 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0imF-0004T9-CQ; Wed, 29 Jul 2020 09:53:36 +0000
Received: by mail-oo1-xc44.google.com with SMTP id x1so2231057oox.6;
 Wed, 29 Jul 2020 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dSPSCJP1B8FFQ4jru/jknXZJ0F7AjGqANGzZ0MmcwoM=;
 b=lIOC7BMxg0i3gaLTPiKIqQZ26oN3EKt3MwpLLUUIy24/B3snuIWEqdrxTjAB35H8Dl
 PJjiXUVULIB843EPpUO4reI82egXXsJ3EkP1/FgV5RPDhHCHT36cbezjM2JEJAlSx11z
 mVDEmHa/W3gwdmHTrM74ZRxYqRo5eGkaTy85FDfkWtZSnyb0YDn8k5+kG4xMlZl6Amkh
 hgFe9Zv3NxFeipsLJ1D54xUeKl2esIONeeREh4KlKau6YVHJFeqEYRMfiZMmaXTYQtqR
 9KtKXBw8SYqr4haun76+qo16Gw4rtXdWV/t0fWys1dZk4WOJ/6INU7xOu573110m3kNp
 wz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dSPSCJP1B8FFQ4jru/jknXZJ0F7AjGqANGzZ0MmcwoM=;
 b=WqpbSw3/7srCzsWPtHt83lKpudBJVHedmuPk3mvEXsLrNIw5TNElzx+yzUSrSKrpdR
 0QBKjRDPQEWu+fg/dhiyaJWiFdHGaKE81IlgyGtIzrXEyyZHLQmW1NSc38ULeRx244WZ
 FnZRyQzlK/GN1/kvuh+z7E2fs2wGJ2Y+K12U0gQYDgffgUNVbAv6ydOQ3TaGd6PnjbND
 U0hFeQRuRxk/4WLqx9JJ68PtFYVhSQte8WwxGTsFgSbBmRjvlV37ze/deZTqoBouZoEJ
 RT/BkA1t6JHG3pAybjghSzlEk+RMHmLELbzvY/I5YUZk9cE5N2ywq7m9RQ7QIFrZa0LF
 wJWg==
X-Gm-Message-State: AOAM5300ScxHy2lLD9X4yVCastltWFLLHztpsj6mSvTYdc/GED+gxxid
 B+vt40drVSZJ7VtkNRHIZndQo5EFgQsjPn+XGaE=
X-Google-Smtp-Source: ABdhPJyyOU2hznwlmIrHYNfEBoEk/NsCxsBtvitRQo5gm44xcrVCwOjDRFKaXRc6e+fpkQx/Dnv/JSJs3AUwUS6Ipq4=
X-Received: by 2002:a4a:b2cc:: with SMTP id l12mr832013ooo.15.1596016413286;
 Wed, 29 Jul 2020 02:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-2-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1596012277-8448-2-git-send-email-weiyi.lu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 29 Jul 2020 11:53:22 +0200
Message-ID: <CAFqH_50+_Bt97roTACRhoq8XkfSc1UcHyQP3OCacQR5oK-viOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: ARM: Mediatek: Document bindings for
 MT8192
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_055335_573613_1C749288 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyu,

Thanks for the patch, some comments below. I am not sure what
maintainers think but your patches, in general, are really big and I'm
wondering if wouldn't be better split by functionalities. Will make
your series much longer but easy to review in my opinion. Anyway, I'm
going to comment a few files but the comments can be applied to other
files.

Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dc., 29 de jul.
2020 a les 10:46:
>
> This patch adds the binding documentation for apmixedsys, audsys,
> camsys-raw, camsys, imgsys, imp_iic_wrap, infracfg, ipesys, mdpsys,
> mfgcfg, mmsys, msdc, pericfg, scp-adsp, topckgen, vdecsys-soc,
> vdecsys and vencsys for Mediatek MT8192.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
>  .../bindings/arm/mediatek/mediatek,audsys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,camsys-raw.yaml | 40 ++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,camsys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |  2 +
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 43 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
>  .../bindings/arm/mediatek/mediatek,ipesys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,mdpsys.yaml     | 38 +++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
>  .../bindings/arm/mediatek/mediatek,msdc.yaml       | 39 ++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,pericfg.yaml    |  1 +
>  .../bindings/arm/mediatek/mediatek,scp-adsp.yaml   | 38 +++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
>  .../arm/mediatek/mediatek,vdecsys-soc.yaml         | 38 +++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  1 +
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |  1 +
>  18 files changed, 249 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> index bd7a0fa..6942ad4 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> @@ -17,6 +17,7 @@ Required Properties:
>         - "mediatek,mt8135-apmixedsys"
>         - "mediatek,mt8173-apmixedsys"
>         - "mediatek,mt8183-apmixedsys", "syscon"
> +       - "mediatek,mt8192-apmixedsys", "syscon"
>         - "mediatek,mt8516-apmixedsys"
>  - #clock-cells: Must be 1
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> index 38309db..fdcb267 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> @@ -12,6 +12,7 @@ Required Properties:
>         - "mediatek,mt7622-audsys", "syscon"
>         - "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
>         - "mediatek,mt8183-audiosys", "syscon"
> +       - "mediatek,mt8192-audsys", "syscon"
>         - "mediatek,mt8516-audsys", "syscon"
>  - #clock-cells: Must be 1
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
> new file mode 100644
> index 0000000..db6f425
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,camsys-raw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek CAMSYS RAW Controller
> +
> +maintainers:
> +  - Weiyi Lu <weiyi.lu@mediatek.com>
> +
> +description:
> +  The Mediatek camsys raw controller provides various clocks to the system.
> +

It only provides clocks or also provides configuration registers
non-clock related?

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-camsys_rawa
> +          - mediatek,mt8192-camsys_rawb
> +          - mediatek,mt8192-camsys_rawc
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    camsys_rawa: camsys_rawa@1a04f000 {

I think that this should be  "syscon@1a04f000", since node names are
supposed to match the class of the device instead of the name of the
device.

Just because I am curious, can you show me an example of
"mediatek,mt8192-camsys_rawb" or "mediatek,mt8192-camsys_rawc"? It's a
different address space?

> +        compatible = "mediatek,mt8192-camsys_rawa", "syscon";
> +        reg = <0 0x1a04f000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
