Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BE7C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LySAHNP7mTCRe2nowX38J9T4myZvj8JYW77lo4fp3Tg=; b=Co1AtarjX5FoXppBHO+P6HJpdg
	wL1dyNqCu7AXIHN7lnT6iV7rjR4RAaPHvmnl8ha4akzjaslNhmfjEtdvBVg7+cjCM7ns8i1MPcMWt
	7T0D4yfPPWtFo144f4twyn/MtZzSRbk80/YvY6TI7LpBw2jIMpNv28OSIxeeUpeR0Nc65iMOlKYkt
	I1S0Y3qeRYX9FjccfJPgA1tOof8Tqzb5fZO5r864BoxMvHraXXyol59jIecGSjI/xBtNrnqz/oPIm
	KO6qwKjOFWfKkm+ltTbrZ8XmTx/ve2ugp5RPQjSeamWMZqSkhkJPEX6q35ylUc10PAfeSeMPK0WMf
	3URxolFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmK6-00Bu9r-UC; Wed, 22 Feb 2023 10:26:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleQ-00BYeP-2e; Wed, 22 Feb 2023 09:43:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ECD2B66021B6;
	Wed, 22 Feb 2023 09:42:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058980;
	bh=ZVUGUSkQPIkJqJdXlquYlMTH70M4rX6hh28fX2ZpB5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=icQqmQC1NwhnkaUQUa+HJKbglRLmbx/Cj2SKtRtzcRiAcaZ6bhD1Me/eThlsET4+i
	 ujYA1sNyAbC9oPZFJYpa9XFob5Sx/YjCt4ShTyTalCwsz2Er43whYGhep8a2lvMUUH
	 RyGA+0aIlYplbyCeYhJGCZ15xq/YKNHkZvkZNmAwwiDj5hAtK6901UscTnn1KpS865
	 S9bZSHyzPYmPHneLMLyiUwBFEEO2/IJPz4qE7tZTzZHGDdA944Hwwowg+WftffoDX6
	 nft5SV61zPfGuvYbc23A5utu3uh/YnAq0yL3fSR7UgphZZV1u2sJ93YcCnYJF9oBpi
	 5G644Bm21xEWw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 1/9] soc: mediatek: mtk-mmsys: Add .remove() callback
Date: Wed, 22 Feb 2023 10:42:45 +0100
Message-Id: <20230222094253.23678-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014302_277394_14B4B71B 
X-CRM114-Status: GOOD (  12.99  )
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

Add a .remove() callback to correctly unregister the multimedia clocks
and DRM drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-mmsys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index eb4c7e57896c..af22f3490034 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -121,6 +121,8 @@ static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
+	struct platform_device *clks_pdev;
+	struct platform_device *drm_pdev;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
 	struct cmdq_client_reg cmdq_base;
@@ -342,6 +344,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 					     PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
+	mmsys->clks_pdev = clks;
 
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
@@ -352,11 +355,22 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		platform_device_unregister(clks);
 		return PTR_ERR(drm);
 	}
+	mmsys->drm_pdev = drm;
 
 out_probe_done:
 	return 0;
 }
 
+static int mtk_mmsys_remove(struct platform_device *pdev)
+{
+	struct mtk_mmsys *mmsys = platform_get_drvdata(pdev);
+
+	platform_device_unregister(mmsys->drm_pdev);
+	platform_device_unregister(mmsys->clks_pdev);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_mtk_mmsys[] = {
 	{
 		.compatible = "mediatek,mt2701-mmsys",
@@ -431,6 +445,7 @@ static struct platform_driver mtk_mmsys_drv = {
 		.of_match_table = of_match_mtk_mmsys,
 	},
 	.probe = mtk_mmsys_probe,
+	.remove = mtk_mmsys_remove,
 };
 
 static int __init mtk_mmsys_init(void)
-- 
2.39.2


