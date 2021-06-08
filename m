Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EA0C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0937160FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0937160FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=up31FnH9VDheM2rdRwf7mLHJXV2CY2bknCe6a5JAVUQ=; b=nVi3hVk2HHn+zcJPdCLn+Ux1cf
	rkE1Rb3SZvNfsclApra3A7KZMopX1s9HLdIjadoHJwVv3kuub/QNSSOuwkpLZ3SRXKoAqN1khz22Y
	w2F3M+46lPIknaPp5vqYc/XWqg77bfX7sTSOT5zS2P3UUxGfdBxJIs0qAnqRfwSa274wiO0hUPIh7
	CjIRVrVQf1je45AgnxpFy2bt0SIVVrt5kWhGvRGQ81+ga7cRktDTMHUeJ3pduBTsWquAQzr9xag/c
	pXvxG2F1Pkm+9JDO0a4QUMPYoa3XKdx/fdIgiE9OZrk+iI82PZ0KfIL/MASakJSgW9V3jfleHqs2R
	Yo1ESVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqcIy-008isH-Iu; Tue, 08 Jun 2021 14:02:08 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqcIu-008iqI-J6; Tue, 08 Jun 2021 14:02:06 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2022588wmh.4; 
 Tue, 08 Jun 2021 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E+9j4IJorqJShjQfs9LsrArykPixg4gTHiIgJ6SNPxU=;
 b=tjSJOuiRQOaK418AxcbqOaKiZnav3BRxujrVXistY+iRayGWPWOKEK7QQKX8t0fZHX
 BZTXjwoim0DyHSN1QAW09f4CuVC5VgId2S+nT+0qI33xK/FfWhS8MmFoq/ajXFDeHPTO
 AFMnsIiYBpY8LBPI/Ex57eWTuhlKRhLWbvZXTgpnDf18qOwZ5dEu6bbteoffkkvpo9dM
 1rYWsCMFfLWp8HpuUB9/Yp2LQjpYhO50KKGNLKIgFOukiLG8JYIKG7OJBuxFlQdCsHrH
 a3GYDuJyFnGM9/tJCaY+xNBFLaTZKS3a0G2ywl9iXqLUPia7MIdIHO/6v0u1TDfrRXUz
 7cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+9j4IJorqJShjQfs9LsrArykPixg4gTHiIgJ6SNPxU=;
 b=B3TpXveUsecf4dZZMGez5PBEDJVFg7FUagUUPeS1GWPF1GpbVUWl59NmCs4A7/jH8+
 EvKSMEjRix4Gd1y6mm5FSzmnhvRvskutFomMmb+yZemcRIVtNp5qIui4TVuwXhti9Fc+
 /nJG/E2pFioPD8th0V1KVLplUCTStpcItvaW1udbZobm8q0C7Ljvl5/G33T4gm+xV5lB
 ubhDfjq5gkerFlTVay232hUveYofcJ1s52Mhut/bqG+oclLV/tr1UZn9Z9Vsfj06Cmq2
 UMAVVrmAjLUyXb6/S62sMbl0g29x+vPDierVGE3IhjfPGijsa2VRDu1ApIM2/EpfIqE1
 ORRg==
X-Gm-Message-State: AOAM530ENb1NvIlQybyi5JgEu67B0s5CS2oKTQQL9BXozAi0af48DykJ
 4fKcZzFQDkOBcX5j2CF/T42XO2SWcnJwKQ==
X-Google-Smtp-Source: ABdhPJw+FtTbLb9zuZT/GZBtbqdUosLyGkCaukigrg4ejpy+HqV456zcPr07NLm5VZNriq1h6GCgOg==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr22061133wml.52.1623160862718; 
 Tue, 08 Jun 2021 07:01:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id g17sm15224005wrp.61.2021.06.08.07.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:01:02 -0700 (PDT)
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 qiangming.xia@mediatek.com
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
Date: Tue, 8 Jun 2021 16:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_070204_704577_824A2B1B 
X-CRM114-Status: GOOD (  21.58  )
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



