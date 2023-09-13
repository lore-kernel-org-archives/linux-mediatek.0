Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CF2EDEC40
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZWcswEMpJ2jN9vrru0ro0v0AMVVsz0uMFp3dLr80ho=; b=DoylbxDML3vuVIFjYPhFFoQqgK
	OAq6QMHN+zLXkZNsA1opiEgQrxHjnAECCmwJgaxJnp+NQ2l9pXsSpwH5kdBvqCmW1X1+CaT+NSE+/
	9LsZiT4gHOUrqBNDzrGnfL8IsuVUqpcwtc5PItE9+Z9DP8qRkgEAFn6mKdGZn10TaxDaG0+z1LHiq
	x004ZpY1QCbVuuFM+S6qfw0lgmXZXb/YNLi0LEKjI77+IY+8uXPKznmSGAmaMbSVnR5YBV+f2VHp6
	qCYI02pkYpIkTzKdmUaUTQboSENQYx0rQOLPLULO2gGRxcNYG4f7KsRCoqRRz+bG9KgVYMiDS+3aw
	Hc1weglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNyK-005jWq-2B;
	Wed, 13 Sep 2023 11:23:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNyG-005jUn-38;
	Wed, 13 Sep 2023 11:23:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D15C660733C;
	Wed, 13 Sep 2023 12:23:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694604223;
	bh=9bbmy55p17H7G4i7jka4gKht9RxZ3/YHdBartMPUciQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lhb4dsm6d9pEPz7v5Uo6JLQbKBWeuoV5tnibypNvmbZDU8IbCAQcYyW0Igfo4n7fJ
	 oGxnqpXd7BuAVmt5NkfJ2wx370twKmDQveLoJK91hulotM9ovn0IhdBxHprEAtfYwv
	 0Ek7hDRrvR8d2YiL3d8ymXTzBsjUx7yuVOdRuLLepjyaIZcV4ZzsHV0hpA9iiZ3WSH
	 2RYaiXYGhAQnkw6cdpZ2uP4ZahIuyDonfv3v6k8nfNYgfxNocbKRfU7XJDFEldRAzN
	 QMuiYqZiMesfiD6gidwb4+RGnVid5/Ecai/Gq5ja+jHYZchVQ3KI2syxQ4IBmqCV++
	 hKnuQxynpoNow==
Message-ID: <8da6396f-3cd4-9c78-06d1-2d2f60d9be3c@collabora.com>
Date: Wed, 13 Sep 2023 13:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC v1 1/3] dt-bindings: thermal: mediatek: add mt7988
 compatible
Content-Language: en-US
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 linux-mediatek@lists.infradead.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
References: <20230911183354.11487-1-linux@fw-web.de>
 <20230911183354.11487-2-linux@fw-web.de>
 <e93aa8a6-e088-2864-6ffa-050b211be21f@collabora.com>
 <DEAA91BC-C55C-4AAC-BA35-0060A01D289E@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <DEAA91BC-C55C-4AAC-BA35-0060A01D289E@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_042349_158950_8E4448BD 
X-CRM114-Status: GOOD (  13.82  )
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

Il 13/09/23 12:57, Frank Wunderlich ha scritto:
> Am 13. September 2023 09:49:08 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 11/09/23 20:33, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add compatible string for mt7988.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>    .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>>> index fe9ae4c425c0..49effe561963 100644
>>> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>>> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>>> @@ -18,6 +18,7 @@ description: |
>>>    properties:
>>>      compatible:
>>>        enum:
>>> +      - mediatek,mt7988-lvts
>>
>> Are you sure that MT7988 has only one LVTS controller, and that it is global?
> 
> Based on the information i have it is only 1 lvts device (dts node) with 2 internal controllers. Do i need to define it in different way?
> 

In the MediaTek BSP, I can see that the controller at 0x1100a000 is referenced
to as `MT7988_AP_DOMAIN`... this means that this controller effectively is the
LVTS-AP one.

This means that the compatible here should be "mediatek,mt7988-lvts-ap" :-)

Regards,
Angelo

>>>          - mediatek,mt8192-lvts-ap
>>>          - mediatek,mt8192-lvts-mcu
>>>          - mediatek,mt8195-lvts-ap
>>
> 
> 
> regards Frank



