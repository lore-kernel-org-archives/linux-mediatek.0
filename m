Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3A8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:15:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0E523332
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0E523332
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NjDiLRArMnO5pVEWcKEfDvVcAjKvUDAgHeWQOOFMn1U=; b=Em9g/6k3paVC654yaD/Ly669s
	kKsmX9Lo3TCf883cbAKjDYZ9pFwW/T8JcQxqhdxZvo2YbOv6vYfvuGBEJKAEhSrwFN4XjauwYvYYK
	Tld1XIyyRPgRuq7mXPaxMevyhy22y1VT0sXwvmBsHfj84sRNz7mzyaIgK7z+Id3QCHs1BJIhjXQav
	Q8ZqLua3G53QLs4BObWZL1NhPlofOs3GlTo/2iikIc0vh46vEaw61ZHHZk6aCjeTPWeVIUjz5XuJv
	/2BALkzZohfO2A2y07NIDI520Y7CfDHBKnDt5e5eKTQAw9eHWFDOmSVhq2ywqEBKHf43vwTdgaxH1
	RxLLJNnVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI1T-0003T7-FP; Wed, 06 Jan 2021 23:15:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI1Q-0003Sa-G0
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 23:15:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id be12so2331505plb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 15:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z2HbF3Kd7nM9wygPmlCYxiwG6y4AFwQv3HT8OOOSHMQ=;
 b=iFlaLI79wgjwFEvTJdIveBCsHg6CY7wDDEiAYPhU0r5X/ym0GPr4SALgpYfzEz4vYL
 OwO2AYrEUoBy1Y13AUf2PvP2uAp+n6v5cFl0qmy4xvDO/pqFh+c3Af9B2E5kDmbd6wKc
 NL8tfziIr6ZO36TTY1yGGZEfYLJrA6nhKkDqwfLCwkGfHfMZpbOPjkDPuL+4HP7YWDeI
 P8agkefOdvsPn0aSWWm+XIdfqnLf17Smp+nQIy/RFf1CLLIE354cOWD6wRKabC+/JTxL
 aBNv9tMsOUGm1dV2cY41IqvmGAuxrq5mNtSkn7hNvkFGFgzSvwtL21j2O0sFVxNMZ9ud
 DONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z2HbF3Kd7nM9wygPmlCYxiwG6y4AFwQv3HT8OOOSHMQ=;
 b=FEIvbJk388z3UK9M8l1xaqyU+lEeQB92qoCo+LnJjrtMqwBJQG8s4Qz+6Wk8uvRM0f
 sYDK0yzrEAQFHK9YjsP8vhyA4VVkxz9Xna9bbDJ+QICi18hUzRPWHSykBjYPKlA/TuRH
 N/Nay3YTgJDUt8pATCR5FIHx/YQzbaNQ4s+6PV56Iol1E24yId09u745XnFF7UXBZNIh
 qYDckiTCuJWAqMntiAd4dC89csj1W6izhR45iK3z9OYWk7Erth2hJynmOkHLwYCeuuMH
 jhIvqPPyvCZo/LVx0aTktSDD4gLnhapoPhSKhKqF0lD7GtXCNkOaz+UgW657HBK2HNKa
 voPw==
X-Gm-Message-State: AOAM5319ihVgry1ARYusO9UGhJyQ9u1d3JMomfbeqeiKS/FDKFPaww2Y
 gofG80M1pCJ7L8HqD4KYLKleFQ==
X-Google-Smtp-Source: ABdhPJzDxsj3pgOjDMYZyKv0dxP6QZv8d4cxpZXurn6hvDguDKOMjJBOlkEXcFGD86UpPAfzYJquOw==
X-Received: by 2002:a17:90a:ae02:: with SMTP id
 t2mr6329731pjq.169.1609974916458; 
 Wed, 06 Jan 2021 15:15:16 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id t15sm3615365pfc.12.2021.01.06.15.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 15:15:15 -0800 (PST)
