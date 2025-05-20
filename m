Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9128C3ABDD
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91WBueY131sZSsyId6mcsaWv/Rp/Hr4fyR1YmtF+OYk=; b=XKrfcp48+pO4U/
	yd+7ImZM7kBki3pMfnOfjbwrVTvdZo3ihnXvoCVN/XC9staCqVwbUBYOJp17NrpvEIreAzukbSqzb
	4HvrE746PG371esjibZ26yUcZvNmHdEkgf0xUEKplybr5XxceDKF/r9Ivf6e77hxWqtfUIclEYjA6
	pn8zDETGzFptSaw2LImumbCBHbjHMi7548DsmWcWdP6RHDeqshg6eykuDLg0jpt9fxDCotCWDLdFS
	ggGltRWKiVCnYCiZNyk0yFFnRb8gYBQKgLYWTnZsWEVOvOqliEWHTDDwSbNCufBw0Xd9jiq6Wf74S
	SnhSlNBIteDxiBiNZc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLf0-0000000CmMq-2rMg;
	Tue, 20 May 2025 12:01:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLYy-0000000CjcA-1DsT;
	Tue, 20 May 2025 11:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747742114;
	bh=5RUqzLMaMG5lBzncssnhHrZkrCiokJ9qjd2PNJ/2yKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BH8osOYNE7umJPQkBEZqyCmHfgRY16TdRs2HA7tz8P7i5G1ORAwxVBwf5J7EaHD7t
	 XtvvFJRY/KMIdb+/byxSxyM77NPEozPuxAz1Og+VhFJrz9BYTCdW+UvHcX3810mpmZ
	 X6FJlJdKPEZdbkKNoLxZa7xxiC9Y54n8tyYqvsyfijatmWygpWMCyAChgviL3OvgBq
	 4gJfIB1QsnR7ftaC6l9v4nZBNtVtbAlbH6lMTatgsRIu7XivtkIVwqqDgZw1EXIjXy
	 HaK5Bz7V5dyqHytCdpCxpx6gNex0rlT0egjiajJfzypwdb7dr3ieooKjIaVcIw0l9y
	 MF/SBS8B/IyQQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AE0D17E0E2D;
	Tue, 20 May 2025 13:55:13 +0200 (CEST)
Message-ID: <c83aa789-662a-455d-a535-237d42df3eb9@collabora.com>
Date: Tue, 20 May 2025 13:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] arm64: dts: mediatek: mt7988: add cci node
To: Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-8-linux@fw-web.de>
 <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
 <4BEF26F3-957D-4BB4-BF7B-69DCFCC513DC@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4BEF26F3-957D-4BB4-BF7B-69DCFCC513DC@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_045516_508924_0427E02D 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/05/25 13:53, Frank Wunderlich ha scritto:
> Am 20. Mai 2025 13:27:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 16/05/25 20:01, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add cci devicetree node for cpu frequency scaling.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 33 +++++++++++++++++++++++
>>>    1 file changed, 33 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> index ab6fc09940b8..64466acb0e71 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> @@ -12,6 +12,35 @@ / {
>>>    	#address-cells = <2>;
>>>    	#size-cells = <2>;
>>>    +	cci: cci {
>>> +		compatible = "mediatek,mt8183-cci";
>>
>> While you can keep the mediatek,mt8183-cci fallback, this needs its own compatible
>> as "mediatek,mt7988-cci", therefore, I had to drop this patch from the ones that I
>> picked.
>>
>> Please add the new compatible both here and in the binding.
> 
> Ok,but you have to drop last one too (add proc-supply) else there are build-errors.
> 

Many many thanks for the reminder, but yes, I already dropped that one too ;-)

>> Cheers,
>> Angelo
>>
> 
> 
> regards Frank


