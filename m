Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940A4CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XcU1bxIbQW7+FTgjh+69tQghlYtLgPDIoQNHjC2sg8=; b=CcnZ4vRfAuf4qS/lcvafJG1Gtb
	cMqW9zEvyceZ5WeXt8QjqRp1wJ4/wJGwFD8aspsVgG/s+pBn+KgmMBzAyoqxbDP+dCOeXcwHHUHog
	RF6ANSlSHOwDiv6oeJPMccXhY0DzF4Ym0jtGoDcMcoyQEB0GZUxovDICptC7xjO3xX7LGnVpLKfW1
	k7TdU88spfAvr0scsI8bTqlxxWZKmgUN8LEQULZ1kou0DJPZffr7LYQ4lUNA5GCCKI1C0cfdsUnI6
	TGGUlsDNJh/QnMPfN2wZYkYgu8CYDiQuEbGCFBkRLX+kGRE8ifSExf+Lap9PEBniFlmCHl9Jzxr7v
	ZMio0FBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxlhK-00000002A6e-2CQb;
	Mon, 07 Oct 2024 11:14:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxlg2-000000029yR-43WN;
	Mon, 07 Oct 2024 11:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F8F35C4C72;
	Mon,  7 Oct 2024 11:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4457C4CEC6;
	Mon,  7 Oct 2024 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728299602;
	bh=lqYKdMgL/af+hqxZMZr0dRdWMk1wm+DIhNwXIm0/hnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+SotpmY/5NmrHLUDYcjkuEZrdK1V5uqxA+bOVR/Y8JpapNCwkKHacHPbyP0DZpIo
	 /JWzTYj9Vin+SlFHpgS9YuRZyXMs00/FTmjKToAdZBbDDyym/RrKgDgU0nBMNo4b0N
	 QyNSe3YmLJSx9A8aaWSB55MWhRkMnsKGbb2Y2HNPTZJAd6ssr9HOWey5HfQVrXrike
	 i6d1D3oa2TVnutA8+mKzyOpwlWj7u+ykcxkjL4TQK3Ja3mMKXYa/152RxK90aSUV20
	 Xjthd0N7ULO4BJKUSwAKf2DpApBrCh215vPtMJX2DwUjC+JofMoaGkTzhP7WaCvchE
	 t60SxkDN77h7Q==
Message-ID: <52790e95-5cb8-41a3-8184-dbde917ed15d@kernel.org>
Date: Mon, 7 Oct 2024 13:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988
 SoC
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
 <p7lqqhet6ahmvieh5xaws6ugsnasmuw6k4oajkmfcctuhrs4dn@quvrkmyof5ss>
 <trinity-57600902-afb6-42f3-8cf5-54a07710f979-1728284364104@3c-app-gmx-bap03>
 <486a85cb-8e09-493b-93f8-6610855b5f7e@kernel.org>
 <trinity-c35964a7-f0d4-435a-ac76-586e90c666ed-1728287815279@3c-app-gmx-bap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <trinity-c35964a7-f0d4-435a-ac76-586e90c666ed-1728287815279@3c-app-gmx-bap03>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_041323_129449_A4E1CED3 
X-CRM114-Status: GOOD (  12.91  )
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

On 07/10/2024 09:56, Frank Wunderlich wrote:
> Hi
>> Gesendet: Montag, 07. Oktober 2024 um 09:04 Uhr
>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Betreff: Re: Aw: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>>
>> On 07/10/2024 08:59, Frank Wunderlich wrote:
>>>> Gesendet: Montag, 07. Oktober 2024 um 07:55 Uhr
>>>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>>>> An: "Frank Wunderlich" <linux@fw-web.de>
>>>> Betreff: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>>>>
>>>> On Sun, Oct 06, 2024 at 05:34:45PM +0200, Frank Wunderlich wrote:
>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>
>>>>> Add binding definitions for mmc on MT7988 SoC.
>>>>>
>>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>>>> ---
>>>>> v2:
>>>>> - fixed minItems to 4
>>>>> ---
>>>>>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>>>>>  1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>>>> index c532ec92d2d9..7380f72ea189 100644
>>>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>>>> @@ -21,6 +21,7 @@ properties:
>>>>>            - mediatek,mt7620-mmc
>>>>>            - mediatek,mt7622-mmc
>>>>>            - mediatek,mt7986-mmc
>>>>> +          - mediatek,mt7988-mmc
>>>>>            - mediatek,mt8135-mmc
>>>>>            - mediatek,mt8173-mmc
>>>>>            - mediatek,mt8183-mmc
>>>>> @@ -263,6 +264,29 @@ allOf:
>>>>>              - const: bus_clk
>>>>>              - const: sys_cg
>>>>>
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            enum:
>>>>> +              - mediatek,mt7988-mmc
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          minItems: 4
>>>>
>>>> Drop
>>
>> Drop this line.
>>
>>>>
>>>>> +          items:
>>>>> +            - description: source clock
>>>>> +            - description: HCLK which used for host
>>>>> +            - description: Advanced eXtensible Interface
>>>>> +            - description: Advanced High-performance Bus clock
>>>>> +        clock-names:
>>>>> +          minItems: 3
>>>>
>>>> This is still wrong... anyway, drop.
>>>
>>> arg, sorry again...i should triple-check all before resending.
>>
>> Drop this line.
>>
>>>
>>> but dropping means the global 2 is used (making axi+ahb optional), or am i wrong? afaik "minItems: 4" is right here
>>
>> How minItems:4 is right here?
> 
> mt7988 needs all 4 clocks, tested with only first 2 (based on global minitems) and got this (similar with first 3 clocks):
> 
> [   10.826271] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd/data/mrq
> [   10.833485] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting mrq=(____ptrval____) cmd=18
> [   10.842006] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd=23
> [   10.848704] mtk-msdc 11230000.mmc: msdc_track_cmd_data: cmd=18 arg=00036402; host->error=0x00000002
> [   15.866269] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd/data/mrq
> [   15.873480] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting mrq=(____ptrval____) cmd=13
> [   15.881998] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd=13
> [   15.888694] mtk-msdc 11230000.mmc: msdc_track_cmd_data: cmd=13 arg=00010000; host->error=0x00000002
> 
> so minItems:4 is imho right here

So the list has 5 items? Then your binding is incomplete.

Best regards,
Krzysztof


