Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CAFC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 04:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzVsE2WVQtDSaAM6UmCM20Z/lAeEvRcu2iqhxm+Mwa8=; b=Mnr8CR/aU5ecjHhO1SqsRLTTUB
	bSS0JXIBO7zr5/eLw/NwO7TJmKXnrz/El/EYJyqId1NZ54g6I/fV8wsrhj6Jn0csGIln8AL8yMsin
	zSccKxmgiDmBNsRgHanH0JV63kc+yuoh2AqQUNJCSCq0CEdLqu9O5uVC3ohlMCDcqpUZWLm/W8fHt
	D2DGHohJM5yBrKT8dKLghIuEg6/KzKa8CWuxV492f5HgOzgASsf8lnwZiEkzKJ6WFJdF5CNtxeQwl
	wbs64IwPHC9ZhXkxld2N/dQxxDTfAjLqP8f7qTvnCzVHvqbemrt6DaqTFI6CWAWADcQnZwrG8q1z5
	alX6a2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEi8V-00000004are-0iuo;
	Wed, 05 Jun 2024 04:20:31 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEi8S-00000004aqk-0uhz
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 04:20:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52b962c4bb6so4930339e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 21:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717561225; x=1718166025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzVsE2WVQtDSaAM6UmCM20Z/lAeEvRcu2iqhxm+Mwa8=;
        b=XQL2S5NvuBjG08HnQo830lAQqda7yJYudLxIo3Atvz3eABE6ukB69xYKkPjUP31DAV
         ZQMG80Wi1QjTMXvi18MzPhBUDFs60x20KAwZiwVGzPb2z+vB5PLjPcSRNWTYozkoC4Om
         ftL0uxBbsEzSaMF8TmlcH94uQJUlfcEGJsAz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717561225; x=1718166025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzVsE2WVQtDSaAM6UmCM20Z/lAeEvRcu2iqhxm+Mwa8=;
        b=cjtPiZNsBXzC0KaKreo0Jq4m+ZuSfL3Bc5A+dsBKBRRpcy8qPnzpF0dWs1rcS04B/s
         YHzY6kPIrZUBixapAPZbHB7jHpVWCbq61+UdxoZyxmdR7ApbnbxQ7pxOVIldYy3cTs0I
         dxK7My8dRor0B6EunYAMIg+Zq9vjqjgqc/orCPZHlLy2Hk66+lhXaXIkS+v7oeQQFpDl
         EvZ+Xgj+0WZCKwqIzr+ZVxmoc73lRnJ6KM4Unv0Kur3RglolCnmKg0Oew/rQzEeRBW9R
         IU+2AQ3ayh2o5+uzom2mtXYkSDfSNBrBAcXYZ+KyaFyvDV21IxC0ky9O3ivgj2dkyvJA
         nu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNCIUDpJwQB9dMq6PstzPk5ErpfhrBxQFqhNr0//3nhgBd/CAFYrM+9mxo2qxYDxQG/2o1tvEB5PC9GTY05lDYUVPVHa13kRF0Sw3xe6plJ9YJ
X-Gm-Message-State: AOJu0YwJxDO60OkFgkLIk7NHNtz32GYu9HapspoDJoG8i9HD0cJq9yN8
	ksezo35mge1o3+4nrCarq+wbCLBBZZ+HE3S87dkjGiOtoBCexMgdM9t6XIA7ZNanKVfp4Vzdr24
	y/EBSDGcY5Lfk+v/IIQLUhs9y9PWAmXCMnFhi
X-Google-Smtp-Source: AGHT+IFjiCTeLxR5Rrc6kuVzd7PjI0caEZqFLRKsHokalU9T+t04/Xl7kHt8MmAkD3exLz2xwKl4SHO//vTdXIubI38=
X-Received: by 2002:a05:6512:b9e:b0:529:b718:8d00 with SMTP id
 2adb3069b0e04-52bab4ca25fmr1391310e87.8.1717561224514; Tue, 04 Jun 2024
 21:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com> <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 12:20:13 +0800
Message-ID: <CAGXv+5E09RGRX=7Ra0H-VtbPKMVg6MiM+hZn75AyJ0KmEd5EEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_212028_375270_ACD13ED4 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Jun 4, 2024 at 8:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml =
b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index e796a1ff8c82..8acb46adabe2 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>        - items:
>            - enum:
> +              - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>
> @@ -195,7 +196,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: mediatek,mt8183b-mali
> +            enum:
> +              - mediatek,mt8183b-mali
> +              - mediatek,mt8188-mali
>      then:
>        properties:
>          power-domains:
> --
> 2.45.1
>
>

