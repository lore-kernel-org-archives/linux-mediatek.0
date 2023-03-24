Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655F2C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 09:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aLFIIwLmkRhIuR5qdX3M5/6/Otnu1LEcXa7ASt0ikk=; b=DHFfeZE1UmPUpgAk4H3J+WcPzi
	obWafa6pViXJl4snLJMGKWYgnT/Yfrwj56einagyF3yd5dTgdu2QsXSHvLhCLIYj46CQE4yMMJqan
	h3LRnxDYeahj+pJygiC7wDwiT5NDYtUu0jsjPIiuzQ65/kymHnuKTGjxWURlxL3TH+ebVtW32AgWI
	Y2K2fsEnNqahWUp3DfSbcvfn7VznuHngyaDfHJLs1r+3qHMcsMrvAT3l2pw3oqjbFDSGf/m8wjOJj
	yT8klKtOzdzxNPxMnuk7ULD14qW4UOMcEgx5NXlJqZeErr0ZcA9jAgeDS32VAhCiEzRCfOJUFDTfe
	fzzlPvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdwD-0043cW-2w;
	Fri, 24 Mar 2023 09:42:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdw9-0043ZL-0D;
	Fri, 24 Mar 2023 09:42:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 980996603111;
	Fri, 24 Mar 2023 09:42:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679650932;
	bh=bI/exYwXALbPVON8gC54id0sZ2eJKvqyQqNJ1pr6jNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bx/i7U5D17LSROf2JbYdFJIuBz/CKvTwDpZXmgZ43Knnc4gDl/RKLIxfpdDnHwLyq
	 GMlkm9dASAZuaEx3HtMmHm+5SxKl0dslbAlnsx8QS41j3JgCtIHnOWUh+EYm4lLFFX
	 TLwj9ue5ySziDId7kKUgqD71VPKoUhHjiVpPLm4jYBXzIzt77WNmjXgCub03BFT7wt
	 GIrtU6qOY4k7TrA+4EzNvsCNKnhjOFgwrPCrRC4uUyu0l9BbapLLSuUf6ulTuASr68
	 cEtSVEMoKqUjtzQn48WYyU/lJAptenC0qMF7dyAK8k5uIFy2hhmY6IxCO5PWo5J/5O
	 ELRLZhZ/HA+4Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	amergnat@baylibre.com,
	flora.fu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/6] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6795 Helio X10
Date: Fri, 24 Mar 2023 10:42:00 +0100
Message-Id: <20230324094205.33266-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024217_312178_CC3D6101 
X-CRM114-Status: UNSURE (   7.94  )
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

Add a compatible for the PMIC Wrapper found on the MT6795 Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 3fefd634bc69..a06ac2177444 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2701-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
               - mediatek,mt7622-pwrap
-- 
2.40.0


