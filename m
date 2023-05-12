Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E42C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBK7MtjywAeGn+dXgdBRN46DBOY/1h28sVdTEkwe97Q=; b=wCo5kELrkj03mu1JIeGBkVpqpF
	c9h97vCE/XR85H+tB1+JzzEDuTrI/1UUvlnQdYEAoQ0kM8AXx9XJLt2cQXoz7rHbdI41LQtm7zvFn
	iFT+Qt3Yck8HJa3zFM6tc4etwFdAfKCzkfJ/1f337uHsog/KCGMDFE/SrpC7oEzWE8DqD4oze6rL1
	x0cfQqHS7jWSkDiq/xdn9gCBgm3Z8ZQYqum2zY652v+AxL1of7I1MAKHxRs9BiYW9dHpRBaRd/7Mb
	VegPEdKa1AjA1f32iZlu8QMEb6OWTv60TUMxhmYF1glccgsqs6TcysYp1iZaikbk3wyRfb5miru9r
	D9bt1EUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTQO-00C7I9-1d;
	Fri, 12 May 2023 14:07:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTQL-00C7Gj-1Q;
	Fri, 12 May 2023 14:07:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so72530765e9.1;
        Fri, 12 May 2023 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683900428; x=1686492428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBK7MtjywAeGn+dXgdBRN46DBOY/1h28sVdTEkwe97Q=;
        b=MXezRAlnkuTV5pIpjNtJgwSMWk2ZtW3qENIEJCAHbuk0aVXOIC8odl/Fnb4T7vZUci
         xu5Bh9Q3uH3CwzGETOxyeotYE1aC8So6ucFo8znyX0R8a6Tj/o1efJt7rcgpm4mMmvMT
         aDzBHHyYWeT/RoTLjo1kPjCCqYsYDx6HCj3+yXL6jqbrk3HhukLzcCOL5KIQokSZ3zn7
         AfkHtj/ZIPOHX/v/h7RdPAfeBTjShXG1H06NsI4d0RDhklGJiV28ctasKVKjOc1yzaVg
         rLwlChOeVn8LXOrCaW/s0dRV4TdHYxoPy5H0Ix+pjPIuv+PHp9t+/FCbBaumrLCrHcml
         3NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683900428; x=1686492428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBK7MtjywAeGn+dXgdBRN46DBOY/1h28sVdTEkwe97Q=;
        b=i9O1IdMMyz4yT3WCwHHqNgaMoW4QWvaqmya3XRNG0W1muo6cM+3jgDTNfl76rNJnXE
         2RbtdZXRwcDfzNtTQmR9GeELHsgExxDfwdf82gJcQttiPakzZeP4/x0+3CdsBU0CvPQu
         uAqMms46s5p369OMG+HnjK69U9B2LD2vTA/2WhbzhzmFHKaK8jQ5fdc7vX7VqxFzqOq/
         1gaMJI4vLoGYPWhaKItrzuSSFSpKDB/hyj9cujEiCgzhS2y1CE5z2Ou4TvRAi3aepsiw
         De0RaOmtY6Qh59kTb6LlpC+cW3HnhVH3eYm3u3lNcyFFNl0bUT7yo+82Sk4j18v90XTJ
         0twg==
X-Gm-Message-State: AC+VfDwK69qxsDHGmeI/lpl81srunrv3lBiHP4wUEv1EFBzp6z6pEY+b
	h/YWsE76SOZavT8TWG2OpoA=
X-Google-Smtp-Source: ACHHUZ466uoppPjkd165GZeEqdb991Ed9InTgjqBaF1UTbDVf5K/JhK+r1n2dr8zXlAuq8GT95qpZw==
X-Received: by 2002:a05:600c:2283:b0:3f4:2254:bd86 with SMTP id 3-20020a05600c228300b003f42254bd86mr14567795wmf.8.1683900427563;
        Fri, 12 May 2023 07:07:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003f41bb52834sm19323160wmi.38.2023.05.12.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 07:07:06 -0700 (PDT)
Message-ID: <5d330bb9-0034-72eb-37bf-3c1bd33e0f2e@gmail.com>
Date: Fri, 12 May 2023 16:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 04/11] remoteproc: mediatek: Add MT8195 SCP core 1
 operations
Content-Language: en-US, ca-ES, es-ES
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
 <20230510063749.5127-5-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230510063749.5127-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_070709_481553_5ABC529A 
