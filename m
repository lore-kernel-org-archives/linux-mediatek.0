Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6838CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwrJB4MLCftsXJHS4rvdnz7fzXPUGe9PDlHfGDWWaDU=; b=d4xJfbWWr8EuHf
	HKITJaljAhbhnyHcgLCMiFiz0pksNVS0iXjkb7IQ1yglvtbrtYI3D278I96BhY8cbfuvC8lI31sWg
	W6/4r+LkaNB4icyyX7UQKtiW9UFNt2WJ2mCkLIFPaPDYyqZe3xZUk9Fjsc6NIPdvPH6f9hFCmuwbT
	SqwXE22n40uqE3iFrfXPOa4xnzGTuCM8cu5h6OwDm5D8Li9EJMVJVGrtWOfcqjq/1CJ1Vb6iRk6r+
	Iex1KioaaZrWfX0uOO6g/+9EnvA4SbPZ+E5tjSpdgW0AhikAAi9yYB9ttT0nm1teZ/I/UG6geaik6
	yR51t8ivpP6ghleQvg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5T-000rqi-U0; Thu, 09 Jun 2022 10:08:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5G-000rip-9G; Thu, 09 Jun 2022 10:08:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 755C866017C5;
	Thu,  9 Jun 2022 11:08:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769288;
	bh=9HpIBYF19N1SAtOw4Vv+gzm2DQkV6yJwK5auxdSwGCU=;
	h=From:To:Cc:Subject:Date:From;
	b=IObVT78jMPoK6EO7srMFDYkY4A8z+8NHyvGo+CD+w6MNqE0lktcPvIvmiORFpjIx4
	 OFWsZDSKP4auG7YOlUNLUConqzkINbyls+H33jGpr+lWhAuWDZgEwGPtqKktOsH/eb
	 o0037R7x9hSb00M+NpMJg/p09lGbi/FocpmbNPlPB+wqi+6jBGe3UUol0Nd8gtJ4YK
	 pWqRQeQiIw7olf+HKlriLbDV16QyP+Lp67tjaI+b76sO1KajYYJk+k28yaRCWtG2l7
	 FGBWYcBubtvDw6+q4Cg0d6htZOLq/CTooDa027LaTE+bP4/Jb9+KxlPB0GFgfTLAUQ
	 lTPt+SU9Qi11Q==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/6] mtk_iommu: Specify phandles to infracfg and pericfg
Date: Thu,  9 Jun 2022 12:07:56 +0200
Message-Id: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030810_496717_E82D6578 
X-CRM114-Status: UNSURE (   8.95  )
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

Changes in v3:
 - Different squashing of dt-bindings patches (sorry for misunderstanding!)
 - Removed legacy devicetree print

Changes in v2:
 - Squashed dt-bindings patches as suggested by Matthias
 - Removed quotes from infra/peri phandle refs
 - Changed dev_warn to dev_info in patches [2/7], [3/7]

AngeloGioacchino Del Regno (6):
  dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to infracfg
  arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
  arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
  dt-bindings: iommu: mediatek: Add mediatek,pericfg phandle
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to pericfg

 .../bindings/iommu/mediatek,iommu.yaml        | 30 +++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
 drivers/iommu/mtk_iommu.c                     | 61 +++++++++++--------
 4 files changed, 70 insertions(+), 24 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
