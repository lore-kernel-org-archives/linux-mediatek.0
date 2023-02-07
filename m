Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A47C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lWOCdyhP4IWMLTRIybiMVm9pDWXI9jDC+/2VxVMMzQ=; b=QiN7ByOUNBATrP
	a6+khC5l1cLLZcqCnfS0LboJ0m4a38Ka1bj4QNm2oxasiIrFhBBYof0+kWK84a/AURXEnUz6CzJM3
	Yr4t7haqWOUFIGsELHCTyDuIcmjehdhBEQtYxBOJPEPVg46nlkOIZSeNZY7U9NF1vUjPI7NgvfJ01
	dsgoRtu4nNXOkLWtlEZW3jzdg1JtbXzKr9j6IeUtNg57f+chAXoccKVIgRSr5xM2GzrfGFkbFHZ9y
	ms4t7lftXfVkGr/G8qaEp19DTH3aO9whMFxCAiH4GTOqdcayOHiDSAqHx/heNXA8dbnSidLZ7bFOw
	VArQP5WSbz3h1f602wKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPip-00CgJg-8Y; Tue, 07 Feb 2023 15:17:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPic-00CgE5-N9; Tue, 07 Feb 2023 15:17:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0854F6602077;
	Tue,  7 Feb 2023 15:17:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675783025;
	bh=TEDT9pnGFqcTJVk9HH31+nHZjvOvS2XRc3rMOWGCeTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7g1fXAmAgcVOMTYHowBNYIBsKGNnW6sSVRvf903qzu2Bfvlwt1ZMZRXpzC1PJOHF
	 egWwoe/kzISIu4u9RpLEKEOQLn5173w4sRElcibvzq+JOcYeCUOgMYWRE5/wtwDY/w
	 4mTonBQQXY3dkUZpffuySaClGfUlg01Ki3WMIqehYCVrBY6+4CaNt9jhF3/0WmmvwV
	 w6XIGcKI6xErOUgwoseeD1y1lanoqGmvVAuHh/YZiDcxWRxn9YzgUPW3a3Dm8yl41T
	 tXJQsfiJNH9naWSz7MJlyTktCYYf+1s0gc1FjyVU5JSTlib90IVh6KvmyEpmVa+TJM
	 l1fPDXu2rnuNQ==
Message-ID: <3a43ce55-ff6a-0cd2-b020-d5fefe8aca0a@collabora.com>
Date: Tue, 7 Feb 2023 16:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mt7986: set Wifi Leds low-active for BPI-R3
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230205174833.107050-1-linux@fw-web.de>
 <8f04f2b5-320e-50d4-9517-6dac989f63b3@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8f04f2b5-320e-50d4-9517-6dac989f63b3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_071714_901014_C17130FB 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/02/23 21:20, Matthias Brugger ha scritto:
> 
> 
> On 05/02/2023 18:48, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Leds for Wifi are low-active, so add property to devicetree.
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>> index 33bd6febc160..2b028141f1f7 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>> @@ -446,5 +446,9 @@ &wifi {
>>       pinctrl-names = "default", "dbdc";
>>       pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
>>       pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
>> +
>> +    led {
>> +        led-active-low;
>> +    };
> 
> The binding is missing this property also the driver implements it. Could you 
> please update the bindind description properly?
> Thanks
> Matthias


After and only after [1] is picked,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20230207133504.21826-1-linux@fw-web.de/

