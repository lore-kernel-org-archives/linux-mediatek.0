Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A44DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMNBNmn5Y1fSgtN561SMaNs6vRqtJwm/NmtTtUBu60M=; b=0+gRuD5j4gcI+L
	f0Gln4dqL/Yu018w+U1fOeVr80Rx8FOHsHyx9utodw8UnjfkC2ngIHmWG2PzPlMVUZ+0BQMIijH0I
	ljO8Ut6I+ctoNxlkZl+kQeAY63rJPJHVhw1JkJifYoRUMq9+uEXBeMnAxtkQvnRdx8/hdA5mOejMF
	dy16yfcvnNE1//1zaIT2AIWU/PW82LibxBQLa+6bUV6rPw5HMLxq/2UQAmFx31kfXuczUI00wdm/O
	7W74OgjgX+4unRrTmeefBhOoBX1hSQ2pC7Tko+lcP9QooNPhIFJfijEFd2LPl+MAmFSmwRrl+LYv8
	zmEHBxIFxrFaZYkIpJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmyed-003gbO-Lg; Fri, 06 May 2022 14:09:59 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmydY-003frX-Fq; Fri, 06 May 2022 14:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651846105;
 bh=WgytZKjmiBQFX7uZ/jjhSIBiJAj8t5XglcXcRrxeF8Q=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=ZxddAxjw4ulOs6jvFgCz850BHQBqwBs2xNTCt3dcLrC9w5PnoSTdnQJ1L03hIwWHQ
 pUuf0nkXavc93/GJW3DSgT40dOcGB7oJxiBTm166dhP0rV2y3rK5pH5s+SgoMwwikq
 6V4CzMHxAHwRU0E5MRb1s6R531VcUhcE1Z6CAaJ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.76.19]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwbz-1ng3gO1qMD-00BMAI; Fri, 06
 May 2022 16:08:25 +0200
Date: Fri, 06 May 2022 16:08:17 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <ac70ae6d-7e1a-d6b9-e33e-793035d5606e@linaro.org>
References: <20220505150008.126627-1-linux@fw-web.de>
 <6d45f060-85e6-f3ff-ef00-6c68a2ada7a1@linaro.org>
 <trinity-12061c77-38b6-4b56-bccd-3b54cf9dc0e8-1651819574078@3c-app-gmx-bs21>
 <ac70ae6d-7e1a-d6b9-e33e-793035d5606e@linaro.org>
MIME-Version: 1.0
Subject: Re: Aw: Re: [RFC v2] dt-bindings: net: dsa: convert binding for
 mediatek switches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Ungerer <gerg@kernel.org>,
 =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <04062F03-43DC-4B92-8C39-2F84ABDE2DE4@public-files.de>
