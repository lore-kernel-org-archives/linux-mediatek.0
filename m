Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE15DC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 02:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYIk4P2p6gp1gkykneVTXGgTOGI8BQeMJrJn0G8vBFQ=; b=AGZITqBNPT8krUVwaY+lgPangR
	yMxvnH0N5bvlmD/MqvvxOxp3Nq08dgZWtZtUYLGWrUdOeQqnh/c0XZax8f6FMA65Lvsve6SmAtSHc
	v6M6Mn2cbTn+vczIvSBHGoFYWPzy+vpSxVRxB9SqjmxHjefP0EgVhi/1W4C2Wg5O/aWyUgNC/MAMK
	1mZ2U3n6ycD3PQNPk2DDiirmUbbkv1yN4jHgulf3XBrEQAnR9/X+utRyYpHoJoReiUtxhyBNgvhy3
	RsK2r5z1nAwHwtAaJ4FfayiDeg2yzrWks3SEghm5wS4agrVOYv2ulsbPCOvb1czjiXT4inPoZKoAp
	nQj1Bn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx1G-00HXiF-EK; Thu, 09 Feb 2023 02:50:42 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx15-00HXfm-8d
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 02:50:32 +0000
Received: by mail-io1-xd2f.google.com with SMTP id y7so192701iob.6
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 18:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BYIk4P2p6gp1gkykneVTXGgTOGI8BQeMJrJn0G8vBFQ=;
        b=HtmNzDuqZVPNnKVKdiDx+Z3cYsXnlZoWJEZPqX81nlx4s12FG5mKWN7Iz8QgRroITS
         uI/SE/a6wLxuTbZ2XqIIRFA0hAyZXeC//DLKyZBwhoYviw0jixTfnpdaGsaTmcSOV3n6
         NcyRBoPWk0t+FdFXhhVMlviUuItG+Tvvb8OQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYIk4P2p6gp1gkykneVTXGgTOGI8BQeMJrJn0G8vBFQ=;
        b=LFO1DEF6Fmw0Pirm0XexR5qDk0YADtVmO26u+AUDFD9YlBeRSgiSeokPaExLIzI3J2
         mTxA01pn6fHV/dfhRorJjecRxXv5sRUB9lwa7jDX7ErXRVuURd8pb3UOofBOn38rw4EB
         eME/msryfe0fmBBqD6LKqrUqCGIDO9o7gcHszp8nyH6m+bEnffjooIn+bvrUZVrBS3Pp
         pBSFcP/3RNBrNm4j7rr6W1CrPBFdD449gylRbB5eA7GxViOK+mWRNQep43COEeUQ2nSr
         MCd28TyO6BU2OljEPhIrRWBXiIGMNEzfu/9zjfOSO4QK5GsFRIeatpuxy0lZKc9HTSUM
         03XA==
X-Gm-Message-State: AO0yUKV8DOHpJ64tkhmNWLLeberr5CPLNNqWkXEMV5eegL4jIcKCX820
	AiEziuN6tRQvjgmuBnuaYGlJnQbhHTW+3QcdwA6TuQ==
X-Google-Smtp-Source: AK7set+bvKsydzGygJFYL5iQOvjw3Jv58rqgkJyZjXTUoGYryQCk+flVM83OAnzthJ9iLUo6Kt6Ev143YXLr6ftrCik=
X-Received: by 2002:a02:cc37:0:b0:3a9:6b85:41ed with SMTP id
 o23-20020a02cc37000000b003a96b8541edmr6496673jap.57.1675911029590; Wed, 08
 Feb 2023 18:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com> <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 10:50:18 +0800
Message-ID: <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, 
	alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_185031_330905_9AAD2325 
X-CRM114-Status: GOOD (  22.45  )
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

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The sram-supply is MediaTek-specific, it is and will ever be used
> only for the mediatek,mt8183-mali compatible due to the addition of
> the mediatek-regulator-coupler driver: change the binding to add
> this supply when mediatek,mt8183-mali is present as a compatible
> instead of disabling it when not present.
>
> This is done in preparation for adding new bindings for other
> MediaTek SoCs, such as MT8192 and others.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 78964c140b46..69212f3b1328 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -57,8 +57,6 @@ properties:
>
>    mali-supply: true
>
> -  sram-supply: true
> -

Have you tried actually validating the device trees against this?
Based on my previous tests this gives out errors.

The reason is that each conditional is a separate sub-schema, and the
validator is run against each schema and sub-schema separately, instead
of collapsing matching schemas and sub-schemas together and validating
once. So we'll get a validation error on sram-supply not being a valid
property when validating current mt8183 against the base schema.

We have a similar issue with power-domain-names, for which I'll send
a patch to fix. See the following for the fix:

    http://git.kernel.org/wens/c/d1adb38ab2ad0442755607c2bcc726cc17cce2c7

and the following for what I did for MT8192 on top of the previous patch:

    http://git.kernel.org/wens/c/049bd164884398d7e5f72c710da6aaa9a95bc10a


Regards
ChenYu

>    operating-points-v2: true
>
>    power-domains:
> @@ -157,6 +155,7 @@ allOf:
>              - const: core0
>              - const: core1
>              - const: core2
> +        sram-supply: true
>
>        required:
>          - sram-supply
> @@ -166,7 +165,6 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> -        sram-supply: false
>    - if:
>        properties:
>          compatible:
> --
> 2.39.1
>

