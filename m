Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174FFC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:44:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87891206B8
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XX0Md+fQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6Q9EUfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87891206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=24mZ/h6S9LyW0m6q53+8c9/5dx/m5DDN+RWVcDdCNWs=; b=XX0Md+fQql1Luwop9mrZRlY+3
	9osBR58+6Cx6kpBr/NjDIlxGgCXsq4nddcG43c4STmw7+eGqv1GTtuvQDk3Zpnz60M8kZOtKrB1Ki
	2hfojkZQxorlcjBOnM8AUBl0u2chClrWVY4zv82J1KeHUdonzwa0FcsWmmOeF1KErbyTSKYi3IPpn
	CswEJNWbknWpOKPZHCZwls6UA9MUVgYiQbreSCFQ2X0r/dKv9omJ2BC66mdxItB3gBx3gIcK2mebb
	dvEUeIoscLVwesSorrCx2FGpK19MC8bQLOgIFoJrj+cZdgYYAFt8xdAFAnIhfQ0akjzuYXMux0yWO
	DLZBJ7YqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGK3v-0005si-HD; Thu, 10 Sep 2020 10:44:19 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGK3s-0005rk-AQ; Thu, 10 Sep 2020 10:44:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id q9so5155865wmj.2;
 Thu, 10 Sep 2020 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aOHr73dpDQf8/KvHagwjhuowv7yRQqFneFoh3PGbITM=;
 b=q6Q9EUfgUkDU+JAG1PhnrxhhQLvngbJ4J1HFd6Py38+r1qzQipjqBpiMaSh+yaS7Gs
 GYJUb7ocbvFg9BR7VWkRKupAOLCOiLsDJC6zR35YgUVfGVH8MXYsSpkRWs+ibXJHuIIO
 uz0SUOdv8J7Wt24LFIB8uq1RwkFCYunBIZg2+BDG4fGRkYfoFspsKkEaHViST77yQz8J
 GjIkXKXwbgdSOlElcBswKxsrO8uc5a5DKTEBWJpTn8aYgDToN8wyHcZObzHDgBWZaEKB
 sCzKremYu7MRyt3Mm60HStuOKlf6ZSLGuIOMBezuog9DNkxAoJFW7v3zEkSZYQSpmPgT
 iy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOHr73dpDQf8/KvHagwjhuowv7yRQqFneFoh3PGbITM=;
 b=DY11NWGTYYxWTJrk3j6YSDzjI6ckxshEb8Nw9R6riFU9JM0Gpb4VReLw5Kau5fSpVm
 vt6DgfPA0om8j5a7/AWdP0msf7yfXajnmzmDVhGgm1JSQqOPKjxyJ7CtsxsvY/SwI+i4
 4Bk6llwRAVRhms2RJY1zSvVwALM3qQ8KjshHlrmN50yPLtgOE8FqsbaJNK7KgzBZWZ+m
 7coZkCKRRfe6EwfCs+XQTaYxU/fUvr3LhijTRuL3jBufl+V/kGf00zGFlRz3DxVF6nk+
 hzt9TYc/WOyBwy+uhts85v7Hjov+O6usxGchrRsBK8bvAYxVa2csWPhHCBOgo/0uHz6k
 xx9w==
X-Gm-Message-State: AOAM531vPupVysM0hG1XYhGuvoMhbxNvpUMVdOf+7wAm0DV+nN10iFCG
 TCkRYSottYaC58Q19K0fI4o=
X-Google-Smtp-Source: ABdhPJzstUYCSIAFw1zbcpfYKdoKEa8qqMY49ikOW8IZMKvNF7nI/+/ZPgIR2t4NGWLpd7xlcoQg6Q==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr8261086wmm.137.1599734655104; 
 Thu, 10 Sep 2020 03:44:15 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id f1sm8452466wrt.20.2020.09.10.03.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 03:44:14 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] PCI: mediatek: Use regmap to get shared pcie-cfg
 base
To: Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
 <20200910061115.909-3-chuanjia.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b627b938-2210-16d2-1682-3c25506e30f3@gmail.com>
Date: Thu, 10 Sep 2020 12:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910061115.909-3-chuanjia.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_064416_374011_C6620AFF 
X-CRM114-Status: GOOD (  25.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/09/2020 08:11, Chuanjia Liu wrote:
> Use regmap to get shared pcie-cfg base and change
> the method to get pcie irq.
> 
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> ---
>   drivers/pci/controller/pcie-mediatek.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index cf4c18f0c25a..987845d19982 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -14,6 +14,7 @@
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/irqdomain.h>
>   #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/msi.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
> @@ -23,6 +24,7 @@
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>   #include <linux/reset.h>
>   
>   #include "../pci.h"
> @@ -205,6 +207,7 @@ struct mtk_pcie_port {
>    * struct mtk_pcie - PCIe host information
>    * @dev: pointer to PCIe device
>    * @base: IO mapped register base
> + * @cfg: IO mapped register map for PCIe config
>    * @free_ck: free-run reference clock
>    * @mem: non-prefetchable memory resource
>    * @ports: pointer to PCIe port information
> @@ -213,6 +216,7 @@ struct mtk_pcie_port {
>   struct mtk_pcie {
>   	struct device *dev;
>   	void __iomem *base;
> +	struct regmap *cfg;
>   	struct clk *free_ck;
>   
>   	struct list_head ports;
> @@ -648,7 +652,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>   		return err;
>   	}
>   
> -	port->irq = platform_get_irq(pdev, port->slot);
> +	port->irq = platform_get_irq_byname(pdev, "pcie_irq");
>   	if (port->irq < 0)
>   		return port->irq;

You will need to make sure taht the driver keeps working with the old DTS 
format. This is not the case here.

Regards,
Matthias

>   
> @@ -674,12 +678,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>   	if (!mem)
>   		return -EINVAL;
>   
> -	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
> -	if (pcie->base) {
> -		val = readl(pcie->base + PCIE_SYS_CFG_V2);
> -		val |= PCIE_CSR_LTSSM_EN(port->slot) |
> -		       PCIE_CSR_ASPM_L1_EN(port->slot);
> -		writel(val, pcie->base + PCIE_SYS_CFG_V2);
> +	/* MT7622/MT7629 platforms need to enable LTSSM and ASPM. */
> +	if (pcie->cfg) {
> +		val = PCIE_CSR_LTSSM_EN(port->slot) |
> +		      PCIE_CSR_ASPM_L1_EN(port->slot);
> +		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
>   	}
>   
>   	/* Assert all reset signals */
> @@ -983,6 +986,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>   	struct device *dev = pcie->dev;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct resource *regs;
> +	struct device_node *cfg_node;
>   	int err;
>   
>   	/* get shared registers, which are optional */
> @@ -995,6 +999,13 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>   		}
>   	}
>   
> +	cfg_node = of_parse_phandle(dev->of_node, "mediatek,pcie-cfg", 0);
> +	if (cfg_node) {
> +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> +		if (IS_ERR(pcie->cfg))
> +			return PTR_ERR(pcie->cfg);
> +	}
> +
>   	pcie->free_ck = devm_clk_get(dev, "free_ck");
>   	if (IS_ERR(pcie->free_ck)) {
>   		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
