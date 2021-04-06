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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF53C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:43:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B116613C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B116613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVur8u8v4m7XLgHV7+4Q+t4SVywFJXvnBhrzllMFSjI=; b=dTkmGhvaH1MrVVDpWHgjImzwG
	RrCQaC4nJOatZG8H4egxtgcuzj5GC9YMzAHn1PmoT/Ralo2gvmsQlit25Tf9d4O7Tli/ero2JPSE3
	UXKtcCad06QGG8LFwNnUaICrgN3otW+Bn3PSAn7VJ+KLebgJlAD2x1GCa7WqCmWqGCJDgx5BZI5ZD
	ANudIXzc5XZSm6ua51A9tJd9IA3uUNC0Gkf6DoyZWunHjDpw5XJbySiJD4HSu1Xmg6J/AP8sA7Jo9
	PcAjD2VxZA1l1zAduwmpsMAR0vTNCeBiVv8UELxIMETS/SHXFNb9g+bhUSI4Rad15fMELUClGBCIW
	4SlZhIpvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTlzW-002lEo-Bj; Tue, 06 Apr 2021 13:43:38 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTlzN-002lBg-F9; Tue, 06 Apr 2021 13:43:31 +0000
Received: by mail-pg1-x52a.google.com with SMTP id y32so7200158pga.11;
 Tue, 06 Apr 2021 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSs0GImijstRdBi/hnd8BpYG0s2XqMpukkAAlW6Mojo=;
 b=opLce27cL+3ZlmbaKha0CMsQyLnq5SwVfZwLI7r7Mi8H0hvPw8fUyx+eCwBVIBuhdR
 nFTnEcxKkIXEiwTCr/1/H3p9juxLV7FZKjlA4EzKa8l4c6mSeUoH/2xky4vO9+4oeolP
 8s+I8xFM5+joUQqZLBO6Hvb4MRwcFaOxYSrWrLQ56lMDET7muIu02FrqZ0mwzuKzmdEA
 at41fKHrLEHDlJrdveavN8LMfzUD4C3kfTKKcSBCbtixhf5LI/XcvGKPN4BzdB6JiHit
 aKmj/m7VzAN2ijPHlM0rRjF2k6s6Lutc8lhV46zlTxaNuQq/5BnhMnQKzTuMZJ4PGT5W
 9dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSs0GImijstRdBi/hnd8BpYG0s2XqMpukkAAlW6Mojo=;
 b=CuWme34oBm3P8sTleUKXvTPj87SOx4y+0OM+c7+5hYDNjTlFsYQs8SPeTJKVCh+b/Y
 K2HXpFDo0t4YD8njGCMXAjboBD/boryeEG8z0Fv5Iep2EpVkUhItPNrCppKqEB9zxTmI
 26uAADdg+19uXsHQbZ7+SjTP+1mP25Bigctb2nAOeNX0rZSGqYCjUBrfV7Ab6QrPvc5R
 J2JhnZwGnIqdPd8wN3Zdx7IypS2zjw5CAN/9J5YflOwPJry7czjm4uGEXb/etfPnWcaI
 PI19Ngs1twqoWmFhxfhQkBmsPfC91egvpAjzXdM8HRf7cO/qS78JRHvvtTQfftV1Glzn
 LRBw==
X-Gm-Message-State: AOAM532WD6dNTlRqE7mdaRlJea9YN0TnCB4cheBlLp0Jt6q2KXmRlNcZ
 ohgwC6YtBiTN+36S1Lst4sEap2bLMjkMRw==
X-Google-Smtp-Source: ABdhPJw4eZiisfrOoYDIWxTG5w9zSLLx4Ne+quT5NeHqLNvnTTR79P3ttNpkO/OU0fJ026VzH/i6WA==
X-Received: by 2002:a63:4d0:: with SMTP id 199mr27823666pge.304.1617716606266; 
 Tue, 06 Apr 2021 06:43:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id g15sm2294162pjd.2.2021.04.06.06.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:43:25 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] soc: mediatek: devapc: rename variable for new IC
 support
