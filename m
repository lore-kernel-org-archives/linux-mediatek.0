Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF600C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sX1znADOY1PNnggEB2TurbxGPI1DvXLgYVslEZyTdxg=; b=QHSLEevjTu5ozm69TNVRSAg3FW
	8H965h26Jf1EtVm9Um2N8VBNiF0pjBIgknGe/nh/aq6sVtCYpWTrvqtEaTSh7pJqMl6qgfhP0+kXG
	bIkVKxnT3VAe8cJ6sO1V3uiHE74kpkE2X7tCpQTMbUhe/GIsYyVt4STMwQ0fWXmQXOeqzhbeDYhNy
	rVyhiRKHs/YJFCOVHJIRsV+JPRHBvbFWFLYoWtvgo+AjtMG6qREJDU/RsQRcCebUO8ppRZO4HOb9g
	Pd/0j66ZSDT6ygz3C2Ts1UX5kODtp+1c5J6yzYSfILl/v1o1lUYS8EsdoeizIYFXrFNQ4d1NXOl97
	Hzeg4+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g7H-001anU-68; Fri, 24 Jun 2022 10:00:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g72-001afe-TZ; Fri, 24 Jun 2022 10:00:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9BB146601706;
	Fri, 24 Jun 2022 11:00:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656064827;
	bh=kE25mZowYawxksYFtTK6e46BuEVPPKrDas/B81hlGfU=;
	h=From:To:Cc:Subject:Date:From;
	b=dK5lHwZzHT0WmQPPa28n8ROtFdjlfq8SR8AslZ7EoynyJLA/3w7rSAvvob5e2QiNJ
	 UAkKJdGIUyczVADiyyXi/M4xZHLQSnHe2zlu5QZb4BdC8O+QQW2gszJAxnbAMoTi1D
	 MkyjnSF2M+f3dYN5t5eDVX6yTdJbvsEeIC2T6jV20ic6Jbpfe2vLSp5B/wd7Gp5x/H
	 QMUcz2WId2rgFUNWNeXvAsaWS8YpoPpG4lMZuh6D9sVM4Yhbkofx1bKstiQoH6yA3j
	 /jMklss5NuhsJCUAkbsez2Nj4IpaGZOuXaD61mBrn0it050z6qWwcng93VF4FTKLKm
	 0PcpX0tzAyySw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
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
Subject: [PATCH v4 0/3] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Date: Fri, 24 Jun 2022 12:00:13 +0200
Message-Id: <20220624100016.246442-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030029_126990_1AFD7F2D 
X-CRM114-Status: UNSURE (   9.24  )
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
2.35.1


