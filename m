Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48083C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bzMWkh3gW8Eu0SXEfwUMm4SsOe7CTvCWXHdr0YLwl0=; b=hF3/JEKwHVF8V9+dXhmtaozc5f
	N8G6a6M9SbBiNlBUuxuvGB9bZhwvZlGXy7ljRwbU4O8TzpV8npH9OrijjeUhiHpscZh+x/L2OcJ8V
	OjD/eXOM20V9/zocD9zLSF/bRv2YgPy3cXt7mVlq4Izbo3Q92F/bRJZ3cOcvoejA8kHUiViPNgGyB
	GGdYYSOfoQyyc6doIoxbrqm2/3P3yGA+EMspvDU9k6FWex9bI5uoUDh4L+7hbk44RGQxBqCMV7XcI
	KHApkAATfGW5PxufFvVED9I3CJmpfnlnpvsVfkotgNyDmb5dnb/8igStVgteKyF3YRU2WGX+mTXjl
	gxvdGGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQT8u-005vXX-Rw; Tue, 23 Aug 2022 12:36:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQT3Q-005t9U-2T; Tue, 23 Aug 2022 12:30:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661257822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kUK9R4fOwaIdguJnen90t1H1YQbeohUSP2LhXaNJx8e+EGaESiDQVSl46eS7CflyE3GlMPihP2qZm1bzEvbXb6WJ7/NTtG0+RB2LZVGcKaXeBOxtl0OvkR0I3/dbOOljLGKYYhjAy76G9yAugBB2VB4/5VY0GnyLxqSxZvBBPl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661257822; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=8bzMWkh3gW8Eu0SXEfwUMm4SsOe7CTvCWXHdr0YLwl0=; 
	b=NYszyn3Jo8l5YNCYoW3Wy9G+tFfarqC08HAObhTvO9HtrStza6CPsmX5qgq17HHe4HfdlBPyW68Nd6rs/e1cxyhxHOa4UFg1ywEAIgkbXwwkM/wsrq4OH5M+6fppcOWUg/9vx9E4Q5JOU2bEv9++dlA7h6lFYzjL1dqkKeVbf2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661257822;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8bzMWkh3gW8Eu0SXEfwUMm4SsOe7CTvCWXHdr0YLwl0=;
	b=GQGn9eXUWpek5t87stuU5SpJkW49SlhBluS2FgLOH1LPETIZWjitQ0DApqfjxnTn
	ncsT96dEzeclV0BIMljDx0sNLkOZTXsH9Nr64rxKCP8VPOHh197wTXypi59Kvi5w03V
	Uv+Zbc4l2nh4sNPBYvo1TH+48iudDowVpGgujxoM=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661257819881912.5959120446157; Tue, 23 Aug 2022 05:30:19 -0700 (PDT)
Message-ID: <fed417ad-946e-64bd-0d7f-5183cc1e5cac@arinc9.com>
Date: Tue, 23 Aug 2022 15:30:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/6] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-2-arinc.unal@arinc9.com>
 <70ae25b9-0500-7539-d71f-52c685783554@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <70ae25b9-0500-7539-d71f-52c685783554@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_053048_249482_D8F38B82 
X-CRM114-Status: GOOD (  13.51  )
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

On 23.08.2022 13:40, Krzysztof Kozlowski wrote:
> On 20/08/2022 11:07, Arınç ÜNAL wrote:
>> Make trivial changes on the binding.
>>
>> - Update title to include MT7531 switch.
>> - Add me as a maintainer. List maintainers in alphabetical order by first
>> name.
>> - Add description to compatible strings.
>> - Stretch descriptions up to the 80 character limit.
>> - Remove quotes from $ref: "dsa.yaml#".
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 36 ++++++++++++-------
>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index 17ab6c69ecc7..edf48e917173 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -4,12 +4,13 @@
>>   $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Mediatek MT7530 Ethernet switch
>> +title: Mediatek MT7530 and MT7531 Ethernet Switches
>>   
>>   maintainers:
>> -  - Sean Wang <sean.wang@mediatek.com>
>> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
>>     - Landen Chao <Landen.Chao@mediatek.com>
>>     - DENG Qingfang <dqfext@gmail.com>
>> +  - Sean Wang <sean.wang@mediatek.com>
>>   
>>   description: |
>>     Port 5 of mt7530 and mt7621 switch is muxed between:
>> @@ -61,10 +62,21 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt7530
>> -      - mediatek,mt7531
>> -      - mediatek,mt7621
>> +    oneOf:
>> +      - description:
>> +          Standalone MT7530 and multi-chip module MT7530 in MT7623AI SoC
>> +        items:
> 
> You have one item, so don't make it a list. Just const:xxxxx
> 
> Same in other places.

Will do.

Arınç