Date: Wed, 6 Jan 2021 16:15:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <20210106231513.GC9149@xps15>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214050521.845396-3-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181520_874512_C8946691 
X-CRM114-Status: GOOD (  25.24  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Shih,

On Mon, Dec 14, 2020 at 01:05:21PM +0800, Tzung-Bi Shih wrote:
> L1TCM is a high performance memory region in MT8192 SCP.
> 
> Reads L1TCM memory region from DTS to determine if the machine supports.
> Loads L1TCM memory region to SCP sys if the firmware provides.
> 
> Starts from MT8192 SCP, the firmware contains physical addresses for
> each memory region, for instance:
> 
> Program Headers:
>   Type   Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x10500000 0xXXXXX 0xXXXXX XXX 0xXXXX
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x10700000 0xXXXXX 0xXXXXX XXX 0xXXXX
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x50000000 0xXXXXX 0xXXXXX XXX 0xXXXX
> 
> Kernel driver can use the "PhysAddr" (i.e. da in the da_to_va callbacks)
> to know the ELF segment belongs to which region.
> 
> To backward compatible to MT8183 SCP, separates the da_to_va callbacks
> for new and legacy version.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h |  5 +++
>  drivers/remoteproc/mtk_scp.c    | 54 +++++++++++++++++++++++++++++++--
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 988edb4977c3..94bc54b224ee 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -75,6 +75,7 @@ struct mtk_scp_of_data {
>  	void (*scp_reset_assert)(struct mtk_scp *scp);
>  	void (*scp_reset_deassert)(struct mtk_scp *scp);
>  	void (*scp_stop)(struct mtk_scp *scp);
> +	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> @@ -89,6 +90,10 @@ struct mtk_scp {
>  	void __iomem *reg_base;
>  	void __iomem *sram_base;
>  	size_t sram_size;
> +	phys_addr_t sram_phys;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
>  
>  	const struct mtk_scp_of_data *data;
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e0c235690361..f025aba67abc 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -458,9 +458,8 @@ static int scp_start(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
>  {
> -	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
>  	int offset;
>  
>  	if (da < scp->sram_size) {
> @@ -476,6 +475,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	return NULL;
>  }
>  
> +static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
> +{
> +	int offset;
> +
> +	if (da >= scp->sram_phys &&
> +	    (da + len) <= scp->sram_phys + scp->sram_size) {
> +		offset = da - scp->sram_phys;
> +		return (void __force *)scp->sram_base + offset;
> +	}
> +
> +	/* optional memory region */
> +	if (scp->l1tcm_size &&
> +	    da >= scp->l1tcm_phys &&
> +	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
> +		offset = da - scp->l1tcm_phys;
> +		return (void __force *)scp->l1tcm_base + offset;
> +	}
> +
> +	/* optional memory region */
> +	if (scp->dram_size &&
> +	    da >= scp->dma_addr &&
> +	    (da + len) <= scp->dma_addr + scp->dram_size) {
> +		offset = da - scp->dma_addr;
> +		return scp->cpu_addr + offset;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +{
> +	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
> +
> +	return scp->data->scp_da_to_va(scp, da, len);
> +}
> +
>  static void mt8183_scp_stop(struct mtk_scp *scp)
>  {
>  	/* Disable SCP watchdog */
> @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  	}
>  	scp->sram_size = resource_size(res);
> +	scp->sram_phys = res->start;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	if (res) {

As far as I can tell the if() condition isn't needed since
platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
is capable of handling that condition.  As such the code to parse "l1tcm" can be
the same as what is done for "sram".

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +		scp->l1tcm_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR((__force void *)scp->l1tcm_base)) {
> +			dev_err(dev, "Failed to parse and map l1tcm memory\n");
> +			ret = PTR_ERR((__force void *)scp->l1tcm_base);
> +			goto free_rproc;
> +		}
> +		scp->l1tcm_size = resource_size(res);
> +		scp->l1tcm_phys = res->start;
> +	}
>  
>  	mutex_init(&scp->send_lock);
>  	for (i = 0; i < SCP_IPI_MAX; i++)
> @@ -803,6 +851,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  	.scp_reset_assert = mt8183_scp_reset_assert,
>  	.scp_reset_deassert = mt8183_scp_reset_deassert,
>  	.scp_stop = mt8183_scp_stop,
> +	.scp_da_to_va = mt8183_scp_da_to_va,
>  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
>  	.ipi_buf_offset = 0x7bdb0,
> @@ -814,6 +863,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_reset_assert = mt8192_scp_reset_assert,
>  	.scp_reset_deassert = mt8192_scp_reset_deassert,
>  	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  };
> -- 
> 2.29.2.684.gfbc64c5ab5-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
