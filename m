Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C7FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x19UJHgjPg1vEn3I77WJvz3u/9s5b1I3mV+7Vr6AYRs=; b=DhXpY/GyuMKBVk2/IBboAOOJdm
	DwQ0yyVIVS94Yf/HAIfjuhoGfEidOL06RDkoMnd0ALfn8TIDQRnKauWx+MrVdDGSIvCZvneaGeKNP
	ClKIowZDEKFEJElOfdwMoRYqAXmNIhdBhTqaQUrcB5Lqh0CBIIPGxkGliQrq9ZR32DehdqjNIK9pD
	Q4gdzQJ7Ar5H7Ebd9Cw907WgRzNvd/3viGVEToVHS/sCIkSICdZrgc2B9ueEfNXov9281kOpKguB3
	4zRWTdnz3yjOeeNk8L2Cpy+//aalYMlQapZ5ZOiNfj/WCKptFCAIAsg3yezpzgW8yqCSGRyZ0gKKi
	/tvptCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j3f-002Ouq-1j; Fri, 08 Jul 2022 08:09:51 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j2j-002OKo-Ed; Fri, 08 Jul 2022 08:08:55 +0000
Received: by mail-io1-xd35.google.com with SMTP id 190so2950772iou.6;
        Fri, 08 Jul 2022 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x19UJHgjPg1vEn3I77WJvz3u/9s5b1I3mV+7Vr6AYRs=;
        b=p/jzrIBVCE2L4aAKNVKDJM1P2kkf3ator6FleDhAOT5oC2wkfI7BmMLkCvKRQn1Zgg
         IgjbC3cNV5fofpi/RUucJXfsW/7LrZ6YWTzbayjSZ3S43NZ74mqUxcsiTxlJJl4UYKYU
         AvhahGc8ElzOyZKm9n+Y5bArRtZ6Aqa20GcInmsqkb0Oe1Ea2b1UurI9ZmpvvY5l6vdm
         B83oVRQD8ipAyFs0mC9Wz+JbuGqzR89t65MEk/zb6VsoqmsqeR35Z17gf7aK3iwt01sq
         tWhhe5+JJM6FSriE9Y5xKdfKzBujN1ZLUv5LZgAVcACMI2vu6+oV/M3218o5WW8zkmKo
         Nofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x19UJHgjPg1vEn3I77WJvz3u/9s5b1I3mV+7Vr6AYRs=;
        b=ZqYafdyys8xUu2l1hl4MqdPFO+8Mqfb/pKA8GXziEOSI4N2gqW5QdrImNfsnSEJFoy
         RF6TupQK/72+7eAB/HGgT8Hb/w9TfI3FFglaljCGtEXrdmp5KY8yyqVIKuenktDVnCkO
         m2EiKnDeu7KA8QFcq6kOhcGSdfE+Ne3JapadYbJdaTBVKzvb7WRPFwzXWXhthwo+fhnk
         MhSDRxJUGkvZBuL2lMn/VxXNkjHKNo+LG7sVe46MQRLI9KhGklGxrdhRv0RY+vTUzq4+
         rzlZbVir60b4oLrRQDQEVTJqTv8p68PLhMD8OXFikJFrCzYFJYsUDbaFLNffMRXpX5Nl
         LWNg==
X-Gm-Message-State: AJIora++km2iuXmS6KTo1a8UWC3/R6gcQ2MWa9HI/CY0vXgVGQ6wBx4v
	NYApSLEUwvwTF+RqZeIFMj8=
X-Google-Smtp-Source: AGRyM1vbWDtr7QrSSlCBjpesSmtTsxWNtNYZogM0xwXarCLfVwdswt0oZzNRXkkcFkXi3jf0j+/itQ==
X-Received: by 2002:a05:6638:3043:b0:314:7ce2:4a6e with SMTP id u3-20020a056638304300b003147ce24a6emr1384191jak.258.1657267726084;
        Fri, 08 Jul 2022 01:08:46 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s10-20020a5ec64a000000b0067520155dedsm16960578ioo.15.2022.07.08.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:08:45 -0700 (PDT)
Message-ID: <81af48c4-757c-384d-9a96-9cf16acb317c@gmail.com>
Date: Fri, 8 Jul 2022 10:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND v4 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8188
Content-Language: en-US
To: kewei.xu@mediatek.com, wsa@the-dreams.de
Cc: robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
 david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
 <20220708034758.22747-2-kewei.xu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708034758.22747-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_010853_555534_6CB4E0AC 
X-CRM114-Status: GOOD (  17.49  )
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



On 08/07/2022 05:47, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
> The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 

Having a look at mt8192_compat there seem to be more changes. I suppose you 
wanted to say, that in the register mapping the only difference is the 
OFFSET_SLAVE_ADDR address, that changes.

Regards,
Matthias

> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
> v4: no changes
> V3: no changes
> V2: added mt_i2c_regs_v3[] to replace slave_addr_version.
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 43 +++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..70aff42adf5d 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
>   	[OFFSET_DCM_EN] = 0xf88,
>   };
>   
> +static const u16 mt_i2c_regs_v3[] = {
> +	[OFFSET_DATA_PORT] = 0x0,
> +	[OFFSET_SLAVE_ADDR] = 0x94,
> +	[OFFSET_INTR_MASK] = 0x8,
> +	[OFFSET_INTR_STAT] = 0xc,
> +	[OFFSET_CONTROL] = 0x10,
> +	[OFFSET_TRANSFER_LEN] = 0x14,
> +	[OFFSET_TRANSAC_LEN] = 0x18,
> +	[OFFSET_DELAY_LEN] = 0x1c,
> +	[OFFSET_TIMING] = 0x20,
> +	[OFFSET_START] = 0x24,
> +	[OFFSET_EXT_CONF] = 0x28,
> +	[OFFSET_LTIMING] = 0x2c,
> +	[OFFSET_HS] = 0x30,
> +	[OFFSET_IO_CONFIG] = 0x34,
> +	[OFFSET_FIFO_ADDR_CLR] = 0x38,
> +	[OFFSET_SDA_TIMING] = 0x3c,
> +	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
> +	[OFFSET_CLOCK_DIV] = 0x48,
> +	[OFFSET_SOFTRESET] = 0x50,
> +	[OFFSET_MULTI_DMA] = 0x8c,
> +	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
> +	[OFFSET_DEBUGSTAT] = 0xe4,
> +	[OFFSET_DEBUGCTRL] = 0xe8,
> +	[OFFSET_FIFO_STAT] = 0xf4,
> +	[OFFSET_FIFO_THRESH] = 0xf8,
> +	[OFFSET_DCM_EN] = 0xf88,
> +};
> +
>   struct mtk_i2c_compatible {
>   	const struct i2c_adapter_quirks *quirks;
>   	const u16 *regs;
> @@ -442,6 +471,19 @@ static const struct mtk_i2c_compatible mt8186_compat = {
>   	.max_dma_support = 36,
>   };
>   
> +static const struct mtk_i2c_compatible mt8188_compat = {
> +	.regs = mt_i2c_regs_v3,
> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 0,
> +	.ltiming_adjust = 1,
> +	.apdma_sync = 1,
> +	.max_dma_support = 36,
> +};
> +
>   static const struct mtk_i2c_compatible mt8192_compat = {
>   	.quirks = &mt8183_i2c_quirks,
>   	.regs = mt_i2c_regs_v2,
> @@ -465,6 +507,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
>   	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
>   	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
>   	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
> +	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
>   	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
>   	{}
>   };

