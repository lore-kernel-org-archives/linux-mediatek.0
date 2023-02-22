Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181FC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9H0xjhxYBLZPbX8nqO91E9hjJ6R+Sm3uDvahoqNPyc=; b=huKiiVQPg+/RAA0XaNLcjGcY4p
	Q+Oz0xuNVGl6S35Ru5Imf39E9hsaexNY4FZX+RA1OC/bBqs6rz0178xGJg+HbaKC6UmvLEzQHG2oB
	aMxVVIm/8tS/mojTb7FIlkF4fnL7XdHk08QKqC+9fmdjD7YXULTJwvb2myIEvnTLbisuJ4T4bWX0Y
	it5Qw5fGPpYfUmUVNzn+V87KoxFFHFj3UafOpbOqoerZCcDXL7EYvUkeojjKYMQ9U0l5m2tMmA+rn
	S+70y91Igo+0USClBsoqG06PzpRPSmzugI3KuUTcvU39ACw11IPCFUstD3GGDwopdQtDdzuEXxsuW
	AvipjLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk1S-00B8y0-Sw; Wed, 22 Feb 2023 07:58:42 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk1I-00B8uf-Nc
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 07:58:34 +0000
Received: by mail-ua1-x936.google.com with SMTP id f17so2311720uax.7
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 23:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G9H0xjhxYBLZPbX8nqO91E9hjJ6R+Sm3uDvahoqNPyc=;
        b=DNemaIQH3jRofAK7MbaDUIqc7f3HRn0kIhuSzD7GLxols1+ghLJzjYiSaKSC5aT2oy
         hDKSvR0/2g6fHPRaHu+gFWFCf5vOucJ41X9kBOqAGlWfYzPaU1bMP9Z6tjgosQFsU1bm
         RkZHOBGvtI8b7FGMn2SLXWnLEhVYvSNNU76gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9H0xjhxYBLZPbX8nqO91E9hjJ6R+Sm3uDvahoqNPyc=;
        b=mcGOBBF68/or0gMScrekLrRbHJjAgeEfOSE7tRNxjc3EpVN7rFcqZz4UrMzHARy8HJ
         IHqF9um8DOWngCfr0egDd1HG3TfoK5QboT9e4PzZW/SvPwuZCR/jwsRIzJz1FHQK9atn
         jnnEkbPcAWGIHGQuEZFeRjkZKSHXURRardVnGsJNrwy4l0IoQIt0GeczoJmu0WCWo8Js
         6Poxix4iXK3lSUwTXUO+8GDCMCrA5nEeA+ZXg6TFJbx5d2Zsg6mfmd8n8jzIO6zKScBy
         O36wL2xDQ77OhC/ek46/ErstCJcRySVyEVdtPUZL03Ig1Tfsye/fQPd2mq+Qet+JnzPH
         WMRA==
X-Gm-Message-State: AO0yUKX24+4KjQZgDp+yumD4R0iLVbnybfgqYL9bLSy+mCTmc9A5iThK
	8Qdq9ZWERMcX2fVpjGdGBPaI3RmeAD8IJcG3Rxjqrg==
X-Google-Smtp-Source: AK7set8o2S3rJyKNzdUr4xZ9nrsGuSmtC2Ccm3LZaoX+pcw8mPI/KNjgf7s21ruTldmlELA+TVaMg7TzGpythFAFdbc=
X-Received: by 2002:ab0:6ed3:0:b0:68b:716e:ed8a with SMTP id
 c19-20020ab06ed3000000b0068b716eed8amr2520250uav.0.1677052711248; Tue, 21 Feb
 2023 23:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 15:58:20 +0800
Message-ID: <CAGXv+5E17b=nT3tquBxA6KkN3XLqNcWHeioeMtDaR+8SQhk8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_235832_773031_D088FC50 
X-CRM114-Status: GOOD (  17.58  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in

                                          ^ missing space

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> the current mediatek,mt8183-mali conditional.
>
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 02699d389be1..ac174c17e25f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -145,6 +145,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8183-mali
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        power-domain-names: false
>    - if:
>        properties:
>          compatible:
> @@ -166,9 +178,6 @@ allOf:
>          - power-domain-names
>      else:
>        properties:
> -        power-domains:
> -          maxItems: 1
> -        power-domain-names: false
>          sram-supply: false
>    - if:
>        properties:
> --
> 2.39.2
>

