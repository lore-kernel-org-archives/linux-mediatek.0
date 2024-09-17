Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE52C35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 09:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ohLUN7DOnyEI3NWAO8wypBaON48U9+peQySTwVRgJc=; b=pSQvqwizaW0NCqAfcrh/3RHBR4
	GLK7KLDGpmHWJcKpXn6vNjBTgv0G3nHU+sSb+nK+ihcbPArjundpmgbBSOqhcaqTaMdDC+YWo+3Xy
	4eIu4+mt3NMt7HyQKENYh0woepUeUhDXIvhe1d3gTu96p0MzoSzakSKWFL1LG/OFfN34LPeF3vc1j
	KszBU7YzVkKmWgWsSN9ImvU68Wggf5oJTzMDj/bjxH0M8rRf5QwWe4QtPFpnKm14W0CdycWH1yXwy
	OfkuPlFQJsV6Ww4Kr4c9r57PtOGh/W1oI6Q+5RWyS814k7fQDvGUWEA6tM4xG/piNlzdGU0dylXw+
	Uu5mY75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUGN-00000005nEI-1KaI;
	Tue, 17 Sep 2024 09:12:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUFG-00000005myp-0ipb;
	Tue, 17 Sep 2024 09:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726564296;
	bh=58lPaXcY3g+9HNzDYS6D7c9jH1qiDF3Ci+34DHi5/VE=;
	h=From:To:Cc:Subject:Date:From;
	b=GMUa/pPXwwgAJ5nhu3kpb/IFFI7eIclKibLfPmOyBaUkSuH5jecsvH1+6CCqTx8GB
	 iC5X6nZpS0r8/usRgxtpNN7B115yGu5NWt9JpEozbqhtpUswtUbVWWdTjd0+qg/IfN
	 TyjqwfiXoWuvpJpHUbdOfOSjAIB4aAOAW5N1uH4qHR6T7SnD81eD/hBaoZuHdkBSUH
	 olg7EEpN/Ajn4nMaeNuS++G5NCrvy/HE1BhxrU7mGLTmyHhkH7iQl2Jo9lEkXPHYop
	 fbhbiScF91DvpAWZj1UFFxUrMektIN5xiYneD0QZ6TwOCK7CfPZBYsJdBxsZ/TLzHD
	 5adlB7soSivPQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9268E17E1080;
	Tue, 17 Sep 2024 11:11:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] PCI: mediatek-gen3: Support limiting link speed and width
Date: Tue, 17 Sep 2024 11:11:30 +0200
Message-ID: <20240917091132.286582-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_021138_378966_37779B7B 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Changes in v2:
 - Rebased on next-20240917

This series adds support for limiting the PCI-Express link speed
(or PCIe gen restriction) and link width (number of lanes) in the
pcie-mediatek-gen3 driver.

The maximum supported pcie gen is read from the controller itself,
so defining a max gen through platform data for each SoC is avoided.

Both are done by adding support for the standard devicetree properties
`max-link-speed` and `num-lanes`.

Please note that changing the bindings is not required, as those do
already allow specifying those properties for this controller.



AngeloGioacchino Del Regno (2):
  PCI: mediatek-gen3: Add support for setting max-link-speed limit
  PCI: mediatek-gen3: Add support for restricting link width

 drivers/pci/controller/pcie-mediatek-gen3.c | 75 ++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

-- 
2.46.0


