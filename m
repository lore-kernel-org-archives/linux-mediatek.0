Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A48C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48EI315MQOjCOThcHKEmc9DntDAARZUe5UjxDuZ02nQ=; b=yyVopAiBL92NZW
	rrGA1C2nLzcmtvxJKbEUeJryedtQKY9MflPTiIqOoHAuzlGf7yu4nLft8fK1KW45gWbj4VjRfBdNF
	DqBrBMt4tm/+MtlQ+7BI+AbTnGYxYrwAPpe1X2LTxBt2EqD9tt38mTOJafMrfETxMDF1oJ2GqZr3J
	5u8DNe9ZgI8xVj8k8WgP5NEscQ88rsLBcKtdkxFLGk+yEc0QEpRuXPuJ7+z2xqA9ZgSjE7q7g2b8y
	oYKJyNcW1ACHc48c50YtlDeMp8XMfXY7lFD5nr0R1ogDJJSpMJhwZ3y/FWl5pHSx60RkhDp1reo3n
	qEr53GtltM4h7EZk3J3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8vz-009h8l-2g; Tue, 15 Mar 2022 15:18:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8v9-009gwZ-UZ; Tue, 15 Mar 2022 15:17:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id r7so904004wmq.2;
 Tue, 15 Mar 2022 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=C9xGFdivsssXWQwIpTJgkBRJXk+js/43FamWLZ8jXQM=;
 b=LifupL2qn79wRXct5I3MyJs8xKpHeVvtJjPYO6rBp0cJiBmLByOnlphZcUEWJWJRF5
 s+wbQ8KPQxWZXMEOYzpGlSqUyZYVEVR5rjZBQLUvAPRiYJntAwSm/0/c3deh6bAwNioV
 AdFpn/Z0am6nPBdX+L6yzReMzHQtQlE81iwJBqNJ39Gpkh9QZLe72IrovpolSvl8iuO7
 zxeV6TaqDS9JPIy6ZeTCjn6RshQSoBDbGy/EiMPOJ7p1rixhPrr+a6c3bWOXuU1I3OaZ
 UQ4OzFH/f2j9Wf0poYTucMeK5hCeh4WmKtGKWvfs3bV5DgwvsBXI3EobRcSPTefIWcJ8
 5FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=C9xGFdivsssXWQwIpTJgkBRJXk+js/43FamWLZ8jXQM=;
 b=Hlj5j+gPVWBKvLP1aHCTRDlsx0fc5bxuDXupPWDq/ai7dTIwD2EYewu4eC4oI4BeKh
 D37pVEwiIT0zKeSXDGiV6vQxwGzpb+VqhoS8LIwiOXHfcMvZ8LEO0cJ6S/+GZdidNJ75
 cFfb9JjjjNZhg/aHfqiOrnLaRuRwVQGAKwTEVuuIq6cTTsVFWAAdN62rOT+cv9bbKhui
 zY0VfsS4l2T8m8f+acWOd1993zuwC/qgjN2D9WQ8T4pnyFEMVAjMx6sJng1a71Z8QoZA
 aVq2kj2RhYNBg1STm/KTkr1mXqxoedz4bIjOlhT1J+lLdRTeQX/95/M08HEq7qjZSc7y
 v3uw==
X-Gm-Message-State: AOAM5336ja7oEz3x7MtJOOAqWRqO0ioxKz6Tnx1LzZe1zNWTdob+4Cr8
 O0gVSLkRB0oMgE7l/sov8F4=
X-Google-Smtp-Source: ABdhPJx7A44+7ld24ZRFIERu7tDwMi3RwuzTJV4KmbfR3MRWP4ExQXr0lKKFoU2RLYk6CuOwhNdWIg==
X-Received: by 2002:a05:600c:3b13:b0:389:cf43:eaf5 with SMTP id
 m19-20020a05600c3b1300b00389cf43eaf5mr3722567wms.198.1647357425651; 
 Tue, 15 Mar 2022 08:17:05 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm15713875wrm.82.2022.03.15.08.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 08:17:04 -0700 (PDT)
Message-ID: <e56bd5ed-ecaa-2fe1-c03e-f7f7456d7761@gmail.com>
Date: Tue, 15 Mar 2022 16:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314111806.28168-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
In-Reply-To: <20220314111806.28168-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_081712_056281_78B44C9A 
X-CRM114-Status: GOOD (  28.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/03/2022 12:18, Tinghan Shen wrote:
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
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v3: fix build error
> v2: apply comments about macro definition and function calls
> ---
>   drivers/remoteproc/mtk_common.h |  2 +
>   drivers/remoteproc/mtk_scp.c    | 67 +++++++++++++++++++++++++--------
>   2 files changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 5ff3867c72f3..ff954a06637c 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -51,6 +51,8 @@
>   #define MT8192_CORE0_WDT_IRQ		0x10030
>   #define MT8192_CORE0_WDT_CFG		0x10034
>   
> +#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
> +
>   #define SCP_FW_VER_LEN			32
>   #define SCP_SHARE_BUFFER_SIZE		288
>   
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index dcddb33e9997..d498f6354cd0 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -365,22 +365,22 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>   	return 0;
>   }
>   
> -static void mt8192_power_on_sram(void __iomem *addr)
> +static void scp_sram_power_on(void __iomem *addr, u32 reserved_mask)
>   {
>   	int i;
>   
>   	for (i = 31; i >= 0; i--)
> -		writel(GENMASK(i, 0), addr);
> +		writel(GENMASK(i, 0) & ~reserved_mask, addr);
>   	writel(0, addr);
>   }
>   
> -static void mt8192_power_off_sram(void __iomem *addr)
> +static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
>   {
>   	int i;
>   
>   	writel(0, addr);
>   	for (i = 0; i < 32; i++)
> -		writel(GENMASK(i, 0), addr);
> +		writel(GENMASK(i, 0) & ~reserved_mask, addr);
>   }
>   
>   static int mt8192_scp_before_load(struct mtk_scp *scp)
> @@ -391,11 +391,32 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>   	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
>   
>   	/* enable SRAM clock */
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
>   	/* enable MPU for all memory regions */
>   	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> @@ -551,11 +572,25 @@ static void mt8183_scp_stop(struct mtk_scp *scp)
>   static void mt8192_scp_stop(struct mtk_scp *scp)
>   {
>   	/* Disable SRAM clock */
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
>   	/* Disable SCP watchdog */
>   	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
> @@ -888,11 +923,11 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>   
>   static const struct mtk_scp_of_data mt8195_of_data = {
>   	.scp_clk_get = mt8195_scp_clk_get,
> -	.scp_before_load = mt8192_scp_before_load,
> +	.scp_before_load = mt8195_scp_before_load,
>   	.scp_irq_handler = mt8192_scp_irq_handler,
>   	.scp_reset_assert = mt8192_scp_reset_assert,
>   	.scp_reset_deassert = mt8192_scp_reset_deassert,
> -	.scp_stop = mt8192_scp_stop,
> +	.scp_stop = mt8195_scp_stop,
>   	.scp_da_to_va = mt8192_scp_da_to_va,
>   	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>   	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
