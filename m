Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D423CCA473
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qYA1ArRnz+F9VizDo2CNqVv0NHTd8SRRG1XeM12r7A4=; b=wt/4cOUQwMnv+I
	KHSRm2CrgS7KZTWpSLDqwbcj5k4ZIuAtsdznt/ajDO+gyRtvgd1VJVvUJF/Kh7H2RExsyHfPyyMUP
	5bTc1zv6MoWEMvKVwe9u3Cc3PMz+o37Le2sXEOZj0PHwK9AkN1Et5389IY33xICgMh5C8F2nECsoL
	3kwWL68+OcCCWZjnOsXDdBO9+ZzcvwEyRVcfw2Bah36FFn6s2Sa7MLkyFRZ94gE0QajrQb/sh15r2
	t9AynISQx1/NPDptW7eq50F6+Zm+QFzCJbukNh8Yp6AlOPSlYSYsYZmmNMEzTflCkze588D0aAl+G
	vX/ETaVF3ZNsi6gNgJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFax-0014JC-Im; Thu, 09 Jun 2022 10:40:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFaJ-0013aO-1W; Thu, 09 Jun 2022 10:40:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DEE3F66017C5;
	Thu,  9 Jun 2022 11:40:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654771208;
	bh=e0AQfxv8jGpQQTIJ9KKzNfQsGY/6PxPWTtlkTzfZaxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QFp+iinGUw+/GZa9POrbVNX8EqjKqwp/vDjG+HoAKtab89eWAf8/SwDrG7wJSSHzY
	 dnoosbFI8+GYD3a08e9TOw9PWSjBZ0Hj7zL0iXt6dQXVBjCrqg/lCvZs8MV7fNsZiv
	 TfY6Vjck2tHn3FQmO6C4qTZIEo8TfpGi06NGe1XM9K30kbRkipqzFdlUZxWBAenzW4
	 olooBGTyxd9Bn5kx0w5hxsKmFIZnuz68MHXhcGGFX1hOkVrFXNkvgNzsRIzYkid//W
	 xUKG36GZfioFha92O78ghvotmX+1BvKmQRUp96KtQvH8XGTgL0J30iZ9KTZLKajZ9U
	 DQjswuX2s1dYQ==
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
Subject: [PATCH v3 0/3] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Date: Thu,  9 Jun 2022 12:39:58 +0200
Message-Id: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_034015_261529_C58257B2 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the IOMMUs found on this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v3:
 - Added new flag as suggested by Yong Wu
 - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=648784

Changes in v2:
 - Rebased on top of https://patchwork.kernel.org/project/linux-mediatek/list/?series=642681

AngeloGioacchino Del Regno (3):
  dt-bindings: mediatek: Add bindings for MT6795 M4U
  iommu: mtk_iommu: Introduce new flag TF_PORT_TO_ADDR_MT8173
  iommu: mtk_iommu: Add support for MT6795 Helio X10 M4Us

 .../bindings/iommu/mediatek,iommu.yaml        |  4 +
 drivers/iommu/mtk_iommu.c                     | 21 +++-
 include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
 3 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
