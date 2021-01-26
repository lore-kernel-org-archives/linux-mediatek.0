Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC8CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9664523104
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9664523104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5FQ3Ev6ONI2+G1cqhGrr3AVUILZ2oOXm1rd98slhURE=; b=x7LB3n3oC0Riw/dWKeFh7J84c
	wxRYY/1r/KQUZivVcpc8w79OakYOeX2TbQlKcTUQflOlE9BK9Ai3zYG6ObPxL5YYbtUwR0jgh5ohJ
	2UgRepxCH5zAdbkwjrb/d3HfMJXl+CdvIFVtpCN+L1nw2xxPZBV41G9QW4OGQpE+A2Y9qj/Ki/vkA
	fGpayThMOQfs6efaXncGEkAqbRCMtcMjki07u33cEoKOS6YuvmACVmKYyH2HEzGLncfo5NBuvXXU4
	btgB6PpclF7R52chH5/JbULs4E0PDeC7in14l2MLBPvn3YEc0TE8STxye6m3zc5Ow/0mWYI/J4UH/
	tbSN98Vqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4D08-0007y1-Q1; Tue, 26 Jan 2021 01:18:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Czx-0007uR-7l
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 01:18:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id a20so708582pjs.1
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 17:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cW8krSz9Suh27i3kFLRH+rKbVyIy/nSf3JAVtiB3NGg=;
 b=OMcAX8e+LPP25ZJuWYYSgfhNFgcP++z9OXPz3H76Ovwj4lxCkaDbAt80h+rthknDrq
 iJuS3q9mOu9ltZ1mqU9i7psDGke7EPWs5StZWbYFBwnQdv6EuQAYuIrrSMk00/dCcYP8
 TXAomikkDj+f0/yxJkFL1lBn852p9TZcaJI+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cW8krSz9Suh27i3kFLRH+rKbVyIy/nSf3JAVtiB3NGg=;
 b=hhN6kRJUHoIprhfJ4HzfmP+jXCB9Z658am2mWk7+27bC0WgYawk4a3iO7mmd4Tqyny
 GsoFEKOzw6CnQtBK96lKFeETXeKiWnVrTtuXaUrtvw2yyMdm8k3+Pd2frtnzz/f+mbnC
 RbF3cWBnDbIKzuKBckOoQ3oyb9qYKfCTk2GY6DcVmNOm67Ubn8weqNM/HN85K96mbBqx
 H09ogEXrcFCJK6oGijtqNSne84e4OFUAa61nXrgXvseVT2V4JHDZo5NwiGJxMXgM4vJC
 EgPpx6biiXtFp9+EFMmGcgVgzpOmsfo0/0y4ug0JFE86LcC/eJmhA4s23Yz5NEedo+6w
 bc+A==
X-Gm-Message-State: AOAM531Dvt3v1jfMoocijeHc8LiB3BeaOb9ra+vpba7dDKJMHrzV1tMP
 UPNL3lDWt8mcen0OwOLnmtmPuw==
X-Google-Smtp-Source: ABdhPJz1KwRDKhFH1+4vA/V0bCaojV/wBSjNoY/yJR26q15uQ6o7lk+MBQ0LDf1TE+A2gIPGNnJuTg==
X-Received: by 2002:a17:902:bccc:b029:de:8483:506d with SMTP id
 o12-20020a170902bcccb02900de8483506dmr3201535pls.53.1611623903115; 
 Mon, 25 Jan 2021 17:18:23 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:22 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Tue, 26 Jan 2021 09:17:59 +0800
Message-Id: <20210126091747.v11.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_201826_180931_04CE4CFD 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for MT8183's G72 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---

Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - Context conflicts, reflow the code.
 - Use ARRAY_SIZE for power domains too.

Changes in v5:
 - Change power domain name from 2d to core2.

Changes in v4:
 - Add power domain names.

Changes in v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

Changes in v2: None

 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 83a461bdeea8..ca07098a6141 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
