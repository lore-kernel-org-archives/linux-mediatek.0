Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C5CC48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZR/yId0zMdb1VoBg8Axbya9oTLCK591PyMAG4SS2OxY=; b=nLl8mRx5jvndNC
	4rMKJ/1T1zm/GVo3vR14DzM51P7PQZ3N5IIzEpHwMAOX1zXXwMlK4db+59rGs8nrmc0KSjx/otd7l
	lV+N/WP9FOizXlPY++TPb8u4EAHxBi8VlfHmeKys4MS2fEtjxuBg/LdV0Lm3bCwhgj9jlUl6PPEQP
	PbFXWpdwwAbhvlc0GnrNKXSEGV9ANA124Agxxz6i2f/mrY2ytv0aOd16TBCURHy0YAcQFuRs+wn97
	du2TgN+WkXRRYys5mG66xKh1zQcYRdLVaBpVD1CxeGQWWQ5wBr745Ou/v/DgQC3xvPeDfzqj6bhWh
	ldjg+OQxLlRkOTQy2GbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMjN-00000007vPL-3Lzy;
	Tue, 06 Feb 2024 14:47:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMjL-00000007vOI-3bwx
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 14:47:25 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5111c7d40deso9522511e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707230840; x=1707835640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR/yId0zMdb1VoBg8Axbya9oTLCK591PyMAG4SS2OxY=;
        b=i6lJi/SQ4QirTNhDMYPdFY8EalYqe9xPLs18Ni2WPpeWrGZv8ZpsESNwaMIL18jJd5
         zRAXeRrfpqwlJwz2KQoe4Jw76+Szz5p4uGOUDcsPKC5KJf5r/XQfZxXDQmVFWZLruHmG
         +m3ISJS2I1n/eAdlEcqke9EJeLxVkdbjp2XZqo5z0PmS6Iwzd3uCBDxDESWK+MI7uysi
         x9VoNq7+aBxngVpFTpwh0wrL4H+HYpBekGIMdVDZQtkINg1IaHqxg1Pl4G91llMdoqu1
         16/C4oZs0f+X9hbYQ/Xm0UHUjSe6E1yVHYKE/PXFAjsBDwbyPAnPAKafh3x0wcRyv+4M
         8g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230840; x=1707835640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR/yId0zMdb1VoBg8Axbya9oTLCK591PyMAG4SS2OxY=;
        b=U3p2vUs4BhlV1jqgZqreUyCorOpbpqcpiGaqW4OFS68h1TKGf7FFfiVGioJMF01WM7
         jvOkFY6r3JiEqJax49bgf3wQy4+wnWxD+Thm6GbBY9bVJyY3t3dbz/DiqbQ2h73tmqjS
         U0rTZVuU66aS22rSclW1G/gF7DPrV0yEdOacqBpXtVv3tQlzMbwNUAimWQW5BoNIV3lO
         rudTh7EmzFpyZNZmEU2wQ40Y+usGLh/deaADUZn93CGjEprn+hF2Thacq5K9SHQU8uvk
         U2EQsZk+qTDCewAmoM4i9vXgMdq5dpigpdju5+LxUGrArFy7vEJPnsxvCtDgJWpS8zRI
         Tuew==
X-Gm-Message-State: AOJu0YzfgVdAsnynyPWSe0xelwG2B5qRJRBU1W9AeitX6IhkY04IyQH2
	uQN/7EHgMjUs/AQCkL/ZvfMvjmwU/WHcIbH1q+z+fdw3KRCtk2M/63YxS9I89+0=
X-Google-Smtp-Source: AGHT+IEuhUD5eEWwYbifjJ3zWOk3sSzNHHGTGTW2BHb978uMI+o0AKo+LWqCNLoEZRgptvn09UAaog==
X-Received: by 2002:ac2:48a8:0:b0:511:52b7:43a6 with SMTP id u8-20020ac248a8000000b0051152b743a6mr2076508lfg.38.1707230840037;
        Tue, 06 Feb 2024 06:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW6O0p8yRFvWA2LcJJ0ltpkPfQ6vI5AikUNA/cAWawwZbgnjphw4M/VshE8gahHAIgGIZF7Gmld/JviR0PfLBno5DT+YgCwcNnuN7vQaRicDacIJWmeRvUbJ1sCX4QWKdBM4n9nUGwV1qEMw9d9+cAvxvrNnAI5xtGAVYSBLVu8+q45icoQe6aCIh4XOniP3CD6AskEtnKkHpJZgLF/DbiIrw+pHt0XHYGHknPi0wvZ4u5FHUi3696dcPv/g7lBtAxJrNBCXE5Dxn/b+Kst7uQVcsUqYgSBCAheYws7ANgNgjFdh+fS3HZL/AUL5RVKJUD2kck/AhPd1dHj3q3Zr07tE0qbl4W4UiN0XBJRU3ECzwAVdklLD+aezRUXcYqgh5aY+T3C1Szf48N/dN7+Ix4loSxCY98GZHzbKw==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b005112ae5fd93sm255854lfh.244.2024.02.06.06.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:47:19 -0800 (PST)
Message-ID: <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
Date: Tue, 6 Feb 2024 15:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_064723_936569_E97FE78E 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Change magic numerical masks with usage of the GENMASK() macro
> to improve readability.
> 
> While at it, also fix the DSI_PS_SEL mask to include all bits instead
> of just a subset of them.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++---------------
>   1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a2fdfc8ddb15..3b7392c03b4d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -58,18 +58,18 @@
>   

...snip...

>   #define DSI_PSCTRL		0x1c
> -#define DSI_PS_WC			0x3fff
> -#define DSI_PS_SEL			(3 << 16)
> +#define DSI_PS_WC			GENMASK(14, 0)
> +#define DSI_PS_SEL			GENMASK(19, 16)

0011 0000 0000 0000 0000 => GENMASK(17, 16)

>   #define PACKED_PS_16BIT_RGB565		(0 << 16)
>   #define LOOSELY_PS_18BIT_RGB666		(1 << 16)
>   #define PACKED_PS_18BIT_RGB666		(2 << 16)
> @@ -109,26 +109,26 @@
>   #define LD0_WAKEUP_EN			BIT(2)

-- 
Regards,
Alexandre

