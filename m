Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9834C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 04:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVCtOFAQeCdlxuy/+5enfIE1//lIAo1ZANgQnvIFVR8=; b=fiS6agY6DEMxIcZA7XUJujQiMc
	0Joo4SK+fHAvs7vpSJefBfau+Fk3LTUTNE4vmXzTOvMY9JzJNy/jtCZksMTOcGOEH08gfIGPlTbc/
	TROHqIqAM6z8vG8HOXIGsTSBYCEyitmLhqO68kknCggZ+nK3dUaJIyoXg8gsK9ayxPDo8gY0htD+m
	IOPnkywz8E1kvnbQiJQ14GkF6kM5h12nwlpbVG5LxvqAeXpgPOqx0BfFYFdrGd9ZKNNu7FMunajFU
	Xw2QSamF+37jMNui2mdFfGMbKB7ba5EjBYqsrW94r6m7N8rH6OoJSLsch7ModogILpWOVk4RJwJb6
	a0pZSi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgTh-00Agvj-0L; Wed, 22 Feb 2023 04:11:37 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgTd-00AguV-U0
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 04:11:35 +0000
Received: by mail-ua1-x931.google.com with SMTP id n4so1955618ual.13
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SVCtOFAQeCdlxuy/+5enfIE1//lIAo1ZANgQnvIFVR8=;
        b=Uk4/+eknl4RG+uywnGzIfuqQmgRvVQ+nJ72nRpvWVpw8DycQ7PGaOKHAAhTCWQrWIk
         PwjsgquqnSsQUM8hoP5yXC0oMtEi8Mo1blXigVQ4Zv+xKW9wHEQKmG/yKjz/N1uIkg5+
         S4V5VONmU8s2dmp/j6W48Hkq+OGx+t5gqRJSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVCtOFAQeCdlxuy/+5enfIE1//lIAo1ZANgQnvIFVR8=;
        b=5J4K0Q4wqqC7X4PFWfavZrrulZbEZ3X2/Cu9CBw9xn2DkHxV6Ckaf9xrgJj2ctssgX
         iwInHDu+4AkqFISKDEAcTLRT9NuhKH/Jnlxy5i9svLZklLyLrMerZq8utW94BHAzrNQE
         wNojVpSNcIHPRMLfDj1f1Z4Tb5Xh02l3DPZFJC1bwFYhUUmoCR417BBDAwT1+5x/OoQH
         JCFxylcvU2ol7HBNvb7/o6Awavibf17LKKUoU7uUJLijslHcokd+P+PNXCDig8VdY6sp
         K+n0ZXj2U4RMCsuzyYIVjRZw5hvHMChHJjeAeaqHvPVWQXSbynrUlFwW5W/heUjN9JyT
         5qIg==
X-Gm-Message-State: AO0yUKUax/IbHyiUNm3C9YiBqw73CtBL5BI8xCtbKsKkncTuKBw741dH
	5aebnUC2rYpXYQD5tgXEuiej4l3kXFKXjnJScFWXiA==
X-Google-Smtp-Source: AK7set/nftjCq1OYuGKOwe46GNxAufRZH/wve/epWZydqSAOCAqd5GxdqmmuSkjxHSKOqAw+INE+gEreuCXBaRsdDs0=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1230544vkg.2.1677039089247; Tue, 21
 Feb 2023 20:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:11:18 +0800
Message-ID: <CAGXv+5Hc0qceN3Cr89ZF8K9-EwqF7v26qsdRS2mE_FE_nr7OiA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_201134_012544_4DEC8147 
X-CRM114-Status: GOOD (  19.47  )
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
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
> but treat it as otherwise identical to a standard Mali-G57.
>
> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
> special GPU ID, in case we find functional differences between
> MediaTek's implementation and the standard Mali-G57 down the line.

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

FYI MT8195 has a minor revision for Mali-G57. See https://crrev.com/c/2834981
The commit doesn't say what issues were resolved or still linger though.

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

