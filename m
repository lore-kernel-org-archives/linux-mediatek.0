Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17799C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+evFeqDgoOOhuBezSSuNAhwY/dJnnKnQbx4DeUDujUc=; b=1yke5gwv6QkKiFjQ5FYo/m5rx9
	E8laDH+GHR743h72cxIzWqBCDZF3zTXJOiXqubEUy32OULWtOlKN1nVqb0jjBJuRC3OonltCUXKzz
	OehcTH18Fw+effJDRRTdBtS+KcXioZSHlEcaiResgTUflDdYAaeRtMpttGAikCcKFwblC5zXQ0Zb3
	TNVsRmC/14HhLCGF7L7fR+R1MKWRjbLJK2/kT2opbXBUAIgHebOYP6Gf7QxKQ2RkbRZqwaZUTVR0n
	GIWJMcJ3FCzLGgaroddsHhEl8ZOtMPPv18nvUgke7wy9ocUWmV49TIWufHvyRm5QNwEHoLCAuCuah
	x2J/QTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmv9K-0064fh-0I;
	Thu, 13 Apr 2023 11:29:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmv9G-0064eD-0y;
	Thu, 13 Apr 2023 11:29:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5D446603212;
	Thu, 13 Apr 2023 12:29:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681385390;
	bh=bvenpCUXdyjjQEZArC0d3YuEErYsBVLrl7zmm7hLLgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bm0jDJcBNEQXa1Ue8FRql2CVOwseKGKuXaSAt56oxwcwKKfMJ5mWYSTO+Afclx9Uh
	 Cp+YADPst8MAbWzan1Vaz0Zt2LjLK9Yx2/+uQaFfO6DreqPEwBI3MnnzgqFN84TdSz
	 Ze5TZBYW6zQ8ALWAA/b9KgqguuGe1kuP1PbGl2V/eWzJrTtrIQJPd489fcC3TlGHOP
	 rJ/FY3ljHLAxXd1Z4RVu9hUqkOQcIzKV1v92BPGoiEPWCjZvYlCsx7EI2AEice40RU
	 0prTs0NN2AOGbT2R4HVI6mkgqftOrE/W4u+PXzbNChFKLsAyQ7RTo3r+3cslonBtjS
	 9Uz5SVc5lJD2Q==
Message-ID: <04d2b53e-4f5e-81ec-3397-e58898b7039e@collabora.com>
Date: Thu, 13 Apr 2023 13:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] leds: leds-mt6323: Add support for WLEDs and
 MT6332
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
 <ZDfiNSAs3Bc7xe1l@duo.ucw.cz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZDfiNSAs3Bc7xe1l@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_042954_466798_0B2C9EDB 
X-CRM114-Status: GOOD (  16.95  )
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

Il 13/04/23 13:06, Pavel Machek ha scritto:
> Hi!
> 
>> Add basic code to turn on and off WLEDs and wire up MT6332 support
>> to take advantage of it.
>> This is a simple approach due to to the aforementioned PMIC supporting
>> only on/off status so, at the time of writing, it is impossible for me
>> to validate more advanced functionality due to lack of hardware.
> 
> 
>> @@ -467,14 +590,24 @@ static int mt6323_led_probe(struct platform_device *pdev)
>>   			goto put_child_node;
>>   		}
>>   
>> +		is_wled = of_property_read_bool(child, "mediatek,is-wled");
>> +
> 
> This needs documenting in the binding, no?
> 
>> +static const struct mt6323_hwspec mt6332_spec = {
>> +	/* There are no LEDs in MT6332. Only WLEDs are present. */
> 
> "Only WLED is present"?
> 
>> +	.max_leds = 0,
>> +	.max_wleds = 1,
>> +	.max_brightness = 1024,
>> +};
>> +
> 
> Is there chip with both LED and WLEDs? (I'm wondering if this makes
> sense in single driver).
> 

Some PMICs have got both LED(s) and WLED(s), yes - this is only on smartphone
designs though.

Regards,
Angelo


