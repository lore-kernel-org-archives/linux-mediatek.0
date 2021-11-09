Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35694C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 06:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB8661184
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 06:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECB8661184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfX75pmfxqmmDedesj7Flslxxi4O17WzV/eOAV0cHes=; b=2p5rplhxnzM3CD
	9L/7uMJU1H4u7jzB4n6reiWjZf9OlxJ31XlOyrgZpyVrORDX7vJDwXRgzazCYfIW9ppH6oomd8YcA
	4nIIr5WWcy5M7DyzolWvf9nQKOno35+B5thX9Eoe0k/0Id75tC7CLsxopTNI72YK5qa2UtQwoWHBE
	DKVBRuRsln5IISAzaSM5U9AlElUdzcQMMNkdRj5VbmBOz0tdy18dKrizNjhGmZvpfD2a+tubdMJeS
	HKrqVLR0D6nIyQw0zpR0B8JKiht5iw2TCLBAy69TjKtfQptuFAnHZgkI0S7f0IQkyX+cb6t67MAxA
	IhIbldXOQTioHP1kqsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkKL7-000n8X-Vt; Tue, 09 Nov 2021 06:10:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkKL4-000n6t-R9; Tue, 09 Nov 2021 06:10:36 +0000
X-UUID: 19e00329d1984289bdb552f9b20f7af0-20211108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5TI9MaGiDCo3zWSVU3oXZEG4tuaeM8OHObYDQ9ZAnOk=; 
 b=Kfl539Brdhh7+cW/qaVcd7GMd7/nntItxF2+s2Y9pIhSQjych/qZCQfOTFFAc9PbhuK+WFT0gOcmjift7ECFLS4YW0wm5qbNd6BadR5nglAbz6yCLkr8WD63RdNNZc9wqEfibPEZQAfthpglFQszOzDQU1hHb7MwAY4v/ripQ0E=;
X-UUID: 19e00329d1984289bdb552f9b20f7af0-20211108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 157808743; Mon, 08 Nov 2021 23:10:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 22:10:28 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 14:10:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 9 Nov 2021 14:10:26 +0800
Message-ID: <b18f74b8831492c4a75f45fa778c359fd80184d0.camel@mediatek.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Disable DVFSRC voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <qizhong.cheng@mediatek.com>, <Ryan-JH.Yu@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>
Date: Tue, 9 Nov 2021 14:10:25 +0800
In-Reply-To: <20211015063602.29058-1-jianjun.wang@mediatek.com>
References: <20211015063602.29058-1-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_221034_911071_830435E9 
X-CRM114-Status: GOOD (  21.57  )
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

Hi Maintainers,

Just gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Thanks.

On Fri, 2021-10-15 at 14:36 +0800, Jianjun Wang wrote:
> When the DVFSRC (dynamic voltage and frequency scaling resource
> collector)
> feature is not implemented, the PCIe hardware will assert a voltage
> request
> signal when exit from the L1 PM Substates to request a specific Vcore
> voltage, but cannot receive the voltage ready signal, which will
> cause
> the link to fail to exit the L1 PM Substates.
> 
> Disable DVFSRC voltage request by default, we need to find a common
> way to
> enable it in the future.
> 
> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver
> for MT8192")
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f3aeb8d4eaca..79fb12fca6a9 100644
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
> @@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct
> mtk_pcie_port *port)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
>  
> +	/* Disable DVFSRC voltage request */
> +	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
> +	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> +	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
> +
>  	/* Assert all reset signals */
>  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
>  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> PCIE_PE_RSTB;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