To: Nina Wu <nina-cm.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-4-git-send-email-nina-cm.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a76686d1-3544-fcb9-4c3e-1498ec29ff47@gmail.com>
Date: Tue, 6 Apr 2021 15:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617259087-5502-4-git-send-email-nina-cm.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_144329_639232_36DAAD53 
X-CRM114-Status: GOOD (  24.90  )
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

Regarding the commit subject:
"soc: mediatek: devapc: rename variable for new IC support"
maybe something like:
"soc: mediatek: devapc: rename register variable infra_base"

Other then that looks good to me.

On 01/04/2021 08:38, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> For new ICs, there are multiple devapc HWs for different subsys.
> For example, there is devapc respectively for infra, peri, peri2, etc.
> So we rename the variable 'infra_base' to 'base' for code readability.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-devapc.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index 68c3e35..bcf6e3c 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -45,7 +45,7 @@ struct mtk_devapc_data {
>  
>  struct mtk_devapc_context {
>  	struct device *dev;
> -	void __iomem *infra_base;
> +	void __iomem *base;
>  	u32 vio_idx_num;
>  	struct clk *infra_clk;
>  	const struct mtk_devapc_data *data;
> @@ -56,7 +56,7 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
>  	void __iomem *reg;
>  	int i;
>  
> -	reg = ctx->infra_base + ctx->data->vio_sta_offset;
> +	reg = ctx->base + ctx->data->vio_sta_offset;
>  
>  	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
>  		writel(GENMASK(31, 0), reg + 4 * i);
> @@ -71,7 +71,7 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
>  	u32 val;
>  	int i;
>  
> -	reg = ctx->infra_base + ctx->data->vio_mask_offset;
> +	reg = ctx->base + ctx->data->vio_mask_offset;
>  
>  	if (mask)
>  		val = GENMASK(31, 0);
> @@ -113,11 +113,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
>  	int ret;
>  	u32 val;
>  
> -	pd_vio_shift_sta_reg = ctx->infra_base +
> +	pd_vio_shift_sta_reg = ctx->base +
>  			       ctx->data->vio_shift_sta_offset;
> -	pd_vio_shift_sel_reg = ctx->infra_base +
> +	pd_vio_shift_sel_reg = ctx->base +
>  			       ctx->data->vio_shift_sel_offset;
> -	pd_vio_shift_con_reg = ctx->infra_base +
> +	pd_vio_shift_con_reg = ctx->base +
>  			       ctx->data->vio_shift_con_offset;
>  
>  	/* Find the minimum shift group which has violation */
> @@ -159,8 +159,8 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
>  	void __iomem *vio_dbg0_reg;
>  	void __iomem *vio_dbg1_reg;
>  
> -	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
> -	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
> +	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
> +	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
>  
>  	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
>  	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
> @@ -198,7 +198,7 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
>   */
>  static void start_devapc(struct mtk_devapc_context *ctx)
>  {
> -	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
> +	writel(BIT(31), ctx->base + ctx->data->apc_con_offset);
>  
>  	mask_module_irq(ctx, false);
>  }
> @@ -210,7 +210,7 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
>  {
>  	mask_module_irq(ctx, true);
>  
> -	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
> +	writel(BIT(2), ctx->base + ctx->data->apc_con_offset);
>  }
>  
>  static const struct mtk_devapc_data devapc_mt6779 = {
> @@ -249,8 +249,8 @@ static int mtk_devapc_probe(struct platform_device *pdev)
>  	ctx->data = of_device_get_match_data(&pdev->dev);
>  	ctx->dev = &pdev->dev;
>  
> -	ctx->infra_base = of_iomap(node, 0);
> -	if (!ctx->infra_base)
> +	ctx->base = of_iomap(node, 0);
> +	if (!ctx->base)
>  		return -EINVAL;
>  
>  	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
