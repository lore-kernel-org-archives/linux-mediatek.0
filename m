Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37718C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58T3I4I+3aKXUaYQHzloX0N6cBIrQARDdmuNHgLGaMs=; b=YmRoB/3DzLZHKmV4peaLBDX0LS
	undLI6bxXVU5OK+4RrLxKUgay/fCnxWVL6+dp+p04NBizVLJCom2H1IPxJhnaBUt6jH0lhif9XThr
	4VcqvgYEeJdbawzAtAqbolcMsKdon8O3XQpJZ7tOd5iArh255XkWNLkaUnBE0pY1HYIUf7MBIkYD0
	/zmtg/QElHoWkkXfsFrYRH6WmJZRuEesNAUcRBx0L9d1v8sp+Fs011kL+nTawNzVY2yVMGTbmXWa+
	iT1qaujT5Iidzh5o5iijDNpRuTypE4WmLhQdg7/YR4HAOrbWvywYl4MkdT7nZ+TKdBTqxCdaqgtkc
	Hks+6E0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSK6A-00DCaK-Em; Thu, 10 Mar 2022 14:49:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSK5u-00DCUx-1N; Thu, 10 Mar 2022 14:48:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BE0E51F45961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646923723;
 bh=ggeM4JSgsp6obEP3ZgCxoHKKLd674MO15iyeV5s6blM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=LC+uup07MAznJo/9jsdRQEAgzrweUQitMhy9VfKgqhVvUFrKPUwUeFujX49LAduGQ
 gKp5GxqiLUeHMDkj+SSLrdjZ06fiCcc/wXoWXOWkaNshHeHS1IIpHTVhdH4Aw9qmRz
 +K8kUscNY15sdTmSi6/uKqCywjRfviOFJOg1dNF436U/TOeJVpjESuMspVqftyMeYp
 S2z/nCcmDGQ36Hvdc35p20o9txpYRCa0w+5iYoo79IxkU1Fr8+OVgZf5pe7CapOeyz
 HtK3ZYr6kN6wgycaNP4QE5q+hWpszYIdBJLeKx6QFWWCECxtyhFtwmu1pkFJ7FGW2S
 HhkKz0ft4OALQ==
Message-ID: <57251e6c-a5e7-2388-f30e-365c56b52a42@collabora.com>
Date: Thu, 10 Mar 2022 15:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] PCI: mediatek: Fix refcount leak in
 mtk_pcie_subsys_powerup
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220309091953.5630-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220309091953.5630-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_064846_250193_A88256E5 
X-CRM114-Status: GOOD (  15.40  )
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

Il 09/03/22 10:19, Miaoqian Lin ha scritto:
> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> Fixes: 87e8657ba99c ("PCI: mediatek: Add new method to get shared pcie-cfg base address")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pci/controller/pcie-mediatek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index ddfbd4aebdec..be8bd919cb88 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -1008,6 +1008,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>   					   "mediatek,generic-pciecfg");
>   	if (cfg_node) {
>   		pcie->cfg = syscon_node_to_regmap(cfg_node);
> +		of_node_put(cfg_node);
>   		if (IS_ERR(pcie->cfg))
>   			return PTR_ERR(pcie->cfg);
>   	}
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
