Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB90E9D41E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Feb 2026 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmnL809AcP5kG1n3ddE5uCdr4+hPrc8W8jMbdaYCzVk=; b=14w7uADHQDIzoMzLcnCOifwxoB
	RFDcUv9EVxcDlc5bvuhLbwi/PcBZJ4Be+g3M3X4vpFWp3u5do99WDdoXqxPCZQ7feG7ZRexf/0z8m
	1AM+AtOU2MMpSSsqaBnfBznff2+KJljTPOR2Pz+2nJPBJ85AOL1L0zMKr6d7/U7bRnfcsP0/6fTNB
	WcXHnijb/iDnCGm93VntuQQxN8eTzF0YW8D2C4dQCyL48F9cAYo/6ZxX8m0rDzhTLoF36tO69CQ3b
	7rMIi0jLCRRazKhNFqFdR7dBEHWTI6vNvQ70Ra5oaX9H5gpsRqbh8Mi0rW3UYAH5p+rpcyrl4gDPb
	oUoqYiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngyS-00000008sjg-0cff;
	Wed, 04 Feb 2026 17:47:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngyP-00000008siI-2Lxd
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Feb 2026 17:47:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so107651f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Feb 2026 09:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227248; x=1770832048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LmnL809AcP5kG1n3ddE5uCdr4+hPrc8W8jMbdaYCzVk=;
        b=RuERZnHjW6WmmFLBXtKRaV63OqeCYMcM/sPpNdknfS4cZo0fyyblcU21LZdjQ7N/eQ
         iYNFT382wv311OdfAfHH+51qpNhVkzTsc5Ed+rlimkuw6CXtWMfoBKSrRAqdZayQztJ7
         QoCL1S6d5Bm6VyG6El8HHriDRLENqzwa6xNgJflZvimFvlZs33WNRjrESKkl+5uO9r9n
         gAFo8bM0tPRFcakueo1nKS3Yyo94VA1wjo+8sb5lakguIDX1Ay51rFXmBJLMVRxkTAcX
         DM06BpJw1rv9j5SdJdHecxDQb5pwpG9VMcjefWij1oHq2/Syd4BNFjzk0A5kphUCHhSd
         +R6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227248; x=1770832048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmnL809AcP5kG1n3ddE5uCdr4+hPrc8W8jMbdaYCzVk=;
        b=ssTzmu9687lgrsuP2dfiL2s77VAbwV2B3rSNNvyPx6KDzHS5hmN5EhZvE4F0xi3eRX
         Dgtf+pEJKg/l99AEEacV5n31fUHZGhVFDHj9rCNFrnHdh4/uoYZ4jgMQ2r7Y+nXaOfvv
         Gg86IyLcNTYTj5OXeoIMFWitrQLyqKsN4YiWlUlWPjuiCSOGLVMh6wR/XuaiWFHVCIhi
         GBULxpXeB8nUXeik0C97hMW6EX4Ba806+E+qJZ2O6vU/++3cdGe+2GyZwL0tv1kRPq22
         HJzMeEBiE/9apaNyJpz/0wnQb3hh5eL6MkSQPL/gNie1u+7HXobvJiTOuhIbUA/9PFAP
         Jy1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0xmMydtQOnnpY2SzlO/9YMLnfqF6pAZLqVMB1a/ct9tYapWYi0YYj4VwaZjsrClCpecIomSFIKP/NVkRAcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YycK9kOqDWhG+D3SCOTZGFewqK++sNS5NMyMMti8J3rfPhulk/6
	KBTKjr2R1gLk1quL881BIMUfJSShEO59k8YgnwN+TsUugYy0hhXdGcMa
X-Gm-Gg: AZuq6aK2mrszfYFkSJQO4OQqfzJxtjlwMb85Ndfr9EdJSoEAknOhSWBmxiw158HXd3b
	QqZz0GKVg+/Piwxvujy/4Kx0coc6CWdZs4Pr1NpDxnUKlhD+3MgQGI2BXYA3H0JRkh9f5TeCaxj
	yRw7gSlFTmchQ/ZEhSVRWHw89/NIByqk/+itwbxh6jWSkpPOwDlMcwWceSWgQQyAtLHVSy56mNW
	gJbdVvFGsO2osGG5dB04jZ0VWYAoOtvfXtD+jtgMfdFYp//dvteGxKCSXHhLkj6B7kDYGAYRnQo
	W/vP3MXDXw2aEUD5/V/UxWojPswzBzO0VUVWPhDefggyU4ZwyvjVKXjAHpOqSnHpXhlrhY8rPlU
	h8MUZZHiKikbEwgIQKavPs3rBzzD3SLVoB4o0LdN6Wvz2rs/vvSGV8WxmMkRkbh30uJ2+q3vVmY
	CUgft1w13prciHQtQn1pkWu4PK40VtT3hJxXMDY7yPzFGzzMnRtAxh6+h0hcAQ
