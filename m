Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48671C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R4Vt38ffSwp93hSnttbl7YVJZ+4nCz6YyNcaMWN4sbY=; b=JtQcd4wP6RZPKa
	d2cZw6nOE0pc1pSpb+OHolis3NayLdHEP5cRyN0prDBZYlUQPjAkjRdbWO3yRsc6+NBomfViqg0Ua
	3D1u2l+bKnunPTEeCT0TzzcIm+DcL7DDqkNorCw8lOn8vXZZpObBxdsKt5BvO/zmNyvj+jmwoa3iE
	2Jb4ID+4eqOBvcVQFL6DHOGZyMy9KHUtrW/9pxMPbHpffRy8xYI/7iNJU5vQmjOc28aIRpyPLW5f1
	NcGzRNbUReT0D1hgrLTWtLfGvrrX426xAnQxGJGFFLeJW6/1xrdazOZimkUgtsSVqNklGzIB7UDYE
	pnxLYGAcQJpCj+gwffTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxKg-00DwhR-1A; Tue, 17 May 2022 13:33:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8U-00Drus-Co; Tue, 17 May 2022 13:21:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EEE141F433D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793672;
 bh=OVAmupcImeep7rSBDHFhNuaLOusX/y6qibNhNwPjm9g=;
 h=From:To:Cc:Subject:Date:From;
 b=AwQWRiA+XZoWp6LVlmA0BAa4UYFfmEJsptnY3ren35hQka/i6zRgZXvpgsQzjpt7o
 tKbi05/UA3sjchbZCztyRXBUFY5zEV8qCVxKtO+ow+R6/4S+wFZ+g6RVZ4YISiQdYD
 4cPHeE0fnt8VsvWCPzKeLRV0gavS7ryrQcZKaQMDlKkLiApzWTlrnuM5ypulvAL0qX
 NdvHicWqqcA1Ra9blXd1sFv1ZUx75CgWBKHwXWrrZGKvf8dQfxUUdTMAbv6DhhnqGu
 xRwVn/xG7gkVp7hmnjrC4BzL3YIFeRK9Bwi4xPsIACLJ40hq+3PyAHjQ0nMcIZNOUz
 FyBcYgIh7C5Pg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/8] mtk_iommu: Specify phandles to infracfg and pericfg
Date: Tue, 17 May 2022 15:20:59 +0200
Message-Id: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062114_642073_0A58704F 
X-CRM114-Status: UNSURE (   8.23  )
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

AngeloGioacchino Del Regno (8):
  dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to infracfg
  dt-bindings: iommu: mediatek: Add mediatek,pericfg phandle
  iommu: mtk_iommu: Lookup phandle to retrieve syscon to pericfg
  arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
  arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
  dt-bindings: iommu: mediatek: Require mediatek,infracfg for
    mt2712/8173
  dt-bindings: iommu: mediatek: Require mediatek,pericfg for
    mt8195-infra

 .../bindings/iommu/mediatek,iommu.yaml        | 30 +++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
 drivers/iommu/mtk_iommu.c                     | 66 ++++++++++++-------
 4 files changed, 75 insertions(+), 24 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
