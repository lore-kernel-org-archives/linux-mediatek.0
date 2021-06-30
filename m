Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2ECC11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B281861D08
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B281861D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yogXOYSGuCsl8BQPiMxoYWrk0KlMcFgV6IBJJaZltJA=; b=StUTJT7RUaIbYX
	fmW7JAq7zbSNYDSGqThD//OXpoqWw1iLfZIb53NY7UTU9847YfENrkLBRA9ct0OBjfF9x79sZOSIN
	UxvZq71SaMmRNOqqR3awkVLuh/Pb5UvlLgQWlyOgcYiF0extWVjy8BTCzNy166KiNdWvuCf2VsYOA
	duj6GOvt+19YSDpig33yOQefBKhUrlnYDk6wOSxGUxnJrsp/5mPpoNebOv9wtSxwzO50SbeM6UJ0U
	T+h40dtCVqEFwmiDO97UamoTSslbI9uuNBdXOFriu53mbrGA3adA7u+wi+Nd+bIl+QL3rLUzFrAmn
	cNBcpZpGCwoqv9qIFV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyR3a-00ChhZ-H4; Wed, 30 Jun 2021 03:38:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyR3X-00ChYo-0l; Wed, 30 Jun 2021 03:38:32 +0000
X-UUID: 7c5502879d4b4c3883c2efce8d84fe68-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2VlqRRg44sL5xrfMMeXAy4DWOwYJ341cF9f4mlVSKCQ=; 
 b=cPTbapyDf3MA3l1lchFnAbmAqSNaMa5ER/3XGsPOHF67CO31q+KFVkuEVnwO2NVLIIrdA3+3ULsAqx8lnxunRZmNQY2wlkffw/PGwJ8COClDlwTuUBzU6yzUHgctuLbU6keJOpQQrLUZFvq7vBlQ0G2IftsSatTS3PBOHCGsobY=;
X-UUID: 7c5502879d4b4c3883c2efce8d84fe68-20210629
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 972962514; Tue, 29 Jun 2021 20:38:26 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 20:38:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 11:38:11 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 11:38:08 +0800
Message-ID: <1625024288.20084.9.camel@mhfsdcap03>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Add support for disable
 dvfsrc voltage request
From: Qizhong Cheng <qizhong.cheng@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <ot_jieyang@mediatek.com>,
 <drinkcat@chromium.org>, <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, <Ryan-JH.Yu@mediatek.com>
Date: Wed, 30 Jun 2021 11:38:08 +0800
In-Reply-To: <20210630024934.18903-3-jianjun.wang@mediatek.com>
References: <20210630024934.18903-1-jianjun.wang@mediatek.com>
 <20210630024934.18903-3-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_203831_111547_4E840D86 
X-CRM114-Status: GOOD (  26.73  )
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

Reviewed-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>

On Wed, 2021-06-30 at 10:49 +0800, Jianjun Wang wrote:
> PCIe Gen3 PHY layer cannot work properly when the requested voltage
> is lower than a specific level(e.g. 0.55V, it's depends on
> the chip manufacturing process).
> 
> When the dvfsrc feature is implemented, the requested voltage
> may be reduced to a lower level in suspend mode, hence that
> the MAC layer will assert a HW signal to request the dvfsrc
> to raise voltage to normal mode, and it will wait the voltage
> ready signal from dvfsrc to decide if the LTSSM can start normally.
> 
> When the dvfsrc feature is not implemented, the MAC layer still
> assert the voltage request to dvfsrc when exit suspend mode,
> but will not receive the voltage ready signal, in this case,
> the LTSSM cannot start normally, and the PCIe link will be failed.
> 
> Add support for disable dvfsrc voltage request, if the property of
> "disable-dvfsrc-vlt-req" is presented in device node, we assume that
> the requested voltage is always higher enough to keep the PCIe Gen3
> PHY active, and the voltage request to dvfsrc should be disabled.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 31 +++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3c5b97716d40..028014707588 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -79,6 +79,9 @@
>  #define PCIE_ICMD_PM_REG		0x198
>  #define PCIE_TURN_OFF_LINK		BIT(4)
>  
> +#define PCIE_MISC_CTRL_REG		0x348
> +#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
> +
>  #define PCIE_TRANS_TABLE_BASE_REG	0x800
>  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
>  #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> @@ -297,6 +300,34 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
>  
> +	/*
> +	 * PCIe Gen3 PHY layer can not work properly when the requested voltage
> +	 * is lower than a specific level(e.g. 0.55V, it's depends on
> +	 * the chip manufacturing process).
> +	 *
> +	 * When the dvfsrc feature is implemented, the requested voltage
> +	 * might be reduced to a lower level in suspend mode, hence that
> +	 * the MAC layer will assert a HW signal to request the dvfsrc
> +	 * to raise voltage to normal mode, and it will wait the voltage
> +	 * ready signal from dvfsrc to start the LTSSM normally.
> +	 *
> +	 * When the dvfsrc feature is not implemented, the MAC layer still
> +	 * assert the voltage request to dvfsrc when exit suspend mode,
> +	 * but will not get the voltage ready signal, in this case, the LTSSM
> +	 * cannot start normally, and the PCIe link will be failed.
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
> +	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
> +
>  	/* Assert all reset signals */
>  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
>  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
