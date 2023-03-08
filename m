Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1335C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVXS8KDoDhOM/NALqKC+cp6/ciQN+TQg0DQlrMhKv8E=; b=mW+L66JLCr5l2/
	E9uuaB6WqzGCLRilWdqIuy+iQfttUFuthqqRI0pxuwu/We91RkVz7Qi+//W1BhB+z03j+QthqimR9
	86f+fpliyGGwK1DIqmkU39mHet2HX2YqfFVAgKSw89oDN1s+oc9pLUEyXp4FC7L1PAbLV27xjJDGF
	J02tZiNd50tCZ+aD9ekxT1bJznj8eZpjBCIfQsmQGZHYWKR1l/YpzHHhSofwy1yhtYCKpA+vgXF8o
	k/eU2FUi2DC9DTLEuR3Evb35Byo9lqH9Tmg0VWXuzmf8Ujov7ioHMT6Za0y6/Wj/kf9C7/UcFUA4S
	iqVpLvJzqBTpYqBoU/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1Fm-006olk-MZ; Wed, 08 Mar 2023 21:23:18 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1Fj-006oie-6w; Wed, 08 Mar 2023 21:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678310583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e4ajlNbGQNsC3O1B1WPmQsT6/2dnUqMg5MPbTYH0m9CHHnYPoqQIbvSGaxdvE+wRvDQU4ahiJWltyzBws/pQzwIDuZgN1e9rBV8Q4gCBDkarCD3fribvo7MfQqyPUf4PymjRCQEnDEe8tqgTzdPnPHgGQfZEd9MDWy5iM3Vp+8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678310583; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=MVXS8KDoDhOM/NALqKC+cp6/ciQN+TQg0DQlrMhKv8E=; 
	b=YjEYjwd2GCNGsGMgbn7Hzii58PHYaiC4egDNq0Iar9fXyZAcBi0sb3JtRjJzqUJFQBozt1fi26xBeX3AhOGpoPuYZhcRJCB8vzSD3+2nZwFlpnlBEo3XnG+3/qvDoz3eegTnVAwvIseCNKKSMS+yO5uUSKAir2kI/mb11TmHWkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678310583;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MVXS8KDoDhOM/NALqKC+cp6/ciQN+TQg0DQlrMhKv8E=;
	b=DeJOdnvKTnhzen1ZAfJv3wlrsqe9/C8dx6jV1G19Prur97d5hd8xayoL8hVL7+cl
	5f9BWGKhOxLrosINyDRYR5Ifr2rHJuPltENN9Gquqs/iaQFV4fX5ROqCyDzQOxytJqi
	HbKjXd+nMavGY8C+pp1adfHx1IjtoA+/43ifLShM=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678310581456117.44812708718553; Wed, 8 Mar 2023 13:23:01 -0800 (PST)
Message-ID: <27dcf711-859e-6d21-f46f-3169bc1d4568@arinc9.com>
Date: Thu, 9 Mar 2023 00:22:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/20] dt-bindings: pinctrl: mediatek: mt7986: fix
 patternProperties regex
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-18-arinc.unal@arinc9.com>
 <20230308211511.GA3850618-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230308211511.GA3850618-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_132315_320186_1125751A 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9.03.2023 00:15, Rob Herring wrote:
> On Fri, Mar 03, 2023 at 03:28:46AM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
>> mediatek,mt7986-pinctrl.yaml.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> index 46b7228920ed..e937881210c5 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> @@ -72,7 +72,7 @@ patternProperties:
>>       additionalProperties: false
>>   
>>       patternProperties:
>> -      '.*mux.*':
>> +      '^.*mux.*$':
> 
> These are equivalent (so is just 'mux', but that's ambiguous). Why are
> we changing them? Ideally, we'd only have a wildcard on one end.

I've seen your review on Daniel's patch for adding mt7981 pinctrl schema 
so I wanted other schemas to be on par with your review.

https://lore.kernel.org/linux-mediatek/20230123225943.GA2781371-robh@kernel.org/

Arınç

