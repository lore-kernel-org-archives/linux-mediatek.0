Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74499C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9h0kdAd/N+I7zpf/teazRbV48CDB2Aqto7TbnsYodw=; b=Tz9S4lqU/wsYF3
	4solCPvpcWSNG1jgUP0lg9009CtEvqGHkKxMCF4UlW7AOJknIN39SeCni6M9sgiJC0Z8QT6+MOmch
	lhYorz2K7pxnGKzVibRkpKHL04Bvz6m9kJEh0axoBiRFWH2evIWTKa97jLojYE+f1ir8eRgoPTNzb
	m4P3BJGqcf/cjqXR1JGoWfGFnmY11/o6jmK4LXfX6UBKox4KvmitXbeuwaqWuOZsb6mrqPnJQKP3P
	YZ59zA79QoAvAWHsVc7ngqj1GylfzT/VQ6vYsL8Rp1hzuttfHIp8MSEDv85IUm6+VuE1z1HAHgFB1
	P/3DwQ44Of/x1xjpDo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ8hp-00BlL2-M6; Tue, 29 Mar 2022 10:04:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ8hZ-00BlES-VN; Tue, 29 Mar 2022 10:03:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso942476wme.5; 
 Tue, 29 Mar 2022 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XP58J9nMiUBKKZ2mEHu2elDVfOboIj5PiONcCMCt6ic=;
 b=Yq4sbY+zwUknZYkTIlOVDWtB1bNtPagOZTtgT+2I2V6upHPE6NIOT3L9S27Sx3I/nz
 bio/avRpFO0w5U5XECzAzLC3az+PrWr7pSssQ/xJN88fnPTBrMKhd+6QqBjuSAIDKJ1R
 3FrFVS+HUJpZ1BT5HBH8JXJmW2OYL82dENzmIYwQUfTMCi/fAdJrxk2dD8+s+IDs5ZVi
 54z7C6/HBUWl/N3wRalHWceNxICXqSnmCSkWIqaCs+BQxR8VJDsPLfVJMEj5utTb10R3
 FgAhPK2IuYpcMppLKB9iXpS+/zIQsSefUrpWdz7iRWN4NR5I08aSY/n1y0aZoo/2OElH
 bFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XP58J9nMiUBKKZ2mEHu2elDVfOboIj5PiONcCMCt6ic=;
 b=MBQss2k+r+2DyiK/M1CQ6F9Phhv/zeWeZCYK8kCPEJXL7K4hmfARmEEFNUElPg52IE
 pfcAmIir/qkegsiTAogPvRbNCcnsq1OWXtPnB3XpgkM/LsMv/BvxgwLTETB+mwtZdjLH
 uqTuOnC5KjPYA9t08GeLzm+huMq31klhN7w/zXXP25i/pUAILyrNmasDo/9/nf7NOKgi
 9RboeB0JTHvFNiKx1dXywsUQ876xL95H4bhJn+QAxWbRxQeL8EfQZM4OD6CpAPr17NPR
 ujQi6yWyhIv1ks6WKukEXie1/0XNPUuXB19kSGgINc1IfK3s26neznlLyouE7kqBvYNm
 BBdw==
X-Gm-Message-State: AOAM533THBbouBMOn8M9UWl1LQs4QokektxYeYFzS57YvZ8AUTxpX7BN
 fn4FJWbCypjtbIR+w9VqJgk=
X-Google-Smtp-Source: ABdhPJztz045tZLfgkeJcC3u6Zv7to81fyJuQrvXjzft9fCaGBH8M6rHdf7cy+6YBfYM8gLnYA366A==
X-Received: by 2002:a05:600c:34ce:b0:38c:a579:944a with SMTP id
 d14-20020a05600c34ce00b0038ca579944amr5773450wmq.113.1648548228053; 
 Tue, 29 Mar 2022 03:03:48 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0038c6c37efc3sm1811134wmq.12.2022.03.29.03.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:03:47 -0700 (PDT)
Message-ID: <ea6868cc-6650-9b69-e328-6b0d31069191@gmail.com>
Date: Tue, 29 Mar 2022 12:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 22/22] arm64: dts: mt8192: Add pwm node
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
 <51f8baea-6562-1d6b-c409-9c362f0b2fc5@gmail.com>
 <6ab86a35394879cf35fd9d780f8b7ab1695c931b.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <6ab86a35394879cf35fd9d780f8b7ab1695c931b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_030350_052156_A6FAE109 
X-CRM114-Status: GOOD (  21.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/03/2022 08:51, allen-kh.cheng wrote:
> 
> Hi Matthias,
> 
> On Mon, 2022-03-28 at 13:10 +0200, Matthias Brugger wrote:
>>
>> On 18/03/2022 15:45, Allen-KH Cheng wrote:
>>> Add pwm node for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index f0f0f067c023..ea98b2230f18 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -625,6 +625,17 @@
>>>    			status = "disabled";
>>>    		};
>>>    
>>> +		pwm0: pwm@1100e000 {
>>> +			compatible = "mediatek,mt8183-disp-pwm";
>>> +			reg = <0 0x1100e000 0 0x1000>;
>>> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>
>> Binding description is missing interrupt property. Remeber that the
>> DT should
>> describe the HW, so we need to update the binding description.
>> I just wonder what the IRQ signals, as it is not used by the driver.
>> Definitely
>> a good candidate to make the commit message more sound. So please add
>> it there.
>>
>> Thanks!
>> Matthias
>>
> 
> For interrupt property, we will send anther patch to update binding
> and add some information for IRQ into commit message in next version.
> 

Thanks. Would you mind to send the dt-bindings updates in a series together with 
the patches from this series that needs changes? This way it will be easier to 
track the dependencies.

Please beware to send dt-binding patches as first of the series, so that Rob 
Herring can find the rather quick.

Thanks!
Matthias

> Thanks,
> Allen
> 
>>> +			#pwm-cells = <2>;
>>> +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
>>> +				 <&infracfg CLK_INFRA_DISP_PWM>;
>>> +			clock-names = "main", "mm";
>>> +			status = "disabled";
>>> +		};
>>> +
>>>    		spi1: spi@11010000 {
>>>    			compatible = "mediatek,mt8192-spi",
>>>    				     "mediatek,mt6765-spi";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
