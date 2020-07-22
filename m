Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94736C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:26:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B902071A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYt0brw/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2fwuh96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B902071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZnU48Qn7nSZMxnFG8LO6wQfmUeKwwZ9BQL0OKN4vhM=; b=QYt0brw/ropUeGmcjNrEMF6/1
	qMReiGE70YoCK+J1iXo+pH2wf4+oUO9PQptambegc52eWu9c1whAIrjSujObnZuPxQ9s07HWpS2rC
	nqx7IpLHh5cmA0k0nFQl9Xc64GIw+rTrIowPqfJ0ckN5sNnO5ebDSvAvdT6HDI04pqONWR+4zK3UL
	+iYZF8VY6GV4DNpC3Ju2HHqH+pr94kHsQTdBi7vK/78J+lMUIpPiLfpJzOzGbGFG/P+uxwsxwcqXJ
	g62aqSk7FDVllF0OgZK/uiT5JYZ2iwAvqkY5xx5T2KPuqTk842EckGEt1xH6eVoHWPCgLTD20psIT
	NHggPwC3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGdu-0006ba-Kc; Wed, 22 Jul 2020 15:26:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGdp-0006Zs-IN; Wed, 22 Jul 2020 15:26:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id f7so2331530wrw.1;
 Wed, 22 Jul 2020 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=akcO108wudl5eEgjnEkCunNDPWVs+eb32qFL3qxkaXw=;
 b=F2fwuh965Lrcv6Mm0JcItJPFlBbuhKsYu3vNEmQZNerCWr81bNRRX4fkIVyJXvACp/
 FzkQT599/MCpybVn4aCNU0QzU7QZezbKdNmmG5k3Ql7hCsVAxG4C5dbO9YEGmRttgenP
 liuwWy5QPuG6HDkDs5BqyLFpFZNcWp0hdtxeAyu9ns4TCRrzghh3vhyJE924/t0noFSa
 UQl1YxYVdqdMd6yUm8UHewWEeLnoJyCtbHcvc+cjn2UNXhX1ON4DFLH5UfF02vc8PGvB
 cSRU1ppxJM1pWIgRnSkXtsctrfgA97KJyOEAA4iScx23/65MFX73gSPVqy5te4OQiKAG
 QFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=akcO108wudl5eEgjnEkCunNDPWVs+eb32qFL3qxkaXw=;
 b=K376mm1ih2awKK6M4GkxCOQ3gTeQI1PeMnfbI2IZ4DXE9eXxFzehofxchDvbwu3Iad
 YdfQkfoMheUL2welzPvdE7HBHZWoj5oX1cNZUhLc+G4Q2gOauatzSnKz3byO7gnyCJzJ
 Nr57pSRQ8o2gC0ph/I1K2cgjXl2bHR0rlLvovFNg2ynRis3OJnIRw/sLbRGwSVPbm9Ru
 7QHhMs2lWsjl03oIswQfwOk6HpbKskGoESI09X4tAJtLfleLDZ0MRnRC9CxFXvrV1dh7
 hUw8FdcwW+U1kxSFMPBqlW+xk7QDi5qduXIHJ/6r4SwfrZNrIend1qf4kncg+r6db7cP
 UGtA==
X-Gm-Message-State: AOAM530RkigSxLEdnNSIae9+cCIvjIKlhpeESrAx61eei+iJqzpYNOGQ
 /Cfp1igy7wVc4+Ts0OA2ODyO4M2r
X-Google-Smtp-Source: ABdhPJzNhFaLsOgasoKvuzKRv3v1C9BYgx4EPcERrylzUFA6ZeQ9um13EegybBW95xbv9HkDiglmnw==
X-Received: by 2002:adf:e701:: with SMTP id c1mr112470wrm.350.1595431604326;
 Wed, 22 Jul 2020 08:26:44 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id u2sm54779wml.16.2020.07.22.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:26:43 -0700 (PDT)
Subject: Re: [PATCH 1/4] i2c: mediatek: Add apdma sync in i2c driver
To: Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <58e23057-d84c-7fc2-e912-6569cbbf1b25@gmail.com>
Date: Wed, 22 Jul 2020 17:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112645_619689_E22DC85E 
X-CRM114-Status: GOOD (  19.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 14:31, Qii Wang wrote:
> With the apdma remove hand-shake signal, it need to keep i2c and
> apdma in sync manually.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index deef69e..e6b984a 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -48,6 +48,9 @@
>   
>   #define I2C_DMA_CON_TX			0x0000
>   #define I2C_DMA_CON_RX			0x0001
> +#define I2C_DMA_ASYNC_MODE		0x0004
> +#define I2C_DMA_SKIP_CONFIG		0x0010
> +#define I2C_DMA_DIR_CHANGE		0x0200
>   #define I2C_DMA_START_EN		0x0001
>   #define I2C_DMA_INT_FLAG_NONE		0x0000
>   #define I2C_DMA_CLR_FLAG		0x0000
> @@ -205,6 +208,7 @@ struct mtk_i2c_compatible {
>   	unsigned char timing_adjust: 1;
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
> +	unsigned char apdma_sync: 1;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,6 +315,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 1,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt6577_compat = {
> @@ -324,6 +329,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt6589_compat = {
> @@ -337,6 +343,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt7622_compat = {
> @@ -350,6 +357,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt8173_compat = {
> @@ -362,6 +370,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt8183_compat = {
> @@ -375,6 +384,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 1,
>   	.dma_sync = 1,
>   	.ltiming_adjust = 1,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct of_device_id mtk_i2c_of_match[] = {
> @@ -798,6 +808,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   	u16 start_reg;
>   	u16 control_reg;
>   	u16 restart_flag = 0;
> +	u16 dma_sync = 0;
>   	u32 reg_4g_mode;
>   	u8 *dma_rd_buf = NULL;
>   	u8 *dma_wr_buf = NULL;
> @@ -851,10 +862,16 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
>   	}
>   
> +	if (i2c->dev_comp->apdma_sync) {
> +		dma_sync = I2C_DMA_SKIP_CONFIG | I2C_DMA_ASYNC_MODE;
> +		if (i2c->op == I2C_MASTER_WRRD)
> +			dma_sync |= I2C_DMA_DIR_CHANGE;
> +	}
> +
>   	/* Prepare buffer data to start transfer */
>   	if (i2c->op == I2C_MASTER_RD) {
>   		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CON_RX, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CON_RX | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_rd_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_rd_buf)
> @@ -877,7 +894,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		writel(msgs->len, i2c->pdmabase + OFFSET_RX_LEN);
>   	} else if (i2c->op == I2C_MASTER_WR) {
>   		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CON_TX | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_wr_buf)
> @@ -900,7 +917,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
>   	} else {
>   		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CLR_FLAG | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_wr_buf)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
