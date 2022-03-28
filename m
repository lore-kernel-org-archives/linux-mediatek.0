Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDBDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ut2MT3Y9TGcZZr0/qyXRJGczPXTDiMzkUaFjDwQBpf8=; b=p9+KWD9Vs51GbH
	iHRsbd0Q7SMpnE1M8muBGRzd48OYc/zrhDN9Cd/HpMsjbqdYjG8vCl6pXMLfzNsZgOnCnR1JoOX8O
	aWb5hnmNr24sPc8Au0pTrvVRJeUFp7og2ig4w1v7yTrI+r3HQ6H2EVEUfAjnJ1QxAGGf13ONZbuDC
	0rY31JbSqdx8z4L0y7QJtR9MYwgGBXXR31SIURSHdZ2RY92NmNAxPogUwHe8DTidA5Upo3YilGbvn
	VaUWFpS/r5s3sBwRM1nRolHiyeIiVSFX3np/UYhd84UyrqccdGdt4jvhJy7yJBGSWn6RjET8uHxk9
	P66b3DUT4EHlxiddbYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYqXF-0096xu-RT; Mon, 28 Mar 2022 14:39:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYqX4-0096vi-MV; Mon, 28 Mar 2022 14:39:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5E5A71F437EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648478385;
 bh=YXyvPIqjtVhfNAWNbSeb5m3srTHuOI0T/YuzxaRmNXk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JMjaS2R8roR5S2Vz5q2oR1bkuGDaCYVlxLPQDdmqdbh6f9C1DfRp2/f0xoUibJyo3
 L3V1zJLK8Wls4AmCAlfzEAlXzLKMCwBxbqwwydh+VjOuGYRqOgFajGd7uWvu8BQsxJ
 ZZkWAblHtn+qzqmoQ4ZRZskL9K4JJL1P1znAztuPRoR89cStjTyeil1fUpIVr3aFbp
 sFvQ+DPUbneyQZzgx8rSJq1qQNBYLtGYf+1/upgE3+mHdYoRbr4dha37PXOwj8pvmC
 h1ETCzSffmQ+gLra+jqb+TVnzK5j5tlgaZipCLRIH0tvhS3sLX1oAsomjiPBz2083V
 7Cr7SMtP4KqrQ==
Message-ID: <cd9c7d5c-4ab6-2795-2bba-9deedb8198e3@collabora.com>
Date: Mon, 28 Mar 2022 16:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] PCI: mediatek-gen3: Print LTSSM state when PCIe link down
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220324072548.11408-1-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324072548.11408-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_073946_926616_D93F4175 
X-CRM114-Status: GOOD (  17.30  )
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

Il 24/03/22 08:25, Jianjun Wang ha scritto:
> Print current LTSSM state when PCIe link down instead of the register
> value, make it easier to get the link status.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Hello Jianjun,
this patch is really helpful when comes to understand the source of an issue,
so I agree with it - and thank you for that.

Though, I think that you should still print the hex number along with the
meaning of it, check below:

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 40 ++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 7705d61fba4c..54663f025e27 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c

..snip..

> @@ -327,8 +358,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   				 !!(val & PCIE_PORT_LINKUP), 20,
>   				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
>   	if (err) {
> +		const char *ltssm_state;
> +		int ltssm_index;
> +
>   		val = readl_relaxed(pcie->base + PCIE_LTSSM_STATUS_REG);
> -		dev_err(pcie->dev, "PCIe link down, ltssm reg val: %#x\n", val);
> +		ltssm_index = PCIE_LTSSM_STATE(val);
> +		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
> +			      "Unknown state" : ltssm_str[ltssm_index];
> +		dev_err(pcie->dev, "PCIe link down, current ltssm state: %s\n",

There, I think that you should do:

dev_err(pcie->dev, "PCIe link down, current LTSSM state: %s (%#x)\n",
	ltssm_state, val);

this will be extremely useful in the "Unknown state" case.

After fixing that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
