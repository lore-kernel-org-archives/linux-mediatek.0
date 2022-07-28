Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72666C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/eKsc2uKJWdGdBPl+AbBqhtWo8lXeOLPWLk2KCcm1s=; b=riXEA979zujLdiF57saA4+tG/m
	g15WaDEg48u5EixUP6LeaT/FY1+yTuOdGfcTwDKklQO65sPLMplKluiH3e4ynEFNHYBkMDTaYCg04
	EypORmXK8ppHPcwPIWBNdQ5zGRoxCG857dXt3KL1Se37BJLMUMPKY998wPiY1pJK4yoKFUiaKphAe
	kw0/Veg+hMCXssrfaBaN779CfCE5KskNJTW3ZJnwrFiTy+Y5CUPjHz7CajFE5Qhh6frwMls4ac7/r
	e79T0LqeeJ1wa6ii3miJpOFZpBurcdY2eOG9WjMm2tYWaGq5T55N1GgQ/vGWgh4oHSBRW8wOuFm+g
	02QmYDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2C6-0090RG-Qq; Thu, 28 Jul 2022 12:00:46 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2C4-0090PY-S3
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 12:00:46 +0000
Received: by mail-lj1-x232.google.com with SMTP id a13so1699630ljr.11
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=C/eKsc2uKJWdGdBPl+AbBqhtWo8lXeOLPWLk2KCcm1s=;
        b=nKujWu5wmdQkM5cn/pFm6/mFjkqKtmL5qBXs81oT2GuPmaqbHrBRI7ZEO0M/Hmo+tR
         mpoPpSJzQ7L2XxpzsaXdcDecYGINCjG3Pmy3NSLXBHMOlBFHJu6wtty5eVmieRZwh4x1
         y6Byb+QckvrtnLdH1YCQBBEaNR5hy6pFbDwil/uzVkteZ/VSjMUNgc0oRnxgj7/Cnlae
         cddpApIV/fGSzVb+JuHFMYQGG+LbeEEnoFNtHJTCfhJnmhbb5Ugv2ZJlhWyUNioYEJTo
         xqTDudeK+1uqeoAW4uVpilYkEH2TWhxZKr6gD0iG5+WW8mbGfIGqLJDEPhRpPM5kBaqh
         CTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=C/eKsc2uKJWdGdBPl+AbBqhtWo8lXeOLPWLk2KCcm1s=;
        b=MurIxTmZyjMbtB8/aiWuYyvwRH5BfeXG+rc63UhEe10SxrkWc7pwZA1niaYIAMZGdV
         HJDx8qDCZkBzXIQYEUWWcOZo4PlkLabDeh/wFahBbzCvuqjcDSENBxmYMOACY6zkLpuf
         JykdAxMyUcm+B3vOqiBfxkk2PtIh+R6oJUX9uEm9SfoBV89qBFPfzKZv+Gu5F0iTURXy
         2CKUKdtUkcp/ANjCeHwObX3Fa4MFgrAVlGldnzSw/pO0y+j7Z6f7gYKxGSdLcIZFkuQh
         hOK3I5rzQeVGuOvuLUlJZiEBuHGdtP2McqV9SXHOZIMB32G9o0xaJhFYZsslH05c34mo
         cMyw==
X-Gm-Message-State: AJIora8lRKjr9wa4rFjbq8DTcmvxC2iIF9/1d/c+jKhI8ZVLYjC2TJrc
	C5G5YWytJCl5Z6LyKStM002e0w==
X-Google-Smtp-Source: AGRyM1uOky7iW93JbEjxtl3fFNWBwgD0p9PteIplGukiC60P+gU7cqklc02N0r7zrgQOigBXsrxzfA==
X-Received: by 2002:a05:651c:150b:b0:25d:ead1:dfa1 with SMTP id e11-20020a05651c150b00b0025dead1dfa1mr8794465ljf.172.1659009642849;
        Thu, 28 Jul 2022 05:00:42 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id p6-20020ac24ec6000000b0048a9b0fe780sm163033lfr.286.2022.07.28.05.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 05:00:42 -0700 (PDT)
Message-ID: <3e00dd43-3c0b-207e-ba41-d46b0759006e@linaro.org>
Date: Thu, 28 Jul 2022 14:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: spmi: add compatible for mt8188
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sen Chu <sen.chu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Hui Liu <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726103729.24525-1-sen.chu@mediatek.com>
 <a7230c4d-94dc-c0fb-e39b-50de971da511@linaro.org>
In-Reply-To: <a7230c4d-94dc-c0fb-e39b-50de971da511@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_050044_941048_620A7628 
X-CRM114-Status: UNSURE (   7.31  )
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

On 27/07/2022 12:26, Krzysztof Kozlowski wrote:
> On 26/07/2022 12:37, Sen Chu wrote:
>> Add dt-binding documentation of spmi for Mediatek MT8188 SoC platform.
>>
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Un-ack.


Best regards,
Krzysztof

