Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A098ECD37BB
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuKyv35cAbZ9ta1zH/bioDTCGnGJx/27yNa8aQoUBgo=; b=tg2xcTITQuRGtkE6uJK9FH0aZ7
	3ASiPZU709fPFNhdJjr2vpSX0MJnq178bXTxvZXOzlvVMjndgac/l/x/SRTWTSAM7iy/GtRL8bXKa
	Mc6qsjLh6S+rFpVROEbdkmooceF+DuEfWxLlHqRwF1QdRLi2pkR29ne6DxoDBCp6H5s1qxgI9FZ/d
	LQN1QP5VzjjUzXP7I5tkqJmaeOYq8uY3rRfREiiv3NPAv8WWqFwevZ/bQYku2tXjegP4uhJFXISwS
	X+/JiEP8lkQnJ/nkn/YWMWzB6K79P5H7mgVXIflLba99ryxOUQ1PeyX7FulXay78mY609J8rlBfUc
	23r7YZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhSkh-00CMXf-2F;
	Sat, 16 Sep 2023 10:42:15 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhSkc-00CMTF-30;
	Sat, 16 Sep 2023 10:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694860930; x=1726396930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1ZWsG3yhjCVQFM0cAQVsfHBzlJHbot5FxPJHCpxOpQ=;
  b=bWTRBhAhAx7t3br0VL/FDo8STd0vSt2mvHt6qVoUtde0FuYwO8K6rqmx
   RjJFdWJrKoLf7jKmbg9Q0DwzLL6rSIOZwwG5TYQBePurLfhSOkhiYq0yQ
   s3Q65zPnHa81aTFz+35ziEHWbSKjPgYEz0qC+Avm5bsSvPSDGp1oqHyQA
   /WNLp3OoI8+rUqb0KQy/2tNsa9t4/EdfmzpBrRaMsHEiYUQpXIyULTwSG
   l8Zn5jUwF3kpDnWHWbn3Qy0uC/gOjYt4xdXerB8aAYf3flhqwIg+SXAlW
   d3HlDneQLWFdeYYj1oD9jef0oNXRMcwPC82Arh1Qd+q6sia/PPBkmKdNq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359653521"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359653521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 03:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780392440"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="780392440"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 03:42:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qhSkS-0000000Fdqv-0pXU;
	Sat, 16 Sep 2023 13:42:00 +0300
Date: Sat, 16 Sep 2023 13:41:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] PCI: mediatek: Correct type for virt_to_phys()
Message-ID: <ZQWGd/RyKaUBRhUY@smile.fi.intel.com>
References: <20230914192324.672997-1-andriy.shevchenko@linux.intel.com>
 <20230914203146.GA77870@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914203146.GA77870@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_034210_985440_9AB485EE 
X-CRM114-Status: GOOD (  17.45  )
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

On Thu, Sep 14, 2023 at 03:31:46PM -0500, Bjorn Helgaas wrote:
> On Thu, Sep 14, 2023 at 10:23:24PM +0300, Andy Shevchenko wrote:

...

> > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > +	addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);
> 
> Lots of these drivers use either virt_to_phys() or
> platform_get_resource_byname() to get a physical address that they
> then use as the MSI target.
> 
> But I don't think that's quite right -- the MSI is a DMA transaction
> on PCI, and in general there's no guarantee that bus addresses are
> identical to CPU physical addresses, so shouldn't we use a dma_addr_t
> obtained from the DMA API?
> 
> dw_pcie_msi_host_init() has a complicated version of this that uses
> dmam_alloc_coherent().

Fair enough. I leave it to you then to get it fixed properly.
Consider this as just a heads up for the old report.

-- 
With Best Regards,
Andy Shevchenko



