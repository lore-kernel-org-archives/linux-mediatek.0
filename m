Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F816CDD1D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uqNRevo7/gz488fiTqhhJjGGO3OeNRssLhg7JzCxscc=; b=Ix3KHUhOEheeg1
	Qii0uUqbfRONpfl2/81qIwfrg3Fi3R8dA709hXSUq0/jQ943wB3PvmDhzEI/ImYlL+xcLINrzoKUT
	6c+RijbWvZA+E0ADLM7gJqN0qdN7eV/Ygji55fV95ZmPuX5ahvax/qGI7CP3fybZGC2kbFl6EygcE
	jUevk3UYvYnN6tRMt2x0jATzn3TNfBnBbyZkFIOVziNZXQ5cz0bi5Qt7aN3axyIp6tjNmif9tQORy
	P5BM2oRS6jAE3G0PNOPosa75WKvnVmuF0FocHvTlF7Sd80moOnbSXduUpQJeM8Qc4AP8QmMvf6dme
	gdSp61r9HGcd/ftLRgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMEl-00000000eUG-16CJ;
	Mon, 30 Sep 2024 19:39:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMDY-00000000eMg-0Kkj;
	Mon, 30 Sep 2024 19:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B23A95C5415;
	Mon, 30 Sep 2024 19:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA59C4CEC7;
	Mon, 30 Sep 2024 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727725078;
	bh=bd1W1edyxyIMzyL2oVwBIlRMv4WpY7BdgJEv7EeGadU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Bj5fAJyXTmlHX0a4DRvSQuSyLlHOQXv4RSMwtiCTmAKV4ifAt0Cy3jB3IVi5N7NqX
	 juZkVo9JxoiHBdA8ynQTQaiKOmZk+y9W3Bpm036nNJqIJOlt9ScFiRBblEUv62GkqX
	 60MhMh2HSYCoz3tT0MmMALx4gTBZjJg+/TTDfhcQA+2UKxMPf3m/HXJz8pynmwSSXK
	 8eglbwfrGxOHYOC7T/QfAtG5+e8+gEpeudcSExGwhGejwdojBWzuiY5gT70m63m6Kz
	 niXI0iq95UQxVnC7QOKBxAsBrOO1Do+P19DXKjDY9gCvH1hjSrOSeO+Z9IkwHyk+/G
	 294KSdkwmdVVA==
Date: Mon, 30 Sep 2024 14:37:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha
 EN7581 SoC
Message-ID: <20240930193756.GA187798@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8941149-9125-4fe2-a1c0-ab29223a0c87@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_123800_205147_09FFDCDA 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, Sep 23, 2024 at 11:41:41AM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/24 10:26, Lorenzo Bianconi ha scritto:
> > The PCIe controller available on the EN7581 SoC does not support reset
> > via the following lines:
> > - PCIE_MAC_RSTB
> > - PCIE_PHY_RSTB
> > - PCIE_BRG_RSTB
> > - PCIE_PE_RSTB
> > 
> > Introduce the reset callback in order to avoid resetting the PCIe port
> > for Airoha EN7581 SoC.
> 
> EN7581 doesn't support pulling up/down PERST#?!  That looks
> definitely odd, as that signal is part of the PCI-Express CEM spec.
> 
> Besides, there's another PERST# assertion at
> mtk_pcie_suspend_noirq()...

I agree, it doesn't smell right that this SoC doesn't have a way to
assert PERST#.

The response at
https://lore.kernel.org/r/SG2PR03MB63415DB5791C58C7EA69FF01FF682@SG2PR03MB6341.apcprd03.prod.outlook.com
suggests that maybe there's a hardware defect that means asserting
PERST# doesn't work correctly?  But surely firmware must have a way of
asserting PERST#, at least at boot time.

If this is truly a hardware defect and we really can't assert PERST#,
please say that this is a defect in the commit log so people don't
think that lack of PERST# is an acceptable thing.

Bjorn

