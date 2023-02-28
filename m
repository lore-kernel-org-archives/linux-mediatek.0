Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73287C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+tG6JS0Kz0cbXbeKHjMGU0WeFesVUIEOdqPcndUf68=; b=0mcMsUvuFR4k2F2Q4sUqqMGzpM
	JiKvG2/8MvzzkcXbg9luENODEG3ZgUVFEgbc3ugkehGtCOtTllQM/p9WFSrFvVtZn2hoD1n8gn5zz
	iP01nJ/ZPw3J3JnSCT+RJ5UkYtWVFzd4nnQijqPjAp3NQwOz4PC8in0I8mtZbrELpAKoCuhEEw+7Y
	Gc1sfBU7TaGedJ7J/c05SMCSNKg6E9seepj1rX3UDoKwH0uqmmfPzwvyic6K9QPpKfaz3CVXqijQR
	0FVnZ3wy4RE8hC9Rs6aafJ29Td6hZJrxtX6DfyEw7zZZohD5ySLdHK837nBtLZAREarwldhUvniN3
	08QnQNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxHt-00CfQh-NA; Tue, 28 Feb 2023 10:32:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCb-00CcCJ-6r; Tue, 28 Feb 2023 10:27:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 03DE66602FDB;
	Tue, 28 Feb 2023 10:27:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580039;
	bh=1JnVPVujLBT5atPy7IIvdnCv3UEvpv+n+JLXQmdBXc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBtqrJ661TF65pMMYdFlcwffGxegFzbooParqFCFZ/PsBfC5GB/3luHURrV0BYvch
	 WCUzqm8UyJbNHi0nzLej2N5SMiMMdBKWs2tkkPZwyZjadsTsXN9minzIpXJhksPZjI
	 +ux46nPhjvajG96R8MeOmWfzjPAetD9idFqfaOV8E+17fgrO0Iy21mkoLIVcw++SDJ
	 yHLrAum9cY2qA4NxshgkViXJOCqrA8UzJQq67gtrYEyqY8Wnl3ZXFHR6XVYVxEl1wf
	 nyMaFifj5PlKcovAGTC7SYhuFyW5h3BBhiT4/GGTJAYscxIAyk9k2OM4qV8VWoHXZc
	 minCGbH9D9V/A==
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
Subject: [PATCH v4 12/12] drm/panfrost: Add support for Mali on the MT8186 SoC
Date: Tue, 28 Feb 2023 11:27:04 +0100
Message-Id: <20230228102704.708150-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022721_415657_DA78FBCB 
X-CRM114-Status: UNSURE (   9.50  )
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
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 14cdeaeeb5c4..e4053bf84c62 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -679,6 +679,14 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
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
@@ -708,6 +716,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
+	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.39.2


