Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7535FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TATcz+DmtC4SElmfQxkBucGaFA4fF3G8jsruw6zU4rM=; b=GETvtjNY2Mnw4s
	azHjz4cjLpXNKEJ6gfWiARCc/Id1C0Nac0V/FP7osF0T3K3HqP3DZLAcDwBWzh2RSooF/ZvpMzcY0
	IosnS/KVMy5BACXogLI2MPcVwlf/MKPDZTXwqcwkvH7gd9iskNKUYxRLeIg7Dxv5QL7h/J3tSrBlO
	3be0scje2MZUTLQUwhahgODSHWA+DSXm3HGjg1tIJvoI3U/KQpv8lzwdAlnYkzLz6s/fyt+ZzJvU5
	NPBQzFLItmwXgirH3sieIRJIq3AIdMfMHGc8DVwEWOzNPQ4JlQFeDnc1XEklhOvb4JgBzoOPI7jbw
	cUJ/zA2HO1Oj3gt6MkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzmh-002Gp2-Pa; Mon, 10 Oct 2022 20:53:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzmV-002Gm2-O3; Mon, 10 Oct 2022 20:53:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B13A8B80E41;
	Mon, 10 Oct 2022 20:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355FFC433C1;
	Mon, 10 Oct 2022 20:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665435224;
	bh=U40ZhDhgjkMFAWq1C9vPEDnFwF9FZwsPexHHtIbXFpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iKiKKaxAdd4bvCbm41s8jnud/2PY6mm5xJhX+z4EYJVi2UZpUhLGwAPgurbQZQRQM
	 u+iPJhMwmmcRwbgW+AOUVJ5H4zkBJt1FsdZ/L0oxaIjx/wpO1V5zRNrrrh1OLnAgxH
	 4KC+dsWCYaYSebuwazSXvpS/Z7HZ5Vxhbux76DlqBtOFY8TH059H8cxq8NK7G42mZV
	 TTldCf2tbA8iwxpEGYpKx8uGdbGO/xQViiR8J0e0xq3XZFvWUyqBaCP3NeKIBBtYS4
	 TDH0unsxLwzYo9p1HPvn07xknu1YqjiL3FjGigEq2S3ZxqFE7euxr4wgmPLFaHbgro
	 wZzDPfxBWqP5w==
Date: Mon, 10 Oct 2022 15:53:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] PCI: mediatek-gen3: change driver name to mtk-pcie-gen3
Message-ID: <20221010205342.GA2935945@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008164211.112944-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_135347_957126_346BAC48 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 08, 2022 at 06:42:11PM +0200, Frank Wunderlich wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> This allows it to coexist with the other mtk pcie driver in the same
> kernel.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Looks like Lorenzo already applied this:

https://lore.kernel.org/all/166125958529.60702.17839683437013330997.b4-ty@kernel.org/#t

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 11cdb9b6f109..b8612ce5f4d0 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1071,7 +1071,7 @@ static struct platform_driver mtk_pcie_driver = {
>  	.probe = mtk_pcie_probe,
>  	.remove = mtk_pcie_remove,
>  	.driver = {
> -		.name = "mtk-pcie",
> +		.name = "mtk-pcie-gen3",
>  		.of_match_table = mtk_pcie_of_match,
>  		.pm = &mtk_pcie_pm_ops,
>  	},
> -- 
> 2.34.1
> 

