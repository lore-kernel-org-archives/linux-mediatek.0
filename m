Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DABC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUV0B2evRba8OLOBqBc0gogv5ZUUOB3nvC4R4bxgD7c=; b=U260nD2+U4iYVYVxACqnSpKlWl
	4c9BAEucZuAHesUpegBuIMLghMLw8AYDSTovvWEopvseRsrT5AUXvm5XB0kdrQzVTdcXNEzP3npzW
	gW3OPzxcgE7dVBNSUPWRYyzmlIf+iP/U3Cm8WsOl6uJqKgZTLiT++NV9yGexcsb7f7bdoC81NH3zH
	T2rfkoCJbOEZwDeLuZ640Xpxf0YvTlLsiJPrPgISRx5Zl3DpIXZckvMuFazw/dnLIojL98z4/uGFn
	M8QW9jWn6v20MwEW63d3i0J4orvfluBXNQrRFc4XhhR/s+UbF6jZKx8YoooUHUpnEhSArapkNcP4y
	/Jud8xdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQtJ-00000006Ys6-28tw;
	Wed, 26 Jun 2024 11:32:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQtE-00000006Yql-2K4P
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 11:32:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso53249165e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719401559; x=1720006359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUV0B2evRba8OLOBqBc0gogv5ZUUOB3nvC4R4bxgD7c=;
        b=O29dGRnX7ZD4az3ViGs7Yz9x/Mv42hZ+7GV2A7W3of2kRX9C+Ejbp/ggjseFHc8uc2
         zX7GKehx7YvCiudC9IO+cis0Uu4pS3Aa5Nqd6cmb+hqBd61jMuQ9e7GfI/2RbupWNDE8
         o0InLpO0QkLR52hoKYvqk3+yK6TJZRNgGMMZsf7EAOq/kMdpmAyfqPjSBfcdWGeyl1ij
         6gwCyIARIjZ4juyz1ykAv5v1he5JSt2vNMnq5lrpa+7daPiAZq2K27hi9vfZeGIY/4tw
         BSdK+o4hZHOZGBbxOA1ARmQiMmkXGpZu8BjyLIqF4ZWwSJKUnPli+8xM5Z+A/MOaz630
         abnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719401559; x=1720006359;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUV0B2evRba8OLOBqBc0gogv5ZUUOB3nvC4R4bxgD7c=;
        b=o/iFe661+qtqBbON3y3CD+b3HVSQRFvpA7TCmHSIym07o6l9pZjnyONm+BHLXxKGm8
         W1teXC/Y92GXLD/jAXg9ZuV+PC12KsL7PVzKmyI4gyZXO4TaxEA3VG3zFuEDW4KNXeyl
         TSCDEbfDTac4XpHzZr+3Tf2i9R28efxXYqEb7WaWQKfc7NK7B/hF5i0wdmCBLqY0r3D+
         6A7mEBkaU1oUJTFmsL6jGTRWdCx8pw2oaXJHmwvn+LNNg480koXWeP5uUzu4j1L5dyIJ
         BoTAxA1KhZRKdFg2YYMtRH9FwsIp1OwqxH8hX1gfGbUUv1RqMI//l6If/Kf00AoA6sp2
         WNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBpmhC9eaYid3PSVkAfvYFFS1a5lwe6JD50z3x4056OjnFYADxY/Ky7PZepaGj2O2B2RMkzWo0ZKXGFtWQgWsR7fp/Y/Ne3r8dpAZePgXAPA7L
X-Gm-Message-State: AOJu0YyKz/cvIbEhm26coGuiuSxmrJ0ehQ39394Rnh5G+uDeY2NAlJjr
	hUfkO12pX111AyPVgBIpIquqLUga9ksqSSuS6y2zlQsNPR/NEm+kr5xlcVgDL0w=
X-Google-Smtp-Source: AGHT+IHK0mpDhVKNwOxESEg68fC+6c0gzgt3Lbu44P9FAbzspjfJJ8HDEIg2m7fZxubKvuK4CunOQw==
X-Received: by 2002:a05:600c:35c6:b0:421:eed3:5991 with SMTP id 5b1f17b1804b1-4248cc593f5mr77892025e9.32.1719401558835;
        Wed, 26 Jun 2024 04:32:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f696csm15537815f8f.82.2024.06.26.04.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 04:32:38 -0700 (PDT)
Message-ID: <1b1e0922-30df-4aee-aaec-22fc674bfb28@linaro.org>
Date: Wed, 26 Jun 2024 13:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20240613133840.6949-1-krzysztof.kozlowski@linaro.org>
 <25c8432c-7e2c-4d32-bf5a-225aeaaa809a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <25c8432c-7e2c-4d32-bf5a-225aeaaa809a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_043240_662217_0F1206BB 
X-CRM114-Status: UNSURE (   7.99  )
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

On 13/06/2024 15:57, AngeloGioacchino Del Regno wrote:
> Il 13/06/24 15:38, Krzysztof Kozlowski ha scritto:
>> Airoha SoC is not covered by any maintainer entry so relevant patches
>> can be missed.  It seems Mediatek SoC maintainers were covering some
>> parts of Airoha and Airoha itself is subsidiary of Mediatek, so assign
>> the Airoha maintenance to Matthias and AngeloGioacchino.
>>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

My intention was that this is a patch for Mediatek.
Matthias/AngeloGioacchino, can you pick it up?

Best regards,
Krzysztof


