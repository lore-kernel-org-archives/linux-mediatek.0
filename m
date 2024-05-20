Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C15FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHGBxKDSRAwkz9GOkKpjyDGJS5FfMPLL/9Zqrg3igro=; b=J6WBaqMF/XPWGDUSfNms3f0PGV
	qC3PeSj5wrRDA68x17gcMQrG1vly65AI1774apRgou4mfWa/AhHsbnjskS9encV7U4qiWgxQyj8bn
	a3m+P+12zjXDHydtneTyGNsegMgHQjx7/s8MZoM9+hZcnk+ULJjZ00CGJyk3MhZWB7r+f4G2Im7gb
	BhTX6I6wtK9VbuJgpeIVuHe9FrBGik+CIgM+TC2+F2mfSUxoo7ie1lw/K1dJ8wlxmiebXW+0sG9z7
	qlMhIOX1WGzOMTagMVlHnJJDr+N+IoXur+6ZASwtcPxtS5QxOlmL9zR6QWlyvZSRuqti4HftdaEPw
	1MKwkGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94lj-0000000Eoo9-3IWs;
	Mon, 20 May 2024 15:17:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94lg-0000000Eon6-2Tvq
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716218259;
	bh=uOtGIokG1ej2tjKbqGupcKq5GCu2h9Y/Z6vGZV0u5Xs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEJRy9kw6Npf7mH1E9bD3EIuQBame++rtyXg98us58+Q5wDNSXd+3ZunPzuNYT6Q/
	 4fXLAANOecpWvIoGki2FE25wKASJzcIG66ffpZJ//fnGnglhMn1MxhI85R5DHbf2EE
	 u0SbmVsFH6yrYm9CJpiGOxyqU7YN8Kk/lajgx+FxijhA3I4pxnRgKfzuhwoZ0hJb3F
	 3nBjfBn//3QToBasV5/TXI3+JmNyL/VaI7tzKaU8D/oAS0AQfysZFHIeOjKVJlNqGU
	 sO8N98F4CNw31ZjhOSNGSG85apx3031BocjAGZHQUzcxI+OJYpcMFjo6xA249T0Eqd
	 ir4O31HVWGm7Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB98637810F1;
	Mon, 20 May 2024 15:17:38 +0000 (UTC)
Message-ID: <42c247c8-f4d6-4adb-a44e-218acfef6dce@collabora.com>
Date: Mon, 20 May 2024 17:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
To: Julien Panis <jpanis@baylibre.com>, Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
 <13468147-6853-4bd8-bd3d-d1f1927133fa@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <13468147-6853-4bd8-bd3d-d1f1927133fa@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_081740_797307_28EA19EF 
X-CRM114-Status: GOOD (  13.34  )
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

Il 20/05/24 15:18, Julien Panis ha scritto:
> On 4/23/24 11:22, AngeloGioacchino Del Regno wrote:
>> Il 02/04/24 05:25, Nicolas Pitre ha scritto:
>>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>>> sensor configurations. Several changes are needed to cope with oddities
>>> these SOCs implement.
>>>
>>> All values (calibration data offsets, etc.) were lifted and adapted from
>>> the vendor driver source code.
>>>
>>
>> I picked patches 7 and 12 (and also fixed them) introducing the nodes for the
>> LVTS controllers, but will not pick 9 and 15, as they're either missing thermal
>> zones and/or using the wrong names; let's wait for the next cycle for those, as
>> I will also be able to add the SVS on top (needs a bit of time for testing),
>> getting both SoCs complete on the LVTS side, without rushing.
>>
>> Cheers,
>> Angelo
>>
> 
> What do you mean by "missing" thermal zones ? (is there some reference
> code somewhere listing them, or whatever ? how can I know which ones are
> missing ?)
> 
> It seems to me that Nico took into account your comment about 'tzone_name'
> and fixed these names in v3 ('cpu-little0-thermal', ...). Are they still wrong ?
> 

Check mt8195.dtsi ;-)

Cheers


