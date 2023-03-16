Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FE7C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYF5ZMV5YSmFW35EGOiHVFrm/JH0vcqvy+bl9OjTjGE=; b=mqC+8/sUXdZx+/cQvDdDyMihcg
	mMol0+BhCbjgFy5eBJFbkJG+3vKobPpfz8YMzuNwRp0Qmu/HgM80m/ctfHIoeGzpM9KnKcm2jA3di
	WvSMkJEhxRpI8kCPxjbo1JMm4p6MhDeaoSQKZfdV7sUdkTPe9qvvvHMevrpLleuUn62jKWgr/AxVO
	iA3GaU6pDtvnxuRlWldVMx9sIofq/DU4GFbrO/Cg+nCuta5i1xSt3ZBm4eNr3ob1hCnTzxWOc6Cdo
	G13vF8TU4SF81xDiMouU/YGjpEVvN22SKaWaztEjaOzDLQTVASnbcNVeoZq9eBHnN5AtMCHrN4kk1
	2srx0qPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckkZ-00G210-2O;
	Thu, 16 Mar 2023 10:22:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckjB-00G0u3-2w;
	Thu, 16 Mar 2023 10:20:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1A0F660309D;
	Thu, 16 Mar 2023 10:20:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962056;
	bh=6DBVKIIHG8WZZ3ntbG1VNgOpsrN60zwSXj2PzGrIUrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbXRKWlmiz0cDiInj2vV5mKScoT/lZkY25h1C8iu8wTWzLudoPjB68uvEUYSKXkjD
	 HHP+smP827Gc38cqEDXPjAAaPU5jBbNNqcwkuUXn4/v7lgtXUjARhXTePEPi7JFfyl
	 kfhIOYrGcMrLKaz/TN2mf1XJHRu8kaEKB3Ncn3kJd6o/asHXUrbnIt1x6yIVWUepG8
	 ckMf9jds4JjYEQNWDZepYz63jS2tg0UyF5gcDtrK0KYOR+77EWKqsY1PIEJMzBW+8X
	 nMpYv7dvDbHG6av2kGdWh+DAlqs8gTyIEiB59yGF5+4GzsjvR/Ucq539rfqGztng6b
	 nNOUIvNpnRYUg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 12/12] drm/panfrost: Add support for Mali on the MT8186 SoC
Date: Thu, 16 Mar 2023 11:20:41 +0100
Message-Id: <20230316102041.210269-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032058_079017_C0DFEFF4 
X-CRM114-Status: UNSURE (   9.27  )
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

MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
and platform data using the same supplies list as "mt8183_b" (only one
regulator), and a new pm_domains list with only two power domains.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 4f39b410302c..bbada731bbbd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -672,6 +672,14 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 };
 
+static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
+static const struct panfrost_compatible mediatek_mt8186_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
+	.pm_domain_names = mediatek_mt8186_pm_domains,
+};
+
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
@@ -701,6 +709,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
+	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.39.2


