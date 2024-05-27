Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA04FC25B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEu6Sl9uq29xpTKPZYdNxdRGMUttT0V2f5MXyW+3dcE=; b=wR1bre5WLeQC7ThS+GG18OCeP2
	TJ3nTieg1D93/bCo7SIFbdfhvRIQBVfSA0/Y6qu3rb4EMQk+DG7Pl4PWKAxeXIbtTiBKbJybTO1ed
	CLqtKkwdFHg2QWQYLQhN+TxqD/CLIeSbIob2n9uvB8VBK+zh4v1GDqLyETt7SoWu9589OCdVMKket
	PoSaJ+JX8/Ljv31uik7okdZ633fWfkiFClHxxmdE8lhjgRe5VKbiQh4EL/zNWpFej2Ss1XAmBGNd9
	dtHP2NXotSatbbW3ntWXtDYFStmkDBzBuPjRU3QRbfOycxojYsKA+p9aalv5h1om33kH2Ubm/HnGa
	+QF+zGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbo-0000000EOYX-1lYP;
	Mon, 27 May 2024 09:25:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbZ-0000000EOPY-3u1A;
	Mon, 27 May 2024 09:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716801919;
	bh=8GuiXIytBzEOOq1loh/sdanwydxd8B84OUGGGBmQrxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GRHZOFIy40cxzRCBKR+sKYr7lZcoxq9hRzQ2jzpd8M6DvzTEaVIX6Vk1n7lI7Fmoo
	 /X//2fYrJWzFYjgzijs9LgplhhSayI/QI3ZGX6zgqv+kDMADoxaQ4IcJ8o8CyXQQg3
	 OUdqIGwhHgFE5VBgqip57mhY7reXuhzqc85uWcMtTneQiA7lfyjbnOQPx4S6+M2vtZ
	 sqkxPWIo90IaEUn6gKN70T0Tia8+bjrmtM08QGqOHLAPprDDSitINYaFG96sanzRb8
	 3/u04bga92Pbq6Uv39DFL+kPW1BTqmUWwxxZIgh2+GOhI7ZBzhDnaWp5CFtmnDrDFC
	 XvUpWaLKBS+Cg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 631A1378212E;
	Mon, 27 May 2024 09:25:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	steven.price@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] drm/panfrost: Add support for Mali on the MT8188 SoC
Date: Mon, 27 May 2024 11:25:13 +0200
Message-ID: <20240527092513.91385-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_022522_165367_7F65FCA1 
X-CRM114-Status: GOOD (  10.62  )
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

MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
compatible and platform data using the same supplies and the
same power domain lists as MT8183 (one regulator, three power
domains).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ef9f6c0716d5..4e2d9f671a0d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
+static const struct panfrost_compatible mediatek_mt8188_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+};
+
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
@@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
+	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.45.1


