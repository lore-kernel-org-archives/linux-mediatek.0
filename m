Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567BC3065C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=w3Xrz0lXD4LhEmE8Ad69YD1BMJkeyWe14o+sv6e0a9g=; b=laHo+Ii8hM3wNj
	PZoz9P0FKcnimwbct0EkDuFt5ZlN5K5BSgWEJd3wiwaHmtbELjYPd3B6VGk1AaJoiSG/5FWDc0uZj
	5ooZH2Bwtk3fNdaKqcRRQGe2w6afjbtxnN1jdNqJm9aesww8kpcNGuk4zeqReJYqK0/b9/NxMQQu4
	XDQA8Z+1B1BJHixeBEEk9Fnx/kwLu/OhU/ZLLVnR1zSMcAUsOgCyuWWmBmgPCosDLVTsZRBX7zy8B
	vj235Ku6I1piuCqCmussZL/hd3vv8o2kaoDNnvRFbsSNlLH4aSCCd7i3Y5Gj6Cq1o4UUI/5KZPNkx
	/wFRBCw6osE0o4J2XysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOgT3-00000007OEq-3wjy;
	Tue, 02 Jul 2024 16:34:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOgSr-00000007OCZ-25yP;
	Tue, 02 Jul 2024 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3FE4BCE1911;
	Tue,  2 Jul 2024 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A5DC116B1;
	Tue,  2 Jul 2024 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719938082;
	bh=khiZR101rp5P36Em7z0sEdIWe+tz1ChCcX6aGVTw7R8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FC26Fg4Gd9lQlTIDmJQO798iX3AYRLV1N3K+ubVnJUNOnyiMRgamzwaviQih2uMar
	 2eqA7yr6mEPkDQlTrC1gC4buih5/fNvkxdcsF8mVQRaLwMcmLjvggJx40ehgTvt8NZ
	 kAwOeVPjqvK1+IHsKBTYaAUhgI4Xn5zOR7OYBzwmbztl1AbshcIK5glMCU1Wrct7SN
	 z/cUg/GPjp46Y204PlCk7RdylWDvknYjyx0P9fQJbigEsEu1bz5e6oDHaPutmh3oFz
	 KsXv99kGH+I+pAb6t5BDEifiP1VJ6igQ/mQLOJMIYdtxRLPSAMcUIRQL8iyZ5mzF4+
	 3r20PudmQeWWQ==
Date: Tue, 2 Jul 2024 11:34:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20240702163439.GA24344@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoPEdU0Eg-f-mbgC@lore-rh-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_093445_741291_41DAE16B 
X-CRM114-Status: GOOD (  20.05  )
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

On Tue, Jul 02, 2024 at 11:12:21AM +0200, Lorenzo Bianconi wrote:
> > On Sat, Jun 29, 2024 at 03:51:54PM +0200, Lorenzo Bianconi wrote:
> > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > PCIe controller driver.
> > 
> > > +/* PCIe reset line delay in ms */
> > > +#define PCIE_RESET_TIME_MS		100
> > 
> > Is this something required by the PCIe base spec, or is it specific to
> > EN7581?  Either way it would be nice to have a citation to the spec
> > (revision and section number).  If it's generic to PCIe, it should be
> > in drivers/pci/pci.h so other drivers can use the same thing.
> 
> It is just the time needed by the EN7581 reset controller to
> complete the operation, it is not something PCIe generic (it is
> something just related to EN7581 SoC).  Do you think we should move
> it in EN7581 reset controller codebase?

I have no opinion about moving it.  But it sounds like maybe it should
have a less generic name so it doesn't look like a generic PCIe thing.
And also a spec citation would be helpful for future maintenance.

