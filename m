Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkRTs3jKBhMQFH/MOxFNeY1aj1COjvJIPLLiYA1AIMU=; b=eDadywEXfwd0fj
	76lPBwu8gf3TBYtJ2RZ93tdB8GR8Cd7RGL0GixFldPAK9X6PwLn4A275Xn5dO4hlNNT7wFhW+8uPS
	TiJcUPxugmktplar9nxC01IfuzmrKYQM4Exm4YpifAzia7xNNaSBjarsRVdISorB3twJOwu79oxZF
	aRaiiRg72AvVqrc+c48zBnnb9Qae8fM7sIjiOWgd2SznwMyzLkr2dYGZc7zI6Lb2M1ls3uInImKfg
	bPUvWMtnDAywH3xMxq2SmyWkBvQCtmmafc/FDAEs4EfRtCLIfGPeoMHgvuvq91EZB2NPn9f3ZPqPs
	ssxZhLFX1PcwJgafqW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndwQB-009h21-QV; Mon, 11 Apr 2022 15:57:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndwQ8-009h0W-LF
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 15:57:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so18796697pjn.3
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M8asM4iauMxrRszdV5+UB7ZDNGbKG8oI3XcEYrRlcUM=;
 b=V3QeCRIKh6yR+JHRKKOiWBsnYjDNWQqGpBEBdBva/1vuS5c4lpeqZkNVXm+dsm2J5Y
 WyVRu5cT4+Zcj0Xpotdq0vALjKzJLUB0t/kqjDr2Ae8bQIG4nKxnmjWZC8W1wRuvJlp6
 oMPQCPRhVfSVOWdkGF9zepYZKS9v8FNL1ezXaFdt1t4Zkq1ujFxYy52xBIO/+pjiJMzf
 EF4QVX0aN8Z1GzzzaGRrQdhlRwcKDygofwwYQmKY8coYITtpx84w5U4wv0p6aPaKickA
 M+E2KONc68+VWlWIyVqj57kB5XgPxNS4P5Zzkk85E/hFWb0qd/XodC2gEHts3evpY25g
 GHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M8asM4iauMxrRszdV5+UB7ZDNGbKG8oI3XcEYrRlcUM=;
 b=B6s0g9E5YUNjI8BSP4L1kcElTVK+jTthBTJfLWIh4idGBsla9gO+OUuOUSp6X/H+/b
 Tt8OR8VeWGAzrYG5aM+ibkZ+9SbopafGWBleuhbqc3WSyozGKUEQRX3seGeU1NpN/eP8
 QZRU1D9W9Ppk7xhgyaXGm4y/C2cbUSlCI99zisPn00mH1ra7em2IqHTIFqxyJAdEEoQy
 0aEFxJYC3ys6H9pbFzl+V54rlzLXSMBUykvReDE8RIhOpRFpI7ynM3o5K7QNBRLwjqlG
 zayr+5T3q6HBuKMhHcLJ3+wOmN7LFZWsoF4rpKCDo6AgFxEUxiBmp5Sr1vWQhI/JKoXM
 +BOQ==
X-Gm-Message-State: AOAM531vGJBFtge5IQ8S09GTxMZj4bCJEfqJ7WnDquRXo7CA9+ZeCzh9
 WT1AeIwQ3nlEApyHPauoB9tR0g==
X-Google-Smtp-Source: ABdhPJzkfNotZYxrom9Q8GRNC2WrpZWQZzmw3QbYTpL/ZYTRwsqnTZtW0D9O/LkzlRdOeN5aIRzM2Q==
X-Received: by 2002:a17:902:bf07:b0:158:24d9:3946 with SMTP id
 bi7-20020a170902bf0700b0015824d93946mr16147253plb.28.1649692658069; 
 Mon, 11 Apr 2022 08:57:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 e5-20020aa78c45000000b005058ab75ee9sm11666353pfd.199.2022.04.11.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:57:36 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:57:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6] remoteproc: mediatek: Fix side effect of mt8195 sram
 power on
Message-ID: <20220411155734.GA323343@p14s>
References: <20220321060340.10975-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321060340.10975-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_085740_740511_76C893CF 
X-CRM114-Status: GOOD (  29.05  )
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

