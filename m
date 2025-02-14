Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF33C021A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=; b=CLpnSAql/gc0jooV+6ozrItNaV
	B2VtBznfXTECiuKLFzI031m8/gTChdh8X5fYY9ham7Bhf0eMjK76y2lcpUWrm3jAdJ8jrg7d4yDmM
	aZryXAhtGOj8beRiMUCVdt2OoFmr3SevO1Ad57jXSoqo2BeVD9+WPmNXD+l59ZR48f+sy5hf5uoOZ
	xneTBenk0Cq2w8ezEI3za6PN/u2VpaQK9azRAz88JBPdV3tERC4T/KAvWh8eg+OgE22uR7H23uffR
	1FfF2e91msGEo1nBaTvZvkBFIIWrjnZ9aDEFMFRsNG24648oAfQ9907VbB++vfQouKUtn4ZY5rlAu
	wjOEuUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizkj-0000000Fli6-3p6b;
	Fri, 14 Feb 2025 17:45:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizDm-0000000Fdr7-2AFr
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Feb 2025 17:11:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220c8f38febso43547305ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2025 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739553081; x=1740157881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=;
        b=CWC3kv9zsxUGcKssTUlDsAerVwTFX/91bFuqN17afQppRAAWpHq71nbjZGArnx72g1
         tZ2ZTSF36yXjMIZplVgiHLAha/utBodAP0UuMBJsuGn5e1dxHeeYsfTzeZoCH1FJo2/Y
         YWA5gcDU+k3RBM31WCpg/EtfxTYbnQOs9yJ/U2L9Cz+Ia96WdTSLv1pywvXikZ9lGnK0
         68LS1umVW3GLGOm9GHuRGZPDHImpTMCjayPOHqKNn4AMo2RLqM5QabZAlUGonXxwsgD+
         iLKGbyfIawHM7yZeF1nq+oQLdoJ3xpdDNaxGa8Pv8VlDSq3SzWgA5zNET+YuiM/DxHB6
         UM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739553081; x=1740157881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tFVk1CSr4Gjhn3uWBeLqopf2bxAI2GHatmkSuDvmcY=;
        b=cA7alM4zYYyZxCfVWoSoes1HKjeduDYpBhuG7swmkPdmBvPSNS9RveSc7eFci1o2xg
         f50EJum8DDWK2NkpsdH3XMFSto5r6DT8lcihjsVogPpQ4ZLnysTiSJNiBtXSOGJ2lBwd
         uOpQINSf/qGGgwITHU8EsxnCnYHGOSwzV4yftKjtyGsG/10EfZ/2Bu6oXWuKShr/cmzT
         oz0gMeLtTvZp76dRNTjj5teAWVWsXraRzsU48pOACyhSOxQ+k0Kmtn53Z6Sun89CzwvV
         hbxNMGvk7tN2k6MXEG5aIYbobhXmiy+pptWAwGMz+UcH2tbqITggou+bEOCqC1WbB41h
         XkrA==
X-Forwarded-Encrypted: i=1; AJvYcCXSX7Yc4/Pt740CcywEXFAiZBNijtesovKtf2/yWBd5i7Oj7sRMXZlk1iq6+PQ+MRhgjrAl46nhqAeb1BKs/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLeF3IVy7i8RwkjzfbaEvZQf2x8eW+371qTTj9SE9zFL0ojb+
	e+nLKkofSEPhkY0GjD+d8u6/k1hFcQb7ztTEpWHwqcZpybNvPHddkW9xH7V9kQ==
X-Gm-Gg: ASbGncuxfIgjAf55AV49XXVEeEKiOfdnDJSkTzs/GiS3Rv1ztY2fCmEy2VWpUqmGXV/
	fZ4ZS/wmHWA8TPIaEz4Sd9sCUE53h2EQN8p4lelQK/ktlqWwgLveFHEaRHxbmvo3dD1BqE9lpdj
	Tgnl55vlyWN9kanuyELveuvkyMTwKypBaW0VhUrufS/213nKo9QLlLtxSpPCOEPHlclHGaxJqg3
	pqFRVLWpKQ82sTs0VP/7Beb4UxsS69lvJzzOv32FKoL1i3kMGxydXPzvduszrxEuSgO931cXea8
	ev4F5zZQgU8lvxYt3cimV6N67S0=
X-Google-Smtp-Source: AGHT+IFtRcsC8lGjgRbp1ycQlIbd0zSbe+MhBv3YgVh5mcJFxmhiI53DBGqspGZoSEm1cJUzqXNGXA==
X-Received: by 2002:a17:902:fc8e:b0:215:a05d:fb05 with SMTP id d9443c01a7336-220bdfee6a5mr208218855ad.32.1739553081492;
        Fri, 14 Feb 2025 09:11:21 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d09esm31064135ad.112.2025.02.14.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:11:21 -0800 (PST)
Date: Fri, 14 Feb 2025 22:41:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250214171106.ul3fwzcwhadhdwhj@thinkpad>
References: <20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org>
 <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091122_582918_3829B74A 
X-CRM114-Status: GOOD (  20.95  )
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

On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> Configure PBus base address and address mask to allow the hw
> to detect if a given address is on PCIE0, PCIE1 or PCIE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 30 ++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..9c2a592cae959de8fbe9ca5c5c2253f8eadf2c76 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -15,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of_device.h>
> @@ -24,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include "../pci.h"
> @@ -127,6 +129,13 @@
>  
>  #define PCIE_MTK_RESET_TIME_US		10
>  
> +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> +	((_n) == 2 ? 0x28000000 :	\
> +	 (_n) == 1 ? 0x24000000 : 0x20000000)
> +#define PCIE_EN7581_PBUS_BASE_ADDR_MASK	GENMASK(31, 26)
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -931,7 +940,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  {
>  	struct device *dev = pcie->dev;
> -	int err;
> +	struct regmap *map;
> +	int err, slot;
>  	u32 val;
>  
>  	/*
> @@ -945,6 +955,24 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
> +	map = syscon_regmap_lookup_by_phandle(dev->of_node,
> +					      "mediatek,pbus-csr");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);

So this is going to regress the devicetree's that do not define this syscon
region? But I do not see any devicetree using this 'airoha,en7581-pcie'
compatible, so not sure if this is going to be an issue. Are the downstream
devicetrees used?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