On 08/06/2021 05:16, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 97 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e..e65a41e 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
>  	OFFSET_HS,
>  	OFFSET_SOFTRESET,
>  	OFFSET_DCM_EN,
> +	OFFSET_MULTI_DMA,
>  	OFFSET_PATH_DIR,
>  	OFFSET_DEBUGSTAT,
>  	OFFSET_DEBUGCTRL,
> @@ -192,8 +193,9 @@ enum I2C_REGS_OFFSET {
>  	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
>  	[OFFSET_CLOCK_DIV] = 0x48,
>  	[OFFSET_SOFTRESET] = 0x50,
> +	[OFFSET_MULTI_DMA] = 0x84,
>  	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
> -	[OFFSET_DEBUGSTAT] = 0xe0,
> +	[OFFSET_DEBUGSTAT] = 0xe4,

Is this offset only for mt8192 or also for mt8183?
In any case that should go in as another patch. Either a fix or a new
mt_i2c_regs_v3[]

Regards,
Matthias

>  	[OFFSET_DEBUGCTRL] = 0xe8,
>  	[OFFSET_FIFO_STAT] = 0xf4,
>  	[OFFSET_FIFO_THRESH] = 0xf8,
> @@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	return 0;
>  }
>  
> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +	dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
> +		OFFSET_SLAVE_ADDR,
> +		(mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),
> +		OFFSET_INTR_MASK,
> +		(mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
> +	dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
> +		OFFSET_INTR_STAT,
> +		(mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
> +		OFFSET_CONTROL,
> +		(mtk_i2c_readw(i2c, OFFSET_CONTROL)));
> +	dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
> +		OFFSET_TRANSFER_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
> +		OFFSET_TRANSAC_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
> +	dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
> +		OFFSET_DELAY_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
> +		OFFSET_TIMING,
> +		(mtk_i2c_readw(i2c, OFFSET_TIMING)));
> +	dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
> +		OFFSET_START,
> +		mtk_i2c_readw(i2c, OFFSET_START));
> +	dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
> +		OFFSET_EXT_CONF,
> +		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
> +	dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
> +		OFFSET_HS,
> +		mtk_i2c_readw(i2c, OFFSET_HS));
> +	dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
> +		OFFSET_IO_CONFIG,
> +		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
> +	dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
> +		OFFSET_FIFO_ADDR_CLR,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
> +	dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
> +		OFFSET_TRANSFER_LEN_AUX,
> +		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
> +	dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
> +		OFFSET_CLOCK_DIV,
> +		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
> +	dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
> +		OFFSET_FIFO_STAT,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
> +		OFFSET_FIFO_THRESH,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
> +	dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
> +		OFFSET_DCM_EN,
> +		mtk_i2c_readw(i2c, OFFSET_DCM_EN));
> +	dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",
> +		OFFSET_DEBUGSTAT,
> +		(mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
> +		OFFSET_DEBUGCTRL,
> +		(mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
> +
> +	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
> +		dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
> +			OFFSET_LTIMING,
> +			mtk_i2c_readw(i2c, OFFSET_LTIMING));
> +		dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
> +			OFFSET_MULTI_DMA,
> +			(mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
> +	}
> +
> +	dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_INT_FLAG));
> +	dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_INT_EN));
> +	dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_EN));
> +	dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RST));
> +	dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_CON));
> +	dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
> +	dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
> +	dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_LEN));
> +	dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_LEN));
> +	dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
> +	dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
> +}
> +
>  static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  			       int num, int left_num)
>  {
> @@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  	}
>  
>  	if (ret == 0) {
> -		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		i2c_dump_register(i2c);
>  		mtk_i2c_init_hw(i2c);
>  		return -ETIMEDOUT;
>  	}
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
