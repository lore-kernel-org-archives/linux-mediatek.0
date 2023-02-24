Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5CC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds+e0Ih6UL/cn2qDTbsziNvDdZY4duRrpUzCZIYiaLU=; b=uP9iaeOGZ2BBlxdvsgX7mi22nf
	mxvNcE1rfZLV1AlSz8LkQauPuaEd21cmvP1eVQHBZBUTliNNLOUiGPlIrHAhxY/Kl0qZb6yqUmrT6
	QROtaxtVCUqfy1WSHJ6R54HFekWlOn2hlqW/zAHn+LwH4iyqVTkjLZKVZhhaMHKAPhpg9O8e/doap
	ndBKGJ6TZ0ydP58aqAZzqCSUA0SE4y0uv2mKoYUnSTBWLHZTRSUsG6pbNyUg8L/IhrGwiUkHym6Gi
	UcuaG1QIWQWKGDnEiibvrjtlL+qFNCtn7geG44pqci+VveGrxMK/pFG2xLHf7gZ3Kh4zoranFFWGZ
	p87JBN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUyQ-001sRx-Tb; Fri, 24 Feb 2023 10:06:42 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUyB-001sJN-4i
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:06:28 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id o2so7252963vss.8
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ds+e0Ih6UL/cn2qDTbsziNvDdZY4duRrpUzCZIYiaLU=;
        b=afCawh6DuktGjlOudCjHqoYpmBUiUP5Ue7N5HIcodXbWKYh46tetr3moqM2V46f0PX
         k1kLAoF9UNzrw7ZwGSQok0opvqeYx5eiPfdra365llKKcEmrJH4+S7HeMFY5qIO653f0
         0UUg86COEMbN7GEPS/1KbEO7+MlWMZ4Poe1nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ds+e0Ih6UL/cn2qDTbsziNvDdZY4duRrpUzCZIYiaLU=;
        b=m/OsgPFRBw8dOdMzQYTEjIdBEcGHTk6+66WXNm725Y4/pALDWsLty4gF+GAQ3r+nCS
         kh2Itd3H/M0/hHRXUBSqefpzmIiixZqCaCVYaekhp/ayr2tJY/H6spLi1SUeGb1Tg2wo
         vNY7KN+3mirtR/ltqfdSWKhnuQ9RdZ/4bVM/HgZob2QCOMQGtYNPsl5WQsMtKwldVtWG
         hREGR7nZCuefIanUwpvYU9iCaKMLmCMMOCmbTeaNh6AfYrCdAZnlDr6+uPVAWI75IDl+
         gjTkHqeyML/U35lyu0S1ZZUXIppk3Zd8mUcDUYpfKbJDgsCvOzJljkck90yH8mDJQBNm
         pudw==
X-Gm-Message-State: AO0yUKWg0cF33Enmmh+fOlLCn/Ny6EHCwaHGzonzDK+pc8gHXJ/qzK8I
	C63RUrAd1/QLmY8zbRaF5qU6SK/t46dO+CNKGbyAMw==
X-Google-Smtp-Source: AK7set/tL0nx+dCLvdLFPGL6MZqwGOMrTaZ11JDqKi1o+dz+K1NCp5pT/0RlUA0xvnbRGHDGRyh3fqWz6RCt7wSFp7Q=
X-Received: by 2002:a67:f650:0:b0:415:2063:e403 with SMTP id
 u16-20020a67f650000000b004152063e403mr2102294vso.3.1677233186030; Fri, 24 Feb
 2023 02:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:15 +0800
Message-ID: <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020627_199322_5488BC06 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
> but treat it as otherwise identical to a standard Mali-G57.
>
> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
> special GPU ID, in case we find functional differences between
> MediaTek's implementation and the standard Mali-G57 down the line.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

As previously mentioned, MT8195 Mali G57 has minor revision number 1.
Do we need to handle that?

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 6452e4e900dd..d28b99732dde 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>
>         GPU_MODEL(g57, 0x9001,
>                 GPU_REV(g57, 0, 0)),
> +
> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID from the
> +        * standard. Arm's driver does not appear to handle this model.
> +        * ChromeOS has a hack downstream for it. Treat it as equivalent to
> +        * standard Mali-G57 for now.
> +        */
> +       GPU_MODEL(g57, 0x9003,
> +               GPU_REV(g57, 0, 0)),
>  };
>
>  static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
> --
> 2.39.2
>

