Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56090C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALLwUd+32zcjV6k1BCmb1zPeRXDaHtTY+HfLj2OSKV8=; b=4B7iv2vW9zRmpv
	9zYfaMseiODE0ADryUcCNDOAUT6OmRuk+6s4prxe4c/a8E4wbKrT28i4jLU/3Usoh9pdYOYlZ1YG2
	MjuhmaIV7Q7PMXjhtks4hw7p2eBsBt+0zXZ0adUg+UxQopBo8bpb0wnIu66v6StKdpU64NZtTXpCv
	8xPcppRz5aa3fjilH/jSvBGH4wI0LNgWdM+2PW44+JasYJU0xsOdCg1eErmAgbJNo0m4xN9SuslwZ
	n4nxfTprr9aBATD/I0CRb7KFXojKMBQfPCA3q9ZzFw8KzNqO3iGT9zkY8wHO0vPeUJpC+zqVloVHn
	cSQ49JDV+KUYARpt1Rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSCit-00Bfbt-Q6; Thu, 10 Mar 2022 06:56:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSCih-00BfYL-2L; Thu, 10 Mar 2022 06:56:20 +0000
X-UUID: 3cc6e65991b54542bdb7cdf0ca1aafd3-20220309
X-UUID: 3cc6e65991b54542bdb7cdf0ca1aafd3-20220309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451206179; Wed, 09 Mar 2022 23:56:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 22:56:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Mar 2022 14:56:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 14:56:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <bhelgaas@google.com>, <chuanjia.liu@mediatek.com>,
 <jianjun.wang@mediatek.com>, <kw@linux.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>,
 <lorenzo.pieralisi@arm.com>, <matthias.bgg@gmail.com>, <robh@kernel.org>,
 <ryder.lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Fix refcount leak in
 mtk_pcie_subsys_powerup
Date: Thu, 10 Mar 2022 14:56:12 +0800
Message-ID: <20220310065612.26452-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220309091953.5630-1-linmq006@gmail.com>
References: <20220309091953.5630-1-linmq006@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_225619_139505_743B6614 
X-CRM114-Status: GOOD (  14.59  )
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

Hi Miaoqian,

> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> Fixes: 87e8657ba99c ("PCI: mediatek: Add new method to get shared pcie-cfg base address")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index ddfbd4aebdec..be8bd919cb88 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -1008,6 +1008,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  					   "mediatek,generic-pciecfg");
>  	if (cfg_node) {
>  		pcie->cfg = syscon_node_to_regmap(cfg_node);
> +		of_node_put(cfg_node);
>  		if (IS_ERR(pcie->cfg))
>  			return PTR_ERR(pcie->cfg);
>  	}

Thanks for this patch.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
