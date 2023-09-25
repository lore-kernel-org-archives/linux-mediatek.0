Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6098CE7AB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njQ1BdogkQcbdblidvKFwQ0CFQs7HyHgjLf5rxsvEe4=; b=k684sXiLSfrcJD/oxvKayYoScm
	WNqtH0ycWNAmBetVkljTjuqRIhG5u40Wbi/MSADn6bsX2thQU6PwUJ7UPTzAyW2TTGnEhXfXcHo/P
	5r7rbnEGUrfK9WWqNqsA1AuPltu+0X4CRUbxEE5Jp5JuXxHcsREI2QXTLzlNhlL4cdDlKavh3sIVZ
	XkFmIAscQY/xcmiUJtqF4NB/4P98jAWyvdLzzYVLqcwFjXktJH6IOdo3ocWZTvoeBGwhDZdgjB+tQ
	Gj/7RgLvj4GT9nfB5SYHveFMJ/g+1b6I69Cs/jtMtASQRgbz4xZWVaRSjoD1B19CuB5iPqPEl1v+0
	sO0hQusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkptb-00EnOy-1F;
	Mon, 25 Sep 2023 18:01:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkptX-00EnNi-2Z
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:01:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso1288902566b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695664874; x=1696269674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njQ1BdogkQcbdblidvKFwQ0CFQs7HyHgjLf5rxsvEe4=;
        b=AG9DkRZg9jkDNgf49ziFzLI/vSFun+Uh19oxbWsWDUhW4WhDY5/KwBzbzX4z9uagsv
         H06ShHy6nJAN2tT91mK9iARyevL+PrGyX2dKeXyL6cnn26Q7pIK0kmOMhUNUgwvR13ac
         2v8r0Xu16Kat02XjbZs6ag8BAuDENx51ko+aRCFpbSX2zuaG55dnyBm/DkJPeI1gA6Tq
         ju/3V26R43SglmP3vqUKAyTVVIauLVHT9cA83Jufc8NIGqGnBG9GlcOpzQ0/rd9sMTpA
         K65cSGhrMkHOKUkieMzhaZteWQyDndOLlg8SpsIfuWfgXrBv9nzizROOURHHxZokAXrP
         Mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664874; x=1696269674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njQ1BdogkQcbdblidvKFwQ0CFQs7HyHgjLf5rxsvEe4=;
        b=fNJxZf3ZPEThHOyRsQM3tf2sUIOjxgTWOYxAdFMx6gKZ+sQtoWRsSaQuadnABwILkE
         ic/MUxpitaCpgFX7R3lCbPxuG3cowK67AfHy1hOlZ/nOXf5U5vlT786YiMLLcdJdtPII
         nFb82RY/oCGRkVZCTTyYEkxXJABHdIto7PRGL8FR5pKka2MIaeLybIx0lWLBtdhpR2mQ
         PsSQAF0QiPsrgTcrp2bUOeSaDusftKm0YdVtkG7QWSjoBvZmF/b+l6sBoeAfDWXKZoPM
         gQMy0B6QL0suPM2hK1PpZGD4JCoq493bWKQbQcankNh7XeOf0Yt6UgqaNGCrYX8XR8DL
         QDow==
X-Gm-Message-State: AOJu0YxWVj+WUGVsZCl4mxCltz7YqlUzAq2ChyCMquNqPiRaLNvuirc4
	x9sZ0rei4B0bFB5wLVNWCOgdbA==
X-Google-Smtp-Source: AGHT+IG9/u2SB3ZRpgbXHjLztULk+AuoniEiZnId5QcCxv56UfQinLW43rYvtYkHF/0n4pyv0GC6PA==
X-Received: by 2002:a17:907:9490:b0:9a5:aa43:1c7c with SMTP id dm16-20020a170907949000b009a5aa431c7cmr451126ejc.26.1695664874463;
        Mon, 25 Sep 2023 11:01:14 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090614c400b00992b510089asm6619941ejc.84.2023.09.25.11.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 11:01:13 -0700 (PDT)
Message-ID: <869d9122-6187-47a0-0589-9feeafaf984c@baylibre.com>
Date: Mon, 25 Sep 2023 20:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] iommu/mediatek: Initialise the secure bank
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WUYgV2FuZyAo546L5LqR6aOeKQ==?= <YF.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "tjmercier@google.com" <tjmercier@google.com>,
 =?UTF-8?B?TWluZ3l1YW4gTWEgKOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>
References: <20230911011751.29906-1-yong.wu@mediatek.com>
 <20230911011751.29906-2-yong.wu@mediatek.com>
 <28b81a20-5cfa-b474-41c3-c01b7b846e21@collabora.com>
 <409168b540948d312a91022f375fa71a470e9d60.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <409168b540948d312a91022f375fa71a470e9d60.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_110119_845999_CF350D7E 
X-CRM114-Status: GOOD (  26.75  )
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



