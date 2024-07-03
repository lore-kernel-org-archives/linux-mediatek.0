Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34341C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 20:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hjMUWxOFD2sB+R9gMNRWFG/NbjSVZjLGutoEHzK3SuI=; b=q2QIdtEF7bkFqt
	h6AKGIkhzOQqXwcQaWLeB8gakXcziB2vQOuNYvw7dLGL4wR9gV2kxS6RCRBCuR5jQjt6YRp/tCvW4
	357knJdZJfcZvdWXPvLojrddNP/acqrtKBGQ8JAG+RSWVHRoRPPpIqOszoVjHqe+C53AZVpEZw7Ui
	oMYnufV4FOW8rjkwEX3JVHRPecFISZIogCDtoLW/e4qy3x9syatHsptajjlHNIpEmAkq9v8vTrjXd
	eQUf14ASDriv1tscoku4e4nuaKHH6g/oLp4dlKIaCp08mvM5vTMdBwmPDsq8nxxA0nmt8nsSgfWRV
	4oyyMcWwSOHqAAgXkJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6te-0000000BPTV-2myY;
	Wed, 03 Jul 2024 20:48:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6tR-0000000BPRZ-2KB4;
	Wed, 03 Jul 2024 20:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8F135CE3096;
	Wed,  3 Jul 2024 20:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9558EC2BD10;
	Wed,  3 Jul 2024 20:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720039673;
	bh=Jd/tImvsQRd4eOrB2nymxgGFq2kqlbVzG8bqRF/WKfg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rE8g+G66RHM0lywX9/LI7kc2Pjf8sJ9xky2WruTaR03dHLvCZgW3Mi7bLolnb/tD1
	 AGrpcI59/KODxBkboZ19Kj8abh/urO8jThUds7fy/G6dsaGs8DGA3mRE+phxJx0lGZ
	 QkSE+htihVGmgnU5S8Irt/iaY7QBSpokMNzysrBFGHK8E3BAJlAAZLbtA6ExnnCdCB
	 2cGlkYNgXT1wEl/3t5jhuX4HCaNTIknE8q2vYzi3DcQiYEKCzZ4lp292ag6UKpAqRX
	 gciYdqMaYKy4vwa+2w01+RRaD8a1POKCHLDJEMkpAMtAicNzPNHmVn4sGHati19PhS
	 uhbOXfhDdtkcA==
Date: Wed, 3 Jul 2024 15:47:51 -0500
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
Message-ID: <20240703204751.GA63492@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoVtwLI5nIRpS2al@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_134757_787872_1877E914 
X-CRM114-Status: GOOD (  26.88  )
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

On Wed, Jul 03, 2024 at 05:26:56PM +0200, Lorenzo Bianconi wrote:
> > On Tue, Jul 02, 2024 at 11:12:21AM +0200, Lorenzo Bianconi wrote:
> > > > On Sat, Jun 29, 2024 at 03:51:54PM +0200, Lorenzo Bianconi wrote:
> > > > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > > > PCIe controller driver.
> > > > 
> > > > > +/* PCIe reset line delay in ms */
> > > > > +#define PCIE_RESET_TIME_MS		100
> > > > 
> > > > Is this something required by the PCIe base spec, or is it specific to
> > > > EN7581?  Either way it would be nice to have a citation to the spec
> > > > (revision and section number).  If it's generic to PCIe, it should be
> > > > in drivers/pci/pci.h so other drivers can use the same thing.
> > > 
> > > It is just the time needed by the EN7581 reset controller to
> > > complete the operation, it is not something PCIe generic (it is
> > > something just related to EN7581 SoC).  Do you think we should move
> > > it in EN7581 reset controller codebase?
> > 
> > I have no opinion about moving it.  But it sounds like maybe it should
> > have a less generic name so it doesn't look like a generic PCIe thing.
> > And also a spec citation would be helpful for future maintenance.
> 
> ack, naming is always hard :)
> I do not have any specific spec for it. It is in the vendor sdk and the Airoha
> folks confirmed just this time is needed to complete PCIe reset.

Even a note that this came from an SDK from a specific vendor might be
useful since it shows that it wasn't picked out of thin air and it
gives a hint of who to ask about it.

