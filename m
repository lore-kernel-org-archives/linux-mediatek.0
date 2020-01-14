Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31047C33CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE639207FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVaq1Ubz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ithCmGPB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE639207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JA0cAeeAz7BxuUFmfcIpiyhPn8NRoYpp6EbVuY0fd1Y=; b=TVaq1Ubziw8YNb
	8Lrr0ah1ZXFFKpe29en41Cz8vYhvIwptrLIwezkkKQ7G6ZW/6PQF93Q80hXItavcTTplxlDw3mXHV
	8rlaCpFNTFhfWnHn8GzXYOP3RHF0k+OOsrHQGCKZ7ZPrYs/z/YAMOcWhuOChEbXwRi4/iDFcY+R3V
	q1bS5sWPQWk2ZHX53uJ0q7V9kAsr9gcN9Zd1NBMlw8vjIY1Y8jrw2wDko8DDrwrirbCXMWojQI4pk
	kChevh2lJk4Aklm52U5HySu7s/alf7d7zKrZeICCSBBNRWxfW703vnvacy6Otvk3hMtNQq7UTgmEg
	dZZh9KvrdaIjUljA22hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irGSr-0005iv-Gq; Tue, 14 Jan 2020 07:18:13 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irGR9-000442-S0
 for linux-mediatek@lists.infradead.org; Tue, 14 Jan 2020 07:16:29 +0000
Received: by mail-pj1-x1043.google.com with SMTP id n59so5458739pjb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2020 23:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5zg+Nyx8gIh15cqNDiymw6e+al01EbMcgFt2zvz0/E=;
 b=ithCmGPBDK/u6wxmb7C8KnWpF6VLxN1iVW9EKRTQdp6gCK/wkyNVGMrjLzSyYPtuZj
 KT0dAo1mqlGPGF8vvWskaLxI8E4PJM7ppHVCuRSeKdX+EsfMf57sl+NMqrMkGaZe+a9e
 jMDmnOEr16LjZs3JxaJxhJ4YKueNcn/vlkQrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5zg+Nyx8gIh15cqNDiymw6e+al01EbMcgFt2zvz0/E=;
 b=h+Cw7AN9mFCrWLEEDT32nhwH8n7w8mLRYxhaR1+rm3GRQ9E3IS62GNHtSATg5UnAd/
 Tc1Y/H+aencr5qBezAy+HpyiCMLzAssnRPLs750mZeUjvQRd62+mh8plDKULYKzX5vao
 CYl7mFdkDosu1Jp7mg3oIbz06zuCivGoW8w8BNmsZetSsJUlJwnjSofbrEcFlUwt1jBL
 2gZaNttAd1FUYDPecxVOkUB/aFalhCAXe+qcNQHw+JETSttXQPWVAOCPLenqAwMuvtiE
 3AjptEAzdJlXlvpG17+mCNqn2UqkrBe4R68zoxnZVdnahSn953NKotR4PkuLAbovfTKV
 6oUQ==
X-Gm-Message-State: APjAAAUZpUFSx5CUbW9Hl5O+b8ZaDgvHYZNDeQ8UANkPcL/UZXF6FQX6
 bLe3U5r4Fvb28dan0zSCZd81jA==
X-Google-Smtp-Source: APXvYqz4laPa/9RzoUxpMClNTomxEKcjjRkPSrqYnULimr14OR/2zncKlcPo6jiMuGgeOUer2Xg6RA==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr17202238plm.31.1578986186739; 
 Mon, 13 Jan 2020 23:16:26 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:16:26 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/7, RFC] drm/panfrost: Add mt8183-mali compatible string
Date: Tue, 14 Jan 2020 15:16:01 +0800
Message-Id: <20200114071602.47627-7-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114071602.47627-1-drinkcat@chromium.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_231627_942970_591A1363 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 42b87e29e605149..3379a3ea754ccde 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -592,6 +592,13 @@ static const struct panfrost_compatible default_data = {
 	.num_pm_domains = 1, /* optional */
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -602,6 +609,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
