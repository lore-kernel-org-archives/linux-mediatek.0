Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CC7C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 19:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE2bkq/ui14lTBLwtUifajE1EvCpc5Pz1BLS66HrLtI=; b=D44WG0CYF/Mt4qP0Ig6SvXb7TQ
	QItuiIJizAkUGC8SbA5CVTFp8OFGnzhJ2lATS1kXir5QLyaVvR/ROquwMfRcOmro0Aj0coJyFfAqd
	W+LIWCAIqJ6AczIBUGgrMsHXfK70/Iymj9RtapbUOMxMPFl4wqg1ros1iHTePEDpCnDt7pgtJdnPX
	cYd4DyLgUOIcgHZSXtmxSPwDOGOcKRC57Z2NCjzoqqbkprB1ezYWOA7sAe2ZO0P54dCKSNGd0wEeL
	9goQj/Co49DfUkW9rhxyUQ/yXfMaN66+MYTfxDGKBI1fYO+N0KmK+FCGIvauS/+NNYaXhQRhmQKk1
	XLvG/B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzN5V-00Au4S-0w;
	Wed, 17 May 2023 19:45:29 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzN5S-00Au2r-1k
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 19:45:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-965cc5170bdso184248966b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 12:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684352722; x=1686944722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE2bkq/ui14lTBLwtUifajE1EvCpc5Pz1BLS66HrLtI=;
        b=pv0XlTzQm0AHDjnYWXA2DFOwY89iONL+pcihwOPnY2/55ELz63O65AuRo8sYRyVtfY
         j4tyirV1rIXbj4sCHOWqTTlOuOSMW2jmK6+rtIOpV7Ka2tulKz/6eWhdbUWijx9Bu6Gb
         ByIIf6pn51KS6teavMyaKat3eWK8I4nOHiWfDQvcdP/Uw0gfXBXnQIrIc/pz6cz6nVR5
         Iy4x6JykOjawxDUZa1NyETS4srgGmwuaVLOaP/oJC0+uKgaPHr9cFO+fpRAAlIcMNtcy
         nhs72woQacj+sq+ZLnu7DXHUJfQ74vtfFxKgtJUnmVCafSnNEWvepe5r3nD9pz3VWUP9
         vy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684352722; x=1686944722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE2bkq/ui14lTBLwtUifajE1EvCpc5Pz1BLS66HrLtI=;
        b=NS8kC03CEsGgr+dZTDjeUPh3w9vkGa7TzUTatSnDhrYBBbcVY/bTS1uWlqjuVCEV1q
         8ilFr3Hd3gUgMgF0QthSXNIwESUbVAjvo4EW6QAbIkqRiERr2kJGCRIwJzJQ1ovMOCpF
         S4Dwi7pkfSs5T2RlcpDB4jD9/45pPLP656oH/MP3bUt3+YApaJrB+LO+OMLD5mCb4j8S
         BiOGKIwXTp0subkv3ouWGmn9S1LHwY5id/XvldNNeQ+sFyP8fyfDeXiwcin7Ch9Z2yEC
         ddY8cO53nWcG8qmTVO40DoAaLVDDZNm9wWoFn2zSuLCjmZr+RFt/MocmBc/4q2Kj7/NG
         l3pw==
X-Gm-Message-State: AC+VfDzq2BFBN++YLml01jxhYoxx56C9kp8GE/MUcNFjrL/7i+Lg2JXA
	SU2g9fjBBXevqQWFjjPOcKAiIA==
X-Google-Smtp-Source: ACHHUZ6Tj8zelM2VZpR/AEzeGAQ8zj37niuO6NRBJvg0WI4NbhdxMvKTFTAAd3TJm0rHrq+VS/nWuA==
X-Received: by 2002:a17:906:eec9:b0:94f:73db:b390 with SMTP id wu9-20020a170906eec900b0094f73dbb390mr34695874ejb.65.1684352722678;
        Wed, 17 May 2023 12:45:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id tf8-20020a1709078d8800b0096a2b6de3a4sm10504747ejc.122.2023.05.17.12.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:45:22 -0700 (PDT)
Message-ID: <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Date: Wed, 17 May 2023 21:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/7] drm/apu: allow platform driver to implement their own
 mmap function
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-6-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517145237.295461-6-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_124526_586783_061C83D6 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

On 17/05/2023 16:52, Alexandre Bailon wrote:
> From: Julien Stephan <jstephan@baylibre.com>
> 
> By default we will call drm_gem_mmap() unless the apu driver has
> declared it's own mmap handler.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>

One does not have to review own code. We all assume that we send good
code which we do not have to review by ourselves (by the author). We
also assume we make mistakes, which we cannot find, thus other person's
review is important.

Adding own review tag suggests you added them mechanically, so I doubt
that they really happened.

Anyway, your SoB is missing.

Best regards,
Krzysztof


