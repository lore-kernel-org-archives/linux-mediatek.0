Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6DAC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:19:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 748E86024A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 748E86024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m73dFt1FNIZyPo406MUiJfp2aYlNgwqcO86LxkTvXFA=; b=NItYld43tKC+CsrL3j5A+x78b
	qZoBL3aeuCEQ7XrcOl7rn2FY0pcEMhWL6iQ7uqONXGZuVksQ2rISLjJ6j52bBaeZwHnt+5gPWyKdD
	DE7DbNeWwgPipCrpW1hks5cF1eYkb3n51B+Sr4QLZ+XBBO8u64pHlesU0RYc9/khO7W7D+e8dslef
	sOZlttOFAMXdK6erKkDw3k5qfYw0YuQTLD0SYT8phSynbcEygSFe4Bx7hXJNe50wJVnKWrWf7Gyqi
	leaGmHwa9LrIDZXTc0OVCTDygPJFJU3C/Ldn1KwnNTSi00CP+q7nBOPL67fkwzeea3YIZuCVkaPzn
	cWP/KGP/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAX6-003BR0-UW; Tue, 30 Mar 2021 09:19:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAX2-003BPj-TW; Tue, 30 Mar 2021 09:19:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id b9so15473458wrt.8;
 Tue, 30 Mar 2021 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QvSPBsb1lX0xL/5H9a1UCrWMqQfmW3P/W0ClVOEXkcY=;
 b=FLYPoItdLnPVnobh+XNzuyR4z9WMc8WPFKBfEMEPW6x1zFwBTOD3iC/9NMNBpJ8vIm
 kKk7ol4ou1Q3qooRlctN9Lv0u5Bwb24w5OcAdWuFFB/Q2pwO0jFANizAyuP5S0fonAG0
 QSoMdSaqnvf5FZ9ezoDj+cSGcAVhVHbG5A2MI/pBfsoWYqz/uBso5uAZtGHHB+1Z06EZ
 SoGpZRgEJXBZGX3nrCm4dr2o0BLWG8xngQltHLTR1q6Foxb1Ln/wwLBIyIWY745qjXf2
 TuKtZ2TQ5rAko21AayJ24x5cZ5h4YS/9nZeab10y7F9sLlmSRC5NJxOkSmkxbnFYMzUh
 IXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QvSPBsb1lX0xL/5H9a1UCrWMqQfmW3P/W0ClVOEXkcY=;
 b=TcMv2ifz4nZCpdvPZpLcrFEbcmSmvy19yQoU8htsYe5okTOHUoREvgRbJrrM4JuiEo
 IVbwxfOk2ypSORxeQJE+pdXCzOHMLATSlPGUFm8Rg19DCuJoD0q3bHEuaXfFOPGAApxR
 jd5TvY0flOTom9iM3NNr6LwX8xXD/MKIbh2L8IW32MpRx0ms6YNjbE3PwWzr/B5htBKV
 RwTx6Mb+ecSMEGWnfob9YCxELWtVUsSYVfQkvNPjYCPD+QlkUhMBLRH/7/DdgAOjh9Ss
 +z/WavpmVmxTc3lrw1FRnVF/HSGzUg0X3c+glkxJ5EKiaL9unwxmBUm3RDi5m54XBjv8
 15Gw==
X-Gm-Message-State: AOAM531DXwPIFCJPp+4K1WKCtUZNNRgnqh14EpT3cJyhZvogVoqiXB31
 2oE/LWYkgP2iTQ+OIQEA4+M=
X-Google-Smtp-Source: ABdhPJxeyzFtZrKGc2ZRNCcxz2PDVWkgayeNybrCwmfKzdHqD0LTm2JSuBNUIXsehLethKQ1oW/cqQ==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr33573108wrw.334.1617095968330; 
 Tue, 30 Mar 2021 02:19:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id a6sm3600749wmm.0.2021.03.30.02.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:19:27 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: mmsys: Add mt8183 mmsys routing table
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 enric.balletbo@collabora.com
References: <20210323055143.607529-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d816e7c7-5bf8-4b4c-f807-1337db4a4241@gmail.com>
Date: Tue, 30 Mar 2021 11:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323055143.607529-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_101929_049574_D40A453B 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Patch looks good but please use the new, just merged format, see [1]
Please put the defines and the routing table in a new header file mt8183-mmsys.h

Thanks
Matthias

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/soc

On 23/03/2021 06:51, Hsin-Yi Wang wrote:
> mt8183 has different routing registers than mt8173.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is based on series ("soc: mediatek: Prepare MMSYS for DDP routing using tables")[1]
> and tested with mt8183 krand and mt8183 juniper device.
> The register value is referenced from [2].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20210317181711.795245-1-enric.balletbo@collabora.com/
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-6-git-send-email-yongqiang.niu@mediatek.com/
> ---
>  drivers/soc/mediatek/mtk-mmsys.c |  2 ++
>  drivers/soc/mediatek/mtk-mmsys.h | 47 ++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index c46d8ab8b0c2..16bb55b0463a 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -40,6 +40,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.clk_driver = "clk-mt8183-mm",
> +	.routes = mmsys_mt8183_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>  
>  struct mtk_mmsys {
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index a760a34e6eca..c55baf5932b8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -66,6 +66,28 @@
>  #define DPI_SEL_IN_BLS				0x0
>  #define DSI_SEL_IN_RDMA				0x1
>  
> +#define MT8183_DISP_OVL0_MOUT_EN		0xf00
> +#define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
> +#define MT8183_DISP_OVL1_2L_MOUT_EN		0xf08
> +#define MT8183_DISP_DITHER0_MOUT_EN		0xf0c
> +#define MT8183_DISP_PATH0_SEL_IN		0xf24
> +#define MT8183_DISP_DSI0_SEL_IN			0xf2c
> +#define MT8183_DISP_DPI0_SEL_IN			0xf30
> +#define MT8183_DISP_RDMA0_SOUT_SEL_IN		0xf50
> +#define MT8183_DISP_RDMA1_SOUT_SEL_IN		0xf54
> +
> +#define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
> +#define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
> +#define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
> +#define MT8183_DITHER0_MOUT_IN_DSI0		BIT(0)
> +#define MT8183_DISP_PATH0_SEL_IN_OVL0_2L	0x1
> +#define MT8183_DSI0_SEL_IN_RDMA0		0x1
> +#define MT8183_DSI0_SEL_IN_RDMA1		0x3
> +#define MT8183_DPI0_SEL_IN_RDMA0		0x1
> +#define MT8183_DPI0_SEL_IN_RDMA1		0x2
> +#define MT8183_RDMA0_SOUT_COLOR0		0x1
> +#define MT8183_RDMA1_SOUT_DSI0			0x1
> +
>  struct mtk_mmsys_routes {
>  	u32 from_comp;
>  	u32 to_comp;
> @@ -212,4 +234,29 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
>  	}
>  };
>  
> +static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
> +	}, {
> +		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
> +		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0
> +	}
> +};
> +
>  #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
