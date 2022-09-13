Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1396C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqee0McLgfjd4DglVBSHzpRLfZUIxufXUv91lsVtimM=; b=l+Mt7BJRQ8a6vtBr78XUkwPfWk
	6n4W2lZasJdiHMeYVksqQLdP2M8ObSeevuyXt5xprlanYjjkl3vxuTPV3BOjp0SbIOaRWxWWRqDnT
	xgBoUnbGoQ1s0/df3IN5sT7jefFCPh8DZGUsgyUpItg2RnhKQUbb7L6mjH9oFtw7jrE1xYWFZCao2
	TrSkuVHMkO89gC2aa9/eKcyNSw0QRF7lo5bzgO924d40A6PXDiP/BuRWCDh14Y9BWNPzIvrLL87gf
	CDKatXme3wFs1rI8Go/uur3Zs1ABPkbKc+S5RXB8CUapArQVyVbZLHiJxmWawnXY2A68b9+HHpw99
	5TnTwNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY7lU-00CROz-FT; Tue, 13 Sep 2022 15:23:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY7a7-00CFmr-2O; Tue, 13 Sep 2022 15:12:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 33B03660159C;
	Tue, 13 Sep 2022 16:12:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663081923;
	bh=KuqdCOgJgOieJeD84xWwkxjms5aJs4gnLtG2P+nlerI=;
	h=From:To:Cc:Subject:Date:From;
	b=KURCdp7GvGRCnqeFgWJ5tTXgrPL4i/PORMKE3D7a7ZUlYh1HKkzMOMKdA2JyHrK9j
	 mSe5KmRvaQq4t+4pwI0KmQg1MXGUrQBXM5RWgKyNsz9a3esnP2/VUm+hDAbgbECp7m
	 jbaLMgpwGpaflHVOI+6ao2gXSRj9D114r1sQKm7faAhvxG4i1cwMa/C7ljK1qD9ADd
	 TCET6+pMynoBYSxkVQGNEaRTejlFrzensWN8Jb9a1ZeL8vdI1EOWu5ARpWSAHodFpk
	 l0qEA5QSO8NnzMMWaiPi7J0iPFUlxZ1463nYzhnLv7Iy00STGM5yQjMCsfYTxduGq9
	 kSJhSENySYFgw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: joro@8bytes.org
Cc: yong.wu@mediatek.com,
	will@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 0/3] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Date: Tue, 13 Sep 2022 17:11:45 +0200
Message-Id: <20220913151148.412312-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_081211_329305_6A822374 
X-CRM114-Status: UNSURE (   9.83  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the IOMMUs found on this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v6:
 - Fix rebase mistake in patch [2/3] (dropped unrelated change)

Changes in v5:
 - Rebased on next-20220912

Changes in v4:
 - Retitled mtk_iommu commits to iommu/mediatek as suggested by Yong Wu
 - Removed unused M4U_LARB5_ID definition
 - Rebased on next-20220624 and
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=650969

Changes in v3:
 - Added new flag as suggested by Yong Wu
 - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=648784

Changes in v2:
 - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=642681

AngeloGioacchino Del Regno (3):
  dt-bindings: mediatek: Add bindings for MT6795 M4U
  iommu/mediatek: Introduce new flag TF_PORT_TO_ADDR_MT8173
  iommu/mediatek: Add support for MT6795 Helio X10 M4Us

 .../bindings/iommu/mediatek,iommu.yaml        |  4 +
 drivers/iommu/mtk_iommu.c                     | 21 +++-
 include/dt-bindings/memory/mt6795-larb-port.h | 95 +++++++++++++++++++
 3 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h

-- 
2.37.2


