Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B06C83F26
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zbDF6DuNywreDfjORRT1cKAmeYmyOF35f+RgRaR5Jw=; b=34UGUcGFzk2sXEo6xZcyA1otoc
	G9PwlK6hMuiGdwSbqKMvD6ZR7qBcjbLUwnt5bTabvmGj2FMSANDQt9e/dILysZJXG5kwxYo3YV7wy
	fknR1UmElfw1jeEwX0lLZfEfG8/hwzsqvoYJ+l5zpdgr+Dgdhv5iJleO2PNTDLL8PmYtSFCkiYVnW
	fHDVY/I29XZ8tITHnt3Kdj6VlvwWCn3DtmiGXNYSnhU5aYfkFtWEfNGsinV+aJcLeE7F681Mu0fFI
	DOekvd/bMSbiwOc6U63SzYsPLmdxb860qoOxtqruhYOP88bOKFKkIRZpxofTwwZ5hG9+fYQ89386q
	k/6PChAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8Tj-00000001oyl-0Mry;
	Wed, 30 Jul 2025 15:12:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8Ow-00000001oPc-3UgA
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Jul 2025 15:07:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso733497b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753888049; x=1754492849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6zbDF6DuNywreDfjORRT1cKAmeYmyOF35f+RgRaR5Jw=;
        b=w3xuTAFcWhEpgVSive4jCUKpnzh1Ubbl3L0u5vf5cozXcu9pePYCgWAu9mFr9GlCMn
         SzMqlzRco84stRwiuMa3qUDPydP6IJBwSE8TjiMKRvTxfTcMcHHKKsJ9Wrwq5ixMKmF5
         15wc/J2JRTSzwXtbThC8hAgOrC1YyIkYaHHVdmfGnwSo08Y28y0WOz70bNXWsbtzkh33
         JSBoyoScOVMuOtfBZATk9Yf2szfffVhPnpEFWjkaTXLJ/0bqg7JKSgXN76/W6/y7UVap
         pe6isMbykL8h63kpc6+BD81Xp2dKidnfvtKr3gP7bDZdx2mzDPlpawKW6wbW7Tz/FpQM
         hK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888049; x=1754492849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zbDF6DuNywreDfjORRT1cKAmeYmyOF35f+RgRaR5Jw=;
        b=Aw0Z4bRiHB2uhpB/sqoelc4JFZw75XYBjtM4uIABgoORt2njz7hrAuVe4P+J6K3s2j
         NM+fvVxFGIDpmBve32Vi86JcZKNcH8AIBER7mV0xc6oDCSqJl2+dS1+hgzc6VG5TeA3h
         5N7IDKMamdmzNsolf5qKtI0huJeXtYCoJfNuWqGbWn4gKgRFXrKsmMLdQQbRmMjPZSJC
         OaG8TOAY8r5rVWocKDh3ni2sn6Xo2fAu9A34T4fmu7uFpl49qA0Pi93oVWEfe8Vkc4bl
         S3C7TTcv9hacob2K4NwWdg7s56olTpAWe8iUPmpiw5Nl1AZohYhRXU0TMlPQQV8g+J7q
         xogw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4fcS+J/BEMybXaW6hx5qqNT+zHjaofyX7obVWSKuCQ8pusBY2tEecVt7b23Si2sOSbvzgeQdUCJO+OK7dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7CBPFkVDxcHvy9b5ufTVcSMZXkb5FnN0vboyWi4QNryD67hC
	JgpTYVPFSbHidUdJ601RMKqg1coFUFBuuu+akPLo3Yqix56fyn8fj0mXi1iLWvmAPAI=