X-CRM114-Status: GOOD (  22.03  )
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



On 10/05/2023 08:37, Tinghan Shen wrote:
> The SCP rproc driver has a set of chip dependent callbacks for
> boot sequence and IRQ handling. Implement these callbacks for MT8195
> SCP core 1.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/remoteproc/mtk_common.h |  9 ++++++
>   drivers/remoteproc/mtk_scp.c    | 56 +++++++++++++++++++++++++++++++++
>   2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index ea6fa1100a00..c0905aec3b4b 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>   #define MT8192_SCP2SPM_IPC_CLR		0x4094
>   #define MT8192_GIPC_IN_SET		0x4098
>   #define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +#define MT8195_CORE1_HOST_IPC_INT_BIT	BIT(4)
>   
>   #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>   #define MT8192_CORE0_SW_RSTN_SET	0x10004
> @@ -56,6 +57,14 @@
>   
>   #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>   
> +#define MT8195_CPU1_SRAM_PD			0x1084
> +#define MT8195_SSHUB2APMCU_IPC_SET		0x4088
> +#define MT8195_SSHUB2APMCU_IPC_CLR		0x408C
> +#define MT8195_CORE1_SW_RSTN_CLR		0x20000
> +#define MT8195_CORE1_SW_RSTN_SET		0x20004
> +#define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
> +#define MT8195_CORE1_WDT_CFG			0x20034
> +
>   #define SCP_FW_VER_LEN			32
>   #define SCP_SHARE_BUFFER_SIZE		288
>   
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e1d93e63d7df..2bf66b1a8d80 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -176,6 +176,16 @@ static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
>   	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
>   }
>   
> +static void mt8195_scp_c1_reset_assert(struct mtk_scp *scp)
> +{
> +	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_SET);
> +}
> +
> +static void mt8195_scp_c1_reset_deassert(struct mtk_scp *scp)
> +{
> +	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_CLR);
> +}
> +
>   static void mt8183_scp_irq_handler(struct mtk_scp *scp)
>   {
>   	u32 scp_to_host;
> @@ -212,6 +222,18 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>   	}
>   }
>   
> +static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
> +{
> +	u32 scp_to_host;
> +
> +	scp_to_host = readl(scp->reg_base + MT8195_SSHUB2APMCU_IPC_SET);
> +
> +	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
> +		scp_ipi_handler(scp);
> +
> +	writel(scp_to_host, scp->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
> +}
> +
>   static irqreturn_t scp_irq_handler(int irq, void *priv)
>   {
>   	struct mtk_scp *scp = priv;
> @@ -453,6 +475,19 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
>   	return 0;
>   }
>   
> +static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
> +{
> +	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
> +
> +	/* hold SCP in reset while loading FW. */
> +	scp->data->scp_reset_assert(scp);
> +
> +	/* enable MPU for all memory regions */
> +	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
> +
> +	return 0;
> +}
> +
>   static int scp_load(struct rproc *rproc, const struct firmware *fw)
>   {
>   	struct mtk_scp *scp = rproc->priv;
> @@ -625,6 +660,15 @@ static void mt8195_scp_stop(struct mtk_scp *scp)
>   	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
>   }
>   
> +static void mt8195_scp_c1_stop(struct mtk_scp *scp)
> +{
> +	/* Power off CPU SRAM */
> +	scp_sram_power_off(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
> +
> +	/* Disable SCP watchdog */
> +	writel(0, scp->reg_base + MT8195_CORE1_WDT_CFG);
> +}
> +
>   static int scp_stop(struct rproc *rproc)
>   {
>   	struct mtk_scp *scp = rproc->priv;
> @@ -991,6 +1035,18 @@ static const struct mtk_scp_of_data mt8195_of_data = {
>   	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>   };
>   
> +static const struct mtk_scp_of_data mt8195_of_data_c1 = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8195_scp_c1_before_load,
> +	.scp_irq_handler = mt8195_scp_c1_irq_handler,
> +	.scp_reset_assert = mt8195_scp_c1_reset_assert,
> +	.scp_reset_deassert = mt8195_scp_c1_reset_deassert,
> +	.scp_stop = mt8195_scp_c1_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
> +};
> +
>   static const struct of_device_id mtk_scp_of_match[] = {
>   	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>   	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },

