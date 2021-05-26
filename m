Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50E7C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 07:45:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C5361429
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 07:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C5361429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFUPlfGcQ6gPVHY5t/+eVI21MOxqLVJPNczVDg4HglI=; b=4vfRxV+KO90T5Q
	FZAvj2bfoURGjZqXDSsbxe5IXbJ9v3GOypvpZGX9QX7FS62loK4wsTBNgYmrQdv37y58VJ88k0XjS
	EFZ05PXnirskSJINuLP1kjETaL/+FPxHF3R0uQm9mBABSEDEZD7h361t0cx7NXjGO+3+XkqcecLOG
	E4kwWIfgUC7oEMhoELUa+Gsj4GaGFPHpaYXE/hb1YmEic5N17udsa4953b7hjeF3Bhi4YCFOABeNo
	KRyrudpAStEenPmliPhPsuhUp/JrYOX/5GOKPPycKoM3t4rt4cMRepkVkDXdb9+kldGNPofIYxahq
	pz6stXmHAE1UKW2C2syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lloDl-00CBIn-QG; Wed, 26 May 2021 07:44:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lloDh-00CBGd-ER; Wed, 26 May 2021 07:44:52 +0000
X-UUID: 08711f368ff3404f8cbc538bddd761d5-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rhis7ZdFLWANZ7b2DBYk1HWn5k7BbGfIhqdHKsjdI6c=; 
 b=i/t8UBBc5C2q4VCptCrrBxH1Q9wSJzuJfy55+XzthiGljpfe9EEBAoWyLQILmGUSrkZVWD4bbLO143bMCyVHElwGA9pKBKtiH+CFOtASIKENwIi3j7o0id5dRSW/Fyjnk4NfR0Y+PpYrTOgiNavtnIvjs1CHpktYXZmDwHW4N2o=;
X-UUID: 08711f368ff3404f8cbc538bddd761d5-20210526
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2085942816; Wed, 26 May 2021 00:44:44 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 00:44:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 15:44:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 15:44:34 +0800
Message-ID: <1622015074.22554.7.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] PCI: mediatek-gen3: Add support for disable dvfsrc
 voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <youlin.pei@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <sin_jieyang@mediatek.com>,
 <drinkcat@chromium.org>, <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, <Ryan-JH.Yu@mediatek.com>
Date: Wed, 26 May 2021 15:44:34 +0800
In-Reply-To: <20210514065927.20774-3-jianjun.wang@mediatek.com>
References: <20210514065927.20774-1-jianjun.wang@mediatek.com>
 <20210514065927.20774-3-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA820A6B0B6D8B6EB8E0F75C994FDD6EAA37103BB9F953B2506EA02435B992782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_004451_201292_DE08DCB7 
X-CRM114-Status: GOOD (  28.46  )
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

Hi Bjorn, Rob, Lorenzo,

Could you please help to take a look at this patch, I'm not sure if this
is a good solution, and I really need your suggestions.

Thanks.

On Fri, 2021-05-14 at 14:59 +0800, Jianjun Wang wrote:
> PCIe Gen3 PHY layer cannot work properly when the requested voltage
> is lower than a specific level(e.g. 0.55V, it's depends on
> the chip manufacturing process).
> 
> When the dvfsrc feature is implemented, the requested voltage
> may be reduced to a lower level in suspend mode, hence that
> the MAC layer will assert a HW signal to request the dvfsrc
> to raise voltage to normal mode, and it will wait the voltage
> ready signal which is derived from dvfsrc to determine whether
> the LTSSM can start normally.
> 
> When the dvfsrc feature is not implemented, the MAC layer still
> assert the voltage request to dvfsrc when exit suspend mode,
> but will not receive the voltage ready signal, in this case,
> the LTSSM cannot start normally, and the PCIe link will be failed.
> 
> Add support for disable dvfsrc voltage request. If the property of
> "disable-dvfsrc-vlt-req" is presented in device node, we assume that
> the requested voltage is always higher enough to keep the PCIe Gen3
> PHY active, and the voltage request to dvfsrc should be disabled.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 20165e4a75b2..d1864303217e 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -68,6 +68,9 @@
>  #define PCIE_MSI_SET_ENABLE_REG		0x190
>  #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
>  
> +#define PCIE_MISC_CTRL_REG		0x348
> +#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
> +
>  #define PCIE_MSI_SET_BASE_REG		0xc00
>  #define PCIE_MSI_SET_OFFSET		0x10
>  #define PCIE_MSI_SET_STATUS_OFFSET	0x04
> @@ -297,6 +300,35 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
>  
> +	/*
> +	 * PCIe Gen3 PHY layer can not work properly when the requested voltage
> +	 * is lower than a specific level(e.g. 0.55V, it's depends on
> +	 * the chip manufacturing process).
> +	 *
> +	 * When the dvfsrc feature is implemented, the requested voltage
> +	 * may be reduced to a lower level in suspend mode, hence that
> +	 * the MAC layer will assert a HW signal to request the dvfsrc
> +	 * to raise voltage to normal mode, and it will wait the voltage
> +	 * ready signal which is derived from dvfsrc to determine whether
> +	 * the LTSSM can start normally.
> +	 *
> +	 * When the dvfsrc feature is not implemented, the MAC layer still
> +	 * assert the voltage request to dvfsrc when exit suspend mode,
> +	 * but will not receive the voltage ready signal, in this case,
> +	 * the LTSSM cannot start normally, and the PCIe link will be failed.
> +	 *
> +	 * If the property of "disable-dvfsrc-vlt-req" is presented
> +	 * in device node, we assume that the requested voltage is always
> +	 * higher enough to keep the PCIe Gen3 PHY active, and the voltage
> +	 * request to dvfsrc should be disabled.
> +	 */
> +	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
> +	val &= ~PCIE_DISABLE_DVFSRC_VLT_REQ;
> +	if (of_property_read_bool(port->dev->of_node, "disable-dvfsrc-vlt-req"))
> +		val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> +
> +	writel(val, port->base + PCIE_MISC_CTRL_REG);
> +
>  	/* Assert all reset signals */
>  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
>  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
