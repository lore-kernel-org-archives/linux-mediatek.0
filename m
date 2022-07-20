Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE47DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OpBJKF3O04JLZfnW5X/pXsvgTvPKFaAa7PTR+Bw3Ijs=; b=pRePtfue2YkKupWMAHaHxTyoSN
	Ege6sRgnw+316B61NlLUYEoDnKa1CjzqZXx73HJtZnlM3N0dJUGblpamEUh3nLpy4os8rpa0pjbAp
	AdOM0EiZp4bxuHDv3u+JiNkYrchthNz32vOer9CNar5dKq6M2NZQLwoBJ6xYs9fH3oOG06T6mxxv2
	aW2hFpOZ6g2NDg3KkwicoWN+mL2fMcp7X1Pp/xok3VGP6o6H8//Dt5QaLuLDpoYbUvQgjKyAdJJPn
	Nmbdbf/3oZ9Tw6XKs/q5YgOSMs+vkhecn90dITBNf7XOK/M7Nz8nNQb6kUNyxHRTt8bSnEIcnbzFa
	Y/mRRztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6wj-00431f-4h; Wed, 20 Jul 2022 10:28:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6wU-0042Xg-0E; Wed, 20 Jul 2022 10:28:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66D5E660159F;
	Wed, 20 Jul 2022 11:28:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658312906;
	bh=7l+2CZgG+sIADvhql1OGVojBV4addG3U3EH5rwCDuag=;
	h=From:To:Cc:Subject:Date:From;
	b=evumRvnk7RBzc5HkvS6nWuSxEMS0AqMj8TyvUq71LPCaNmEvwvMG/XkE25SP5NJkE
	 qfGAI5ZVtWUvHQzZobwuQfPAU2v1wYCJnJcybUTVPdsqi2gBjcSGba8Z6lsLxMc+mV
	 RmK+yj+yRu4Qd2FRf/O4eDT+MlRTHW+OrXzGIMTH06VgLYy6aIxZI4rLV4Rsb8qRC1
	 cK2T1PBgI6bZcUBoG9MrYFa0zgsx4pNRYxKXuqF60PbUJ1cOFAv4N73N+f4dyopCwL
	 2jSy4aiEIb/60Pohd0Au3kHjePd7twmQ+lpVvjqf2YW5Z+LvLklZYLRexa229g7qGC
	 3G4mNEWl+qIcQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] MT8195: Add reset for T-PHY (usb/pcie)
Date: Wed, 20 Jul 2022 12:28:15 +0200
Message-Id: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_032834_299946_153F11A7 
X-CRM114-Status: UNSURE (   9.65  )
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

Add the resets for TPHY Port 1 which, depending on the board layout,
is used either as USB or PCIe PHY.

This is required on MT8195 Tomato Chromebooks for correct initialization
of the secondary PCI-Express controller, where we have a MT7621 PCIe
WiFi chip.

For reference, the PCIe1 controller devicetree node resets will look
like this:

pcie@112f8000 {
	... blurb ...

	resets = <&infracfg_ao MT8195_INFRA_RST2_USBSIF_P1_SWRST>,
		 <&infracfg_ao MT8195_INFRA_RST2_PCIE_P1_SWRST>;
	reset-names = "phy", "mac";

	... blurb ...
};

This series depends on an earlier one where I introduce the MAC
resets for both PCIe (p0, p1) controllers [1]

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=654980

AngeloGioacchino Del Regno (2):
  dt-bindings: reset: mt8195: Add resets for USB/PCIe t-phy port 1
  clk: mediatek: mt8195: Add reset idx for USB/PCIe T-PHY

 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 1 +
 include/dt-bindings/reset/mt8195-resets.h  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.35.1