X-Received: by 2002:a05:6000:230f:b0:435:b7ca:7521 with SMTP id ffacd0b85a97d-43617e41ef4mr6015696f8f.15.1770227247485;
        Wed, 04 Feb 2026 09:47:27 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e250b2sm8813826f8f.8.2026.02.04.09.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:47:26 -0800 (PST)
Message-ID: <7324306f-16cd-4a2c-8b4d-0bf65129acd3@gmail.com>
Date: Wed, 4 Feb 2026 18:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-4-irving-ch.lin@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094729_774697_70687187 
X-CRM114-Status: GOOD (  17.51  )
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



On 02/02/2026 07:48, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Introduce a new power domain (pmd) driver for the MediaTek mt8189 SoC.
> This driver ports and refines the power domain framework, dividing
> hardware blocks (CPU, GPU, peripherals, etc.) into independent power
> domains for precise and energy-efficient power management.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mt8189-pm-domains.h | 485 ++++++++++++++++++
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>   2 files changed, 490 insertions(+)
>   create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
> 
> diff --git a/drivers/pmdomain/mediatek/mt8189-pm-domains.h b/drivers/pmdomain/mediatek/mt8189-pm-domains.h
> new file mode 100644
> index 000000000000..c28b9460c074
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mt8189-pm-domains.h
> @@ -0,0 +1,485 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Qiqi Wang <qiqi.wang@mediatek.com>
> + */
> +
> +#ifndef __SOC_MEDIATEK_MT8189_PM_DOMAINS_H
> +#define __SOC_MEDIATEK_MT8189_PM_DOMAINS_H
> +
> +#include "mtk-pm-domains.h"
> +#include <dt-bindings/power/mediatek,mt8189-power.h>
> +
> +/*
> + * MT8189 power domain support
> + */
> +
> +#define MT8189_SPM_PWR_STATUS				0x0f40
> +#define MT8189_SPM_PWR_STATUS_2ND			0x0f44
> +#define MT8189_SPM_PWR_STATUS_MSB			0x0f48
> +#define MT8189_SPM_PWR_STATUS_MSB_2ND			0x0f4c
> +#define MT8189_SPM_XPU_PWR_STATUS			0x0f50
> +#define MT8189_SPM_XPU_PWR_STATUS_2ND			0x0f54
> +
> +#define MT8189_PROT_EN_EMICFG_GALS_SLP_SET		0x0084
> +#define MT8189_PROT_EN_EMICFG_GALS_SLP_CLR		0x0088
> +#define MT8189_PROT_EN_EMICFG_GALS_SLP_RDY		0x008c
> +#define MT8189_PROT_EN_MMSYS_STA_0_SET			0x0c14
> +#define MT8189_PROT_EN_MMSYS_STA_0_CLR			0x0c18
> +#define MT8189_PROT_EN_MMSYS_STA_0_RDY			0x0c1c
> +#define MT8189_PROT_EN_MMSYS_STA_1_SET			0x0c24
> +#define MT8189_PROT_EN_MMSYS_STA_1_CLR			0x0c28
> +#define MT8189_PROT_EN_MMSYS_STA_1_RDY			0x0c2c
> +#define MT8189_PROT_EN_INFRASYS_STA_0_SET		0x0c44
> +#define MT8189_PROT_EN_INFRASYS_STA_0_CLR		0x0c48
> +#define MT8189_PROT_EN_INFRASYS_STA_0_RDY		0x0c4c
> +#define MT8189_PROT_EN_INFRASYS_STA_1_SET		0x0c54
> +#define MT8189_PROT_EN_INFRASYS_STA_1_CLR		0x0c58
> +#define MT8189_PROT_EN_INFRASYS_STA_1_RDY		0x0c5c
> +#define MT8189_PROT_EN_PERISYS_STA_0_SET		0x0c84
> +#define MT8189_PROT_EN_PERISYS_STA_0_CLR		0x0c88
> +#define MT8189_PROT_EN_PERISYS_STA_0_RDY		0x0c8c
> +#define MT8189_PROT_EN_MCU_STA_0_SET			0x0c94
> +#define MT8189_PROT_EN_MCU_STA_0_CLR			0x0c98
> +#define MT8189_PROT_EN_MCU_STA_0_RDY			0x0c9c
> +#define MT8189_PROT_EN_MD_STA_0_SET			0x0ca4
> +#define MT8189_PROT_EN_MD_STA_0_CLR			0x0ca8
> +#define MT8189_PROT_EN_MD_STA_0_RDY			0x0cac
> +
> +#define MT8189_PROT_EN_EMISYS_STA_0_MM_INFRA		(GENMASK(21, 20))
> +#define MT8189_PROT_EN_INFRASYS_STA_0_CONN		(BIT(8))
> +#define MT8189_PROT_EN_INFRASYS_STA_1_CONN		(BIT(12))
> +#define MT8189_PROT_EN_INFRASYS_STA_0_MM_INFRA		(BIT(16))
> +#define MT8189_PROT_EN_INFRASYS_STA_1_MM_INFRA		(BIT(11))
> +#define MT8189_PROT_EN_INFRASYS_STA_1_MFG1		(BIT(20))
> +#define MT8189_PROT_EN_MCU_STA_0_CONN			(BIT(1))
> +#define MT8189_PROT_EN_MCU_STA_0_CONN_2ND		(BIT(0))
> +#define MT8189_PROT_EN_MD_STA_0_MFG1			(BIT(0) | BIT(2))
> +#define MT8189_PROT_EN_MD_STA_0_MFG1_2ND		(BIT(4))
> +#define MT8189_PROT_EN_MM_INFRA_IGN			(BIT(1))
> +#define MT8189_PROT_EN_MM_INFRA_2_IGN			(BIT(0))
> +#define MT8189_PROT_EN_MMSYS_STA_0_CAM_MAIN		(GENMASK(31, 30))
> +#define MT8189_PROT_EN_MMSYS_STA_1_CAM_MAIN		(GENMASK(10, 9))
> +#define MT8189_PROT_EN_MMSYS_STA_0_DISP			(GENMASK(1, 0))
> +#define MT8189_PROT_EN_MMSYS_STA_0_ISP_IMG1		(BIT(3))
> +#define MT8189_PROT_EN_MMSYS_STA_1_ISP_IMG1		(BIT(7))
> +#define MT8189_PROT_EN_MMSYS_STA_0_ISP_IPE		(BIT(2))
> +#define MT8189_PROT_EN_MMSYS_STA_1_ISP_IPE		(BIT(8))
> +#define MT8189_PROT_EN_MMSYS_STA_0_MDP0			(BIT(18))
> +#define MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA		(GENMASK(3, 2))
> +#define MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA_2ND		(GENMASK(15, 7))
> +#define MT8189_PROT_EN_MMSYS_STA_0_VDE0			(BIT(20))
> +#define MT8189_PROT_EN_MMSYS_STA_1_VDE0			(BIT(13))
> +#define MT8189_PROT_EN_MMSYS_STA_0_VEN0			(BIT(12))
> +#define MT8189_PROT_EN_MMSYS_STA_1_VEN0			(BIT(12))
> +#define MT8189_PROT_EN_PERISYS_STA_0_AUDIO		(BIT(6))
> +#define MT8189_PROT_EN_PERISYS_STA_0_SSUSB		(BIT(7))
> +#define MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1		(GENMASK(5, 4))
> +
> +static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8189[] = {
> +	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI
> +};
> +
> +static const struct scpsys_domain_data scpsys_domain_data_mt8189[] = {
> +	[MT8189_POWER_DOMAIN_CONN] = {
> +		.name = "conn",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0xe04,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MCU_STA_0_CONN,
> +					MT8189_PROT_EN_MCU_STA_0_SET,
> +					MT8189_PROT_EN_MCU_STA_0_CLR,
> +					MT8189_PROT_EN_MCU_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_INFRASYS_STA_1_CONN,
> +					MT8189_PROT_EN_INFRASYS_STA_1_SET,
> +					MT8189_PROT_EN_INFRASYS_STA_1_CLR,
> +					MT8189_PROT_EN_INFRASYS_STA_1_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MCU_STA_0_CONN_2ND,
> +					MT8189_PROT_EN_MCU_STA_0_SET,
> +					MT8189_PROT_EN_MCU_STA_0_CLR,
> +					MT8189_PROT_EN_MCU_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_INFRASYS_STA_0_CONN,
> +					MT8189_PROT_EN_INFRASYS_STA_0_SET,
> +					MT8189_PROT_EN_INFRASYS_STA_0_CLR,
> +					MT8189_PROT_EN_INFRASYS_STA_0_RDY),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_AUDIO] = {
> +		.name = "audio",
> +		.sta_mask = BIT(6),
> +		.ctl_offs = 0xe18,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_PERISYS_STA_0_AUDIO,
> +					MT8189_PROT_EN_PERISYS_STA_0_SET,
> +					MT8189_PROT_EN_PERISYS_STA_0_CLR,
> +					MT8189_PROT_EN_PERISYS_STA_0_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_ADSP_TOP_DORMANT] = {
> +		.name = "adsp-top-dormant",
> +		.sta_mask = BIT(7),
> +		.ctl_offs = 0xe1c,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(9),
> +		.sram_pdn_ack_bits = BIT(13),
> +		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_SRAM_PDN_INVERTED |
> +			MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_ADSP_INFRA] = {
> +		.name = "adsp-infra",
> +		.sta_mask = BIT(8),
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.ctl_offs = 0xe20,
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_ADSP_AO] = {
> +		.name = "adsp-ao",
> +		.sta_mask = BIT(9),
> +		.ctl_offs = 0xe24,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +	},
> +	[MT8189_POWER_DOMAIN_ISP_IMG1] = {
> +		.name = "isp-img1",
> +		.sta_mask = BIT(10),
> +		.ctl_offs = 0xe28,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_ISP_IMG1,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_ISP_IMG1,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_ISP_IMG2] = {
> +		.name = "isp-img2",
> +		.sta_mask = BIT(11),
> +		.ctl_offs = 0xe2c,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_ISP_IPE] = {
> +		.name = "isp-ipe",
> +		.sta_mask = BIT(12),
> +		.ctl_offs = 0xe30,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_ISP_IPE,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_ISP_IPE,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_VDE0] = {
> +		.name = "vde0",
> +		.sta_mask = BIT(14),
> +		.ctl_offs = 0xe38,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_VDE0,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_VDE0,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_VEN0] = {
> +		.name = "ven0",
> +		.sta_mask = BIT(16),
> +		.ctl_offs = 0xe40,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_VEN0,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_VEN0,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_CAM_MAIN] = {
> +		.name = "cam-main",
> +		.sta_mask = BIT(18),
> +		.ctl_offs = 0xe48,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_CAM_MAIN,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_CAM_MAIN,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_CAM_SUBA] = {
> +		.name = "cam-suba",
> +		.sta_mask = BIT(20),
> +		.ctl_offs = 0xe50,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_CAM_SUBB] = {
> +		.name = "cam-subb",
> +		.sta_mask = BIT(21),
> +		.ctl_offs = 0xe54,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_MDP0] = {
> +		.name = "mdp0",
> +		.sta_mask = BIT(26),
> +		.ctl_offs = 0xe68,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_MDP0,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_DISP] = {
> +		.name = "disp",
> +		.sta_mask = BIT(28),
> +		.ctl_offs = 0xe70,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_0_DISP,
> +					MT8189_PROT_EN_MMSYS_STA_0_SET,
> +					MT8189_PROT_EN_MMSYS_STA_0_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_0_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_MM_INFRA] = {
> +		.name = "mm-infra",
> +		.sta_mask = BIT(30),
> +		.ctl_offs = 0xe78,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MMSYS_STA_1_MM_INFRA_2ND,
> +					MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +			BUS_PROT_WR_IGN_SUBCLK(INFRA,
> +					       MT8189_PROT_EN_MM_INFRA_IGN,
> +					       MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					       MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					       MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +			BUS_PROT_WR_IGN_SUBCLK(INFRA,
> +					       MT8189_PROT_EN_MM_INFRA_2_IGN,
> +					       MT8189_PROT_EN_MMSYS_STA_1_SET,
> +					       MT8189_PROT_EN_MMSYS_STA_1_CLR,
> +					       MT8189_PROT_EN_MMSYS_STA_1_RDY),
> +		},
> +	},
> +	[MT8189_POWER_DOMAIN_DP_TX] = {
> +		.name = "dp-tx",
> +		.sta_mask = BIT(0),
> +		.ctl_offs = 0xe80,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +	},
> +	[MT8189_POWER_DOMAIN_CSI_RX] = {
> +		.name = "csi-rx",
> +		.sta_mask = BIT(7),
> +		.ctl_offs = 0xe9c,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8189_POWER_DOMAIN_SSUSB] = {
> +		.name = "ssusb",
> +		.sta_mask = BIT(10),
> +		.ctl_offs = 0xea8,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_PERISYS_STA_0_SSUSB,
> +					MT8189_PROT_EN_PERISYS_STA_0_SET,
> +					MT8189_PROT_EN_PERISYS_STA_0_CLR,
> +					MT8189_PROT_EN_PERISYS_STA_0_RDY),
> +		},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8189_POWER_DOMAIN_MFG0] = {
> +		.name = "mfg0",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0xeb4,
> +		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
> +		.caps = MTK_SCPD_DOMAIN_SUPPLY,
> +	},
> +	[MT8189_POWER_DOMAIN_MFG1] = {
> +		.name = "mfg1",
> +		.sta_mask = BIT(2),
> +		.ctl_offs = 0xeb8,
> +		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_cfg = {
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_INFRASYS_STA_1_MFG1,
> +					MT8189_PROT_EN_INFRASYS_STA_1_SET,
> +					MT8189_PROT_EN_INFRASYS_STA_1_CLR,
> +					MT8189_PROT_EN_INFRASYS_STA_1_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MD_STA_0_MFG1,
> +					MT8189_PROT_EN_MD_STA_0_SET,
> +					MT8189_PROT_EN_MD_STA_0_CLR,
> +					MT8189_PROT_EN_MD_STA_0_RDY),
> +			BUS_PROT_WR_IGN(INFRA,
> +					MT8189_PROT_EN_MD_STA_0_MFG1_2ND,
> +					MT8189_PROT_EN_MD_STA_0_SET,
> +					MT8189_PROT_EN_MD_STA_0_CLR,
> +					MT8189_PROT_EN_MD_STA_0_RDY),
> +			BUS_PROT_WR_IGN(SMI,
> +					MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1,
> +					MT8189_PROT_EN_EMICFG_GALS_SLP_SET,
> +					MT8189_PROT_EN_EMICFG_GALS_SLP_CLR,
> +					MT8189_PROT_EN_EMICFG_GALS_SLP_RDY),
> +		},
> +		.caps = MTK_SCPD_DOMAIN_SUPPLY,
> +	},
> +	[MT8189_POWER_DOMAIN_MFG2] = {
> +		.name = "mfg2",
> +		.sta_mask = BIT(3),
> +		.ctl_offs = 0xebc,
> +		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +	},
> +	[MT8189_POWER_DOMAIN_MFG3] = {
> +		.name = "mfg3",
> +		.sta_mask = BIT(4),
> +		.ctl_offs = 0xec0,
> +		.pwr_sta_offs = MT8189_SPM_XPU_PWR_STATUS,
> +		.pwr_sta2nd_offs = MT8189_SPM_XPU_PWR_STATUS_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +	},
> +	[MT8189_POWER_DOMAIN_EDP_TX_DORMANT] = {
> +		.name = "edp-tx-dormant",
> +		.sta_mask = BIT(12),
> +		.ctl_offs = 0xf70,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +		.sram_pdn_bits = BIT(9),
> +		.sram_pdn_ack_bits = 0,
> +		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_SRAM_PDN_INVERTED,
> +	},
> +	[MT8189_POWER_DOMAIN_PCIE] = {
> +		.name = "pcie",
> +		.sta_mask = BIT(13),
> +		.ctl_offs = 0xf74,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8189_POWER_DOMAIN_PCIE_PHY] = {
> +		.name = "pcie-phy",
> +		.sta_mask = BIT(14),
> +		.ctl_offs = 0xf78,
> +		.pwr_sta_offs = MT8189_SPM_PWR_STATUS_MSB,
> +		.pwr_sta2nd_offs = MT8189_SPM_PWR_STATUS_MSB_2ND,
> +	},
> +};
> +
> +static const struct scpsys_soc_data mt8189_scpsys_data = {
> +	.domains_data = scpsys_domain_data_mt8189,
> +	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8189),
> +	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8189,
> +	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8189),
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8189_PM_DOMAINS_H */
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 3eeb0dabf7d7..58648f4f689b 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -26,6 +26,7 @@
>   #include "mt8183-pm-domains.h"
>   #include "mt8186-pm-domains.h"
>   #include "mt8188-pm-domains.h"
> +#include "mt8189-pm-domains.h"
>   #include "mt8192-pm-domains.h"
>   #include "mt8195-pm-domains.h"
>   #include "mt8196-pm-domains.h"
> @@ -1171,6 +1172,10 @@ static const struct of_device_id scpsys_of_match[] = {
>   		.compatible = "mediatek,mt8188-power-controller",
>   		.data = &mt8188_scpsys_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8189-power-controller",
> +		.data = &mt8189_scpsys_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8192-power-controller",
>   		.data = &mt8192_scpsys_data,


