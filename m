Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A5C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9RwxvXHbJPa9t8iHG3Uau7EBpBE/ftRSWJKTpfTPy4=; b=gZwCqkGt46gswB
	V7w3gKLJjwmBbHsoLRbGc8Cxd23JcCQu48APe75dZrrod43Orqrio/Rt4Ay7eG6eSDYulnEhOU1Z2
	llPzphZDSe+15gR2mxU85E3R5UjSk9TJqZ6R8cVhd/DzwTrteeDPv+JJJmygMFREUaEgW4JxEzngQ
	pxQTyKkps5PrTuRhcF8cc3/ndRmKvGluuc+yCllRmeFUNGcC62Ev23mcxbScL2wp2kLyZmc0hYXZP
	GTNIQYgdCzsjVMnbsQdYZ4b2qMVZdq0UwlhpAErqp+9ImUiIkgvPNQLckeRyx92BTm3EY7xvG3cyz
	eaFB3VJLfvh6i3QaaEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKLB-00A9A0-1w;
	Mon, 20 Mar 2023 18:34:41 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKL9-00A98L-0a;
	Mon, 20 Mar 2023 18:34:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679337260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=anXf6Am1T9NK86qA90SdIAMl71YV8UEjW1td0WDHnxZ/E/dRM8Q3BCorHNS/IC15sfb/AdecuYXdTOvasyAXXqoFo9AtM2RRcrd0mGma9tPv20CqJKO6S7vWT9FhvMruTMUzob08GI+BiIlT8jQjHoAWaJZBu0B89lqz5eug/4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679337260; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=a9RwxvXHbJPa9t8iHG3Uau7EBpBE/ftRSWJKTpfTPy4=; 
	b=LfgwroXGyHQYOGq7lkQNQRDzCEIOMW8Qv9hSef7taXVC7lX+Ckc7UZDSQKL9vR85ot3EuUx74IcjOGRWjIerz0PNk8mYnpfi8dhy0myKYhGCujbCPgnXCxiyfQSMTh+Yhx8ccuAeKYZfENcj1poDw7023RN6jomoobkk5bNe2C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679337260;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=a9RwxvXHbJPa9t8iHG3Uau7EBpBE/ftRSWJKTpfTPy4=;
	b=N0LHOty5yjqwZcpgt8lT3Im2xOyWYTyvJAYjCNapnpQ9stZeI4pyeIfY3v3Y46Wm
	2WEWlmfRt7pplAwSkSI5A2s0H1bKWNlMxFpeF8wp9FyGS51QpTHLvrZJA9pqMJatVdN
	F/g0nIyL8NC2kCzZc5MOKV+lLxnUpJLg/kOMIqyk=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 16793372581171015.9762932646127; Mon, 20 Mar 2023 11:34:18 -0700 (PDT)
Message-ID: <4eed7059-128c-f614-625a-5ab596351ce8@arinc9.com>
Date: Mon, 20 Mar 2023 21:34:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/21] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-21-arinc.unal@arinc9.com>
 <1d0c0e49-4f50-7fc8-d514-b19cf4054066@collabora.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <1d0c0e49-4f50-7fc8-d514-b19cf4054066@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_113439_282559_422AE5DB 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20.03.2023 18:00, AngeloGioacchino Del Regno wrote:
> Il 17/03/23 22:30, arinc9.unal@gmail.com ha scritto:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7628 and MT7688 SoCs contain different pin muxing information,
>> therefore, should be split. This can be done now that there are 
>> compatible
>> strings to distinguish them from other SoCs.
>>
>> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
>>
>> Remove mediatek,mt76x8-pinctrl from mt7620.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 379 +--------------
>>   .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++
> 
> AFAIK, wildcards aren't allowed, so the new file should instead be called
> "mediatek,mt7628-pinctrl.yaml", the compatible string 
> "ralink,mt76x8-pinctrl"
> should be deprecated (but still present as to not break ABI), and the 
> driver
> updated to accept the compatible string "ralink,mt7628-pinctrl".
> 
> At that point, you could update the devicetrees as well: for MT7628, you'd
> have a node using
> 
> compatible = "ralink,mt7628-pinctrl";
> 
> while for MT7688, you'd have
> 
> compatible = "ralink,mt7688-pinctrl", "ralink,mt7628-pinctrl";
> 
> If you don't want to go through those lengths, you could still do the
> cleanup that you wanted to perform, but with a filename containing no
> wildcards - anyway.

I was able to have it accepted by Rob, and the patches are already 
applied so I'm going to leave it as is for now.

Arınç

