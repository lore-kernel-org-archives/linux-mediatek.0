Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CECDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I6UGeFEkXlgrVRY5xqOMReP5vtYTX3IPS6DCfP5Wm0=; b=RediZ5EswOODDpwqGZqR9CYE7M
	g1QcpzU6eMq03TPzOBOhVdqnonOJqRwtUFFnNYxEnfkNCYp6bFh6r1IRb1FmmQ0FZjewI/RMnKm3Q
	ZyEOR40tLpEbEixmp68f3AMvrD/CkRagrTp5pLKpu+dZHqfvZA2sjQPPyUo9lpdKxs2Wz8Mvj1PsP
	Ix6GV7dsiGRxXwe8cfA4LQZAISrGXSRZlinUXc95D7jDYpDr3Zc52dzTRPC7OmVq2Pu6giNhtyLwN
	PD31L9w6xDAz9SUE7E2C2UibbtAoJpKt9G7xUmJhDdglonv9CblyQUwynTQWogV4uHe1lUWLlNIPO
	GJqJTwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB3h-0077wC-Jz; Wed, 20 Jul 2022 14:52:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB12-0075Oq-Ga; Wed, 20 Jul 2022 14:49:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id b26so26481758wrc.2;
        Wed, 20 Jul 2022 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4I6UGeFEkXlgrVRY5xqOMReP5vtYTX3IPS6DCfP5Wm0=;
        b=VVWRB0wGYlNsUtg4p1B8eLYg4sm0YI6oz44md611lRBy1OMvzzhk5nyhWQ634GjD3d
         8wb1dNQ0NENgd8g0HwordOKrBgDyuahPegItx3bYTjw5dVsddcHbfdWTl14Pm4kTpW2L
         bwVOgku5pQfJmrkSTLNJqQagQf2Vz50EIORU7qzbfgIB46h4LmcxK9q6wpdWE/SXqA80
         nCJ0ibP38PamrHXoc0QEgfBnFfyphqn7uCsyCtKdelykgGBQDYpweeGSrUTRvz7ueH/c
         2MNz4Fy0rESoaTa6ty0irVvF6uPF8CtnJsNvMd7Z33i1K1bSAFAAKqELwCnfVqEeMkDt
         u3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4I6UGeFEkXlgrVRY5xqOMReP5vtYTX3IPS6DCfP5Wm0=;
        b=YAhl794vXe56DGvAyQkVMnS4QWbiGpkda4BKe4M0d+lSqNQ6ahKIFBs85XiOfQSgvX
         NZL6V9eVy7tURTwBWJ6qWRTXURr4LaYs6dlbl+9Y48jwsCRv6XT/2jaMRkCEme9rkjZF
         cj/x/P2SbhquYgtQqK8K8gvVXlSqU2B6+ZkMGWa6+ny1lGC7kvHT8TGU1lYhyzdy9yUC
         sQPb26CVjI2XQmdkv2Ct5D4ng4Ld2J7sOMXIapjkwzcjvbAIA9ENUmaW6ybusPK+2fym
         w9Tt2op+Nyfp9ckRZfS06lYZWLdUYB2sZ6iQiTraP2IJILbOG36lfG/ZBk3Zwp4geK2n
         udXg==
X-Gm-Message-State: AJIora/ggOoej7VJLpXUbDAZ+jpyl0TKbwDCT38h0CQoRzaL0e7AbNmO
	IxIHbt6yAY+ILm9bSIwEeec=
X-Google-Smtp-Source: AGRyM1uxA0vAoOO3DxL7mUqYJD7JvPh957H84Ju9Sj/3ppHLAtfCS67+3bV9HouPx/uKchBISOJ1YA==
X-Received: by 2002:a05:6000:1091:b0:21e:3d13:283d with SMTP id y17-20020a056000109100b0021e3d13283dmr6541589wrw.376.1658328570279;
        Wed, 20 Jul 2022 07:49:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe0c9000000b0021e40f9f47csm3987821wri.5.2022.07.20.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 07:49:29 -0700 (PDT)
