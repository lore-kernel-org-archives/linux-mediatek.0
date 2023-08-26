Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE00C83F10
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 02:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCMAT5RK5lYU1x7cfXnJGNdEHYznzWfreprkDZKvP0k=; b=aQ9tgZOadKzXS6mM1qBeyDD4Na
	YwSvmGtQVC/iSBdbYgkRY0mKMhsoeA/Rqx8eEMqokrQZ759lqfKwH7k57DNKg5WLxaE7n8E6EhFPK
	E8PqtzLj33F+loVJawgPlA+OP/u1X7RCx58gR3JD026X6aMJEv5s+gL9TFKCTDS+Y6iT++MIDXGeb
	4R/YaebjSWRTCR0CdoEGEY2LlpBZ3SVC/cGcByOYYxi5hUG3G3F7MVHgfwFpmtfabbK/aGWwkZPoY
	Z6XTYEP+drnkjRqLy4GCQMwMftbx9QImRKT0AwCR1KWCPs1axiGcRAqVxtX1RbT5ctY6ppWZL976Q
	q2JebZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZjBO-006KTF-2l;
	Sat, 26 Aug 2023 02:37:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZjBL-006KSd-0r;
	Sat, 26 Aug 2023 02:37:49 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RXgsM6NjTzVk3H;
	Sat, 26 Aug 2023 10:35:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 10:37:39 +0800
Message-ID: <85a940c1-c43a-6a2d-a992-7341fffa74c8@huawei.com>
Date: Sat, 26 Aug 2023 10:37:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/4] iio: adc: mt6577_auxadc: Use
 devm_clk_get_enabled() helper function
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
CC: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
 <20230825105746.2999548-3-ruanjinjie@huawei.com>
 <20230825135402.5eef68f6@jic23-huawei>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230825135402.5eef68f6@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_193747_649750_4608F172 
X-CRM114-Status: GOOD (  13.84  )
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



On 2023/8/25 20:54, Jonathan Cameron wrote:
> On Fri, 25 Aug 2023 18:57:44 +0800
> Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> The devm_clk_get_enabled() helper:
>>     - calls devm_clk_get()
>>     - calls clk_prepare_enable() and registers what is needed in order to
>>       call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Applied.  This is another case that would benefit from use of dev_err_probe()
> for all error messages in the probe routine.  Should also be easy to convert
> to fully devm managed with one devm_add_action_or_reset() and appropriate
> callback.

Right! Use dev_err_probe() to simplify it is a good idea.

> 
> Jonathan
> 
>> ---
>>  drivers/iio/adc/mt6577_auxadc.c | 17 +++--------------
>>  1 file changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
>> index 0e134777bdd2..ea42fd7a8c99 100644
>> --- a/drivers/iio/adc/mt6577_auxadc.c
>> +++ b/drivers/iio/adc/mt6577_auxadc.c
>> @@ -270,23 +270,16 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>>  		return PTR_ERR(adc_dev->reg_base);
>>  	}
>>  
>> -	adc_dev->adc_clk = devm_clk_get(&pdev->dev, "main");
>> +	adc_dev->adc_clk = devm_clk_get_enabled(&pdev->dev, "main");
>>  	if (IS_ERR(adc_dev->adc_clk)) {
>> -		dev_err(&pdev->dev, "failed to get auxadc clock\n");
>> -		return PTR_ERR(adc_dev->adc_clk);
>> -	}
>> -
>> -	ret = clk_prepare_enable(adc_dev->adc_clk);
>> -	if (ret) {
>>  		dev_err(&pdev->dev, "failed to enable auxadc clock\n");
>> -		return ret;
>> +		return PTR_ERR(adc_dev->adc_clk);
>>  	}
>>  
>>  	adc_clk_rate = clk_get_rate(adc_dev->adc_clk);
>>  	if (!adc_clk_rate) {
>> -		ret = -EINVAL;
>>  		dev_err(&pdev->dev, "null clock rate\n");
>> -		goto err_disable_clk;
>> +		return -EINVAL;
>>  	}
>>  
>>  	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
>> @@ -310,8 +303,6 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>>  err_power_off:
>>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>>  			      0, MT6577_AUXADC_PDN_EN);
>> -err_disable_clk:
>> -	clk_disable_unprepare(adc_dev->adc_clk);
>>  	return ret;
>>  }
>>  
>> @@ -325,8 +316,6 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
>>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>>  			      0, MT6577_AUXADC_PDN_EN);
>>  
>> -	clk_disable_unprepare(adc_dev->adc_clk);
>> -
>>  	return 0;
>>  }
>>  
> 

