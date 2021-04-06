Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4B1C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:53:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7BB61260
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7BB61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDLhFPQ8MpXIzXlwGJkFGcWNtvR/VypDdlY43ytAugs=; b=dxDXLa8buRQRJsP1khUjmyBXs
	/H2WPVmkpLWqOpBcqCmmhix1hC/8qrwccPifv1Ckrt1DRfiSUlQcRSfTWI50kv4PJVeEB3lA0CwwC
	6C+KNlZNjyyn9BkDIIrjgwlw6p26ZlmRIMoXXME9twB29Jv5k28pSJBhR5BxnCObAA+kbBtAWc0ph
	HKbnaCU22nJxGHCGnUxraM6WVjpa+HKvHYcAfK3a/FO2xSgyiyFbIlkh8AFCBGT+VfUGxDpIwOjPi
	QiLhMeZItgP/dcZddkPC1WXCaTfva+IyuMhCn8wyLF96feOG4JPu/AvTWvP5oTwgb02ti6NxcugZZ
	2siSJHM+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTm94-002mWC-T4; Tue, 06 Apr 2021 13:53:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTm91-002mVj-C1; Tue, 06 Apr 2021 13:53:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d124so1643817pfa.13;
 Tue, 06 Apr 2021 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OJw/MQDTwsE99RcSWN1zpL6Wxd6tbDfIwDMtU0pQS3c=;
 b=ry8ThBgJVfOJerbxjm02BnqFHaArr88tQqG8iKHZOPrTxvHkXHormbablrQThndRvD
 ZEmdIJV4Y+f5+hfInM7TTrZakUQiU+exxc+a48IGU91X3iUoaMl4m41XhALr5DTXaVHx
 SWvRq4ALJGqr0zGiR9/ATbrOXgKDAI4JzzKhOVGUCxTdx+OltYSSVu3/y6TNX0b5X39W
 wIfYYdXFd+jjyh5UNg7r9GabdX8lKOicCrV0HborB+pKktvw4tTvzCeXkZI9oZ3ViqH0
 cE1wK2X+H9At+OfBHIVycmGdGeZlq/1LVraNE+3qXsnBEQaldxVMSaVoDygf41exsbZS
 iEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJw/MQDTwsE99RcSWN1zpL6Wxd6tbDfIwDMtU0pQS3c=;
 b=NGrw0sYL1nW5AkeM+U9jEZjodXigb17Uo1u7nfW+ihtSgVSmRYLlOGWjUO/1BglZAo
 Xw2HN44sGECMsemDAjWBpZj810r292uydj5pVvJv+VPEd7OoxxqxMLila23Mkp/0FaoX
 Wph8arWGqyK2+XJxzRfJ7Is1X5rGiC4zf+UjRhRt0qyH3qtBwP+qWN68MBAkaBZY1rkQ
 gBqGJVMHlOYkQy69MxkQASyH2J9+/hVl8nf7LGLvBuf9mH+lrDngViqAJ6xGlK5H//OG
 TdAnGF+TEfgVYsjekT3o7XJbAaXnH70MTTtgsk5J1Ym4vCHNpTjQY0Z3OJNuTasMHxsX
 4huw==
X-Gm-Message-State: AOAM531OfgPqFIZOH0xs+Hdw2HSByFu7R8WYTp8N0H4zfVmfPXC/WaKV
 PSgXNeFQdE8WN+WFLBYzKN4=
X-Google-Smtp-Source: ABdhPJzn3noEyLiqvdfFdzNy+7STwb3Skz3mKSaI0+XpYwKhn0vzij9IZJRbD3GXQER0wYY3WVWnew==
X-Received: by 2002:a63:e913:: with SMTP id i19mr17746329pgh.426.1617717205076; 
 Tue, 06 Apr 2021 06:53:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j22sm2593924pjz.3.2021.04.06.06.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:53:24 -0700 (PDT)
To: Nina Wu <nina-cm.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-5-git-send-email-nina-cm.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 5/6] soc: mediatek: devapc: add debug register for new
 IC support
Message-ID: <23c0d15c-6cc2-dc40-e45a-c2fb749cec1f@gmail.com>
Date: Tue, 6 Apr 2021 15:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617259087-5502-5-git-send-email-nina-cm.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_145327_504304_D6A4B103 
X-CRM114-Status: GOOD (  25.14  )
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



On 01/04/2021 08:38, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> There are 3 debug info registers in new ICs while in legacy ones,
> we have only 2. When dumping the debug info, we need to check first
> if the 3rd debug register exists and then we can konw how to decipher
> the debug info.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-devapc.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index bcf6e3c..af55c01 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -26,9 +26,19 @@ struct mtk_devapc_vio_dbgs {
>  			u32 addr_h:4;
>  			u32 resv:4;
>  		} dbg0_bits;
> +
> +		/* Not used, reference only */
> +		struct {
> +			u32 dmnid:6;
> +			u32 vio_w:1;
> +			u32 vio_r:1;
> +			u32 addr_h:4;
> +			u32 resv:20;
> +		} dbg0_bits_ver2;
>  	};
>  
>  	u32 vio_dbg1;
> +	u32 vio_dbg2;
>  };
>  
>  struct mtk_devapc_data {
> @@ -37,6 +47,7 @@ struct mtk_devapc_data {
>  	u32 vio_sta_offset;
>  	u32 vio_dbg0_offset;
>  	u32 vio_dbg1_offset;
> +	u32 vio_dbg2_offset;
>  	u32 apc_con_offset;
>  	u32 vio_shift_sta_offset;
>  	u32 vio_shift_sel_offset;
> @@ -158,12 +169,29 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
>  	struct mtk_devapc_vio_dbgs vio_dbgs;
>  	void __iomem *vio_dbg0_reg;
>  	void __iomem *vio_dbg1_reg;
> +	void __iomem *vio_dbg2_reg;
> +	u32 vio_addr, bus_id;
>  
>  	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
>  	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
> +	vio_dbg2_reg = ctx->base + ctx->data->vio_dbg2_offset;

We should read this only if we have version2 of the devapc.

>  
>  	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
>  	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> +	vio_dbgs.vio_dbg2 = readl(vio_dbg2_reg);
> +
> +	if (!ctx->data->vio_dbg2_offset) {

I think we should add a version field to mtk_devapc_data to distinguish the two
of them.

> +		/* arch version 1 */
> +		bus_id = vio_dbgs.dbg0_bits.mstid;
> +		vio_addr = vio_dbgs.vio_dbg1;
> +	} else {
> +		/* arch version 2 */
> +		bus_id = vio_dbgs.vio_dbg1;
> +		vio_addr = vio_dbgs.vio_dbg2;
> +
> +		/* To align with the bit definition of arch_ver 1 */
> +		vio_dbgs.vio_dbg0 = (vio_dbgs.vio_dbg0 << 16);

That's magic, better add another variable domain_id and do here:
domain_id = vio_dgbs.dbg0_bits_ver2.dmnid;

> +	}
>  
>  	/* Print violation information */
>  	if (vio_dbgs.dbg0_bits.vio_w)
> @@ -172,8 +200,7 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
>  		dev_info(ctx->dev, "Read Violation\n");
>  
>  	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
> -		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
> -		 vio_dbgs.vio_dbg1);
> +		 bus_id, vio_dbgs.dbg0_bits.dmnid, vio_addr);
>  }
>  
>  /*
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