On Mon, Mar 21, 2022 at 02:03:40PM +0800, Tinghan Shen wrote:
> The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.
> 
> L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.
> 
> L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
> These bits have to be powered on to allow EMI access for SCP.
> 
> Bits[7:4] also affect audio DSP because audio DSP and SCP are
> placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
> blocked too.
> 
> L1TCM_SRAM_PDN bits[31:8] are not used.
> 
> This fix removes modification of bits[7:4] when power on/off mt8195 SCP
> L1TCM. It's because the modification introduces a short period of time
> blocking audio DSP to access EMI. This was not a problem until we have
> to load both SCP module and audio DSP module. audio DSP needs to access
> EMI because it has source/data on DRAM. Audio DSP will have unexpected
> behavior when it accesses EMI and the SCP driver blocks the EMI path at
> the same time.
> 
> Fixes: 79111df414fc ("remoteproc: mediatek: Support mt8195 scp")
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> v6: fix build error
> v5: rebased on rproc-next
> v4: add Fixes and Reviewed-by tags
> v3: fix build error
> v2: apply comments about macro definition and function calls
> ---
>  drivers/remoteproc/mtk_common.h |  2 +
>  drivers/remoteproc/mtk_scp.c    | 69 +++++++++++++++++++++++++--------
>  2 files changed, 54 insertions(+), 17 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 71ce4977cb0b..ea6fa1100a00 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -54,6 +54,8 @@
>  #define MT8192_CORE0_WDT_IRQ		0x10030
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
> +#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
> +
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 38609153bf64..ee6c4009586e 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -365,22 +365,22 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>  	return 0;
>  }
>  
> -static void mt8192_power_on_sram(void __iomem *addr)
> +static void scp_sram_power_on(void __iomem *addr, u32 reserved_mask)
>  {
>  	int i;
>  
>  	for (i = 31; i >= 0; i--)
> -		writel(GENMASK(i, 0), addr);
> +		writel(GENMASK(i, 0) & ~reserved_mask, addr);
>  	writel(0, addr);
>  }
>  
> -static void mt8192_power_off_sram(void __iomem *addr)
> +static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
>  {
>  	int i;
>  
>  	writel(0, addr);
>  	for (i = 0; i < 32; i++)
> -		writel(GENMASK(i, 0), addr);
> +		writel(GENMASK(i, 0) & ~reserved_mask, addr);
>  }
>  
>  static int mt8186_scp_before_load(struct mtk_scp *scp)
> @@ -393,7 +393,7 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
>  	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
>  
>  	/* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
> -	mt8192_power_on_sram(scp->reg_base + MT8183_SCP_SRAM_PDN);
> +	scp_sram_power_on(scp->reg_base + MT8183_SCP_SRAM_PDN, 0);
>  
>  	/* Initialize TCM before loading FW. */
>  	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
> @@ -412,11 +412,32 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
>  
>  	/* enable SRAM clock */
> -	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
> -	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
> -	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
> -	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
> -	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
> +
> +	/* enable MPU for all memory regions */
> +	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> +
> +	return 0;
> +}
> +
> +static int mt8195_scp_before_load(struct mtk_scp *scp)
> +{
> +	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> +	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
> +
> +	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
> +
> +	/* enable SRAM clock */
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> +	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
> +			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
> +	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
>  
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> @@ -572,11 +593,25 @@ static void mt8183_scp_stop(struct mtk_scp *scp)
>  static void mt8192_scp_stop(struct mtk_scp *scp)
>  {
>  	/* Disable SRAM clock */
> -	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
> -	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
> -	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
> -	mt8192_power_off_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
> -	mt8192_power_off_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
> +
> +	/* Disable SCP watchdog */
> +	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
> +}
> +
> +static void mt8195_scp_stop(struct mtk_scp *scp)
> +{
> +	/* Disable SRAM clock */
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
> +	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
> +			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
> +	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
>  
>  	/* Disable SCP watchdog */
>  	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
> @@ -922,11 +957,11 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  
>  static const struct mtk_scp_of_data mt8195_of_data = {
>  	.scp_clk_get = mt8195_scp_clk_get,
> -	.scp_before_load = mt8192_scp_before_load,
> +	.scp_before_load = mt8195_scp_before_load,
>  	.scp_irq_handler = mt8192_scp_irq_handler,
>  	.scp_reset_assert = mt8192_scp_reset_assert,
>  	.scp_reset_deassert = mt8192_scp_reset_deassert,
> -	.scp_stop = mt8192_scp_stop,
> +	.scp_stop = mt8195_scp_stop,
>  	.scp_da_to_va = mt8192_scp_da_to_va,
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
