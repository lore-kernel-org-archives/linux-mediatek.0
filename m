Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6D8C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6g1ytsthnfWXIku4aqH3xhdM/9Ri2X7FyfLWo9ROV8=; b=HhRAaSreth3vJ1A0qF86d8FG15
	Hr35PrhuSubGNO/fJoDStikgWWVWS9ZQri0mmNB/aTV7cSXY/t/tjPAYMYFOfiyatIPw46g5gS0W0
	+SvoBod0tvqNnhLbobGu4v1D4/fWxq2uD39ZsF/nPUXkndtGPEaZzp2bBkWo4Q6UHNu2tT/YWdhZs
	b3mOocZ83JxBye4+5I/GM+MpB7erc8aBaKsIoCUHjzfF69FTVuv/gcCJyIoktqn13HlmLrIKr2D+L
	iHUv+ACS7uJvvwzV1x5rvqOvvPM2k3beQqbVR62rSYl8k1QVH8zfMdfoqfCPAExnN3h/WfrLnQiDb
	bfQUSr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUGk-006Qr1-Ch; Tue, 23 Aug 2022 13:48:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQUGe-006QoU-GK
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 13:48:34 +0000
Received: by mail-lj1-x22a.google.com with SMTP id l21so13568413ljj.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=i6g1ytsthnfWXIku4aqH3xhdM/9Ri2X7FyfLWo9ROV8=;
        b=lnuCGHm/PTxz1gMjlh6EwYedDmDSkRIcLQu70CyscsSnw1bFVmYmwYZU7Vskw193FH
         /gaLFbR7JgbcnCLuvFKdex8r461kKWyBn1HdOLi9u6roSHpZKBEwrRM2Zsoh7+rdEsco
         v8unp4dpv0a5xISb/Cl3YsM/lPwz1OSib5tK2KJuRZtzNKu83K17rsTRcMvMU4pWvlOd
         1BLlHWHRD2evfPGxn+b8kZDL+cuUGoa9TdbdupPzwePky/8K2AdrQuEflNXthdxPp1YG
         kLPS2mKpS059ru57iN+9ziA78SGoI4dugzGm0MKb1EajM98qMzCzBGoxKZmSfoCzoFNa
         7UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=i6g1ytsthnfWXIku4aqH3xhdM/9Ri2X7FyfLWo9ROV8=;
        b=XUb6kI2mn0+dcKGuUT1et7FPitF4MCtIfbMug596OV9nZvd64tpL8amU5uo8uGvGoK
         YnkQIJoVpovRy86yWicxi7GHsUmhAKQVy3Kyfexqs2cOJmJTlCGcSa0bctPmzqyeSPli
         O/yVRJQt4baRdottBMnTon8MViGF6KJxzpVoyrYiYjWukBy9UNACYKmN+NgEU9PlDoEe
         uWMinalR0WMDsCd++Pz9wFjZ8SYDEJrxpkZiyEH/KauQlho9IzLApQ86AborjYX4vYUo
         7v5Q2Wo9b2I0GUolryyl0ZgPeAeP4IdkrkWvS9x0QB9NVFj6i8KV5QpN1MA6QvzFVMZM
         5s7A==
X-Gm-Message-State: ACgBeo0IVaV+MnNbTHoT3nYChO7GEH5QRh4GXGnAvoI4cndsW9+MgmmR
	pEz7dpl3T0lOs2aBg6fRZBQ5tg==
X-Google-Smtp-Source: AA6agR6/zduTpM8TBLJ4dYqpdr6hx69FMcRTHKzThqsgckEidignmxKxVwL0wGuNZc9gPHwW/XWewg==
X-Received: by 2002:a05:651c:509:b0:261:c6f5:59e2 with SMTP id o9-20020a05651c050900b00261c6f559e2mr3908472ljp.28.1661262510922;
        Tue, 23 Aug 2022 06:48:30 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id q13-20020a19430d000000b00492eb7205b0sm873422lfa.210.2022.08.23.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:48:29 -0700 (PDT)
Message-ID: <2bd97f8c-8613-1414-a185-9ef2e17925dd@linaro.org>
Date: Tue, 23 Aug 2022 16:48:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
 <20220820075343.13993-3-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820075343.13993-3-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_064832_592973_265F10CC 
X-CRM114-Status: GOOD (  13.79  )
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

On 20/08/2022 10:53, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
> ---
>  .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> index 059a7629b2d3..0281984fc916 100644
> --- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> @@ -43,6 +43,16 @@ properties:
>      required:
>        - sound-dai
>  
> +  mediatek,adsp:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

No need for quotes.

Best regards,
Krzysztof

