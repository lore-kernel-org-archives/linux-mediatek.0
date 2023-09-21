Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C360FE7071D
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjeUJBZ9Erxt2QWsmnFq/mAmnDQu/WCTvaB34qMsEzQ=; b=CBM+4qoO0WZYYQ
	CtvzI/CbVwUC0/xcXtmCkEEvTPo86jsfCMEorxlQm7wRI4LxPw+VtdY3zu9I+kb9xb1SPM4MRbmMU
	gzHiUloZrkdezmaGQtZKDC3zUGZA3UoN7QbkHeYRJWsKJ2WHrEFHS/Wx+bGqQ7bKsjcknK2kyWTsw
	dvYajFf/oBsCZYV0PQ7ufhz6gAXniNx1WAoFvI2LeW/Lli0L7fhEFizl4vgnEZxmp/DM9Fa7W6I1B
	E7keHEzbDDDjLRiDybYpAttX2AjPInCBKRSXQoAfbjSy44cnE+8Ibi0CjMG8V9ZR4J/RMAZ8iIFaT
	4xhYGq/MQRVXSsffZZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHgN-005tq1-1y;
	Thu, 21 Sep 2023 11:17:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHgK-005tp1-1A;
	Thu, 21 Sep 2023 11:17:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E5B766072AC;
	Thu, 21 Sep 2023 12:17:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695295031;
	bh=5QZOgiLgPuj65gBIxllEBQ8UoAChCrqYN69GWaV+yPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YIkKEXQn5t4jCUZXXcgaqsS6xgzmWls+xt48pRl4jotoNXPsxnwU8UlPasMZ765an
	 paCIZCGBBoLI4DEJ39pIm/BPJa5zGDs7y7m9WKcShrDe4EOA4RNkvOxQNpinMY+Ktw
	 MopSXw+sp9/afzvJNgoKPhm5XLMOad5TLwgwcpOdaIXyodmGRAtQYNKAifssIrrK/5
	 ZGsptSM+8tnUHNHK1obP3UP/remTXxWWsSC2TytAPZMAjkot5qpiBZpPjIVztfajzd
	 e/+RRAGceAq9iYKuU15E3FuXrbDtHqsSMIJEdwHWdRAdeVz7dIEkbqK0/5TIHlGEud
	 60+XAyr3xGh9g==
Message-ID: <fb716cdf-12eb-8d85-3b9d-b1d5e5aee212@collabora.com>
Date: Thu, 21 Sep 2023 13:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 4/4] thermal/drivers/mediatek/lvts_thermal: add mt7988
 support
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-5-linux@fw-web.de>
 <eb6cc1dd-1df9-3b68-1f72-d536189c7b4d@collabora.com>
 <F68F7C77-BB1E-4D9F-B760-9B35DE3693C5@fw-web.de>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <F68F7C77-BB1E-4D9F-B760-9B35DE3693C5@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_041716_726240_199975BE 
X-CRM114-Status: GOOD (  22.04  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/09/23 12:39, Frank Wunderlich ha scritto:
> Am 21. September 2023 09:54:35 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 20/09/23 19:50, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>   
>>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>>> index c2669f405a94..8fd1dc5adb16 100644
>>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>>> @@ -82,6 +82,8 @@
>>>    #define LVTS_GOLDEN_TEMP_DEFAULT	50
>>>    #define LVTS_COEFF_A_MT8195			-250460
>>>    #define LVTS_COEFF_B_MT8195			250460
>>> +#define LVTS_COEFF_A_MT7988			-204650
>>> +#define LVTS_COEFF_B_MT7988			204650
>>>      #define LVTS_MSR_IMMEDIATE_MODE		0
>>>    #define LVTS_MSR_FILTERED_MODE		1
>>> @@ -89,6 +91,7 @@
>>>    #define LVTS_MSR_READ_TIMEOUT_US	400
>>>    #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
>>>    +#define LVTS_HW_SHUTDOWN_MT7988		105000
>>
>> I would simply reuse the definition of LVTS_HW_SHUTDOWN_MT8195....
> 
> Hi angelo,
> thanks for review.
> 
> Imho it should be separated...if someone thinks it needs to be changed later it will be changed not only for mt8195...a generic name can also cause problems if the next soc has different value.
> 

Okay, I don't really have strong opinions against that anyway.

Cheers
Angelo

>>>    #define LVTS_HW_SHUTDOWN_MT8195		105000
>>>      #define LVTS_MINIMUM_THRESHOLD		20000
>>> @@ -1269,6 +1272,41 @@ static int lvts_remove(struct platform_device *pdev)
>>>    	return 0;
>>>    }
>>>    +/*
>>> + * LVTS MT7988
>>> + */
>>> +
>>
>> Please remove this big comment block, that's not needed.
> 
> Ok,i drop the comments (maybe except the wed one where the name in technical document (i used for constants) does not point to wed function.
> 
>>> +static const struct lvts_ctrl_data mt7988_lvts_ap_data_ctrl[] = {
>>> +	{
>>> +		.cal_offset = { 0x00, 0x04, 0x08, 0x0c }, //918,91C,920,924
>>
>> This 918,91c,etc comment is not necessary
>>
>>> +		.lvts_sensor = {
>>> +			{ .dt_id = MT7988_CPU_0 }, // CPU 0,1
>>
>> If you want to retain those comments, you shall use the right style.
>>
>> { .dt_id = MT7988_CPU_0 }, /* CPU 0,1 */
>> { .. } /* CPU 2,3 */
>> { .. } /* Internal 2.5G PHY 1 */
>>
>> etc
>>
>>> +			{ .dt_id = MT7988_CPU_1 }, // CPU 2,3
>>> +			{ .dt_id = MT7988_ETH2P5G_0 }, // internal 2.5G Phy 1
>>> +			{ .dt_id = MT7988_ETH2P5G_1 }  // internal 2.5G Phy 2
>>> +		},
>>> +		.num_lvts_sensor = 4,
>>> +		.offset = 0x0,
>>> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
>>> +	},
>>> +	{
>>> +		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 }, //92C,930,934,938
>>
>> comment not needed
>>
>>> +		.lvts_sensor = {
>>> +			{ .dt_id = MT7988_TOPS_0}, // TOPS > +			{ .dt_id = MT7988_TOPS_1}, // TOPS
>>
>> The dt_id definition already says "TOPS", this comment is not needed.
>>
>>> +			{ .dt_id = MT7988_ETHWARP_0}, // WED 1
>>> +			{ .dt_id = MT7988_ETHWARP_1}  // WED 2
>>
>> Same comment about the format; /* WED 1 */
>>
>>> +		},
>>> +		.num_lvts_sensor = 4,
>>> +		.offset = 0x100,
>>> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
>>> +	}
>>> +};
>>> +
>>> +/*
>>> + * LVTS MT8195
>>> + */
>>
>> Please also remove this big comment block, it's not needed.
>>
>> Apart from that, this patch looks good; v3 will be the golden one :-)
>>
>> Cheers,
>> Angelo
>>
> 
> regards Frank




