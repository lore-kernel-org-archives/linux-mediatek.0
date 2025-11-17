Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B330CE8D6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUj9CnAKaYL4CSPf9nhifExVFiQR0npQvu3foEooZYY=; b=2R15EsEEjosKiZjiwNPX12vZyy
	Jl4c4EJBHHpZ4Cdq3uiYrLOcXcve+ikIvT94hB5l8F/D+f60cwPtMb3RhdqGVyiKdFgLtgUtZXQwC
	PgV5aSiWXoHMg/ji6c8HGDaI1ioRJAont4hCsPqmrUy5GRQS4lrdGSvn7bQMDGJG/MCc/aoWQ0g6D
	onUgnBMcVsoR3pJgaYsXgADqtMMTLzlESw+bCukVBOs1vWPd+WhCBTPUpd0lpOMU3dGpz/dHMl9ly
	UCZBp58C7t5UG3xxlkR8DPU75Hpe+nJ1vE0Bb3klRZDBc/bu2DfCYvCLKDI/qffzIMTpiAeh8qwZ4
	TGgEWD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Se-0000000GQbQ-31Zf;
	Mon, 17 Nov 2025 16:52:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Sb-0000000GQaQ-1jj1
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 16:52:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3745583b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 08:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763398333; x=1764003133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUj9CnAKaYL4CSPf9nhifExVFiQR0npQvu3foEooZYY=;
        b=OjiMVRkFDD0umE09iGjIKmTWWtIUk/R0lHsya4mbneycyX9t6qLV6PsC+cPW+P7o05
         lucZHPxGXHF6Npbkh9iw/Yu9k0ggqEHKXdtjg8izyHs1KdTnGrD0jVyYFPEwa5ct2M6V
         MtQX8GTk1QxfuCnAMhddterNPym8sxLmV7i42HwCfsV04ngDYcLqGsdLrsuKwOe/ZmWi
         wy+UFhuY9S5siCd2PsbjTW95SyHC2TsvxLtvvcyfwlACOWDbK/iHrl0bQcCA3QZQVe2v
         yQ37yf9hRtDjCc2YqKiUStuNsgCfRoi2D95ww13xD/5tGOry8E7aAxavfrDi5uXJaxeD
         5rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763398333; x=1764003133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUj9CnAKaYL4CSPf9nhifExVFiQR0npQvu3foEooZYY=;
        b=rYdPJG+JBhaMzGamK74Mg2ch+cXqYMAwV+xIr7jtW2Yco/Ph1tCxl6N7s7nSMs625S
         4Mbsx4Q+hkzHKQKpXvume5RSlhuJPoA4xTDceskIYxGp8rQ/0bJMIZ/uvYJICtPXZaqM
         +qY/RJetqd8zpjZfd+cxHNLslNvsacfYtkcXfwFZL389WsP+qncKzqspaxa7H2/ueieM
         9JFNk58u63aGrbuuTtVDDMrob8qL18pauxNP2oZrKw6/k7qz9Re8c+VXsHMlJ3lum50g
         tft+hOtil4W5JHMQlRez/MyUq6XUQf2zs6hn8KeONyhpOyD8kdq8HqquXo9l2/S6uI+j
         nqhA==
X-Forwarded-Encrypted: i=1; AJvYcCUhYlFO0nCU+VnCN+5qSxoIaJRpe723FjZDb2xn/oqzpz0FGJW7V0PB4h5wN/UibeuyUmCto4AtWWLYZrXYcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRp43cw6etmDFrDmZ8hSiWeqHEfgI0HzpAPIosfU9+qpK/XqZU
	Pr5yDP/aFDkZ78sspKVQcqNoLBjm4waOhLZCRjz6+xEtmqduDHfrpKBz89nSx8H2vFM=
