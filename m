Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB72C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoPEBTe8GIWOjbjulVhuWkgAmLX2oZ/qEHBUDv8Xq4A=; b=1BDxp94giF2NrtxLmr00lIz9Lh
	Esmpo8j92jKK3tGgPzBKY4bok75SFBknVm/7skredwdqtZVAxzowyu7xbg7HeEi3XRcodDxzcZ3uD
	NQJ8QnSsu0E1dKEezrrhltee3WaNF1WmPlVFNkSMDMnXhGV5+2MeYpJlTof8tdmfIi9w1igg4SQpV
	9tPrjIW8kl7zkvUJjeD+nS2NzthrVxGP+DcX1bayDiacURg0mrHOubvcihr4WcrydPNg+Flcomjdx
	VkU6x2vuhWwPvoy+bZCvF1jDvYSB6jclSZ/f4K4dyhnHCUXwvzg3GOoP4qDvAucp1nq3oN5CS7A2v
	wrc8jVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Ba-006wxN-4N; Fri, 17 Jun 2022 10:26:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29BX-006wvP-RX; Fri, 17 Jun 2022 10:26:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id m24so5161461wrb.10;
        Fri, 17 Jun 2022 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VoPEBTe8GIWOjbjulVhuWkgAmLX2oZ/qEHBUDv8Xq4A=;
        b=T8mspU3pKYdO8CUcvqthLXqrOQjJPUSkkv257NLusbuA8D/FXqWjAsPN4BlAbrUh18
         Iuj7wTUJYyyWy/R59XJTqtBCjIwAh/Zw766eyhjpZE27PfcPNEy9P8SxB+vzhrrvTyfI
         LalDITAZYpx+jrf26Z77xY913zVn716mxfAo9TRTUkwHbsNzzxMd8owSzazAfVmq+gaS
         RioAf09Li9mX5EhwESX9qKJ/anXW3aNmzNHTOaSJ29ICo3kL44+gmjDjYYnqCdizV9OA
         RmPsiJHvBjTysXlujz8NjWwuhk5U6NIfEBK9CBy9+SH/sbgoFVi8h2+igSYptJKqGSwa
         rLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VoPEBTe8GIWOjbjulVhuWkgAmLX2oZ/qEHBUDv8Xq4A=;
        b=H5/qOVZwG1R5ga+GRbeMg6dZ2DBaVwVgUGUN8TRvpPjQACN9e8jIdzQZEiYANowD+Q
         oZzdSHz7p1scOSDpAk+KXI1Enm/u1Fpd0bGm5j4DXLRAQbt1nZ7ShsRmESM4lq/5nQJU
         Chc/KoxOsD1jdsw92DGa54fn2s5LDs7LDQW8P79p/IGIeG7XC5ksEYc5/kncnmpTrgwA
         I18wX9DBIKHZLnhilqde2XVcDGNFRCe3NDpSqgLXbE5603I2E1OGm63nQFfXyR1XkCo/
         fn9C7kVsOVqC+/lCvaj9DWlyeX0a3roUdvEsu8m/+j85GmcvqOTmtTscPmAFT7NcVIZF
         q7RQ==
X-Gm-Message-State: AJIora9DVIXUJD+Mig5Z4If66KNnDJ87MlFA0hOBBvDx61Ta64OO7rVC
	sEVkv+YBgNmm8Tr25Us3np8=
X-Google-Smtp-Source: AGRyM1v/yWcwiAGw1BrqNvRucAgFNGX7IUS4GB4H5cVgcY5uvNLqpVZZyYaS3ErTF+o1i11IIwOO8w==
X-Received: by 2002:a5d:5c04:0:b0:21a:23e0:6ba3 with SMTP id cc4-20020a5d5c04000000b0021a23e06ba3mr8861230wrb.71.1655461596259;
        Fri, 17 Jun 2022 03:26:36 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id z12-20020a05600c220c00b0039c5b4ab1b0sm4774639wml.48.2022.06.17.03.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:26:35 -0700 (PDT)
Message-ID: <9f36c019-dff7-7fa8-b8c8-ed118cef716e@gmail.com>
Date: Fri, 17 Jun 2022 12:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display
 path
Content-Language: en-US
To: CK Hu <ck.hu@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 jitao.shi@mediatek.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-5-fparent@baylibre.com>
 <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_032639_941317_48EC71DB 
X-CRM114-Status: GOOD (  13.67  )
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



On 17/06/2022 07:53, CK Hu wrote:
> Hi, Fabien:
> 
> On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
>> Right now only the DSI path connections are described in the mt8365
>> mmsys driver. The external path will be DPI/HDMI. This commit adds
>> the connections for DPI/HDMI.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 


Applied, thanks!

>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> ---
>>   drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h
>> b/drivers/soc/mediatek/mt8365-mmsys.h
>> index 24129a6c25f8..7abaf048d91e 100644
>> --- a/drivers/soc/mediatek/mt8365-mmsys.h
>> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
>> @@ -10,6 +10,9 @@
>>   #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
>>   #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
>>   #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
>> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
>> +#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
>> +#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
>>   
>>   #define MT8365_RDMA0_SOUT_COLOR0			0x1
>>   #define MT8365_DITHER_MOUT_EN_DSI0			0x1
>> @@ -18,6 +21,10 @@
>>   #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
>>   #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
>>   #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
>> +#define MT8365_RDMA1_SOUT_DPI0				0x1
>> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>> +#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
>> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>>   
>>   static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] =
>> {
>>   	{
>> @@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes
>> mt8365_mmsys_routing_table[] = {
>>   		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
>>   		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0,
>> MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
>>   	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
>> +		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK,
>> MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
>> +	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
>> +		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
>> +	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
>> +		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
>> +	},
>>   };
>>   
>>   #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
> 