Message-ID: <02ccc8a9-083b-9076-bbf1-5882b9bc04bc@gmail.com>
Date: Wed, 20 Jul 2022 16:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: mediatek: mt8195-infra_ao: Set pwrmcu clocks as
 critical
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, wenst@chromium.org, chun-jie.chen@mediatek.com,
 miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220719093316.37253-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220719093316.37253-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074932_627459_6A15446C 
X-CRM114-Status: GOOD (  18.07  )
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



On 19/07/2022 11:33, AngeloGioacchino Del Regno wrote:
> The pwrmcu is responsible for power management and idle states in SSPM:
> on older SoCs this was managed in Linux drivers like sspm/mcupm/eemgpu
> but, at least on MT8195, this functionality was transferred to the ATF
> firmware.
> For this reason, turning off the pwrmcu related clocks from the kernel
> will lead to unability to resume the platform after suspend and other
> currently unknown PM related side-effects.
> 
> Set the PWRMCU and PWRMCU_BUS_H clocks as critical to prevent the
> kernel from turning them off, fixing the aforementioned issue.
> 
> Fixes: e2edf59dec0b ("clk: mediatek: Add MT8195 infrastructure clock support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt8195-infra_ao.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> index ce7ac16a2f42..75b54ec9c46c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> @@ -55,8 +55,12 @@ static const struct mtk_gate_regs infra_ao4_cg_regs = {
>   #define GATE_INFRA_AO1(_id, _name, _parent, _shift)	\
>   	GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, 0)
>   
> +#define GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, _flag)	\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao2_cg_regs, _shift,	\
> +		       &mtk_clk_gate_ops_setclr, _flag)
> +
>   #define GATE_INFRA_AO2(_id, _name, _parent, _shift)			\
> -	GATE_MTK(_id, _name, _parent, &infra_ao2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +	GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, 0)
>   
>   #define GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, _flag)		\
>   	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao3_cg_regs, _shift,	\
> @@ -136,8 +140,11 @@ static const struct mtk_gate infra_ao_clks[] = {
>   	GATE_INFRA_AO2(CLK_INFRA_AO_UNIPRO_SYS, "infra_ao_unipro_sys", "top_ufs", 11),
>   	GATE_INFRA_AO2(CLK_INFRA_AO_UNIPRO_TICK, "infra_ao_unipro_tick", "top_ufs_tick1us", 12),
>   	GATE_INFRA_AO2(CLK_INFRA_AO_UFS_MP_SAP_B, "infra_ao_ufs_mp_sap_b", "top_ufs_mp_sap_cfg", 13),
> -	GATE_INFRA_AO2(CLK_INFRA_AO_PWRMCU, "infra_ao_pwrmcu", "top_pwrmcu", 15),
> -	GATE_INFRA_AO2(CLK_INFRA_AO_PWRMCU_BUS_H, "infra_ao_pwrmcu_bus_h", "top_axi", 17),
> +	/* pwrmcu is used by ATF for platform PM: clocks must never be disabled by the kernel */
> +	GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_PWRMCU, "infra_ao_pwrmcu", "top_pwrmcu", 15,
> +			     CLK_IS_CRITICAL),
> +	GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_PWRMCU_BUS_H, "infra_ao_pwrmcu_bus_h", "top_axi", 17,
> +			     CLK_IS_CRITICAL),
>   	GATE_INFRA_AO2(CLK_INFRA_AO_APDMA_B, "infra_ao_apdma_b", "top_axi", 18),
>   	GATE_INFRA_AO2(CLK_INFRA_AO_SPI4, "infra_ao_spi4", "top_spi", 25),
>   	GATE_INFRA_AO2(CLK_INFRA_AO_SPI5, "infra_ao_spi5", "top_spi", 26),

