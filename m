Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA1AC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0haZW6xREx05oo/OttdLfNmKhaLURqoiJ3M1lL9b6hs=; b=3RlHqw6XUcbLN4uc6U6FRRQlYe
	zlRF3WEzKHWF54zRK0/CjE3T+/Kexts0gQW9aqumoNhEbQPWmCIxSrkoJ8oRacFN/KAP8ad7QLSRs
	jQVE+/zAvvtY6W/RBuvO8N0q7EKjHllchbzRe7eJ7wKsbLiJTKHXldy5/jC1E6CjWVLjHN+4NgThS
	PkIZ5wVb791jH6dDHmikshBtBpgNmcqx5pMLXK0jXKI6xqOyPuZsiz3DszQCpktfLBZs0AeVeslqU
	sPxM3+Bsk/+JJzmZXyF9Xr7YnkGF+TLbrpA3DVGosA5IEFl7RI6UVvVjwvzg0m9dF09enSS8zcD08
	kw2n71TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBMQ-00000001k4s-3Dzs;
	Wed, 31 Jul 2024 15:35:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBLj-00000001jpB-3sT1
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 15:35:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so576817766b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jul 2024 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722440085; x=1723044885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0haZW6xREx05oo/OttdLfNmKhaLURqoiJ3M1lL9b6hs=;
        b=dCLBHuNas81Nt86ipQ71Fp0Evun0YHovPdBQK0lZqad94ypDF4SQ3RJ1wQt7+gd1hQ
         K3gzpuKnQrhWThUs9UNcraYxM3Ms320HXbHebGBuJI7dC2o7ZSV2znUqMX/4FlKtaRvO
         xskWszsTSDD76idgwW6eLFGxzsHT0Ec4jQD559kKCmT6jeyBUJFRQu0embvzEUqCgib3
         Pc0n9ADtqAwp5tmfncvzXEwMpYbCHP3ycBv+EeVIBzm6n8EEEDEmwDojHVnJ9QErCU6V
         TMWaT+8Ek7JTNE/+HJ7nW055Sc9khTrKyhWZQ/vtxF4ieK4w5jAnwvYQ5S7BhFd4ULIh
         Mf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722440085; x=1723044885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0haZW6xREx05oo/OttdLfNmKhaLURqoiJ3M1lL9b6hs=;
        b=ZX6oamp/fkeBEWbBCN+qvtB8S8gkrJ887sfax1JIz61/i1W5TG9uopUjVi7VqTI0dk
         uD5257qJS1/HnZYgaTzhH4IuLqZEk2d4uOFK+6bVwMQTEqyKx8+QZR0nSKLxcTkjHJmj
         bItqInMgcYqqcXG6qggWELsxLxOp7Ek+8XobU75/4Zntz7iXiO2cS3sGxsXW1wRUEbDD
         iKPr3RdJFA5Iw3RpWtIa58oSg7MZUTzwge+vAUfWvh6yOr9NcxnjnGxcp2n9G94E5fib
         lTFXm8Gd9IexavGDfDs6mjygXQoRSc5wM66guTuvrmVCItT5q4ejENbKpnyKGWXLahJm
         DGqg==
X-Forwarded-Encrypted: i=1; AJvYcCV3JG4J7xIZTh0z7vuTL7lu7OtzjQoYHaFlP8IK/IHGQI90m0VnOdgiKsNjUVEjTPuxkfrd5YqUbKh9EY5cTQ4OIJ2z/+TwMOI95Ll7aqM70RCC
X-Gm-Message-State: AOJu0YxCh/Q9AwV+LoRsysFtx7Fbqysvn96BdsXCWygH7amnz/RrYDv9
	7nTMSN12GzHGM8ErcZTqATte8X0qRo9fFCy7UESqnK/ogoqc3at4kZdz7iDebZA=
X-Google-Smtp-Source: AGHT+IGEPSvbY32kvTP+Dedi5GlwS7ioq6a9GjXU2i8Z1P0SOaRgOy+7IlOcspRR43306XeEquyROQ==
X-Received: by 2002:a17:907:7286:b0:a77:f2c5:84a9 with SMTP id a640c23a62f3a-a7d3fffb6f5mr1155473266b.18.1722440085443;
        Wed, 31 Jul 2024 08:34:45 -0700 (PDT)
Received: from [192.168.1.68] (120.205.87.79.rev.sfr.net. [79.87.205.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab22bfdsm782913866b.34.2024.07.31.08.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 08:34:44 -0700 (PDT)
Message-ID: <abefa449-c0bc-4b58-89b8-d4272f7774f6@baylibre.com>
Date: Wed, 31 Jul 2024 17:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v7 0/6] Mediatek thermal sensor driver support
 for MT8186 and MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
 <171826604410.51825.14935271158174620262.b4-ty@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <171826604410.51825.14935271158174620262.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_083448_009070_07A2BC2A 
X-CRM114-Status: GOOD (  13.62  )
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

On 6/13/24 10:07, AngeloGioacchino Del Regno wrote:
> On Mon, 03 Jun 2024 12:50:47 +0200, Julien Panis wrote:
>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>> sensor configurations.
>>
>> Since the patches of v3 were applied except those related to the SoC
>> device trees, this series includes mainly patches for 'mt8186.dtsi'
>> and 'mt8188.dtsi'. Due to some thermal zone renaming in these 2 device
>> trees, the related definitions were also renamed in the dt-bindings and
>> in the driver.
>>
>> [...]
> Applied to v6.10-next/dts64, thanks!
>
> [3/6] arm64: dts: mediatek: mt8186: add lvts definitions
>        commit: 0c598e50e6c823c1057ddad17c546e368a415d6a
> [4/6] arm64: dts: mediatek: mt8186: add default thermal zones
>        commit: d7c1bde38bf37a59551cfd52cfdb5bd974b17431
> [5/6] arm64: dts: mediatek: mt8188: add lvts definitions
>        commit: 7e3e18f2ed40ea9018590b4533fa148954a725bc
> [6/6] arm64: dts: mediatek: mt8188: add default thermal zones
>        commit: 2f950510411a33d98eea28c22d7880eeb48adb61
>
> Cheers,
> Angelo
>

Hello Angelo,

About this series, the DT patches were initially applied, but removed
due to missing dt-bindings in linux-next[1].

But now the dt-bindings patches are applied in mainline[2].

Would it be possible to re-apply the dts patches please ?

[1] https://lore.kernel.org/all/ZnBn-vSj-ssrJFr2@sirena.org.uk/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/linux-next
4262b8d782a7 ("dt-bindings: thermal: mediatek: Fix thermal zone definition for MT8186")
744ca11f52e5 ("dt-bindings: thermal: mediatek: Fix thermal zone definitions for MT8188")

Julien

