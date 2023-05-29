Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE7AC7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78pcypVpN3CxF4Efbw66eNAU7KdZVo7I7D8DwmPSSNY=; b=uaP7YkJmsthuvANjLJ7MwTWLkg
	uGfUTQKxNmDv8ieB8GMZFd2CmMBSPMTFczmE/Gwmv0wlXpd8NwZ38okVx/Tr36WiRoz5ZbkZNrzi2
	/2I4f2d3nLWfppsJhHryRLQXvy8omYxJ0NKlO+lTodBWfNMLq6XhicoA6l9KZ2LLXT0eTUkQhn2n2
	gV+YqjJH59JGNTa/YPZT8PYGKRY++x/GrCIo+2bIu0BBtVrG1sAd5gks5FN4svIRWpQyK78gnOYsm
	xcTHkLJSotwSOM8QreAyz84cyHVjZ6d1E1FwrkQzG5m92rUuv36Cea3bgmwExAKWP4w8KHI3G/OAA
	ygLUcWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dHY-00AenK-01;
	Mon, 29 May 2023 13:51:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dHV-00AemD-1C;
	Mon, 29 May 2023 13:51:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30aef0b8837so439164f8f.1;
        Mon, 29 May 2023 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368287; x=1687960287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78pcypVpN3CxF4Efbw66eNAU7KdZVo7I7D8DwmPSSNY=;
        b=RGnHahrqAMOmuuk/E4fXSa9iPqk72Omn6f6aqeKHPz/0xSpC4bL3nJsEoyKF8COt0x
         cQ3xzsVZvg9pOC5MXDFpHrCyv6GxVACQvk54AJZMptR3Blktf7ReftSc5WdHGJEjLO46
         R+TdZ9Ttjs20yAV4AzMzN0eq/7XY5ypMuZDM/7zu2vM3vJNwoPRVRq6JnLU7iaIF7Nxm
         0gq5+8qUOXOJacb+phUkDb3i1PJCpVDKzhF9i0WfvWX35z9I6g4SNDNRR86GnloatUmQ
         0uFZsI4mjH74yYXx0rbsxNM5VN2lATjny7VRQnXjFX9KACBz7zzQR8Wj0NcO6PaYBtHd
         J2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368287; x=1687960287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78pcypVpN3CxF4Efbw66eNAU7KdZVo7I7D8DwmPSSNY=;
        b=AYCPiYAzM12mxuXbRaJvSDoafKy+8TdWX10jOGifpTuUSgAjhP4kkT2Qz/q1ErmUv3
         zMMcAHFMMF9JigugzNge6YromF5kVEa+VDk+h7qMXwFokzbLXvgkj6L20AEXz/9NRJOx
         gA0orIcvlf9Zrl8CsBggM7BT7GEMUqm1KJYXbjbXZnATCrac2I1EtoyfAikvnGHJVD7H
         EfHmTa/2653u/plCf4yNZ0Maa9bVLWpi/u3MJpwQGryISlJY8i73XR6Jp+RQt6JG2qhk
         XSsXQJbX+amvFIFAp35u5owgEi5or7l+H7EZiwI/cjnoZbH8mqQx5+PC8Qidti3EI+sz
         /HTw==
X-Gm-Message-State: AC+VfDzU73qcTuvay4TS6SUeEVb9MamQp/jwTMxt4xGLgX9LpgJCwwHG
	K2M6ClzC9B5oSqE5UUhCXP8=
X-Google-Smtp-Source: ACHHUZ7XNS0Ka4Zavjp9uZSaETZlKXum4Ox8t6LlTxg+Hui9Jl0m6ncdtdAfQq6dIti7SzAdeGbFiQ==
X-Received: by 2002:adf:e345:0:b0:309:4f23:e52e with SMTP id n5-20020adfe345000000b003094f23e52emr8944522wrj.15.1685368287334;
        Mon, 29 May 2023 06:51:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u3-20020a5d6ac3000000b003062ad45243sm53692wrw.14.2023.05.29.06.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:51:26 -0700 (PDT)
Message-ID: <7b39f7ba-7e29-bf4c-e165-130cd3539d45@gmail.com>
Date: Mon, 29 May 2023 15:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_065129_431484_EAE8840D 
X-CRM114-Status: GOOD (  14.45  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 0088bc8e7c54..153e146df7d4 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -22,7 +22,9 @@ properties:
>             - mediatek,mt8173-disp-pwm
>             - mediatek,mt8183-disp-pwm
>         - items:
> -          - const: mediatek,mt8167-disp-pwm
> +          - enum:
> +              - mediatek,mt6795-disp-pwm
> +              - mediatek,mt8167-disp-pwm
>             - const: mediatek,mt8173-disp-pwm
>         - items:
>             - enum:

