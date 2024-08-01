Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80324C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9MF6Pe4fXq99XGtd4btOXQy0qMcu3SpsHpd4d2n6Os=; b=wOUylVQnw8RCiNwlPHAfy3c3RH
	sUTXQx4sYPXQE8gzC0y4AZJc5GWDNAPFpx7L4j8J/EGlXOZOfW7Q4u/GBCoYPjjPFUtWr/wlhl0/D
	daC0Lq9jBh4ToFMDiS/bgc7HaGQ82rZ7lSqq9qfzk3DB0OF7Y0yjwP7dJ/ivruoziB1wmKvcBUUiF
	jCEh/Nj/receQRd1Jj4jDIags0KZlx5uTBaoE7UzbLG5sqpABOHqvA0bG+73JhO5UfDO8xtVzqAnN
	kXqrvCka+MfeHg5oN5FO5vTm/vDoKNjCOCOknjVPNTLt4uXBTVs+sFAZM32/SPDKSN4PfaLRzF1WF
	ls4IsRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR3m-00000004K3k-0hmh;
	Thu, 01 Aug 2024 08:21:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR3G-00000004Jwd-3ObO;
	Thu, 01 Aug 2024 08:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500445;
	bh=pxDD+VqHUK/fgNuVfTXryZFPFuOe9Elqx9CJ2loe6/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItQK+fI08GD1pTQ3PR7NQqWCG2Ggto5LWuHL75Ztu/qlUAQKHkATCIWOryCvSpGNv
	 OXfGHt08E7pb2nGSWfi9FXbT4Enfkt2b/UPQekb1juW3sgWqxB5iePyRe1wr4d7mv3
	 YEilLf2wws7u7RVF9jK7vQ1Iqrz396YIkZEgXH9aoNIFHPEKTWeeHVrt1eqw8YbaP8
	 5Eg2+anUn4RazRZ6g0JW2On9WVuCm33AGlLWCjI8+l3stlORjEBZ1LgqgjICqYIH71
	 RB0CIjZoAXKFX7jmOZTrMX/3q2NvfOqgtiGE4sTo3kT5lL/bh+Y5DwLnx+jb3CCSmp
	 adywNqe2Gq82w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2FA4B3780520;
	Thu,  1 Aug 2024 08:20:44 +0000 (UTC)
Message-ID: <21a9fcfa-e92e-4178-bbae-0193f8b86987@collabora.com>
Date: Thu, 1 Aug 2024 10:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v7 0/6] Mediatek thermal sensor driver support
 for MT8186 and MT8188
To: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
 <171826604410.51825.14935271158174620262.b4-ty@collabora.com>
 <abefa449-c0bc-4b58-89b8-d4272f7774f6@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <abefa449-c0bc-4b58-89b8-d4272f7774f6@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_012047_014973_3EB9C5F7 
X-CRM114-Status: GOOD (  16.36  )
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

Il 31/07/24 17:34, Julien Panis ha scritto:
> On 6/13/24 10:07, AngeloGioacchino Del Regno wrote:
>> On Mon, 03 Jun 2024 12:50:47 +0200, Julien Panis wrote:
>>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>>> sensor configurations.
>>>
>>> Since the patches of v3 were applied except those related to the SoC
>>> device trees, this series includes mainly patches for 'mt8186.dtsi'
>>> and 'mt8188.dtsi'. Due to some thermal zone renaming in these 2 device
>>> trees, the related definitions were also renamed in the dt-bindings and
>>> in the driver.
>>>
>>> [...]
>> Applied to v6.10-next/dts64, thanks!
>>
>> [3/6] arm64: dts: mediatek: mt8186: add lvts definitions
>>        commit: 0c598e50e6c823c1057ddad17c546e368a415d6a
>> [4/6] arm64: dts: mediatek: mt8186: add default thermal zones
>>        commit: d7c1bde38bf37a59551cfd52cfdb5bd974b17431
>> [5/6] arm64: dts: mediatek: mt8188: add lvts definitions
>>        commit: 7e3e18f2ed40ea9018590b4533fa148954a725bc
>> [6/6] arm64: dts: mediatek: mt8188: add default thermal zones
>>        commit: 2f950510411a33d98eea28c22d7880eeb48adb61
>>
>> Cheers,
>> Angelo
>>
> 
> Hello Angelo,
> 
> About this series, the DT patches were initially applied, but removed
> due to missing dt-bindings in linux-next[1].
> 
> But now the dt-bindings patches are applied in mainline[2].
> 
> Would it be possible to re-apply the dts patches please ?
> 
> [1] https://lore.kernel.org/all/ZnBn-vSj-ssrJFr2@sirena.org.uk/
> 
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/linux-next
> 4262b8d782a7 ("dt-bindings: thermal: mediatek: Fix thermal zone definition for 
> MT8186")
> 744ca11f52e5 ("dt-bindings: thermal: mediatek: Fix thermal zone definitions for 
> MT8188")
> 

Thanks for the reminder; I have applied those to v6.11-next/dts64.

Cheers,
Angelo


