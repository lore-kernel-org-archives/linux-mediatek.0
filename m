Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjIwrwxKeq5Ld9Ij9H2Gbwf8PRvgEpDh113K4y969wE=; b=5D6p3qkJLLV3fo
	wE8RjVI0TFbjGLRjbZu3YyA1x/pONXlZfkp7AwQEKwhMYqu0munShpzOOiogQeGPZYdUzyGBgMM+E
	E/ksyyzfXcULdnv+Wr0Tt1GAwM796kIUPwRfX8F3nVW26/M8bf5IoqM//yQhHdaNmVpnvcTRdLEsE
	IHVTlbKBUWdJTDTk9BQH5jVkihvkRDgolMttAa3N19OtNV3UwRgBJbEVCx+Gf+sWXL9bc7miuNGPX
	vwV6sZpIw9M//Qq9eqwvbOoZCZanbYv47GEPz8gGgzdK84lkkvhmozDwIBaFRyWpBSQmEnXNzSL4I
	P5NmpkBByS9fAY03by0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGqd-003KAE-0G;
	Fri, 17 Mar 2023 20:38:47 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGqa-003K9c-1O;
	Fri, 17 Mar 2023 20:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679085506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xw/JmgIpXeWcbao/wk4KwQ4Jquj/5Ho6qfNyIdO4Ur9aMayyP5TrN4EJzDccCEWYKoi4giSEwrW8C7YmlUOx5lLKRARF5SvcfAOUPlUqOtzkuvyJxE0ICjHeIj6/XOEN0YueD64oXSDgmxlcsfdP12Ve3Tut9SiH7UwHypfT2tI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679085506; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WjIwrwxKeq5Ld9Ij9H2Gbwf8PRvgEpDh113K4y969wE=; 
	b=LMni3nsGFnG2FVnh6j6xH22hvSZ6yIBCrpnLHfsA/dr1HxdNGBW3iVIQHTXhOVPzKYUuycLznExUjo8h5UKKTL/SF/44yWFqQpXVvYb5NDnuILezptc2szB91vBW92Xc0Q/ToflYp23Z/AovR6QALoXUAsa/VJTtN1VCOY34Cnc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679085506;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WjIwrwxKeq5Ld9Ij9H2Gbwf8PRvgEpDh113K4y969wE=;
	b=h2jZZs7IRiH7FdUfBugzOWe/DM0kpKGcr02Mcdb8/PX8HJ9rm3kNyMUqKb9N9t/b
	oYooBgEjewh5KXrq5ufHqBSB8F1msv9f8aEqaMtg8Eu518AB6iU0gnkQrohkv1nRhQp
	8vPyCEZaBehcCPGd5eKq36itLWJWYLFZ757aLLkI=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679085504453905.0224911165027; Fri, 17 Mar 2023 13:38:24 -0700 (PDT)
Message-ID: <022c66f3-75d4-5ab4-4a4d-e8260fd70904@arinc9.com>
Date: Fri, 17 Mar 2023 23:38:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 20/21] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
To: Rob Herring <robh@kernel.org>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
 <20230313205921.35342-21-arinc.unal@arinc9.com>
 <20230317190331.GA2628708-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230317190331.GA2628708-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_133844_550641_3713CD8B 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.03.2023 22:03, Rob Herring wrote:
> On Mon, Mar 13, 2023 at 11:59:20PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7628 and MT7688 SoCs contain different pin muxing information,
>> therefore, should be split. This can be done now that there are compatible
>> strings to distinguish them from other SoCs.
>>
>> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
>>
>> Remove mediatek,mt76x8-pinctrl from mt7620.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 379 +--------------
>>   .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++
>>   2 files changed, 459 insertions(+), 370 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> index 808dd8bd276f..591bc0664ec6 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
>> @@ -11,15 +11,13 @@ maintainers:
>>     - Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>   
>>   description: |
>> -  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
>> +  MediaTek MT7620 pin controller for MT7620 SoC.
> 
> Saying MT7620 twice is redundant. Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

It's not always a one to one relation so I'd rather explicitly point the 
SoC out like on other schemas like MT7621. Thanks for reviewing!

Arınç

