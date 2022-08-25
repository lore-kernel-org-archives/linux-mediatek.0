Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5458C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JsieqXDivmRRvE/zWwLdZw6fqOmBPCekC3LYmW4t64=; b=PFmWgxzvqa0Ku0Hw9jTCppX/eR
	O/ljM7NVtF9DCpNSNoxOTMmtli3kDdZ58ImwAGWc182w9K58tPdm/85TeAAeRpOs/ILZWwG9TamIE
	ZyfcOK5X5Il2RKOZrLmgfbYEuCAxUNMQsC7VSs8aV3XVolUR2dk4uR8W37Xh1L2DvPk3YogTe6zTV
	jB4p5LIMtBHW7OgE726icrATF7Gpan4zC3JF+8H5RMloYZk03hF0HMNHbAOpnuVzTZfiQPMd9PAV3
	PFcBTpALBSAuLuNz0iL4bpKqV17yKSx++GLmimiu33gFmOR4FtIiLa8+Vzvr01FYmHbJUJ2XZ7fKu
	R+VGhThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7tg-009saf-Ex; Thu, 25 Aug 2022 08:07:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7tV-009sQC-8I; Thu, 25 Aug 2022 08:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661414807; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GPPQ95Ij6UbK9cbdbMjwj3IxV6MmdWMA267hSYszjyUDLDVIWmWLieL9hwf9Si9RpkNXNC7+7yRLuyyvgIqOf1JKVOmqfa2zc9OkZp4PSpCXnF0LU71pRb4ssN9DLyaFNI5TWPFnghHI95Yd0jJQeBkdRJ1UmWLTRvJIMxLJirk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661414807; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4JsieqXDivmRRvE/zWwLdZw6fqOmBPCekC3LYmW4t64=; 
	b=Q/oh6A4YvYlHfL0xTF1YvF8rL0otqnlGAn1E5jvc8DG6U0TrOvH0AGYaG5Ae+dPA9uAQmFGgS2BcQvzGN7BsxCaGyuYputrWdRDx5ULjIqub6IZ2YDuoFME34nuxK3Wy/99r5JDZ74ON9r0d4IKWlVU5CKAOo5u5mu3dFVTdSgE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661414807;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4JsieqXDivmRRvE/zWwLdZw6fqOmBPCekC3LYmW4t64=;
	b=F/SWD+LHEElDMK1k3KlaBPED4fBlWutYwKB9PXDF8rgMuI4KbfmzsGA4chOkWLQt
	TV0IpYKp8DC1pZ5Acq7fzhEU5ragF51BJ3azjmeQGIzmgTDvBTnY2gs0ZCMYV5blpJo
	nyxrL/Y8Elkx/+CbWBgBJt+KzRXEszGUqrja4fro=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661414805043384.980663798763; Thu, 25 Aug 2022 01:06:45 -0700 (PDT)
Message-ID: <e2679c3f-87f4-4705-a820-72b46975c851@arinc9.com>
Date: Thu, 25 Aug 2022 11:06:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/6] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per switch
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
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-5-arinc.unal@arinc9.com>
 <c24da513-e015-8bc6-8874-ba63c22be5d6@linaro.org>
 <ea3ceeab-d92b-6ce5-8ea9-aebb3eaa0a91@arinc9.com>
 <7248cbce-29b9-aad6-c970-8e150bc23df8@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <7248cbce-29b9-aad6-c970-8e150bc23df8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_010717_354007_8DD0FA3A 
X-CRM114-Status: GOOD (  17.08  )
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

On 25.08.2022 09:33, Krzysztof Kozlowski wrote:
> On 23/08/2022 15:29, Arınç ÜNAL wrote:
>>
>>
>> On 23.08.2022 13:47, Krzysztof Kozlowski wrote:
>>> On 20/08/2022 11:07, Arınç ÜNAL wrote:
>>>> Define DSA port binding per switch model as each switch model requires
>>>> different values for certain properties.
>>>>
>>>> Define reg property on $defs as it's the same for all switch models.
>>>>
>>>> Remove unnecessary lines as they are already included from the referred
>>>> dsa.yaml.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> ---
>>>>    .../bindings/net/dsa/mediatek,mt7530.yaml     | 56 +++++++++++--------
>>>>    1 file changed, 34 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> index 657e162a1c01..7c4374e16f96 100644
>>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> @@ -130,38 +130,47 @@ properties:
>>>>          ethsys.
>>>>        maxItems: 1
>>>>    
>>>> -patternProperties:
>>>> -  "^(ethernet-)?ports$":
>>>> -    type: object
>>>> -
>>>> -    patternProperties:
>>>> -      "^(ethernet-)?port@[0-9]+$":
>>>> -        type: object
>>>> -        description: Ethernet switch ports
>>>
>>> Again, I don't understand why do you remove definitions of these nodes
>>> from top-level properties. I explained what I expect in previous
>>> discussion and I am confused to hear "this cannot be done".
>>
>> I agree it can be done, but the binding is done with less lines the
>> current way.
>>
>> I would need to add more lines than just for creating the node structure
>> since dsa.yaml is not referred.
>>
>> Then, I would have to create the node structure again for the dsa-port
>> checks.
> 
> I understand you can create binding more concise, but not necessarily
> more readable. The easiest to grasp is to define all the nodes in
> top-level and customize them in allOf:if:then. This was actually also
> needed for earlier dtschema with additionalProperties:false. You keep
> defining properties in allOf:if:then, even though they are all
> applicable to all variants. That's unusual and even if it reduces the
> lines does not make it easier to grasp.

Understood. Will send v6 with respect to this.

Arınç

