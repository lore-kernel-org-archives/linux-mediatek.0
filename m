Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81266C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hor7nIS2SSQmr5WE3WDGTUnccWJ1F9dvI8aeZqW5v4=; b=l0xXCRm4fBxV1+JwCTvtprkMkb
	5pqlx4uf6pffOyTjMSi9jorg7DmTE+uOzBt81vdYUOFIOlsszVnaUUIY56iI4BR8dz7eFBD6/o4Cz
	/G0/TCNJZqFxYy5ffb6oX44mE3Uc+LO1fcmdSjB9biejyyMizj2js3PZ6UPz6mUI1e3nXjPu9aJRz
	/REcfq3hFzqXQ1nkMFJ0xth55gLhTyboMWCKGP45npEYQ3N5Pw8SBf8heYhNMKIf306O52VvKpJiX
	qce+Q+xmsuo4BrBiYM1+ueRDDMU6Y7KDSGQUJPOAeETFgrNgr68824OfGLFbcNv8GBWzpx67Ho0AE
	BW9GPZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsU6-001OPY-Gv; Mon, 11 Jul 2022 12:25:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTQ-001O3C-H0; Mon, 11 Jul 2022 12:25:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7589D6601A00;
	Mon, 11 Jul 2022 13:25:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657542310;
	bh=exs3pbqQsoOqcfyKmAZDPS7dHDfSgn805ug/IQkbTTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7Blw7mb+6iWeJXSpyTg5gsPCpZ/oX4nhA4AdPgZAyw+awSwz0ET4Ll4cPtJZpDIo
	 Lv7oKYFzUH9IE4ju3x8FOMqVXoObiVHatljFjJZSRxl0NZjq7iQ1kU/TIyUXL90cNG
	 HbzlewoWSCRBGTtqLlCAs+ysD0f8333Le6a97nMuvgIAaCL2zIW47oy9pqY+qH5e4L
	 G8gg4OhCdmOvX1pcHsNcio6NEAvfX825BxFN2oGVuPnpJfcpzvbPUVU0NlzrE2UQtE
	 Hk5elY06tC9y5w1tHfhrmLTcgojqTvqjre6uMuKKkmFPNgmrV+O06LApMeR+48V9nT
	 50JUVuRTaPIIw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH 3/3] soc: mediatek: pm-domains: Grab SCPSYS registers from phandle to syscon
Date: Mon, 11 Jul 2022 14:25:03 +0200
Message-Id: <20220711122503.286743-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_052512_727595_255C79B9 
X-CRM114-Status: GOOD (  12.85  )
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

Instead of requiring nesting of the power-controller inside of a
"syscon", "simple-mfd" node, look for a phandle to SCPSYS in the
"syscon" property of the power controller node.

Compatibility with older devicetrees is retained by falling back
to looking for a parent node if no syscon phandle is found.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index a3dae391a38a..c5a1c766cd50 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -590,8 +590,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	const struct scpsys_soc_data *soc;
-	struct device_node *node;
-	struct device *parent;
+	struct device_node *node, *syscon;
 	struct scpsys *scpsys;
 	int ret;
 
@@ -611,13 +610,16 @@ static int scpsys_probe(struct platform_device *pdev)
 	scpsys->pd_data.domains = scpsys->domains;
 	scpsys->pd_data.num_domains = soc->num_domains;
 
-	parent = dev->parent;
-	if (!parent) {
-		dev_err(dev, "no parent for syscon devices\n");
-		return -ENODEV;
+	syscon = of_parse_phandle(dev->of_node, "syscon", 0);
+	if (!syscon) {
+		if (!dev->parent)
+			return -ENODEV;
+		scpsys->base = syscon_node_to_regmap(dev->parent->of_node);
+	} else {
+		scpsys->base = syscon_node_to_regmap(syscon);
+		of_node_put(syscon);
 	}
 
-	scpsys->base = syscon_node_to_regmap(parent->of_node);
 	if (IS_ERR(scpsys->base)) {
 		dev_err(dev, "no regmap available\n");
 		return PTR_ERR(scpsys->base);
-- 
2.35.1


