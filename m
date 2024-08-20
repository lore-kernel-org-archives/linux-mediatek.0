Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C984EC531DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MMpGYWqxYFvsJZFB/aitMBHjApRYA3U/nib/hXoTY+o=; b=1gAKHlWFpHCzZN
	45K6SYLfByq0+i9gK0ACLMvVVUJFMx1on3wmh4kv5EnmU5DpsbVJxNBHUv+vyRXfdpPrIxOfkEmEg
	Eje0a75wQcyDrmqf2DCZRbMjo3pauhvQTVUKFs5nkZXomhKHxFz6LkGH6XNOVSkJXHHlLerFsoCRG
	eJhI2/FkMV1qDIWL+omkc3njDgDU/Z0NknX2ldob5zZfUh6Ahnf90NyVJ3canx95fO6iJ+0s17r09
	UShybzEBE7Oky9ERLh3Mjjj8Hx/6/uAqLo4sEYq7F1GJPunv+N2fPyv3AHc75w+H+w3vozePQQ20Q
	dpRNTllAYPIvu+akvDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgPRJ-00000005SRw-1QpC;
	Tue, 20 Aug 2024 14:02:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgPQa-00000005SKg-1agk;
	Tue, 20 Aug 2024 14:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2AB360BBD;
	Tue, 20 Aug 2024 14:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F1EC4AF0C;
	Tue, 20 Aug 2024 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724162495;
	bh=tMDVgSdrmUt0o/yr0SfdNlxwNnAf8+M9He9ObnMuKnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QtlTyHdwklxJiNDl1CkBntI64OwQmmIL/QJE+S3XpXS94qiUgxFWHwmyx7NREFN8f
	 fn/3zqHETJtME/zWnFx/z2IMXN4x0fcyg8iDF2cSDA056DwAU1pVjquIqLi2bV3Knp
	 ZFxCUIeFaxW4//jkoo22CwWmfhcDpNG+6Yiq+Y4DDmQRG1TAzIxjKdBOIsq0Bdap0p
	 YLyOGEr8w3P9xW7H5MNW9Z02FwROUpCkvycnQGJdh6uU38f1ZmxdsravoLIUJPM3Vf
	 iocd0Gv9qhHk7/ZYb7wY97K2gb1XN2f13WLE2MtZzTug6sYqV+NF+uzGt74Yk0JoLV
	 wArz/EvMvMuFA==
Date: Tue, 20 Aug 2024 09:01:33 -0500
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
Subject: Re: [PATCH v4 0/4] Add Airoha EN7581 PCIe support
Message-ID: <20240820140133.GA207494@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsRX-Hrn2fCITK4P@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_070141_315672_3038FAF1 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, Aug 20, 2024 at 10:46:48AM +0200, Lorenzo Bianconi wrote:
> > Introduce support for EN7581 SoC to mediatek-gen3 PCIe driver
> > 
> > Changes since v3:
> > - move phy initialization delay in pcie-phy driver
> > - rename en7581 PCIe reset delay
> > - fix compilation warning
> > Changes since v2:
> > - fix dt-bindings clock definitions
> > - fix mtk_pcie_of_match ordering
> > - add register definitions
> > - move pcie-phy registers configuration in pcie-phy driver
> > Changes since v1:
> > - remove register magic values
> > - remove delay magic values
> > - cosmetics
> > - fix dts binding for clock/reset
> > 
> > Lorenzo Bianconi (4):
> >   dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
> >   PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data structure
> >   PCI: mediatek-gen3: Rely on reset_bulk APIs for PHY reset lines
> >   PCI: mediatek-gen3: Add Airoha EN7581 support
> > 
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      |  68 ++++++-
> >  drivers/pci/controller/Kconfig                |   2 +-
> >  drivers/pci/controller/pcie-mediatek-gen3.c   | 180 ++++++++++++++++--
> >  3 files changed, 229 insertions(+), 21 deletions(-)
> > 
> > -- 
> > 2.45.2
> > 
> 
> Hi all,
> 
> any update about this series? Am I supposed to do something? Thanks in advance.

No need to do anything, I think Krzysztof will likely pick this up
when he has a minute.

Bjorn

