Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=75CakknAqO0PMv6rE61f+6vnoUrCIgWs3bvKtyD5Cq0=; b=2yCjYfAKN697Lt1im2k8y4LsoI
	YzH+B3Y8dFyoZC0wiLtk/BYCg4gAeQJZgT1JlQjJ8No1tEhlFyHa9TN++0VHOiOD7p7SUsb71QwQp
	XuujY2iA0sMLUMQsSfLulxWBlCpIXfgjrIBB9rSn3j/rx4e61WCBx4VzWNwaWOABUsSaX0r2Qcv0P
	H7hzdS/xW3bvhpkUbMGX6cLEgm/LtnhZnmDL+xbLZhJ4hxkbQs0+6NCN/L+OlkrVov62F9BU2gQgf
	mecwrFia3Tx0EZWi6z1EUUDXifZGMTPHaH2tNKWZHGBUBcsY66HjxPWona/fY408OkZAhN/cC87Yx
	+x2HBHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nMr-00204L-8x; Thu, 16 Jun 2022 11:08:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nMf-001zxT-G7; Thu, 16 Jun 2022 11:08:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 686846601747;
	Thu, 16 Jun 2022 12:08:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655377719;
	bh=mpK1TVAIqyX6YVJK1M8Os+7jR/kqhqwVYDvOvGIs95Y=;
	h=From:To:Cc:Subject:Date:From;
	b=Ch6RYiKtPc9VsSjhrKSnp0vU0dODz448sqD29I+hfp7tCSq5/Ms2LWSEmzwV9qCFj
	 J3HRBsegQbwFFREW/xctKgGliHrhsNAX/hzS1NR+sNIfg8fXJAyVe/5fqZ0QKL4H6w
	 5XeXjANUFC2PrvMdwicA55FIyaMoVZc5uBhj6yMPfuHVu2QLOLG3DQiFH1x0G5qPIF
	 BI5vbbrHPn0UYp78uw+RtufGvAbSFKnCq94XwKZFtGPfhDMsIsH8I2XtydLwqLAW93
	 sEfCtPjgq0vSZdfTOF91OsyzR9Jq+0/kn8QN0ufQW/4J25FJfL/V6d3ItuimOpVXZh
	 R7/M9tiasr5gg==
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
	krzysztof.kozlowski@linaro.org,
	miles.chen@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 0/5] mtk_iommu: Specify phandles to infracfg and pericfg
Date: Thu, 16 Jun 2022 13:08:25 +0200
Message-Id: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_040841_790133_24585D3E 
X-CRM114-Status: UNSURE (   9.35  )
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

The IOMMU has registers in the infracfg and/or pericfg iospaces: as
for the currently supported SoCs, MT2712 and MT8173 need a phandle to
infracfg, while MT8195 needs one to pericfg.

Before this change, the driver was checking for a SoC-specific infra/peri
compatible but, sooner or later, these lists are going to grow a lot...
...and this is why it was chosen to add phandles (as it was done with
some other drivers already - look at mtk-pm-domains, mt8192-afe

Please note that, while it was necessary to update the devicetrees for
MT8173 and MT2712e, there was no update for MT8195 because there is no
IOMMU node in there yet.

Changes in v4:
 - Dropped changes introducing mediatek,pericfg handle
 - Fixed required property in IOMMU example in patch [1/5]
 - Added a pericfg lookup flow cleanup commit

Changes in v3:
 - Different squashing of dt-bindings patches (sorry for misunderstanding!)
 - Removed legacy devicetree print

Changes in v2:
 - Squashed dt-bindings patches as suggested by Matthias
 - Removed quotes from infra/peri phandle refs
 - Changed dev_warn to dev_info in patches [2/7], [3/7]

AngeloGioacchino Del Regno (5):
  dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
  iommu/mediatek: Lookup phandle to retrieve syscon to infracfg
  arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
  arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
  iommu/mediatek: Cleanup pericfg lookup flow

 .../bindings/iommu/mediatek,iommu.yaml        | 17 +++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
 drivers/iommu/mtk_iommu.c                     | 50 +++++++++++--------
 4 files changed, 49 insertions(+), 21 deletions(-)

-- 
2.35.1