X-Gm-Gg: ASbGncuiMn/7+PlQ9nz4522an2mEcWgxkDKwBhDKsa+bKHJfbrAYbWOGESL4BktAMlO
	UBYK2MIOjVV8gJsjNVN6I53uqzh0Em0HwraE32pMk/SKSSpcNjE+WdyQWNCod2PuwQU/9qaIrkn
	Yll4tYUjPYzktfMrWH79Q30X9S8vitxzx/st92suj/tDvp8UTg+yvRlM5HCv38blDboUewdiXRQ
	6/+IiD056fLqOWTYAPP5nY/w/KE9KEPQ9Hc4pwDcd7A6pcCyZk2jHMzC1VBtwQfJDVRH2EcwyAB
	4knedgCrByLENYddWlKtGtjsOazAdK+RyVsNNOweQnZBKtXwFG4PuOi32L4PU56irrD+faBUB6w
	qhjQmt5TqE1qfdyMaPKtUt1BrMRFaejKcTC3LyIT/Tz/bJ6FsSfdVbLQtIxPyKVSPvF+bVKJqEE
	RoRi4=
X-Google-Smtp-Source: AGHT+IHecI276kQIbxBZ9syfl92jYHLFh+TC5jrh7TzsTTTb6R0qJEIR0wIHJjht4p40zgRpFX7K5A==
X-Received: by 2002:a05:6a00:1311:b0:7a2:1b8a:ca22 with SMTP id d2e1a72fcca58-7ba3b1b0020mr16038431b3a.25.1763398332587;
        Mon, 17 Nov 2025 08:52:12 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:df44:9b1b:6b35:3fb0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm13792560b3a.23.2025.11.17.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:52:12 -0800 (PST)
Date: Mon, 17 Nov 2025 09:52:09 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/3] remoteproc: mediatek: Add MT8189 SCP platform data
Message-ID: <aRtSucnncIC33zQf@p14s>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
 <20251110101342.24261-3-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101342.24261-3-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_085213_488204_E14F365F 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, Nov 10, 2025 at 06:13:30PM +0800, Huayu Zong wrote:
> Add platform data for MT8189 to support SCP remote processor.
> This enables SCP functionality on MT8189 SoC.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  5 +++++
>  drivers/remoteproc/mtk_scp.c    | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index d45480ad332e..abf0dbd9978c 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -35,6 +35,11 @@
>  #define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
>  #define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
>  
> +#define MT8189_SCP2APMCU_IPC_CLR	0x30010
> +#define MT8189_SCP2SPM_IPC_CLR		0x30018
> +#define MT8189_SCP_SECURE_DOMAIN	0xA080
> +#define MT8189_SCP_DOMAIN_VAL		0x3303003
> +
>  #define MT8192_L2TCM_SRAM_PD_0		0x10C0
>  #define MT8192_L2TCM_SRAM_PD_1		0x10C4
>  #define MT8192_L2TCM_SRAM_PD_2		0x10C8
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index c3c37cae933a..f311e23b6d65 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1529,6 +1529,23 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
>  	.scp_sizes = &mt8188_scp_c1_sizes,
>  };
>  
> +static const struct mtk_scp_of_data mt8189_of_data = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8192_scp_before_load,
> +	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_reset_assert = mt8192_scp_reset_assert,
> +	.scp_reset_deassert = mt8192_scp_reset_deassert,

This is the last patchset I accept for this driver where the name of the
functions don't match the mt****_of_data.  It is highly confusing, hard to
maintain and error prone.  Functions that are re-used need to be given generic
names.

Thanks,
Mathieu

> +	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.scp_to_host_ipc_clr_reg = MT8189_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8189_SCP2SPM_IPC_CLR,
> +	.scp_secure_domain_reg = MT8189_SCP_SECURE_DOMAIN,
> +	.scp_domain_value = MT8189_SCP_DOMAIN_VAL,
> +	.scp_sizes = &default_scp_sizes,
> +};
> +
>  static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_clk_get = mt8192_scp_clk_get,
>  	.scp_before_load = mt8192_scp_before_load,
> @@ -1587,6 +1604,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
>  	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
>  	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
> +	{ .compatible = "mediatek,mt8189-scp", .data = &mt8189_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
>  	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
> -- 
> 2.45.2
> 

