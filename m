Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572A5C021B3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WNlacTHLiwWI06w65nVbipAqlE6KzC1iSQdxi30OCKc=; b=ww5zpkQ07zkVlj
	iwAKTcLSRFrq91lotLarmtUI5pNWTLH9ZYGDDn/hLiPqHS5DjQkJd1jdmNuL7R8giy+Eaz//MYqi+
	tUH5dqKuCJ/wnxiiD2SgFNx2RobD7jxovJ9LkrhZ80mVjEnEPeuUfdOYcqEmWpRYRXBn7cqoLNlEl
	wnejStnIfyVNv2aQvt5tnKiK8xvgiT5CfVkuierceE2yNz9XLvdWAwdKCNw1zUjvuE0I0yNwiJ69M
	yJj9FFn7Yw/G4feetLw1KBzYF1IIUbg+vtr425xtkr+h8NqwA9cAmNYaGvPAMgzDJGcffl4Sq0HVH
	Lp1ZrCqUVGOkmjfU1srw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGQK-00000003QHf-0P3n;
	Thu, 20 Feb 2025 23:57:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGOp-00000003Q63-1SAm;
	Thu, 20 Feb 2025 23:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB9BA5C62D5;
	Thu, 20 Feb 2025 23:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83825C4CED1;
	Thu, 20 Feb 2025 23:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740095768;
	bh=Eb3PNHLV4cPI8K6SDzl4RrupJI0tXhzPnoREbPcni7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PTL3U9QPyEq8DsWrE9mRVirVrg4Xpdiov+zckJd5xANuCrKWRinEGmyP1j/e4m/5O
	 PVBH7axWpFFORCsaWCblKfI5cgAKguHNxxf00l3qzBYjRpYpTjI6gGQ+NrXcIzX3ZX
	 eGNbByszbdPASr4BwCG3lQbds5rfXGf50Sz/9T8Zc49A0Br56VxZmpRxiQYvXZkg9W
	 At/a8C9LxJ56/ITaANbMIo9T9TkJvVBd5PxSBIPJmjKK8kZDJP0Zs/Ld39DNPPWnGp
	 kVZWtAfRV9c5svu8wllde5ohk3JfFANi60LfPU3ssJXYsEUxCFW1MlxPQOrO8j8ri1
	 9ahbSnETYQjSg==
Date: Thu, 20 Feb 2025 17:56:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250220235607.GA320302@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7eIXsupArd8xH7_@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_155611_427448_31BB1839 
X-CRM114-Status: GOOD (  17.99  )
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

[+cc Frank, who asked the same question about DT]

On Thu, Feb 20, 2025 at 08:54:06PM +0100, Lorenzo Bianconi wrote:
> On Feb 20, Bjorn Helgaas wrote:
> > On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> > > Configure PBus base address and address mask to allow the hw
> > > to detect if a given address is on PCIE0, PCIE1 or PCIE2.

> > > +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> > > +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> > > +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> > > +	((_n) == 2 ? 0x28000000 :	\
> > > +	 (_n) == 1 ? 0x24000000 : 0x20000000)
> > 
> > Are these addresses something that should be expressed in devicetree?
> 
> Do you have any example/pointer for it?
> 
> > It seems unusual to encode addresses directly in a driver.
> 
> AFAIK they are fixed for EN7581 SoC.

So this is used to detect if a given address is on PCIE0, PCIE1 or
PCIE2.  What does that mean?  There are no other mentions of PCIE0 etc
in the driver, but maybe they match up to "pcie0/1/2" in
arch/arm64/boot/dts/mediatek/mt7988a.dtsi?

It looks like you use PCIE_EN7581_PBUS_ADDR(slot), where "slot" came
from of_get_pci_domain_nr(), which suggests that these might be three
separate Root Ports?

Are we talking about an MMIO address that an endpoint driver uses for
readw() etc, and this code configures the hardware apertures through
the host bridge?  Seems like that would be related to the "ranges"
properties in DT.

Bjorn