X-Gm-Gg: ASbGncstRygn1JOOx0a82ogHQVtklQTyqmcq1ksU02xznSIuLLYlfQiOz4WSsfJbDRR
	/DoRRup7+YcyyEDXWx2AchmZThE++u4mFN7cmDnh3m3drNyHDlGt//JRoo1U96yk4F9wpDZ9AhV
	ByPUdbzyr2CLkvUkDU1g9SGleRC9toeBrCcc3Fz4/fVhtXItpP7g67G5t/KLBBg1xImoaNMNbgz
	f85CRZb80I8VfBgjAZ1nWR4tB625rfeKy5v4/vTED7JQVPj+/ud5LtPaubdwr354GXLtD419xLt
	nqE+iYM5UAdn55z1P+odbEuDoVidxDkRdSN6uYvUDmMD9rBR52D25iXQAHUh4TsxCrng9ZcVqC6
	ZrDprMO4fZTqqfRUAuH1El9RRRhKLY7yxNok6
X-Google-Smtp-Source: AGHT+IFaZ9+p55hN5f6LxwvTNGvq2uEnkVbWsMgb6AANE/sV3IXqIf2qyYyxe/SLSbbyK1EkPLnaaw==
X-Received: by 2002:a05:6a00:4b0c:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-76ab092312amr5779637b3a.7.1753888049439;
        Wed, 30 Jul 2025 08:07:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:19cc:e53e:637f:aa72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408cf75dfsm10232542b3a.50.2025.07.30.08.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 08:07:28 -0700 (PDT)
Date: Wed, 30 Jul 2025 09:07:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	--cc=Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Message-ID: <aIo1LsFeKqtPoCDm@p14s>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-4-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729023125.9036-4-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_080730_897735_761AA45D 
X-CRM114-Status: GOOD (  24.61  )
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

Hi,

On Tue, Jul 29, 2025 at 10:31:13AM +0800, Huayu Zong wrote:
> Add SCP support for mt8189.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h | 11 ++++++++++
>  drivers/remoteproc/mtk_scp.c    | 37 ++++++++++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index fd5c539ab2ac..fb2131e0ed07 100644
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
> @@ -112,6 +117,12 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +	u32 scp_to_host_ipc_set_reg;
> +	u32 scp_to_host_ipc_clr_reg;
> +	u32 scp_to_spm_ipc_clr_reg;
> +
> +	u32 scp_secure_domain_reg;
> +	u32 scp_domain_value;
>  
>  	size_t ipi_buf_offset;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..956793fc6901 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -225,7 +225,8 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  {
>  	u32 scp_to_host;
>  
> -	scp_to_host = readl(scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_SET);
> +	scp_to_host = readl(scp->cluster->reg_base +
> +			    scp->data->scp_to_host_ipc_set_reg);

As far as I can tell, this is the same for both mt8189 and mt8192 - it should
not be needed.

>  
>  	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
>  		scp_ipi_handler(scp);
> @@ -235,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  		 * MT8192_SCP2APMCU_IPC.
>  		 */
>  		writel(MT8192_SCP_IPC_INT_BIT,
> -		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
>  	} else {
>  		scp_wdt_handler(scp, scp_to_host);
>  		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
> @@ -559,8 +560,10 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
>  
>  static int mt8192_scp_before_load(struct mtk_scp *scp)
>  {
> +	u32 scp2spm_ipc_clr = scp->data->scp_to_spm_ipc_clr_reg;
> +
>  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> -	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
> +	writel(0xff, scp->cluster->reg_base + scp2spm_ipc_clr);
>  
>  	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
>  
> @@ -574,6 +577,11 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* set the domain of master in SCP */
> +	if (scp->data->scp_secure_domain_reg)
> +		writel(scp->data->scp_domain_value,
> +		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
> +
>  	return 0;
>  }
>  
> @@ -1464,6 +1472,24 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
>  	.scp_sizes = &mt8188_scp_c1_sizes,
>  };
>  
> +static const struct mtk_scp_of_data mt8189_of_data = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8192_scp_before_load,
> +	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_reset_assert = mt8192_scp_reset_assert,
> +	.scp_reset_deassert = mt8192_scp_reset_deassert,
> +	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
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
> @@ -1475,6 +1501,10 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  	.scp_sizes = &default_scp_sizes,
> +	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
> +	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
> +	.scp_sizes = &default_scp_sizes,

You are introducing a duplicate .scp_sizes

Thanks,
Mathieu

>  };
>  
>  static const struct mtk_scp_of_data mt8195_of_data = {
> @@ -1520,6 +1550,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
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

