Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85424C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM1cXvWA1i0knwqswfw70xmFV65eQs9q9yVBIQSrHSQ=; b=JzHcpMBUt0350tRVolIlCkgf3U
	o4xaTkbVvetqTi4nugaIbwL/Za2mb6pjueSZb5LtY0vU7GpnVNisDGvCkj+nDBUAQtUhmqnx4yK7h
	MSQgE7lePoRoZ2FS455dlDDLow6FXiWasvR5FCqfxUdtcRhmODmpdVmT35XxmEdr9tg9PxrrPD4Aw
	V4kZgy/FmsYJC+Obkhq95y3dSAZJVM3Qw7HK5o6nBqiRoy+N5B/g/cJY+/G6rNVa+Tgv+gwr+lMux
	Nskzy4gSRgZKPpYiWSCem/NWAAkDVgwPTxiBnYfVXc5y4jq7Uiz3/rpOX0CGWeIfQT9lGUA3f/o2Q
	yFq1dgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wZK-00Dc16-F6; Wed, 21 Dec 2022 10:43:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wQM-00DUVI-7o; Wed, 21 Dec 2022 10:34:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C142D6602CBE;
	Wed, 21 Dec 2022 10:34:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618848;
	bh=dYnHLUJwsMgAqRqXR0SLLIpg7sZb52juTMDSydtg2x4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NJWuTs4kLFIVz6qdw1/352wJnSGg8W+CUVh5jJ4Fh0eCzdhJcGGEbC0udVFsDxFVg
	 RhrTq8CShiU7b1sr1rsIXkCnufUZ77mMTIgsYMxBaEWp5gamaAqX5RtVXMadVMZ+tU
	 wyYSJjGk8Wgs5PRaOWa+bpvVZkjvraBBNBTlepzIsoSByhjYhBl0pLWJbYJ1+cS4RF
	 4YRefd0VGzzz9In7DgfUZBsm8TMJBzuV6uPAQ2RWKW55KeeKtfSl2YM25JvYFXG6qa
	 aaZPhdVWbmLfRhlLpJRjBtC/m2IIGaSblzKqeYz7sL1YVpyWPtcWR337m4AryTNZtH
	 9/VPFLvpFqUvQ==
Message-ID: <9ea3d941-e68a-ce48-5f34-264f925c4358@collabora.com>
Date: Wed, 21 Dec 2022 11:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add missing
 power-domains property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
 <ec927229-cf03-136c-5629-22719110313a@collabora.com>
 <403b0310-070f-1ecc-2188-95c22859bae1@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <403b0310-070f-1ecc-2188-95c22859bae1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_023410_623129_BAC3F972 
X-CRM114-Status: GOOD (  13.41  )
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

Il 21/12/22 11:33, Krzysztof Kozlowski ha scritto:
> On 21/12/2022 11:22, AngeloGioacchino Del Regno wrote:
>> Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
>>> The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
>>> specified.
>>>
>>> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>>    .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>>> index b57cc2e69efb..ce8dd2bfb533 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>>> @@ -40,6 +40,9 @@ properties:
>>>      reg:
>>>        maxItems: 1
>>>    
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>>      '#clock-cells':
>>>        const: 1
>>>    
>>> @@ -47,13 +50,27 @@ required:
>>>      - compatible
>>>      - reg
>>>    
>>> +allOf:
>>
>> allOf is unnecessary here.
> 
> If you mean that "if:" can be without it, then it is better to have
> allOf. It grows often, so you avoid useless indentation change later.
> 
> 

Yes, that's what I mean. I've suggested so because I don't expect this list
to grow in the future.

Regards,
Angelo


