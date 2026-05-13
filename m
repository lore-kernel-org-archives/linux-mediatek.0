Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87448CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=c8FKm5hlMk5Vj1bTlO3N9tcfDuURyyeS7KvcRJK8cTY=; b=pw3/54/S+eTL8/
	gNwez6RnbeQmyN3VqzcES9iJJ2QPBlZUtxNcLbOsAOxtYgY6ueYcOoOMtKpzOiHs0Kzp52YNRS3GD
	vtf7exTldjPLVcSU2kt9jia0uv6axqmaIpTWn5tRjKatgupQ+DN7Y4lQA0EjdAXFtVSwP5ySsy7PT
	oBga9Uv12f/NuPHGzxq1m605U55wHf0Zu0kDujEYR7W+S/eq1S1NQk1PG9ig2VPI2g+AS/i4PR3gZ
	s5odRUvVfr939NJGgZda04vrAayahVTqKpCCXgD92g4azqj9mQB4srxi8FlpDNeODXY5HHVinqojh
	cI3Q8K2yr7QjgvTNPaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHid-00000003tAH-2K8V;
	Wed, 13 May 2026 22:06:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHib-00000003tA4-2B5Y
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 22:06:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CEBE60052;
	Wed, 13 May 2026 22:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12129C19425;
	Wed, 13 May 2026 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709976;
	bh=SLtUZuE6eCsfJ26y0lN0VMH2gCaWGCYQmYw6nlqF/tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iKlNtMsxO8YS65qWNkC+Igkes3nSBBPFNoNOGWHh1xmPes8LhvqktmDIQl6T7V1wd
	 F5DhkQSKsroXc4idKz4sjmjMtnLTTEECeQij+Pn+umz31TtVu8pXSLmnPNBjtandzc
	 KvV0w8drrLjeSHQ9v4/jwjHJHhRycEAABi8+thwgutnz1i8MQdBw7areXuJ28sYCCU
	 1Inr6U6FlQWOw3Rj/ZK82cEbX5DnYOgSc+sKH9yLl/DYi+MojvIXGzTt+vC7YKkDan
	 wZhGRHOMhUBxs7uouy2ojlPxZoAnvL45Chj5cPDTR7jeVTb6R1rnhHNJkFuNmW6Kl3
	 FWHC1Ts9Xi7kQ==
Date: Wed, 13 May 2026 17:06:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260513220610.GA341225@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65792ada-5e9d-4e3f-aa79-bb4a8ffd9161@cjdns.fr>
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

On Wed, May 13, 2026 at 11:39:25PM +0200, Caleb James DeLisle wrote:
> On 13/05/2026 23:07, Bjorn Helgaas wrote:
> > On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
> > > Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> > > 
> > > These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> > > require re-training after startup.

> > > +found_port:
> > > +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
> > > +		/* Let it go because the device will work as Gen1 */
> > > +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
> >
> > I suppose this will cause a warning even in cases where Gen2 is
> > impossible, e.g., the endpoint only supports Gen1?
> 
> Correct indeed.
> 
> I imagine in most cases, if the port is Gen1 only then board integrator uses
> a Gen1 card as well, so I could try being fancy and probe the card to see if
> it supports Gen2. In OpenWrt the PCI driver is always built-in so I didn't
> really consider this something to worry about.

Probing the downstream device sounds like overkill because it hasn't
been enumerated yet and there's no good place to check after it is
enumerated.  I would consider just logging one message as "info"
instead of "warn", maybe in mtk_pcie_startup_port_en7528()?

