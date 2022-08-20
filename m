Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA5C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EemleEMy15KCJL1YIgOwHrMRf0e9xmVdGltzEqsF9oo=; b=G/O2U7p+cpbnfLDaJnFmcRopzo
	fFnQ0N9AMtDTWXuMWh/mkPC+cn21cMFU1+EnODpcQ3SWlpqzDL6W9b5s5/JpdrVsjMQXEo1OGte40
	7j8ovuUbgx0932+jpl4rPw804jKfquxw2EHJX3FVx8oVcu00w2gYQRJfWUsFgh93eskbaU/+HpP8A
	TovUavcfOIMSxO1daJ8KoSFJuzohVPB7RH6VY6zGZhDN1uGJlP9sFPgaRZAMIcVjOB4jMplMBYF9s
	8LEfY8Nr38y9dwT2RHmO2uzoXQYB+hSIQdc3Yftwnu/+WE/CqW1IDOiTOWq7l3frc/se8MZe+ck6B
	wRVveGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJ0b-004Jw7-KZ; Sat, 20 Aug 2022 07:35:05 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJ0O-004Jd7-9c; Sat, 20 Aug 2022 07:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660980858; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=grGB65a6Z/0gqEKmfSHQhJjp66VAGs6SVbgpbariwXdYYe3Lvb0SCLNQFfcSNXd0zEpN1l0dkwiwlNTeaZcF/haQYHoLamIUsPpY5/S9c/52rwcHs78WuZUJM5ziZhNbwLXAhuTCmuikYhVN5LgMiEOzKMloNtWn5hzKWxj6KFk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660980858; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EemleEMy15KCJL1YIgOwHrMRf0e9xmVdGltzEqsF9oo=; 
	b=GSIO4MyUsJt7D/fCMpCJvjkt1SgHVU/JmaFdqG8J4bZaKtv4vHUkUaJmTdaniXWPUsgwjC20/0JkduQ+waAd03moN6MHsWizdJCTkfTAUgRgCFdebYbznYPsyZlfBk73iu02XD9cwnodJb0DMLnNgmCXPTe+3p62i2pLOQ37g0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660980858;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EemleEMy15KCJL1YIgOwHrMRf0e9xmVdGltzEqsF9oo=;
	b=WX3Vjj2BYfqR+E9hObCL0/jXDYxssnkV3bhHeY5zo/f3Ic1EgZfBb0YMJIEku70N
	tYx9jNidIu+AGP8/7/DAQ7Jwbw6vluzy/cfZyioXaYetL0/qX5ILdwo/5CLBKkG42Ry
	r/EyTVBafKymP8m+PU3Vf9Tv+Enu1gnKcnuU+Hwg=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 166098085594979.27797162485172; Sat, 20 Aug 2022 00:34:15 -0700 (PDT)
Message-ID: <0bf02926-753e-e8d5-1d87-f286ed743fb2@arinc9.com>
Date: Sat, 20 Aug 2022 10:34:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/7] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per compatible
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
 linux-kernel@vger.kernel.org
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-5-arinc.unal@arinc9.com>
 <d2279a7d-bbc3-c772-1f30-251f056341bb@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <d2279a7d-bbc3-c772-1f30-251f056341bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_003452_416684_C5F2FAA4 
X-CRM114-Status: GOOD (  18.06  )
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

On 19.08.2022 15:43, Krzysztof Kozlowski wrote:
> On 13/08/2022 18:44, Arınç ÜNAL wrote:
>> Define DSA port binding under each compatible device as each device
>> requires different values for certain properties.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 116 +++++++++++++-----
>>   1 file changed, 87 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index cc87f48d4d07..ff51a2f6875f 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -130,35 +130,6 @@ properties:
>>         ethsys.
>>       maxItems: 1
>>   
>> -patternProperties:
>> -  "^(ethernet-)?ports$":
>> -    type: object
>> -
>> -    patternProperties:
>> -      "^(ethernet-)?port@[0-9]+$":
>> -        type: object
>> -        description: Ethernet switch ports
>> -
> 
> my comments from v1 apply here
> 
> None of the reasons you said force you to define properties in some
> allOf:if:then subblock. These force you to constrain the properties in
> allOf:if:then, but not define.
> 
> 
>> I can split patternProperties to two sections, but I can't directly
>> define the reg property like you put above.
> 
> Of course you can and original bindings were doing it.
> 
> Let me ask specific questions (yes, no):
> 1. Are ethernet-ports and ethernet-port present in each variant?
> 2. Is dsa-port.yaml applicable to each variant? (looks like that - three
> compatibles, three all:if:then)
> 3. If reg appearing in each variant?
> 4. If above is true, if reg is maximum one item in each variant?

All yes.

> 
> Looking at your patch, I think answer is 4x yes, which means you can
> define them in one place and constrain in allOf:if:then, just like all
> other schemas, because this one is not different.

If I understand correctly, I do this already with v3. Properties are 
defined under the constructed node. Accepted values for properties are 
constrained under if:then.

Arınç

