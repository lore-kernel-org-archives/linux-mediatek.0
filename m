Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC331C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CUzAZVNmhEddWbv5po9+adEHLn5WWCOxoPTdFXS6l4=; b=W3QB7vWzE52ttPIMGXWK6JtRb5
	wkTvxCMRokD3wiqlU7wGwnOHatjjNwrlSp74OraL39UfEIPutMW9ZRFF3QwJ5/AVZSAkez9cQ+73C
	goI1/KZ7FRQpQroO5lAdML4cVUHc4ICJISpwlH1b/SS8W3okq+vAWErdFLHH4VC3P5QatnS3wJxIF
	BXsokVbWW/sZnj3uRHEIOY4Gkc+QVkJoT3P9Is2bD3A+8Dom69pZ/wjlGBZdXwPqnhaIHDjo0H+XJ
	iMNbmIDO03nkxSrS8+ryfa1aNihfMTWZBUaQ0ZPcasMs9+TCPS/yK6157se78TZhG574tq+tGeBKM
	guMeQ2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU6P-001yyR-38;
	Wed, 12 Apr 2023 06:37:09 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU6M-001yxF-1J;
	Wed, 12 Apr 2023 06:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681281401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MPx172HnOIejQDyL0d/0DUdOEHO0rjgD6Oa6glZ3HE1iJOzYBJScCGQwiUPBWcUfB7qTQ1oWbuOxkpSrSKivIIeG4C7/KvdrHEPIK38DvN3oDFTKMZMuGsBwVOdYHx7ZmdUQfqJfsbwG1d3DuNlDRsdUCWZf448dtEaqOpj7yzc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681281401; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2CUzAZVNmhEddWbv5po9+adEHLn5WWCOxoPTdFXS6l4=; 
	b=hO8QKIOywiaIoS0G/klCObI81udy+loHkZMRlNb27Q2pVFh1KmoK4BC4D+kD3tApqyntKxoFc6u297ewZkyN8roixqL5TpQ9MzCzXJVxyVfb9sGa8Jm+hSwIvRwJqWT+e02yoO7HvbckJ/UM4c0MqgRGdjbrag1pegsgCOE71BM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681281401;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2CUzAZVNmhEddWbv5po9+adEHLn5WWCOxoPTdFXS6l4=;
	b=HU8zdvcDb/wiOXq/4JV9AcKkkkg4J778VwuzUb1bK4CSUeyllHOJNYeeW2jEJaRC
	/2hett5Z85bMYasKfsrUdc30njoAPbVB9V0huiyEOkqkuXlfCqRPQO1XJvm3hckcxtI
	w2jmcP4gc7nUSenhjPrSN092MUzCsPvyDKyemgjU=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681281399656135.19981499513426; Tue, 11 Apr 2023 23:36:39 -0700 (PDT)
Message-ID: <80d4a841-db7c-fa2b-e50d-84317ee54a40@arinc9.com>
Date: Wed, 12 Apr 2023 09:36:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct
 brand name
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
 <20230411235749.xbghzt7w77swvhnz@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230411235749.xbghzt7w77swvhnz@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_233706_497464_3CC1CCD6 
X-CRM114-Status: GOOD (  12.20  )
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

On 12.04.2023 02:57, Vladimir Oltean wrote:
> Hi Arınç,
> 
> On Fri, Apr 07, 2023 at 03:50:03PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The brand name is MediaTek, change it to that.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> It is good practice for series larger than 2 patches to create a cover
> letter, which gives the overview for the changes. Its contents gets used
> as the merge commit description when the series is accepted.

Ok, will do on the next version. I'll also split the schema while at it.

Arınç

