Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC89CC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPgEx3GtMaUfzrhotDmNS7q39kZcogdON2mF0DZp2xw=; b=GEqLSPmyufAcmeVeW6v84kto7c
	RsHoQ3PaZN8ftbWOTp/7GHzhIfV63QKhwqDuYAzGtWWl6GF+n5PHTDRrMKtGm/oJMzBadwtYPldKi
	kfrdKT6W8X1QAuEc7el1ZgHKkeHrsOrrUJ3b+41pSvcuMs8sVnTkqMNESLzVJZ+wJBK0tWVyQFNT9
	EkGps52gHp9KT8PNBO7B/K9kdqwWv6KPshO01VkSDWURB/oXs0u64TUHX7vDiXjipUv0WNMVPR0Yd
	2zL2XxEP53k6axOr2bmmh9U8YORhabeaWmcPnHsLd6YDc8oVNGisDSNfRtDAhtOO3tDC+snQr+uHD
	4mH3Wjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9TPX-00000000dmW-1olA;
	Tue, 21 May 2024 17:36:27 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9TPV-00000000dls-1dD9
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 17:36:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e716e302bdso35595121fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716312981; x=1716917781; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPgEx3GtMaUfzrhotDmNS7q39kZcogdON2mF0DZp2xw=;
        b=aXbHAhbACRS02P1N/uQ+v2XNsRcdhVCdEzvkp2+20PN1zLEnBHnORsLTq88ZrxQzm9
         RWBKwtRAtsb11gLjtMX2TRQAfTt51z8aGmY9bf8FtNrU59ONth211FIiXOk2nQqJajS7
         ezzgoCGMZVGTv0ASp8pofds54ZD15w1lyzoSiHkMtxkp7OfYUoA9te3CHVoq1OZNtXmP
         RUFrBAfyV9lRwmd5J+cLcVCO6S9rmQkth3kbmORGsRtEcBc24xqzKG6bv0ycN7lFJdQA
         4OtrB0vrjbw5SRXGze2Gm3gDvA8kOLVQhTRoa/w+YOcatDmPTSQdEBM2MhA/QC7B6Rw5
         fJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312981; x=1716917781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPgEx3GtMaUfzrhotDmNS7q39kZcogdON2mF0DZp2xw=;
        b=p9U1upg/mNbQJ8X9VEwf9VEHYmtHbcYpUkFyKe12lEAyer3jjbTcuZPAVg1+ZoEx+s
         9GnnUaHzOVBHyxgewvFOH6ScnVT8kjL9wI4kLrKx9hFxiktrpfpciN9TvYYsHGnpC7m6
         6oQ8LgOfKpaG216BDLi6+70sqGqdZnjZuVBrlgJJmpbl1tK8AyA6YKr8JN8oNuO2J+IG
         dTar6Kro/GlGE6OcwqkCSQR5DJEjL9h/JjJP3lJOCHIhQy715E7opjs9PwUSDq/ABubY
         1qLpu8KQaJL1Z34c6fuHYjevxIjzkpkvNbgtZ0BAbo4PbjEXGwz8JTPmijWqGkCnC/Rr
         OVwA==
X-Forwarded-Encrypted: i=1; AJvYcCVuyl5pTzqr9QbIJS89ndhslAw5s1iS3GkgmlSjERp5OSz7NmeMPzWzGDFkAESKYNqA7iGL5xzwZGTqhbZmnz2vmLdNPMGqzuifip3+/xpVZeMy
X-Gm-Message-State: AOJu0Yx1zG/cGjLppqfc8XVeiXtlFUZXJTG5GkaSrirJtk/ej8j6DGEK
	iKzxCVS5p0u70frgofE8S4R/RRqY1PLrpSllaJLs40/+98ssAgu9MEz2jGuuX+A=
X-Google-Smtp-Source: AGHT+IFjJk9ErXRZ9mgIVn9Q70lSKsJgFXX9/mhVTn1VEkxcNEDE0qL/KX6kDba10kEFw4rs+oNWEg==
X-Received: by 2002:a2e:9b19:0:b0:2e8:60e2:3c8d with SMTP id 38308e7fff4ca-2e860e242f2mr6435921fa.12.1716312981380;
        Tue, 21 May 2024 10:36:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfc6sm32606201f8f.72.2024.05.21.10.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 10:36:21 -0700 (PDT)
Message-ID: <a2ef92ad-7704-49d2-9cb7-783047e5676d@baylibre.com>
Date: Tue, 21 May 2024 19:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek,mt8195-scpsys: add
 mediatek,mt8365-scpsys
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_103625_437333_03370CB1 
X-CRM114-Status: UNSURE (   7.43  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 18/05/2024 23:11, Krzysztof Kozlowski wrote:
> Add a new mediatek,mt8365-scpsys compatible, for the SCPSYS syscon block
> having power controller.  Previously the DTS was re-using SYSCFG
> compatible, but that does not seem right, because SYSCFG does not have
> children.

-- 
Regards,
Alexandre

