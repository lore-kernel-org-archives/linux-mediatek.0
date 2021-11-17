Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3733D60FED
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3733D60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4hIQIxZtYewFxmm8tMeTbcOmjmI8x3WhBfx8b9uHhM=; b=KPHvo7Pw74T8ua
	h44WZYr+N/rLOpuV8E6HA3FqFmxArZ1CKYaX2cHsHJV7dtgvSnysk69pOr+3TQd/lAYq//xIKVz+i
	hUbyREleA5fqD2no990btbUDe8MD2rPsg3lwRdoRuOF7R5pDRrYMPet66TvQzD7awSdq1rq0YRo4r
	8IPtvr/4qACPB0Yna9NVQLOGlowOt3cv3MZia3SBJNL+0bnHDR3LS83tVNfCn6OhcJ8FiBZpfm1A7
	TqWAXGc+nF6V0hbinMGQltduyijScOXVIaqWx8Xt5dmpr0mghPFEISQDJEPAm+2eMrg7kTBc79Y/F
	Dzi+L2XXApeabnNHLL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPBG-005zJW-3X; Wed, 17 Nov 2021 17:57:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOwO-005tsC-Vh; Wed, 17 Nov 2021 17:41:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2724682wmb.5; 
 Wed, 17 Nov 2021 09:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BCfxE88dMmtTmPlUzg3IUvh5ugr7FFULc+8pak8LPb0=;
 b=BCm14ce8Vs0eMVI2gdWtYiQECnj71bGwZWcZJpS9BGKFv5+AxNXFXsOR2bs/s2zdKe
 tvuCl5X694tuo9H4oux1UvAseKDkQf0KcVDRROimIHDNAn/ycPxHLm2Vui7/487H4gWc
 sHUdKDk6Lknnr6BENrDbJzTjllK1Swc0RtQW88FEji6BLfBad/9SbRDImkuO/yxjP5gh
 8OEwDYstnbfQ5dX86MISHfO2bXi1ip4OuplO0DHS8AOQ+Rxr0qsbfXfTE5AjW0uh12jj
 bB1Hp3h6jbYJ2G3ilFvHJohUBWmhDPEWy436si26Zx3W4pqjb4BQlR/j6fUb3Wp6fHM2
 3toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BCfxE88dMmtTmPlUzg3IUvh5ugr7FFULc+8pak8LPb0=;
 b=A/tkhDEN3kyXR8YioV+9L9X8IXsoUg02PSHKuBF77xdXzaPk2moCtdQ1yITQsk2YHp
 NQzm7od61xgI1CPhjVeBD5XLdznfOBUunfZLTwtDcMH0dlBQe5vwYqWbLqq0chwfuQlk
 Skl9OhNA70wFHFFY7QDY4cfz0Qz2DDr8RL2eQPakTCvTEzCaZCfoymKw2uwSTn3NsKJR
 GczlY0Co4Yv/0X+sSt6spsWD1q4ttyYSNH1iTtTO1KsOImVfHbk3GtMmvduSINeHbG9l
 qiZnQS6g9Icl784ZTtEgGz98EyhcArTX/o0Dvc7StwM3j1gN6OmUaOrpxr2MppJDpExT
 sg7Q==
X-Gm-Message-State: AOAM532vZy4RlImqNWDLFntjv0m58uu/pvv8MGw/HdEms24WiL//znf6
 kry8OTgZIelccv8MOc+E1IY=
X-Google-Smtp-Source: ABdhPJyAsGQK5QkuZFkT7fxQC65+3O/kbaaiGA/+ggsHKzLUwmDhpHaIPb1hpBjY9lHUv2mU/mTPLw==
X-Received: by 2002:a1c:5414:: with SMTP id i20mr1676633wmb.88.1637170907592; 
 Wed, 17 Nov 2021 09:41:47 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id p12sm724836wrr.10.2021.11.17.09.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:41:47 -0800 (PST)
Message-ID: <c3630f7f-fb3d-6018-c12a-535e891d535a@gmail.com>
Date: Wed, 17 Nov 2021 18:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Disable DVFSRC voltage request
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 qizhong.cheng@mediatek.com, Ryan-JH.Yu@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>
References: <20211015063602.29058-1-jianjun.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211015063602.29058-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_094149_080638_6C2EAEF8 
X-CRM114-Status: GOOD (  19.08  )
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



On 15/10/2021 08:36, Jianjun Wang wrote:
> When the DVFSRC (dynamic voltage and frequency scaling resource collector)
> feature is not implemented, the PCIe hardware will assert a voltage request
> signal when exit from the L1 PM Substates to request a specific Vcore
> voltage, but cannot receive the voltage ready signal, which will cause
> the link to fail to exit the L1 PM Substates.
> 
> Disable DVFSRC voltage request by default, we need to find a common way to
> enable it in the future.
> 
> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f3aeb8d4eaca..79fb12fca6a9 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -79,6 +79,9 @@
>   #define PCIE_ICMD_PM_REG		0x198
>   #define PCIE_TURN_OFF_LINK		BIT(4)
>   
> +#define PCIE_MISC_CTRL_REG		0x348
> +#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
> +
>   #define PCIE_TRANS_TABLE_BASE_REG	0x800
>   #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
>   #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> @@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>   	val &= ~PCIE_INTX_ENABLE;
>   	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
>   
> +	/* Disable DVFSRC voltage request */
> +	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
> +	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> +	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
> +
>   	/* Assert all reset signals */
>   	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
>   	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
