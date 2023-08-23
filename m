Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096DDEE49AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMLqQ07/1S4FGZac+b+3f8r1p2hwvkhxqYFR9XhasgQ=; b=GiEP9jil0iYVcstAj87f7ANR+U
	n/Wb2UiUNTY99V4yvNJtFU0T4HXGr/gHbalHet2xoUqJYDvRzhy74GbZsIMgvsekh7kBidmORslzD
	N6olFqKycJEO4oVbIL4hEmOVwbUe60e7yV8LL7QulRtPAW1xE39mgkR/UT3zTmUdaPiXMZLLz7AJU
	HMwcVkh+TX74eS8hpcAGwBVca95k868x34r9yePJHsLb9E6a5D+MR9oTSGnmZIcswEdiGCUiAmDhw
	TGdVK91NFVtiqatfMaMp1uzByNZ15W71KseyKvB5OI6cFEnCZx1OWcxCFGl7gqfG86bxKVv2hAvGM
	3CvixF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYibK-00HVFc-2q;
	Wed, 23 Aug 2023 07:48:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYibI-00HVEW-05
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 07:48:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so4451287f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Aug 2023 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692776901; x=1693381701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMLqQ07/1S4FGZac+b+3f8r1p2hwvkhxqYFR9XhasgQ=;
        b=xPQOyHts+i9uO+7Lq2SW75l7BNzXbnEHzbY/GIalOHkJV0T9C1s+5e2PYA/yb58BRc
         j3JJEx2+1mhKBwvTO2lioBRdZYiQRurrgvJyx2sdWR3Zd4a1ryZfz1PkrK79eJCrSMc8
         HCTJM2m7WTAMp3zHz2u1Guc7CHjED0IIOQB8B+CJW2DPAWhLPMhaOebScjTyT4ipNn4e
         Y9lU477EdYf0BA/2IscFXXaGlvGtStv0SwE1h7CwP7aMbc2RuN5ImU5o6X3iRxsQO+IC
         yRGmw1iqFdhUYbu2X3QIKq168/Hmwi0u5YsS7X6VgaM2TGa0pyZnkdKsoLwzno1yWsu9
         fVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692776901; x=1693381701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMLqQ07/1S4FGZac+b+3f8r1p2hwvkhxqYFR9XhasgQ=;
        b=XomXTUhZz7JcB9ieWK09MREDQ2KUXHHDqaTTD+1niUt+mqCB1uipI6rQf+DInrezou
         zAZFjGX5/vQgyCLKuJjjXbv770erT+glBAm5XN74k3xd5aF6gI15ibVxfZgghSvaoLFZ
         3ZZld3Z22o6a+raygChHshmYMrsgFQZy0JXmwwQ2zeMcClZR2Enc7nsoGYfN0WQy6Irr
         UgJxeI3+QYFP0uEhpFkN+P3x7PkMUuo+Byx3xJwhSzCdK2hRT4w8BbfwvSxYOyy4riuA
         A5nVznKov2kIThiRmNuj+5z6djj3fdYfGA8OTvLQmfX4RpRQZi+J5kiqXY9moHcRlA1y
         FMUg==
X-Gm-Message-State: AOJu0YzOLV4UjG0G3+H3q5oPXf3tVr6VUafrIrUVHVMbZn80qgQyo7Dv
	PMOAQMDMX0LEtuyjwp/OEf7NLQ==
X-Google-Smtp-Source: AGHT+IEJCgqNoN/t/JtugjJDUHt4ZTgJERVOv2dLtodMoCTxdTohodR2lggnhDmB/2raLk4Fvg/g7w==
X-Received: by 2002:a5d:46cd:0:b0:317:5c36:913b with SMTP id g13-20020a5d46cd000000b003175c36913bmr9140847wrs.48.1692776901194;
        Wed, 23 Aug 2023 00:48:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g16-20020adff3d0000000b00318147fd2d3sm17986636wrp.41.2023.08.23.00.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 00:48:20 -0700 (PDT)
Message-ID: <b544e079-c9de-23d3-80f7-cff89293eeb5@linaro.org>
Date: Wed, 23 Aug 2023 09:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend
 and resume
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <20230530195132.2286163-3-bero@baylibre.com>
 <371790cd-5a7c-8fa6-cc38-3a3680525092@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <371790cd-5a7c-8fa6-cc38-3a3680525092@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_004824_101861_A021E9A6 
X-CRM114-Status: GOOD (  11.43  )
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

On 31/05/2023 10:05, AngeloGioacchino Del Regno wrote:

[ ... ]

>>   static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
>>       {
>>           .cal_offset = { 0x04, 0x07 },
>> @@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
>>   static struct platform_driver lvts_driver = {
>>       .probe = lvts_probe,
>>       .remove = lvts_remove,
>> +    .suspend = lvts_suspend,
> 
> Should we do that in noirq handlers?
> We're risking to miss a thermal interrupt.

I'm not sure missing a thermal interrupt is a problem in this context 
but we may go in the irq routine with an undefined state sensor setup 
(eg. the internal clock stopped in the suspend and then read the sensor 
in the isr).

IMO, using suspend_noirq and resume_noirq may be required here.

Alexandre are you taking over the next iteration?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


