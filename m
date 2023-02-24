Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F0CC678DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLgAm+20NHdcq3TTMKIQSFC8qlmxumh/Xz94/sWg1sg=; b=RdUPAZIb1UgCzpehIdz56e3Kl9
	v/LIkMUdzxyW/5eBE5Oir1H9qOtzSg/4iwKhgtJVlGipch5hAxt1W8OpZHg22OHCYNdp/VCKbznlY
	fAuZUO5xQftei6D/Bn5oqF3th3OR2xeTB9g1Ly/IQCnMMSd4R2tabJQfES8jxUYPfKf3DQjgwhdgC
	qA+uRdcGzBU6nPnnGfjWjDeUqGGHHRV1RF+95Wn0VGdmdGvpFN50LXVZ2e1/iqC2Nx4uX/vVQeDLn
	ttBMnePdtUMcQj94B4nho5aujdlycsqRtUw4pdHS55CiUYkholnXL5j1y5U9UUO1ui90x4Mvpy0+q
	gUnVZ28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV1g-001u1d-34; Fri, 24 Feb 2023 10:10:04 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV03-001tER-7D
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:08:24 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id f13so16663163vsg.6
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QLgAm+20NHdcq3TTMKIQSFC8qlmxumh/Xz94/sWg1sg=;
        b=TqCzL9tTwUn2D8BgnS/XinTdipALTG+K4pHG117dB2icMNDC9IdP54M4WXROap6tix
         ZYIoJjvpocY5eufWjfnHvTbh6ZI4sBOPFS3xT3Mg9n9Z8wuNkDv/dAsUp2HNF+yMZqjO
         WrJDRa9clAKnn56oMSnovkTkOQsgEr9s3AQzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLgAm+20NHdcq3TTMKIQSFC8qlmxumh/Xz94/sWg1sg=;
        b=l6xI1fpEdZfd2yjesBJDKejj4dVU5rEn5v6A3H5I95sGbu/rAigAzzJpXmXdUPv4G8
         EGoEa1tDdLFXAingoXOXpRZNQtBVEDURZj4kJYoeWWQJhhfwrT9Y3BZaGJjisivGD8j9
         V/+cPU3MdwNkgt2/y3MVK4ulx7AaB0o9SF3oET1Z9fv1iktUHhLs2DslZUbYFWdLgEfD
         6/0NZ2KNYd0tw9M9fSFlrORN6pk0jjUCZ+4eORb3Qp2Ve6keuKlL3NZh1gDp61X63u3W
         Jezma9rMsiZhGx4ac/tMCqdhs2lsXqv1g0bdCWCNqZIi50D+Xtahmb/mNDCKnGMDCnXo
         JTrA==
X-Gm-Message-State: AO0yUKXBKEDFsZXZ5OLx3D1LSjXiRftzH2/BzhGfWZ66lRYpdJcYTxZC
	lM6xe4GWwBMWRQhaYig4RUvEl2zevS4G37uT1Hf2Mg==
X-Google-Smtp-Source: AK7set9+CsoqKt5EF2uez7Y+7kBPrW2rCoZh1NWDNAuNiIsn/Yo/mXxmNcqE0NmxlOQD8opEMKzbfzkayObs+QwkzPg=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr4377179uaa.1.1677233302208; Fri, 24 Feb
 2023 02:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:11 +0800
Message-ID: <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020823_297695_423FC458 
X-CRM114-Status: GOOD (  14.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 65fe139ceb83..4d9ab4702582 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -25,6 +25,11 @@ properties:
>                - rockchip,px30-mali
>                - rockchip,rk3568-mali
>            - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-mali

This could be squashed into "- const: mediatek,mt8195-mali" like the
following lines?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +          - const: mediatek,mt8192-mali
> +          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>        - items:
>            - enum:
>                - mediatek,mt8192-mali
> --
> 2.39.2
>

