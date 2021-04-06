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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF25C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:42:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C42B613C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C42B613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=deR/lQXAryCerCWjVT14x14dG4qoDr8l+xq0LgOettg=; b=e+pov8+efGOoA08IB9z6lzbaI
	Y4b3VDg4GqXcYIHIm5w2EIpK1sW0pUKSXnoFAJpnp0RMBzO7GOWKy6FBZ7UQKhS1E0HqUNF843/ZL
	4cVoAQ5dKrcwe1P0TgFonnw4z2menlWztA1vw7WsaHA+lUdBCyt6iZbwF2V+tR+MgaDCfXFEbAu35
	Hsjz4EgfOaVdWM6r3GEcZ4gp2s83WPRWaImJqAhwdty/sfsYiv9larKQrsLi/o29rvLNBs48IzZKH
	Vc9VDR6wFee6FI7SAk0X86cgaSRCK/fhHKD9cHuXrwSjbMGlRc5aOsmOxffFc4o9kWAkKrPRwud/h
	lGukaNHbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTlxm-002ktD-7n; Tue, 06 Apr 2021 13:41:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTlxe-002ksP-Jc; Tue, 06 Apr 2021 13:41:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u11so1863480wrp.4;
 Tue, 06 Apr 2021 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qklMtpnFh5J5Dsu48LFQMJDK+GDGgx9EDr9EU819CxU=;
 b=JXU5+afhpmqz3s79d6W4embKeBxGq+5VP/jgfpjVz+QNZvQ4/gBxi9nRmOdYwEOSz4
 pymCG55qWmaSYUiAmrHsEmJtdsFzwTn/uviHtZkYFsJaCtQJSmdpNtjb2V/EOntK7EeY
 XGfzyMRY32vXyLyGfLZrgyjWTla2wZoxgQWdIja37Ygr9ik6UdlRLASrXubenE7MSK5X
 RNxwqkZxL7jfDHQ0fmByzK55mgRSo0ZNpAiHThkFh7KGRHYZbYRlQCQDteGP/Zb5xQqs
 JPdGqG3uuopEUEA4NSsd+W0HWwJkPfssshHQec9wHsSJKSQk4iBA9etJKYMi1DmO0pLl
 laUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qklMtpnFh5J5Dsu48LFQMJDK+GDGgx9EDr9EU819CxU=;
 b=JFJEn0++czhGoEgNTAObz+wQboAaHiSLYGp/MLGQy2AH59SmsyBHLU7wk7BWj6/po0
 MYB71QirVUdV88+gVyWV5zy9z+ljXQnRcu4OFd93AZm5fr79sxzw490DB8kXCxR+OlF9
 2dGVtwqFRepr3IX1pkUQuAVm5NN2ueOZ8PyDZLjcbJu85MNT7k5B2tGfcJBi4DCrfdh/
 fbTeTI/D7v7as/CZ2J3PEuu/cgVH4r/2hFFYIW8u1hxbqF352tKE2HkxgOWxs9LmDr9e
 WN6/s6rhEQnSZ95znOUNrC2fOps87K1Bl7FgjPrvMcQrxy6MqUIN/h4qT4vVXe12f3qL
 UUYA==
X-Gm-Message-State: AOAM533qi4HKTpV3lCRoTZ2rtAXeMytb38f4P4LJGOflt4MdWmv15AQR
 5oCZk+r9+KL0Hd3MCDunn5s=
X-Google-Smtp-Source: ABdhPJwyg/Mb/15E0YTxtFvcV888RO6L7pQfcpaGvAIsJ88MyIZjILLZHAsIXVUmaZCyc6MlfIjNdg==
X-Received: by 2002:a05:6000:1209:: with SMTP id
 e9mr10247647wrx.36.1617716502095; 
 Tue, 06 Apr 2021 06:41:42 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l4sm2870959wmh.8.2021.04.06.06.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:41:41 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] soc: mediatek: devapc: move 'vio_idx_num' info to
 DT
To: Nina Wu <nina-cm.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-2-git-send-email-nina-cm.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <39794302-7993-4f9c-b28c-577fdb0265a3@gmail.com>
Date: Tue, 6 Apr 2021 15:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617259087-5502-2-git-send-email-nina-cm.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_144145_776562_BF6C6D41 
X-CRM114-Status: GOOD (  27.70  )
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
> For new ICs, there are multiple devapc HWs for different subsys.
> The number of devices controlled by each devapc (i.e. 'vio_idx_num'
> in the code) varies.
> We move this info from compatible data to DT so that we do not need
> to add n compatible for a certain IC which has n devapc HWs with
> different 'vio_idx_num', respectively.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-devapc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index f1cea04..a0f6fbd 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -32,9 +32,6 @@ struct mtk_devapc_vio_dbgs {
>  };
>  
>  struct mtk_devapc_data {
> -	/* numbers of violation index */
> -	u32 vio_idx_num;
> -
>  	/* reg offset */
>  	u32 vio_mask_offset;
>  	u32 vio_sta_offset;
> @@ -49,6 +46,7 @@ struct mtk_devapc_data {
>  struct mtk_devapc_context {
>  	struct device *dev;
>  	void __iomem *infra_base;
> +	u32 vio_idx_num;

We should try to stay backwards compatible (newer kernel with older DTS). I
think we don't need to move vio_idx_num to mtk_devapc_context. Just don't
declare it in the per SoC match data. More details see below...

>  	struct clk *infra_clk;
>  	const struct mtk_devapc_data *data;
>  };
> @@ -60,10 +58,10 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
>  
>  	reg = ctx->infra_base + ctx->data->vio_sta_offset;
>  
> -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
>  		writel(GENMASK(31, 0), reg + 4 * i);
>  
> -	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
> +	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1), 0),
>  	       reg + 4 * i);
>  }
>  
> @@ -80,15 +78,15 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
>  	else
>  		val = 0;
>  
> -	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> +	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
>  		writel(val, reg + 4 * i);
>  
>  	val = readl(reg + 4 * i);
>  	if (mask)
> -		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> +		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
>  			       0);
>  	else
> -		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> +		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
>  				0);
>  
>  	writel(val, reg + 4 * i);
> @@ -216,7 +214,6 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
>  }
>  
>  static const struct mtk_devapc_data devapc_mt6779 = {
> -	.vio_idx_num = 511,
>  	.vio_mask_offset = 0x0,
>  	.vio_sta_offset = 0x400,
>  	.vio_dbg0_offset = 0x900,
> @@ -256,6 +253,9 @@ static int mtk_devapc_probe(struct platform_device *pdev)
>  	if (!ctx->infra_base)
>  		return -EINVAL;
>  
> +	if (of_property_read_u32(node, "vio_idx_num", &ctx->vio_idx_num))
> +		return -EINVAL;
> +

...only read the property if  vio_idx_num == 0.
What do you think?

Regards,
Matthias

>  	devapc_irq = irq_of_parse_and_map(node, 0);
>  	if (!devapc_irq)
>  		return -EINVAL;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
