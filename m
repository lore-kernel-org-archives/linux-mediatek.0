Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3C0C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yvqknv+v7GLERPv4rK1Gd79LjR459kGzMTdLdtwCzJ0=; b=dXXRkPAWhfqBQBpfj35G8Mu7lc
	pI+X5Wp3T/zpsaFXXvqE1Rlexx5rHzvTN14KKpXUc/vgLQMERD8r5uP2dEhxpY4BAdjE8Swq9bpWE
	IHr/Iy2f+80Wd5VDzrL8iI63IwcD0vXfaHELqA7qeYzN4n5c86hkAeZtFSfchsLQc7s5Zer08nDBm
	9GaZ0GB6G8u0hKBjZgD/Z4tCqYjGSKJxBVa6jwgTMb76Tbjx4f1BHOC/7zCyps+9m4+pp27ZfrmbT
	TtTn+juOwoQr3WfleD2aRmCheF2i5IXdbCjLXcuxyvUFUsWJ9bOKeaX+O8olwIV1tKb5RvPzXffuX
	Qj53pG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDU5-00944o-MF; Thu, 09 Mar 2023 10:26:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTf-0093wS-Mz; Thu, 09 Mar 2023 10:26:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 82BA76603010;
	Thu,  9 Mar 2023 10:26:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678357581;
	bh=N5rncwLqIzL40g4iR25V5+icV4dUKNFhKHV4oNcqK9s=;
	h=From:To:Cc:Subject:Date:From;
	b=onfl1tC7dpZo/F3UsCarDfTOKZpu4FXAJkCysyeJxTMzko2Gld+TQtsjEbxkANdT7
	 iAlLIPlVU3JXJy8aN9ckUbewGCUS8lOlhDcdbhQBW20lp2kZ2JP19g+LHgd53ALcJl
	 toGEDBF2lVeuvES0m0REBWDWKIfxyMKm2m5y+wxK+8Z82fpzH/49kpj7xdTFQKcN/U
	 v96YDvYDftNdcJWtu2VIq+5OTFBeGJDvP/dMgJjS+UlNdy5uAagbTLBb75U7HIxSku
	 wH5J2txcKAEV+CzdyZNSY8tN/EnuGWTKfs23nn9PLluWAOFx22NMAFOkqFCAriPV16
	 UlbY5ciN9L49g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/3] MediaTek MMSYS: Split out MT8173 and add MT6795
Date: Thu,  9 Mar 2023 11:26:15 +0100
Message-Id: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_022627_928549_B58D9DE8 
X-CRM114-Status: GOOD (  10.94  )
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

This series migrates MT8173 to use its own mmsys DDP routing table
and introduces support for the MediaTek Helio X10 MT6795 using the
same routing table as MT8173.

Broader explanation goes to that MT6795 addition: 

Both MT6795 and MT8173 can support more usecases than the ones in
the current routing tables and the ones that are actually supported
in mediatek-drm!
This is mostly about MERGE, dual-DSI, WDMA (for command mode panels)
and others, but, again, right now, these are not supported.

I could have created a mt6795-mmsys.h, but that would've been a 1:1
clone of mt8173-mmsys.h, creating unnecessary code duplication hence
raising code (and kernel) size for no practical reason.

As a side note, if more MTK Smartphone SoCs land upstream, I expect
to see more re-using of MTK Chromebook SoCs mmsys routing tables.

P.S.: MT6795 dt-bindings are already upstream in v6.1 [1].

This series was tested on:
 - MT8173 Acer Chromebook R13 (Elm)
 - MT6795 Sony Xperia M5 (Holly)

Also, this series depends on [2]

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml?h=v6.1.15#n28
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=724014

AngeloGioacchino Del Regno (3):
  soc: mediatek: mtk-mmsys: Split out MT8173 mmsys DDP routing table
  soc: mediatek: mtk-mmsys: Change MT8173 num_resets to 64
  soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10

 drivers/soc/mediatek/mt8173-mmsys.h | 95 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    | 16 ++++-
 drivers/soc/mediatek/mtk-mmsys.h    |  2 +-
 3 files changed, 109 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8173-mmsys.h

-- 
2.39.2


