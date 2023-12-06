Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A10C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ud39F5UDe8n+6BHebsfA6Iydh88vnK3+ucVMl02cY+k=; b=RbKfGpbSBNevQK
	+hmvD3GpBo8UZ5LqZqUAhgiuxwPmf75mapWtKY/xfqbq4ARHbSS0FZG3ByQ0ooH3/SalBXV/BVCCM
	GeBiwUpB5VinEdXZu2KEJFhChVsV1eOQoJvsrpVmXqO1LWzKWy8ybis/9wEem4LNLhlOgWvOhQ4ex
	djtR5GF6awtjby/FSA2TGlF4m7ZNIcEPUSfOYA0H5Wp1EPueSqwJulS/kbrd8IF9SqVhShVqwM5q7
	/JlPXz2eJHaPKwyIMF0NKSSjM3EUaFM57shxfkN5HZn3W+scFuwwesSPaqyFDuts8uphOUtmutLl+
	eK+OSm2hgo3dkA8vIxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvNJ-00Aqo8-14;
	Wed, 06 Dec 2023 17:07:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvNG-00Aqmo-0Z;
	Wed, 06 Dec 2023 17:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 871B061D90;
	Wed,  6 Dec 2023 17:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00977C433CA;
	Wed,  6 Dec 2023 17:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701882469;
	bh=bLTnwDn3Jiu3/drePnXNUKRZRyvC9sryoEXthKuzXU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Bu6/zwGlO/moKGVxZVrNljA/XHmVtK61dWS/2Z1JxswaonKZQJhKzurie/D1BFRe0
	 kFoQKjy2BxC/cUSDGkNOD+n9F32AUBIHkcDXM7MRHi1VpgvhfFZaTtPCKzg2aCJewR
	 Q1sMLOcnmtVcdBIh2k+XgKQHjPm37pc6rXRfWDniE1yxf48O4X6GYnKp4T8mLm1/Le
	 IXG+qbxnIJ8wbuNVWYm1eCiVDM3A4x9fh3ch18Yrjyu1emt84t1RwvU4/qFzWqD4sS
	 5K8jvQvJKXhYgWa/6ALdjFEEsO2Cd1LbjjAezM22QM25Vk75yqMrYMEE+Ic2aN3FI2
	 NjJiR7rpdG+SA==
Date: Wed, 6 Dec 2023 11:07:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jieyy.yang@mediatek.com,
	chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
	jian.yang@mediatek.com, jianguo.zhang@mediatek.com
Subject: Re: [PATCH 1/2] PCI: mediatek: Allocate MSI address with
 dmam_alloc_coherent
Message-ID: <20231206170747.GA718062@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206083753.18186-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_090750_258245_F6F91594 
X-CRM114-Status: GOOD (  10.34  )
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

On Wed, Dec 06, 2023 at 04:37:52PM +0800, Jianjun Wang wrote:
> Use 'dmam_alloc_coherent' to allocate the MSI address, instead of using
> 'virt_to_phys'.

s/'dmam_alloc_coherent'/dmam_alloc_coherent()/
s/'virt_to_phys'/virt_to_phys()/

In subject also.

> @@ -732,8 +740,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	val &= ~INTX_MASK;
>  	writel(val, port->base + PCIE_INT_MASK);
>  
> -	if (IS_ENABLED(CONFIG_PCI_MSI))
> -		mtk_pcie_enable_msi(port);
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +		err = mtk_pcie_enable_msi(port);
> +		if (err)
> +			return err;

Is failure to enable MSI a fatal issue?  It looks like this will make
the host controller completely unusable if we can't set up MSI, even
if downstream PCI devices could use INTx and get along without MSI.

Bjorn