X-Provags-ID: V03:K1:T2On2gkE0ziiZBeVVFwz7HVvt6s28DOg5a5fA6wmtL/dbrZEuhj
 Lc6jEaasYReZ2Th3WG9V3OdBFSGLkGFhxjMiEPCQvTEG1WRCcqaUTZMhy2NnvA9H34jRsa6
 qFVirmd8FSVISD+xDX0OLaoJ58TUm8CgS26ZNmsFg6t9dgkRTpmDwPuiDVIGqnRkLnIACT+
 I9AxXwRJo8n/w6uDoj2zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wLNzKAt24Gs=:9cXTi89Mx1jhPI9X1MTGb5
 2FtlAU0g62zkWejjYg3duxYKExkF8b1BKvybOIwO5PCED+wMAkU0VUcld1JJ5W+o6RxK8rk3X
 IY4IBtl/Haee4H1h/n2d6ouprEK1lAaQfGirHOihtyfKcWfYc9Q9M7g3iLDdSTpPusWvJh3Ow
 0cLYOxQcU4YzBzw3+RPuRv9LjXXb/6UlezyNZGKjCpVbNirIV39c6I6uSm58e5lvYBGibs1X0
 rfgvE9Tux3JjJ9jtEOmCBD3lSkn5NsK167A6X3CpRUH9OEhKRTiQZpI4k/mvzCT31LStYNBcx
 vWK/hw+5lG9W8th0sWDjSN9/CR23hYaOQUnwlHw2eJpKd5dlyaZztl9EbLRBne2eUUsNV9Ncd
 2IyLcYQXm6crYBI3L5gnrTDB6T4qbDv3PbPbWSF33moVo5WuopCgF+05MXVpRF4wSI2yGZERd
 60JKjqOz4fVYbD3UQGpA0TYjUfeSweEuvBIjZhhgLeRSwFIrUqsDfReWlt4JyfFAyewgqYd8N
 SIUrgTwTeDc3rvPDPn6Bt5n7z/uW9m0gULvr/IPsjwy4kORCKDHKuQ8HX6u8Lif/q3iX5w2Uc
 Aprol01yvwJ4e00aYhh64WS5G4PfE1Kh/x5tFkvSqpyRoCGpPmzx5X4J8dJxfJw3Jsxtl3qwt
 d18BPoo1xDyLtYYZ8Fzk1GmuDQGJy5dpkGcbuUh1MzOsPFWA/UKNxwo/7O/TmUZwmQyrT5kFd
 c9HihY7GMsBKO8BQR9G5Y+LYzuryLVPuj/exy5QSz9pMUR0kgiBCTpfhgLAdrWJhwanRB1G2t
 swnQPpv5l1IvZOIG///twmFl91e5bACtQR1y1CDMc4Bo3Xcxu3g/zGqx6oXkuphm4ZEqKlXmA
 FuW4fvoxNXAm2oXj2BbM9zF0te5Wc/hBafKPJMTe+G4NQ0sEaskKFmIXo49cwABeSFgH43mz/
 zNch3CAozA0grXMaOGIHAYR8RCScF01TDR2WS1bWI1bno9hdxUSe2hL2PCUtxOdjbCHqCRt6o
 qpLPtz4IavtR/x0mifFRSP07o6/Y2BcDiRXQsDxULMKEg537m0x+ATBus+Nc+BAAE/OC5J9bz
 zYvdaugEn1ns7Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_070853_005075_937B1C32 
X-CRM114-Status: GOOD (  10.95  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 6. Mai 2022 09:15:12 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
>On 06/05/2022 08:46, Frank Wunderlich wrote:
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +  core-supply:
>>>> +    description: |
>>>
>>> Drop | everywhere where it is not needed (so in all places, AFAICT)
>> 
>> is it necessary for multiline-descriptions or is indentation enough?
>
>It's necessary only when YAML syntax characters appear in description
>or
>when you want specific formatting.
>
>https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree/bindings/example-schema.yaml#L97
>
>https://yaml-multiline.info/

Ok then i drop all except on examples

>>>> +
>>>> +patternProperties:
>>>
>>> patternProperties go before allOf, just after regular properties.
>> 
>> after required, right?
>
>properties do not go after required, so neither patternProperties
>should. Something like: propertes -> patternProperties -> dependencies
>-> required -> allOf -> additionalProperties -> examples

Thx for explanation

So i end up like this:

https://github.com/frank-w/BPI-R2-4.14/blob/5.18-mt7531-mainline/Documentation/devicetree/bindings/net/dsa/mediatek%2Cmt7530.yaml

Including followup (remove reset-gpios and add rgmii for mt7531).

>> 
>>>> +  "^(ethernet-)?ports$":
>>>> +    type: object
>>>
>>> Also on this level:
>>>     unevaluatedProperties: false
>> 
>> this is imho a bit redundant because in dsa.yaml (which is included
>now after patternProperties)
>> it is already set on both levels.
>
>dsa.yaml does not set it on ethernet-ports.
>
>> Adding it here will fail in examples because of size/address-cells
>which are already defined in dsa.yaml...
>> so i need to define them here again.
>
>You're right, it cannot be set here.

So i make no change here,right?

>Best regards,
>Krzysztof


regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