On 25/09/2023 14:50, Yong Wu (吴勇) wrote:
> On Mon, 2023-09-11 at 11:22 +0200, AngeloGioacchino Del Regno wrote:
>> Il 11/09/23 03:17, Yong Wu ha scritto:
>>> The lastest IOMMU always have 5 banks, and we always use the last
>>> bank
>>> (id:4) for the secure memory address translation. This patch add a
>>> new
>>> flag (SECURE_BANK_ENABLE) for this feature.
>>>
>>> For the secure bank, its kernel va "base" is not helpful since the
>>> secure bank registers has already been protected and can only be
>>> accessed
>>> in the secure world. But we still record its register base, because
>>> we need
>>> use it to determine which IOMMU HW the translation fault happen in
>>> the
>>> secure world.
>>>
>>> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    drivers/iommu/mtk_iommu.c | 19 +++++++++++++++++--
>>>    1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 640275873a27..4a2cffb28c61 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -146,6 +146,7 @@
>>>    #define TF_PORT_TO_ADDR_MT8173		BIT(18)
>>>    #define INT_ID_PORT_WIDTH_6		BIT(19)
>>>    #define CFG_IFA_MASTER_IN_ATF		BIT(20)
>>> +#define SECURE_BANK_ENABLE		BIT(21)
>>>    
>>>    #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>>>    				((((pdata)->flags) & (mask)) == (_x))
>>> @@ -162,6 +163,8 @@
>>>    #define MTK_IOMMU_GROUP_MAX	8
>>>    #define MTK_IOMMU_BANK_MAX	5
>>>    
>>> +#define MTK_IOMMU_SEC_BANKID	4
>>> +
>>
>> Is there any SoC (previous, current or future) that may have more
>> than one
>> secure context bank?
> 
> Thanks very much for the below detail suggestion. But No, for MM IOMMU,
> The bank4 is mandatory the secure bank, and there is only this one
> secure bank, and this is the case for all the current projects, we have
> no plan to modify this at the moment. Therefore I think a macro is ok
> for it.
> 

Between 2 solutions which have the equivalent complexity (logical & 
readability), I prefer the most generic one (at least for generic 
drivers like this). Nobody is aware about future SoC, even if you know 
what will have the next SoC generation, I'm not sure you can certified 
it will be the same in the next 2, 3, 4,... generations.

I'm convinced it will be easier in the future to maintain the IOMMU code 
if it's flexible.

> Thanks.
> 
>>
>> I'm thinking about implementing this differently...
>>
>> static const struct mtk_iommu_plat_data mt8188_data_vdo = {
>> 	....
>> 	.flags = ..flags.. | ATF_SECURE_BANKS_ENABLE
>> 	.banks_num = 5,
>> 	.banks_enable = {true, false, false, false, true},
>> 	.banks_secure = {false, false, false, false, true},
>> 	....
>> }
>>
>> ...this would means that you won't need to specify a static
>> SEC_BANKID, as
>> you'd get that from banks_secure... so that....
>>
>>>    enum mtk_iommu_plat {
>>>    	M4U_MT2712,
>>>    	M4U_MT6779,
>>> @@ -240,9 +243,13 @@ struct mtk_iommu_plat_data {
>>>    };
>>>    
>>>    struct mtk_iommu_bank_data {
>>> -	void __iomem			*base;
>>> +	union {
>>> +		void __iomem		*base;
>>> +		phys_addr_t		sec_bank_base;
>>> +	};
>>>    	int				irq;
>>>    	u8				id;
>>> +	bool				is_secure;
>>>    	struct device			*parent_dev;
>>>    	struct mtk_iommu_data		*parent_data;
>>>    	spinlock_t			tlb_lock; /* lock for tlb range
>>> flush */
>>> @@ -1309,7 +1316,15 @@ static int mtk_iommu_probe(struct
>>> platform_device *pdev)
>>>    			continue;
>>>    		bank = &data->bank[i];
>>>    		bank->id = i;
>>> -		bank->base = base + i * MTK_IOMMU_BANK_SZ;
>>
>> ....this would become:
>>
>> bank->is_secure = MTK_IOMMU_HAS_FLAG(data->plat_data,
>> ATF_SECURE_BANKS_ENABLE) &&
>> 		  data->plat_data->banks_secure[i];
>>
>> if (bank->is_secure)
>> 	bank->sec_bank_base = res->start + i * MTK_IOMMU_BANK_SZ;
>> else
>> 	bank->base = base + i * MTK_IOMMU_BANK_SZ;
>>
>>> +		if (MTK_IOMMU_HAS_FLAG(data->plat_data,
>>> SECURE_BANK_ENABLE) &&
>>> +		    bank->id == MTK_IOMMU_SEC_BANKID) {
>>> +			/* Record the secure bank base to indicate
>>> which iommu TF in sec world */
>>> +			bank->sec_bank_base = res->start + i *
>>> MTK_IOMMU_BANK_SZ;
>>> +			bank->is_secure = true;
>>> +		} else {
>>> +			bank->base = base + i * MTK_IOMMU_BANK_SZ;
>>> +			bank->is_secure = false;
>>> +		}
>>>    		bank->m4u_dom = NULL;
>>>    
>>>    		bank->irq = platform_get_irq(pdev, i);
>>
>> What do you think?
>>
>> Cheers,
>> Angelo

-- 
Regards,
Alexandre

