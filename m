Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB29CCD183
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UkQx0dDM+CwizD2fsgnTktra1UuqfCJasqigqyryAE=; b=JcsVX8af0hHB+Occ9VcZKxt734
	XDASxKxg/Pz+EulcJSQ9PGoQ/KiVJ7W3m/htd1A0VEwF+aeBVDK5W2HfBPbFXSzrDmGSUdWo832vP
	qbEAOiVFHNjbWGFge3+4qqgGuAeqVi4m2RCZUho7quMdS9UV1IZJ28orxH2RI9uFxhwVoPV5umxY8
	xEIx3WRJkNRHBOg5pzRzykaLj7gGXbzDeBBGXlJV3PgSslwSpyMZwoUPGCKR8SPQIGjkYwK8mzAt6
	CitneBarTQz+sKoP+/JM0d282hAyeM933SKh24rUQfbfasgbGKhT6sIlizKhe5g565Hrk8FEqbxv7
	gwX0tMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KT4-00000004FC8-3BLr;
	Thu, 16 Oct 2025 09:40:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KSr-00000004F0u-1cZj;
	Thu, 16 Oct 2025 09:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607603;
	bh=RVbex/FLno2le4rsAHEctfKuvWs4AdkH2KC1lA9P7ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFL1hklk0IsKQI8JaIU+2cfm5M5jJYGk8aXq2s2zeRwf+mztfXQyggTFwIXEp0jf8
	 zAocx/D6+OpuBiP6sGf3g/oCSHpnBwXHrHZTDQgYmIgSRIpZCyAvy4cqDMmuveGE84
	 gFsuzyFz2JcRKV7/Fyaf0qZ3pttsU1T2KgnXk3tFnevnhjXFbPuhTzb9hxaYOapYPR
	 HhcvBOzbuUqQi7+LrCuG0/QTV3CN9zXAEcuF+ECT090yK+YCAKVXO2YVb1UwIcmKfJ
	 1mkNP0GNl/Djlx5kPBiGa0y2VgE/KR8WmCmMZCxfjk4POjjklbBYxkGjiZy1L1LMHQ
	 oqfnZIgZtTRgQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD05B17E1407;
	Thu, 16 Oct 2025 11:40:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 5/5] spmi: mtk-pmif: Add support for MT8196 SPMI Controller
Date: Thu, 16 Oct 2025 11:39:49 +0200
Message-ID: <20251016093949.127326-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016093949.127326-1-angelogioacchino.delregno@collabora.com>
References: <20251016093949.127326-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024005_607254_E959D737 
X-CRM114-Status: GOOD (  10.10  )
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

Add support for the SPMI controller found in the MT8196 SoC:
this supports SPMI 2.0 and features two SPMI buses.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index ad7b0cc9cdaa..719753651234 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -636,6 +636,14 @@ static const struct pmif_data mt8195_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static const struct pmif_data mt8196_pmif_arb = {
+	.regs = mt8195_regs,
+	.spmimst_regs = mt8195_spmi_regs,
+	.soc_chan = 2,
+	.spmi_ver = 2,
+	.num_spmi_buses = 2,
+};
+
 static int mtk_spmi_irq_init(struct device_node *node,
 			     const struct pmif_data *pdata,
 			     struct pmif_bus *pbus)
@@ -834,6 +842,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
 	}, {
 		.compatible = "mediatek,mt8195-spmi",
 		.data = &mt8195_pmif_arb,
+	}, {
+		.compatible = "mediatek,mt8196-spmi",
+		.data = &mt8196_pmif_arb,
 	}, {
 		/* sentinel */
 	},
-- 
2.51.0


