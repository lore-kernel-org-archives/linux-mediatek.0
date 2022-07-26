Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C54C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiL7N1V14P6qUA7EWI8jEtTe1G9qlVnHH5dJdtXng+w=; b=IqSkPjfQMxy/0Du9CtaP3bDEAu
	ah+jJZ0hNWX0RIfnv4THwi74ekY03r6QP8ULQ7BV6bWzDqk2tc7e91f+hwrWPmjudePUA48P9k2Gw
	jx9V6I/pR1zSFwMKOjzFRCnRNQ9X7Wf08KNprdr7vLycNRiKoFj5AFBSC7gctgOpctMpgLfXDHKTl
	oD03lGH1+eLNd6bi2FIeHF34uDFkZHg7uCn1fdmeHfVkLMRC6Rk/XMiT53Cw+xWyi2QF6/G4e0KN/
	oegXiTTMrx4CxPa5VXMaFVlIGcq1Gq//0TPTAb0+QfdIfjsrWJ6YP3lhlpn5GLdj6F2N7bBraxPDT
	j0a/ULwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGL9-00Acm7-3o; Tue, 26 Jul 2022 08:54:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGKx-00AcUL-Eo; Tue, 26 Jul 2022 08:54:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 756A96601B15;
	Tue, 26 Jul 2022 09:54:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658825681;
	bh=1iaVgIqkvqng7ciBfQWjGnm3J+Dd5w0l/SpsumKNy98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DTWln5MH9nDgWRzFzCd03y2BUudE9Ndz+sh35jeUDme8zX5EN3n7w8MfN9OBKmYNh
	 oO55WutYJaPoDELJyyG7bhpvi5zWJDRv5pinsEpUucvps4qHt5be1SkhhVaOUn1hrr
	 x2EDbnfBaS3QCLa8BTPvrpGgnlbJMByQyhjqT6v0B5qxiek9AvWRuUUza6DJ9ZCoR7
	 4UDwdFfY9O4UW2AwPLXuNCHMv4Hibfx2MLVg09Krbiz2wsIrt+P+ktq/48vabBM/Wu
	 p/GuIT7IuWwVgg2aZl0T5RqghCFgm3xcw5hNwCK2Aj4hKqsel15UD8GhIRkblO5NXs
	 mSp1A2XYzaZbg==
Message-ID: <c923758d-b591-26bf-8091-527500ae7a6f@collabora.com>
Date: Tue, 26 Jul 2022 10:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] soc: mediatek: update power domain data of MT7623A
Content-Language: en-US
To: Chukun Pan <amadeus@jmu.edu.cn>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rex-BC Chen <rex-bc.chen@mediatek.com>
References: <20220726030621.7555-1-amadeus@jmu.edu.cn>
 <20220726030621.7555-2-amadeus@jmu.edu.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726030621.7555-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_015443_667541_CCC0814B 
X-CRM114-Status: GOOD (  18.76  )
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

Il 26/07/22 05:06, Chukun Pan ha scritto:
> When running OpenWrt on MT7623A, I receive a kernel
> warning as follows (Device dts using mt7623.dtsi):
> 
> mtk-scpsys 10006000.scpsys: Failed to power on domain mfg
> WARNING: CPU: 0 PID: 1 at drivers/soc/mediatek/mtk-scpsys.c:457 0xc04a4130
> 
> When I switch the device dts to using mt7623a.dtsi,
> the system fails to boot:
> 
> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> rcu: 0-...0: (0 ticks this GP) idle=146/1/0x40000000 softirq=53/53 fqs=1051
>   (detected by 1, t=2102 jiffies, g=-1111, q=18)
> Sending NMI from CPU 1 to CPUs 0:
> 
> Solved the problem by duplicating the power domain of
> the MT7623 (except MFG) to MT7623A, the system works
> fine without kernel warnings/errors.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Can anyone from MediaTek check if these power domains do exist on MT7623A?

Thanks,
Angelo

> ---
>   drivers/soc/mediatek/mtk-scpsys.c | 35 +++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index ca75b14931ec..8b5713db1ca3 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -910,6 +910,41 @@ static const struct scp_domain_data scp_domain_data_mt7623a[] = {
>   		.clk_id = {CLK_NONE},
>   		.caps = MTK_SCPD_ACTIVE_WAKEUP,
>   	},
> +	[MT7623A_POWER_DOMAIN_VDEC] = {
> +		.name = "vdec",
> +		.sta_mask = PWR_STATUS_VDEC,
> +		.ctl_offs = SPM_VDE_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.clk_id = {CLK_MM},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT7623A_POWER_DOMAIN_DISP] = {
> +		.name = "disp",
> +		.sta_mask = PWR_STATUS_DISP,
> +		.ctl_offs = SPM_DIS_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.clk_id = {CLK_MM},
> +		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_MM_M0,
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT7623A_POWER_DOMAIN_ISP] = {
> +		.name = "isp",
> +		.sta_mask = PWR_STATUS_ISP,
> +		.ctl_offs = SPM_ISP_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(13, 12),
> +		.clk_id = {CLK_MM},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT7623A_POWER_DOMAIN_BDP] = {
> +		.name = "bdp",
> +		.sta_mask = PWR_STATUS_BDP,
> +		.ctl_offs = SPM_BDP_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.clk_id = {CLK_NONE},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
>   };
>   
>   /*



