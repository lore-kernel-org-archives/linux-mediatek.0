Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40107C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=; b=RkhpwMy2kxQl+QVpe6gopVuS9H
	tGEi/QoT5oVsyhSQaFruf/91smuCaLV2EyoWwQuPcyBSF2fsjpX1egioJGL6qXQSMPrSZHV8j/hHS
	ObssWGeordsOATVINCKwY4fLKAaqXbh86s6f8Yd6j3xfu66zljAhH6tBNaU2NlzmYSbwsSKfQTnFl
	pUoObWRhioobTfWyUYhdhWRfS7YfLnEZ/5ZZQODuK/nQMVRt75t3AyZWkVtLsLzY/DDptSK4D6enq
	MCJ/C0DlnRzB28NhfR5tNZ2VdMmIRqGr0XuDh8QcUT6n3wbNI6/a0G5lZHbE4hFm4FPIkvB1clPl6
	M3wDtuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuT7-00000003Qcy-0HpZ;
	Fri, 16 May 2025 12:47:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuT3-00000003QcB-1Ko9
	for linux-mediatek@lists.infradead.org;
	Fri, 16 May 2025 12:47:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so21304165e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 May 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747399631; x=1748004431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=MNE78l+DPH3RDdL7dx9/PdzqMTCTDKU1jDrNhB8EYUL8kNZdLHkFm/LBcwioIVKFdu
         k8ysof5mI4GIHyCOVvxktYGQbWdr5YAr9svSsfNK8Xny9slNYFRxKHLsPZ2J2ibtbQ0Q
         NmvlQlcjq+M6oJGDciA3n0KMhOuBp72HK0uG1oHmX/TwEHNttc1cZfWvBrkpSpQqzrO+
         Lk7EqK5XTXmP4fZljLtMBe338hBxbA7csxgYuXA0Yc2fd27W1Uw2ERC3zIdm07zFknsA
         dNCRF4IsTAa9bu86M8Wv24zgxfSrCl4I/5bS0JKcGuvWEkQ104k5pU3QJAT2953fFuIq
         31eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399631; x=1748004431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=gvlgfIRM+iwHgro56mrlMX9vkBc4+KVp8yJo9LUzu44ibXu0gxT15RN95hnNIIy8fs
         K7M9VeDjb4AbJO5JCZrfcZFhRXxfrMDCrGAM0sIklQltdRq2KDi7XwEIuzt3S+6wb0qL
         b0cK+qVsKSHrjWbzz1QO6nbJqUpHlQYwJmhj+AzXDLlA6vkTWcXdzJOcSkvCirewtIOD
         Fi+q1Hz+wQYqwZeiwEoRvnuMiA37D1ITmZKn1TLng45i7gIKCOqmUCjIDc7F0I/n5C0t
         3FclOya6oaAnyluej33xT7iGdsArC8AA4ni2N7gIoW95BWfj6zPy4jfh4kBNH88Zfv/9
         3hFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU23AbaCE8YM/AL+y4Y007zbG8zZ6I3HtGzA+GbTJvC9aVes1hOiaMriOVHbCA/rIB19cjXEVsylZisRTRWJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTUdv5VaBoESOuE2Nx4mHjU6/IE0jyvn4fCPW26RWNIWULfJls
	uVcHDPmD3xJEWQUI4cma2gI310hbSB1oITcUDdfK7amkffcWyxwSa+R2vwo2OEX9yJQ=
X-Gm-Gg: ASbGncsQMkPa50Bt6NCThqR8TPlXxX9ufl+LrdE5KWadH6tVPsdSxwf5uj0cxV5MXag
	yH9fGR7ef63bgkJOy0i9J3ns1qXkdogpjkm/Q0cGZ0gBFi4E6gIOE2ZL3A4QAJjcahYZWhhKaKy
	3ACPZXza69gfEmYnJ1nsh1cirz4rDwTjYct0jGXRrnjrqQlE1gVgLnH6KMZMzZVR8kPBAWfQTet
	mSrT9d1oWzEwrB80w1otWD+6mdWilxhclmfrEf5BRu0Ytg2HEa5CNJDDfYpotLL/cu1/nk83RGQ
	svLtNQRAhQX/ZSs4PEQsD+ChcY6C+GCrcbCNdd2k63LbC2Agyqs0gTQ4RRfHuKkNcIlSoZkG8KX
	zdIAm49FcznxoU6o=
X-Google-Smtp-Source: AGHT+IH5gScMrCCTGF//8JROzSasDHWVQYCYlgMKE4a0wf2w3fuKAyBSQp+DJif8kHEnseMXKCoH5g==
X-Received: by 2002:a05:6000:144c:b0:3a3:62c6:d2cd with SMTP id ffacd0b85a97d-3a362c6d48emr1641333f8f.14.1747399631142;
        Fri, 16 May 2025 05:47:11 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm2792986f8f.55.2025.05.16.05.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:47:10 -0700 (PDT)
Message-ID: <70da4bf0-a36b-474c-8057-1ad056573e01@baylibre.com>
Date: Fri, 16 May 2025 14:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] arm64: defconfig: enable display support for
 mt8365-evk
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_054713_444997_BBCFA43A 
X-CRM114-Status: GOOD (  13.21  )
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

Hello

On 20/03/2025 09:48, Alexandre Mergnat wrote:
> Enable the DRM HDMI connector support and the MIPI-DSI display
> Startek KD070FHFID015 panel to have HDMI and DSI display working
> on the mt8365-evk board.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e615863..1e2963a13500b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 

Gentle ping.
Is that patch can be applied please ? The remaining patches in this serie
do cleanup only, then shouldn't block this one.

-- 
Regards,
Alexandre

