Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39803C43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/6Rsu3j9TkKh8xtxQwADCMWChIMdZvvbcBKzahYIpo=; b=0iqzx9C7HUzX/q99fmlHV5NMYM
	2szozYxl8nNpxZ8h2XRnan3h5BmkiSBTrWsHZ87Y+7MAMFO2TxOpoyPNX5+0zLfnjiNHE+GjYh8kM
	+zRtfCfomYJoArli0EDr0U6RV03jUX4zm6vE8E5UNvWtSm+ntoT+A73imxqir0jPRX+uOM1QVHu1w
	+Vnudo3wiuKsHj7xuSe6m5I1kUXeMbhDzxwjwcHvJyWv0Y7B9uGYMbTWuElrP1wKaFIQ5p0gjKJkR
	Q8CGyccZl8A3hOeS6heIo0puwI1pCgPQidp3b2JZLojnAFQ6NIyPuuAgnlqxrqnW5QmA/fT2uuRSM
	TiLwNfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osT6Y-007O4h-CA; Tue, 08 Nov 2022 18:13:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osT5f-007NbW-Ei; Tue, 08 Nov 2022 18:12:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id l14so22320472wrw.2;
        Tue, 08 Nov 2022 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/6Rsu3j9TkKh8xtxQwADCMWChIMdZvvbcBKzahYIpo=;
        b=iNVmH7VljuLIqdjZ0dluSYcDd0M6JfwzAZgS0Gg3XMAhXJfJSgYZfoKwgO76nIoBSO
         zm4k1R+w1Ey7C9KhsWFa52ysYKWwi+Q1DLWZcMuTkQv+EusWmtTgtuALR/6qcBzTb4/w
         5IUswt8O3OxkLb2yeO/9CCGVssB+EznrSsCtZHI8W0fTV6G47jMo3+uyGIy9aiZ2b1w8
         lwVV+1sdPeTYqPd12MkIoXQcERJahUmmvtWgNaIBvNcr+0YG07qEnII8TAkquTEVTFq/
         ojunaD94fI8BPHA7HDd2VXnppxgoMLjPQOptGshn2h9Vg87YN8k1hE1sP2z6PLNIso0v
         htow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/6Rsu3j9TkKh8xtxQwADCMWChIMdZvvbcBKzahYIpo=;
        b=2Lytj8kQcMdZCSH8Qc1d6m3EHtPBUzCt6iGGpmtXlMP6WmeqLhCofeDdlzvYRPASf6
         aFoN9ww6SDjEHlSdWyEZQumvH8QCAj/TrzqOQ0gw9DwZO14lUMxln2SEPkZBuQbTX+2B
         Bvh+0ghmszNbm3VA7/cyXcyzqaS+amUOUlCAsEoLzxEMDUHNkNluE2I3lmc6bQchND5j
         LUhbGH7EuyblPnIgoKnSj1PWFKQbwHegI2FjxyaNekeAsD6hmxdO9P3fOUetdHZ33EQW
         x0mdapM0lVV399LgEG+eVqn72KH1eHDjb4vfB2b+373hAOD2e5tN+9BSZ6kYTSZ7PyIa
         IR7Q==
X-Gm-Message-State: ACrzQf3XUBxVTP01VNRB3w3NKV4ZMSLPxzLnnvdr1JAA2uxtsGJZE0dB
	ZFGGnA8aUFtxqN0NnWtEfDI=
X-Google-Smtp-Source: AMsMyM4LsIt2QZCkCAiTujJEBgJNBV56F5h6wXyJFgMkC4NCKqLaT1CH0NFCX2a5C1Dr2A5ZmmWG/w==
X-Received: by 2002:a5d:4143:0:b0:236:4b40:bbd1 with SMTP id c3-20020a5d4143000000b002364b40bbd1mr35927670wrq.26.1667931165743;
        Tue, 08 Nov 2022 10:12:45 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id o35-20020a05600c512300b003cfbbd54178sm3083688wms.2.2022.11.08.10.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:12:44 -0800 (PST)
Message-ID: <00b68d53-63fd-f676-218b-fe370fae302c@gmail.com>
Date: Tue, 8 Nov 2022 19:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v13,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <1666577099-3859-2-git-send-email-xinlei.lee@mediatek.com>
 <03fdf45d-be93-206a-8c9c-17d31010162f@gmail.com>
