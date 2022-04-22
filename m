Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F4EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne5ULxEXxcwV3BJeqHjWRCQ/MS7dwMaPpd4Z/BIVk0A=; b=DJH9EkqXGdgKcc
	lS89Ns5TC+u04F98o/q7xnpOtLSWS63GUUHjXnRYSvKY+TYXpfbavFm+4AvpD6o2ewMIoE0fokyrn
	06rENstPb/wWV2LmasOrvm6aI2ECTnGEYJVCTRaQ/goH+a4TmlBqeFWLQ3L81IcxKrOUEUrbDxw0A
	brdAHh2+xZtB28y1UQPK+fCBON/Ll7+eGBA+JjuwKhFKMgZ+hDrzf0wkyY1GlNvjq3LlNCXIkxIZe
	4wvXy6hOZcK0Ac97Rbqx7+6m2xjKfyBXgW9PSacoPr3fbJkF4QTFNV7VmsUpBUVw/T8eYnFdoeipQ
	f3UCNCibyYEffupJhFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmtc-00Gb6j-Sp; Fri, 22 Apr 2022 06:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmrl-00GaGw-T9; Fri, 22 Apr 2022 06:34:07 +0000
X-UUID: 20dd1e5b947244ef9e7bd5632b9dfb36-20220421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vNDBoSBzLtpc0hGOSr6uL9+E5m8539170qJODFD3fqI=; 
 b=VOZ6IjGHOxp98AAtzHsNBYRvBSEiwnR6//WXmatPUD9h8Len38GOeODFhK5T9CtFquoyuSZhohg4KyxF+KWyPJz6l7ENEhiR6OjmPaqlKJmRkggdWuMS06HRQ0FniAGMflcDduDo83T3SO+iGx4nligO/+FBygx9wmLu2hv4PZI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ee39d57d-9ee9-401c-910b-d975a06d9628, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:918bbeef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 20dd1e5b947244ef9e7bd5632b9dfb36-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2052736883; Thu, 21 Apr 2022 23:34:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:34:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 14:33:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 14:33:56 +0800
Message-ID: <32f5308e629cef3692c57c4c55442b0f2f25634f.camel@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Print LTSSM state when PCIe link
 down
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Fri, 22 Apr 2022 14:33:56 +0800
In-Reply-To: <20220329030715.7975-1-jianjun.wang@mediatek.com>
References: <20220329030715.7975-1-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_233406_068563_15B1E9F9 
X-CRM114-Status: GOOD (  23.15  )
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

Just gentle ping for this patch, if there is anything I can do to get
this patch merged, please let me know.

Thanks.

On Tue, 2022-03-29 at 11:07 +0800, Jianjun Wang wrote:
> Print current LTSSM state when PCIe link down instead of the register
> value, make it easier to get the link status.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> Changes in v2:
> Print both of the register value and the LTSSM state.
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 41
> ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 6745076a02b9..c24e03c198b7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -153,6 +153,37 @@ struct mtk_gen3_pcie {
>  	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
>  };
>  
> +/* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
> +static const char *const ltssm_str[] = {
> +	"detect.quiet",			/* 0x00 */
> +	"detect.active",		/* 0x01 */
> +	"polling.active",		/* 0x02 */
> +	"polling.compliance",		/* 0x03 */
> +	"polling.configuration",	/* 0x04 */
> +	"config.linkwidthstart",	/* 0x05 */
> +	"config.linkwidthaccept",	/* 0x06 */
> +	"config.lanenumwait",		/* 0x07 */
> +	"config.lanenumaccept",		/* 0x08 */
> +	"config.complete",		/* 0x09 */
> +	"config.idle",			/* 0x0A */
> +	"recovery.receiverlock",	/* 0x0B */
> +	"recovery.equalization",	/* 0x0C */
> +	"recovery.speed",		/* 0x0D */
> +	"recovery.receiverconfig",	/* 0x0E */
> +	"recovery.idle",		/* 0x0F */
> +	"L0",				/* 0x10 */
> +	"L0s",				/* 0x11 */
> +	"L1.entry",			/* 0x12 */
> +	"L1.idle",			/* 0x13 */
> +	"L2.idle",			/* 0x14 */
> +	"L2.transmitwake",		/* 0x15 */
> +	"disable",			/* 0x16 */
> +	"loopback.entry",		/* 0x17 */
> +	"loopback.active",		/* 0x18 */
> +	"loopback.exit",		/* 0x19 */
> +	"hotreset",			/* 0x1A */
> +};
> +
>  /**
>   * mtk_pcie_config_tlp_header() - Configure a configuration TLP
> header
>   * @bus: PCI bus to query
> @@ -327,8 +358,16 @@ static int mtk_pcie_startup_port(struct
> mtk_gen3_pcie *pcie)
>  				 !!(val & PCIE_PORT_LINKUP), 20,
>  				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
>  	if (err) {
> +		const char *ltssm_state;
> +		int ltssm_index;
> +
>  		val = readl_relaxed(pcie->base +
> PCIE_LTSSM_STATUS_REG);
> -		dev_err(pcie->dev, "PCIe link down, ltssm reg val:
> %#x\n", val);
> +		ltssm_index = PCIE_LTSSM_STATE(val);
> +		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
> +			      "Unknown state" : ltssm_str[ltssm_index];
> +		dev_err(pcie->dev,
> +			"PCIe link down, current ltssm state: %s
> (%#x)\n",
> +			ltssm_state, val);
>  		return err;
>  	}
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
