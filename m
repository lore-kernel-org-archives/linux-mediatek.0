Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5BCEF4EDF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2026 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmBWQp407PS3C3blBT27whCkUNWZwLdXdrOvCWYusnk=; b=MI9TxUsGNww6stoUFzBAK3pmJO
	HN6qKMPdb518hyS3hgDF5BX/+P4m0f8IqaOUc5doPZxz8o5na1A8dYE7LEWk1tAxWRGzin7AgEta/
	iiUWTlvIsvv5gCEIq7bEPNYt4y5opA1ufaq5ZJZd/8beghEDjrZ4MaASsbjgtLEUB8G79drr+Mu76
	cjTJ7s+l3O5ULI4mKTu+02vq0dQ+jzcpN4CmyOFzIBi1Ab8BeMFia/PyCZ1ZGpQH20OJuN5LrraMl
	bQk9T+GDKMn3aD+unM5WqBmg+/j4mHV0MiWP+gsCOsVPPlisuxLXVdCTpKgEOWC1d2ZYAiflBp8Nj
	t+u01xOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jD8-00000005762-22e3;
	Mon, 06 Apr 2026 12:37:46 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jD5-00000005759-16pg;
	Mon, 06 Apr 2026 12:37:44 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jD1-000441-00; Mon, 06 Apr 2026 14:37:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1F503C0256; Mon,  6 Apr 2026 14:37:11 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:37:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
	vkoul@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] mips: dts: Add PCIe to EcoNet EN751221
Message-ID: <adOo9xZxXT3FkufM@alpha.franken.de>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-9-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-9-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_053743_451120_3A3CEE1B 
X-CRM114-Status: GOOD (  10.04  )
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

On Mon, Mar 09, 2026 at 01:18:18PM +0000, Caleb James DeLisle wrote:
> Add PCIe based on EN7528 PCIe driver, also add two MT76 wifi devices
> to SmartFiber XP8421-B.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  arch/mips/boot/dts/econet/en751221.dtsi       | 114 ++++++++++++++++++
>  .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++++
>  arch/mips/econet/Kconfig                      |   2 +
>  3 files changed, 137 insertions(+)
> 

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