In-Reply-To: <03fdf45d-be93-206a-8c9c-17d31010162f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_101251_529387_2286F91B 
X-CRM114-Status: GOOD (  23.19  )
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



On 08/11/2022 19:11, Matthias Brugger wrote:
> Hi Xinlei,
> 
> Can you please fix the threading of this patches. I can see that this 1/3 but 
> I'm not able to find 3/3 in the series. The first two look good, the third, I 
> don't know.
> 

Nevermind this message, the problem was on my side.

Regards,
Matthias

> Regards,
> Matthias
> 
> On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
>> From: Xinlei Lee <xinlei.lee@mediatek.com>
>>
>> The difference between MT8186 and other ICs is that when modifying the
>> output format, we need to modify the mmsys_base+0x400 register to take
>> effect. So when setting the dpi output format, we need to call
>> mtk_mmsys_ddp_dpi_fmt_config to set it to MT8186 synchronously.
>> Commit a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
>> output for MT8186") lacked some of the possible output formats and also
>> had a wrong bitmask.
>>
>> Add the missing output formats and fix the bitmask.
>> While at it, also update mtk_mmsys_ddp_dpi_fmt_config() to use generic
>> formats, so that it is slightly easier to extend for other platforms.
>> Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for 
>> MT8186")
>> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
>>   drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++------
>>   include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
>>   3 files changed, 33 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h 
>> b/drivers/soc/mediatek/mt8186-mmsys.h
>> index 09b1ccbc0093..279d4138525b 100644
>> --- a/drivers/soc/mediatek/mt8186-mmsys.h
>> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
>> @@ -5,9 +5,11 @@
>>   /* Values for DPI configuration in MMSYS address space */
>>   #define MT8186_MMSYS_DPI_OUTPUT_FORMAT        0x400
>> -#define DPI_FORMAT_MASK                    0x1
>> -#define DPI_RGB888_DDR_CON                BIT(0)
>> -#define DPI_RGB565_SDR_CON                BIT(1)
>> +#define MT8186_DPI_FORMAT_MASK                GENMASK(1, 0)
>> +#define MT8186_DPI_RGB888_SDR_CON            0
>> +#define MT8186_DPI_RGB888_DDR_CON            1
>> +#define MT8186_DPI_RGB565_SDR_CON            2
>> +#define MT8186_DPI_RGB565_DDR_CON            3
>>   #define MT8186_MMSYS_OVL_CON            0xF04
>>   #define MT8186_MMSYS_OVL0_CON_MASK            0x3
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> index 2e20b24da363..16cd924d8973 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys 
>> *mmsys, u32 offset, u32 mask,
>>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>>   {
>> -    if (val)
>> -        mtk_mmsys_update_bits(dev_get_drvdata(dev), 
>> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> -                      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
>> -    else
>> -        mtk_mmsys_update_bits(dev_get_drvdata(dev), 
>> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> -                      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
>> +    struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>> +
>> +    switch (val) {
>> +    case MTK_DPI_RGB888_SDR_CON:
>> +        mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> +                      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_SDR_CON);
>> +        break;
>> +    case MTK_DPI_RGB565_SDR_CON:
>> +        mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> +                      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_SDR_CON);
>> +        break;
>> +    case MTK_DPI_RGB565_DDR_CON:
>> +        mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> +                      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_DDR_CON);
>> +        break;
>> +    case MTK_DPI_RGB888_DDR_CON:
>> +    default:
>> +        mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
>> +                      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_DDR_CON);
>> +        break;
>> +    }
>>   }
>>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h 
>> b/include/linux/soc/mediatek/mtk-mmsys.h
>> index d2b02bb43768..b85f66db33e1 100644
>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>> @@ -9,6 +9,13 @@
>>   enum mtk_ddp_comp_id;
>>   struct device;
>> +enum mtk_dpi_out_format_con {
>> +    MTK_DPI_RGB888_SDR_CON,
>> +    MTK_DPI_RGB888_DDR_CON,
>> +    MTK_DPI_RGB565_SDR_CON,
>> +    MTK_DPI_RGB565_DDR_CON
>> +};
>> +
>>   enum mtk_ddp_comp_id {
>>       DDP_COMPONENT_AAL0,
>>       DDP_COMPONENT_AAL1,

