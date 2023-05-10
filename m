Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E606C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buV1oS+q5zSYMCb+Vk5Sei3x9AdpdZjHmxNoX6GDBRE=; b=XkLSq5M9Zr3IVrc8YcLFM0XqdK
	6kZlXtgrYszR8gAt0gYLVsF2pEDRIsSfUYiQyYUKjxb7kHb1wEY5mGuuRwYzKTr6QCm32/zqadyC/
	R9izrTXbvwWPLCVjQTAfZ9UTxNmjT5C4NJfAUxp4tlTt0QRgsTRuluVrJ4kqheV16R18zFQAF1wH9
	n2ZqpuRaa6zOzok5pJK0VrSAJrGPw3WdO0E06zXoD5gAJvCLqMq1xLISGWx8aNbxonrD4sMwg7vYO
	0kk+kZE2vh3JHY8DII5HrTlDpfICY7h1lZ3YAEHNIrT3JajCcMi1zvdb0xjYwh8/1bDNzr5SFnVyt
	selCMMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pweci-005R8c-1L;
	Wed, 10 May 2023 07:52:32 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwecf-005R6z-1N
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 07:52:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso13169051a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705146; x=1686297146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buV1oS+q5zSYMCb+Vk5Sei3x9AdpdZjHmxNoX6GDBRE=;
        b=Q4XRlsa/ttO62lIK4GlvTimIidf2aZ8yWta4S1EEsfZMxipw4+4vFyoxAMvBO3WFtg
         SLnrwwacDR91Ltcs6KRK2lB9oz5WNqvkCQ2r6BV2RpFVUuC+bxpxblT5dd1LJ0HuGM1c
         TZyR+ILO+ItOWB7mfM/2AI9FVgrklZOFMsO7BVyxebCvru0hF4K69Fsh3eWXZrE/vsZD
         y0IxnpRhuCHlpspg1zMQXxJhTmu+Qy7RveEvP23D77fHuQv/9vJA/T3WaPr1ZxkGLMQv
         sSPrTIdo2yJeKQnWlS76VfEDyHdcHtENmMxvaKlxhk5Kz2kkyib3R7XGcdbfKOvEZUDW
         6NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705146; x=1686297146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buV1oS+q5zSYMCb+Vk5Sei3x9AdpdZjHmxNoX6GDBRE=;
        b=kwW6nCXTcpirocECI+V8i9Edf8vv+82AjZHnUhdeFnOdic3rWC5yECJcp/ddNh7cLf
         lz1uXYgVwhGL3WkYCU/8bgTu06+Q+MjaWA0V8PW6YaRgzSVNo10noMJ9Yi6SZgTNyLSc
         9cbh7TeRgJkS3jB/KiMNe4KBzyIhm2toWPDx6ZmAHsUGuKNNir0FXDOGGvEQRyp8MpwE
         Nb3eT5aP1zjR8hOG4+q7wjKeGcMiwGaGVvUC6iahyqytsecIAwGTe9fZXuoNbHRWKVti
         hkZZNwbcTZg6M2l8dWgppSdF4cU4XlVVfA7+YBpYtQVszjwpIBxXdrepcrzqrosqreKj
         n4NA==
X-Gm-Message-State: AC+VfDx1NqQo/UEgTjTP7cFtOOh+3R63x3KsK9otmmzCHTo2Gxz3OAKJ
	zt9O5k8B5ae80cK1jjnHxxKDoA==
X-Google-Smtp-Source: ACHHUZ4PkilMztZzdtCbud0lGz7T8NDnLixfG28NHHOUaUz/5BDZAb+4ZEG6FXuOIsei4a4hftLJhQ==
X-Received: by 2002:a17:906:fe07:b0:953:8249:1834 with SMTP id wy7-20020a170906fe0700b0095382491834mr13901254ejb.16.1683705145939;
        Wed, 10 May 2023 00:52:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id v20-20020a170906b01400b0096165b2703asm2338115ejy.110.2023.05.10.00.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:52:24 -0700 (PDT)
Message-ID: <a575e8df-4882-79bc-ea1b-005961afb77f@linaro.org>
Date: Wed, 10 May 2023 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 8/9] ASoC: dt-bindings: mediatek,mt8188-afe: correct
 clock name
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
 <20230510035526.18137-9-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510035526.18137-9-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_005229_463700_3DFCFA79 
X-CRM114-Status: UNSURE (   9.92  )
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

On 10/05/2023 05:55, Trevor Wu wrote:
> The original clock names are different from the list in driver code.
> Correct the mismatched binding names in the patch.
> 
> Because no mt8188 upstream dts exists, it doesn't affect the existing
> dts file.
> 
> Fixes: 692d25b67e10 ("ASoC: dt-bindings: mediatek,mt8188-afe: add audio afe document")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml   | 36 +++++++++----------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


