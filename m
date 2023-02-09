Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19342C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTiiOLww2H2qU6H3Gb9A+bRYep9nVjssyjgIVJEAYZA=; b=FpJ1177uXclrjmTk2zzXhOw1Uc
	qGJ47nfAdpQsli6wskFrKLgiXdFofSOXu5vYOCczM5Q8csxCJuqyow6E0caTa3TB0wijO2Qr9W532
	DfnK7Zs7B1Q9rVPuxu2bqAeYIAM43lerxaKmI7l37GZL5LFaND8tx+X/+r4im6rIxrdVcfEoCQ5kU
	Y1Xva+k4WAtBluoaKdTOgm0WLlZlfDvOO1aBPXLUGKGEEnDnMTQvV60KHttvTg5T2TKULl4mVYVZl
	I69azrpjYiRupDUDvm+ANgjdWB2fMPC92SQ0ZVpxg1QJIMcs3h4zUrAzIpDEhn0NU5jrOS0iGeyHj
	3AjhZXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6MQ-001Ydk-Ld; Thu, 09 Feb 2023 12:49:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6MF-001YbO-U4; Thu, 09 Feb 2023 12:49:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B58DE66020C1;
	Thu,  9 Feb 2023 12:48:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675946938;
	bh=WIeAtzp/L0JbuRqFiBgonx+z+AnLyNZgpaAp7pibERE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JW2RNBxz7CoiZuLvoGyrMCcIEQV0ybAtjZQSn6JgNbhoS5FUKoiSoe4nhhP0S27dz
	 0EU6s0JDCImnCpox9hqLOsXR1sJunGIbnDiD0QiBIY++rVOXlxinYdkiOW2TcZJL3T
	 0kduMSYiHv+9BVQPj31es1bOLypbx27GBdQZ2i3M1jh903LuM1iir0GlsjgrRl3c3b
	 mQ0g8Qs0eaPNrwQabXcYucwPLNB5j8KGqvA+4nheccQBj4+e0S/vb1jCYL1pRTTwkL
	 JLgd/KuJ2V6TViNkYe5BrTAfaUUA3tFpLW3A/Yh/JxNbI0GrhQOIy8jsL6wFfTx5yv
	 DxFgqzCqX3//A==
Message-ID: <5c677b40-7bbd-5d69-9f9b-4879c8aeddf8@collabora.com>
Date: Thu, 9 Feb 2023 13:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/12] remoteproc: mediatek: Handle MT8195 SCP core 1
 watchdog timeout
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
 <20230209074021.13936-11-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209074021.13936-11-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_044900_129377_D832D1FA 
X-CRM114-Status: GOOD (  21.49  )
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

Il 09/02/23 08:40, Tinghan Shen ha scritto:
> The MT8195 SCP core 1 watchdog timeout needs to be handled in the
> SCP core 0 IRQ handler because the MT8195 SCP core 1 watchdog timeout
> IRQ is wired on the same IRQ entry for core 0 watchdog timeout.
> MT8195 SCP has a watchdog status register to identify the watchdog
> timeout source when IRQ triggered.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |  4 ++++
>   drivers/remoteproc/mtk_scp.c    | 24 +++++++++++++++++++++++-
>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index e4ef97f2d3a1..ca2395b98d27 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -55,6 +55,10 @@
>   #define MT8192_CORE0_WDT_IRQ		0x10030
>   #define MT8192_CORE0_WDT_CFG		0x10034
>   
> +#define MT8195_SYS_STATUS		0x4004
> +#define MT8195_CORE0_WDT		BIT(16)
> +#define MT8195_CORE1_WDT		BIT(17)
> +
>   #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>   
>   #define MT8195_CPU1_SRAM_PD			0x1084
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index cfcb719ba50b..9fbbc4751433 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -222,6 +222,28 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>   	}
>   }
>   
> +static void mt8195_scp_irq_handler(struct mtk_scp *scp)

Looking at the C1 interrupt handler, I don't see any WDT timeout handling, hence
a question naturally arises:

Would it ever be possible for *both* CORE0 and CORE1 WDT timeout to happen
at the same time?

Meaning that MT8195_SYS_STATUS has *both* CORE0_WDT and CORE1_WDT bits set when
we reach this interrupt handler?
In that case, the fix would be to just change....

> +{
> +	u32 scp_to_host;
> +
> +	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
> +
> +	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
> +		scp_ipi_handler(scp);
> +	} else {
> +		u32 reason = readl(scp->reg_base + MT8195_SYS_STATUS);
> +
> +		if (reason & MT8195_CORE1_WDT)
> +			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
> +		else

...the 'else' to another conditional :-)

Regards,
Angelo



