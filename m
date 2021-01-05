Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2F5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:12:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4CE2255F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E4CE2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WP+xnxfEkzqXQnZTCCAP3uYUJ3vQtT/ASX1HCqPVJgI=; b=cyMdDk/Zh3P76dJ5KDfEJ7/+C
	NPGyF8L7WgNk5SZKM9QZEQ5CaIbIiRKdF1feSi44R8GSGappVHxsXWlpwiegIPoBNFX1S+VwucAZf
	wBOtYDZikmHpuhTDvzFbMwq9Mnq79YUZblE59cVI5LY6qI21Ej+WRS/q/o9Dpjmly16cZsw1U4GNj
	UUC41jaQmXpqoC1j2gvRuzIL815nF69BBJEfkxfXfxTBTq1L7lRAka1Y6moLQkJYwxzGhMvHX0RBK
	+dUAynMEEnf33ebo88Z+sJw6yZ321aofF/eQvuKojbc8GGjr/4wrV5jSSmb8P1vIXynjg54ie7nYk
	52IApGiwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwZx7-0004zk-68; Tue, 05 Jan 2021 00:11:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwZx0-0004wA-Vt
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 00:11:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 4so15420041plk.5
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 16:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvqJReQ8p0Q2wrcytP2TtmywERHqcvpbJnQQt8vIrRI=;
 b=ScUimOvRWjQnaVl3XASbOdDlbmovU5P/7tEX4ORdNnIB9j9wH5ytoq2cCDVznY8O30
 eWgD9UXUHHlO9+50t+PPEVX+4CPMTPPcRsOA9d9fy6QHgz6DC0RWtq4zVhuKED0lX97P
 m0r1OSN/9xz2wHbXEElVpx3wFAvjk4kL5TQ5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvqJReQ8p0Q2wrcytP2TtmywERHqcvpbJnQQt8vIrRI=;
 b=RpZYsuckuTmSS2CFYkYiwvlNkVltR3+mJM4XMC8UmB647ndXQHXx/Nc+oDVicoG011
 DwyqBj1DrCcUmDlxy4bxVH6dTSg8D1nNJqPuwDDCX433/sRYPNHh4uHTuPAoxFYb1lZD
 +619qzPecz5QgTQbns17XlM65dx+LieFhVVvc1vJXd5Vp4VnAFbl42i/uUUm+vx0Nf/a
 fJ1fd834L2axzoDsb4Y2d3CBlOiicZDNXhASnJ+beGGRJWkAVwW1J8zUAZfC2O9BZsJ3
 wVeQ2+diqesTA7FEzk9a0cBWkJEUNrz8PIkZtPKY4IWmgylSCWqvmn5l098TskAvFnlX
 o6hg==
X-Gm-Message-State: AOAM5325JxLsg13uH8a0VrvsIRD8wKnP1tb0SiuQ6ZEm7DhU+pSAAYlf
 HBn4JYvbr01/ymdE7tefpXm3uQ==
X-Google-Smtp-Source: ABdhPJz9/LbtEhIm8FWyQjCxzQx0i1/dDotSyolZEhpKdMauZYRkQLUTKYO5bNPm7nnBtipcZbEHrQ==
X-Received: by 2002:a17:902:8a8d:b029:dc:8ac6:a149 with SMTP id
 p13-20020a1709028a8db02900dc8ac6a149mr14187800plo.18.1609805508768; 
 Mon, 04 Jan 2021 16:11:48 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:48 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Tue,  5 Jan 2021 08:11:19 +0800
Message-Id: <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210105001119.2129559-1-drinkcat@chromium.org>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_191151_076716_63FC85CB 
X-CRM114-Status: GOOD (  15.16  )
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

Add support for MT8183's G-57 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

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
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
