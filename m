Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB6CCF9C69
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2D1FLkfdT8tqQmZVHNTljRFZ2ec4kkfhX1YDQtFBBQ=; b=HpM/VnmyoAlG8KvS8Xhky5ER3j
	qvjwGKc+vdcEpE8D/HTfsvNb06cSPE25BD3Xx/STMLxaHegV3rQicWjYgAMxIxAqcotGriVVdDIIr
	smIBpKghFaojoPQUtfJ6AO14JhDLMh1Lek9hML48Mw7Kv1QqtVDi3iiWd0Gll0oXpv73i1bF4exY2
	dYZ1jaFXVwxwFmr24MCVc93WOkdbWyufr333sgKtTxPMRktgMgD3fjb0P0qct1Nl2EEGWTOhkUsn9
	LO1d5NRRJZN4naBlrmHRqN6CNCYV7DGmEzxl54XTwKFevYgYxGz9pXlEEs402XOuWBV826RG94rY0
	e8T9h0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssiA4-0000000HAsk-0t6r;
	Mon, 23 Sep 2024 12:27:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssi7s-0000000HAXV-0z3v;
	Mon, 23 Sep 2024 12:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727094309;
	bh=oVnappwI2asg1Mmf+oMcKojkg9+Z0J7WmOxhJWSM3kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tj/L4nvRSp5Oa5oywuog3blCYKnRcOhvwJvam8UXfvTh1zG0pASOMhRoDtDkiGfqO
	 pB6vekai1WFqwSw3bww3yvYXWjavV6cR/8bTXfAUex/Zuvw2K6uvq3HAwegPKO3M9i
	 DNjlEJLMjzrbxxnmHjsk1zEV8/T2cuyQbAombyyddafGJMMIcEjsPBlC6eUHTvdDLn
	 TfP1T2k5CDNte7JF9YXwQ4e7QfHt0kXR7FY8B95H8Wi3xWZ9IInMzsEUPSyJG6P+GI
	 y+fxOvLEU486ptT4KFrQlH3ZZsyZvZ/wPmXbQrMWncY3tYS1XeBB53x+mItSG24WP2
	 1Q7KulaV9+G7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E36817E121B;
	Mon, 23 Sep 2024 14:25:09 +0200 (CEST)
Message-ID: <228c9508-76c3-4772-bf0a-56e85a47af78@collabora.com>
Date: Mon, 23 Sep 2024 14:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 Mali GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-6-pablo.sun@mediatek.com>
 <eb17085d-78ff-4833-a4de-17b9327d776c@collabora.com>
 <bf45531a-eacf-22a9-65f1-f6474a2ca843@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <bf45531a-eacf-22a9-65f1-f6474a2ca843@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_052512_495046_A0665064 
X-CRM114-Status: GOOD (  21.65  )
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

Il 23/09/24 12:14, Pablo Sun ha scritto:
> Hi Angelo,
> 
> On 9/23/24 16:45, AngeloGioacchino Del Regno wrote:
> [snipped]
>>
>> Is there any real difference between MT8390 and MT8188 in terms of the GPU OPPs?
>>
>> I see that on MT8188, frequencies up to 880MHz want a DVDD_SRAM_GPU of 0.750V,
>> then 0.775/0.762/0.750 (bin1-4/5/6) on 915MHz, and 0.800/0.775/0.750 (bin1-4/5/6)
>> on 950MHz.
>>
>> Those never call for 0.850V...! So is MT8188 (Chromebooks) wrong, or is MT8390
>> different in that?
> 
> To the best of my knowledge, MT8390 and MT8188 has identical GPU
> subsystem. Thus, the OPP table should have no difference.
> 
> To be specific, I list the link to the OPP table of Genio 700 EVK
> (MT8390) in reference in [1]. It should match the setting in Chromebook
> kernel branches.
> 
> The "typical" voltage in the datasheet is the voltage that would work
> for all frequency settings. As long as it is smaller than the maximum
> operating voltage, setting voltages higher than the ones specified in
> the OPP table does not damage the hardware.
> 
> But this 0.85V setting is indeed not optimal. We should follow the
> voltages described in the OPP table, if we want power savings.
> 
> I also considered model the regulator setting with 'regulator-coupled-with' and 
> 'regulator-coupled-max-spread', but I am not entirely sure how to describe the 
> relation that "DVDD_GPU_SRAM should follow DVDD_GPU
> if and only if DVDD_GPU is higher than 0.75V" - should I simply
> set min-voltage to 0.75V and set 'regulator-coupled-with' ?
> 

VSRAM_GPU regulator:

	regulator-min-microvolt = <750000>;
	regulator-max-microvolt = <800000>;
	regulator-coupled-with = <&(vgpu regulator)>;
	regulator-coupled-max-spread = <1000>;

VGPU regulator:
	regulator-min-microvolt = <400000>;
	regulator-max-microvolt = <800000>;
	regulator-coupled-with = <&(vsram_gpu regulator)>;
	regulator-coupled-max-spread = <1000>;

Cheers,
Angelo

> [1]: 
> https://gitlab.com/mediatek/aiot/rity/meta-mediatek-bsp/-/blob/kirkstone/recipes-kernel/dtbo/mt8390/gpu-mali.dts
> 
> Many thanks,
> Pablo
> 




