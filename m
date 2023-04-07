Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4BCC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmgW4edYlUnyxLuwyv+RhMeMNoN0f2U2QoMCWe0iOyU=; b=zx3EUO5AOFpThz+u4XGrtNNONm
	JS+QbLbtHBi48GAI7h/Bsl41N8/F70rvDZc6Rto9Ywcjsazw3ZkRqRjs5PZIwPX2O0TLYJFe0nuR4
	R3rNI5TR5h4sALGEINMpiiidbW/NCKtoxRPkR7wKs+vhHEhykS3klArlA0ixkYUajetFksGukpN2y
	+IUi7ApKkIljuhPyzfs2FPIWTop1b+q22c2zS8cj6EkNmUOb2IuH12LceTIpe1CEnxSpZq/NZSAl0
	Hfn0NUuJ+9nzr0b4eyK2mRCKZMSI+ko0sbEO4MXJeseKuCe3LuIO99r+B2i8M7uU89Fc0a8LmyR7i
	RJj0d8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkigM-009iXy-30;
	Fri, 07 Apr 2023 09:46:58 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkigI-009iWt-2e;
	Fri, 07 Apr 2023 09:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680860782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eBTYQ58vhgLgJ4yHfjiHgtJlGFjyAESluw6BNI9VBH5VQR6zqkymV5P4XN8VfnotRf6TJJPBDn5CONQlz8VkMRCcgJ4R9l1InItL8Ud0HBvexc8+uyLa8OSgmL+CfMrlP2EJiW4GOFrSWUd1XViYS5gKsZUrl1vVnFj0vM1W+bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680860782; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mmgW4edYlUnyxLuwyv+RhMeMNoN0f2U2QoMCWe0iOyU=; 
	b=eVom5K6RyjeM2xe4T2tXSDGQ03nQ9gtC8ejvyc/iCvWWf7I4lO5dc6SGFe1yVTCc2vLYELVid26V2R28/bXOnD7502mNaBidHISMBo8GEyyfdMyVf8uCGbPB5Kj4a/YanAncljYw608MewcFj9uzRooLn3ZwdY11/jHz86Cuhps=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680860782;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mmgW4edYlUnyxLuwyv+RhMeMNoN0f2U2QoMCWe0iOyU=;
	b=VP1bH1Sbx6pTq9Kefa1rc9NVAak3gRAr6CeVg1qZoECgJA8CIW0I78wk41fXtDoZ
	yNUs4exZsnDYl+2zE5zMrAAyvIOIUUMS9NII3Hz5Vjdzj29txsbpploTVhgKOCM0odx
	413Pz23s8WrQ/Avqhcn/T4IX7KuKrx6gLmDV43nw=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168086078067680.0988150323908; Fri, 7 Apr 2023 02:46:20 -0700 (PDT)
Message-ID: <5a92419c-4d2c-a169-687b-026dc6094cd8@arinc9.com>
Date: Fri, 7 Apr 2023 12:46:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port
 bindings for MT7988
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-3-arinc.unal@arinc9.com>
 <23c8c4b5-baaa-b72b-4103-b415d970acf2@linaro.org>
 <5b3a10ff-e960-1c6e-3482-cb25200c83c6@arinc9.com>
 <951841d3-59a4-fa86-5b45-46afdb2942dd@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <951841d3-59a4-fa86-5b45-46afdb2942dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_024654_959681_259DA477 
X-CRM114-Status: GOOD (  19.20  )
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

On 7.04.2023 12:07, Krzysztof Kozlowski wrote:
> On 06/04/2023 21:18, Arınç ÜNAL wrote:
>> On 6.04.2023 22:07, Krzysztof Kozlowski wrote:
>>> On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>
>>>> The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
>>>> to be used is internal. Add this.
>>>>
>>>> Some bindings are incorrect for this switch now, so move them to more
>>>> specific places.
>>>>
>>>> Address the incorrect information of which ports can be used as a user
>>>> port. Any port can be used as a user port.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> ---
>>>>    .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
>>>>    1 file changed, 46 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> index 7045a98d9593..605888ce2bc6 100644
>>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> @@ -160,22 +160,6 @@ patternProperties:
>>>>          "^(ethernet-)?port@[0-9]+$":
>>>>            type: object
>>>>    
>>>> -        properties:
>>>> -          reg:
>>>> -            description:
>>>> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
>>>> -              for user ports.
>>>> -
>>>> -        allOf:
>>>> -          - if:
>>>> -              required: [ ethernet ]
>>>> -            then:
>>>> -              properties:
>>>> -                reg:
>>>> -                  enum:
>>>> -                    - 5
>>>> -                    - 6
>>>> -
>>>
>>> I have doubts that the binding is still maintainable/reviewable. First,
>>> why do you need all above patterns after removal of entire contents?
>>
>> The 'type: object' item is still globally used. I'd have to define that
>> on each definitions, I suppose?
> 
> Doesn't it come from dsa.yaml/dsa-port.yaml schema?

It comes from dsa.yaml#/$defs/ethernet-ports which this schema already 
refers to. I'll remove the patterns above.

Though 'type: object' is not there for "^(ethernet-)?port@[0-9]+$". I 
think I should add it there as the dsa-port.yaml schema defines the 
properties of the DSA switch port object. So the value matching the 
"^(ethernet-)?port@[0-9]+$" regular expression is expected to be an 
object conforming to the structure defined in dsa-port.yaml.

Does that make sense?

> 
>>
>>>
>>> Second, amount of if-then-if-then located in existing blocks (not
>>> top-level) is quite big. I counted if-then-using defs, where defs has
>>> patternProps-patternProps-if-then-if-then-properties.... OMG. :)
>>
>> Yup, not much to do if we want to keep the information. I'm still
>> maintaining this though. ¯\_(ツ)_/¯
> 
> Maybe it should be split into few bindings sharing common part.

Agreed, I think it makes sense to split this to MT7530, MT7531, and 
MT7988. I will do this after this series.

Arınç

