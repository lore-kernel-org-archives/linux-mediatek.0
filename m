Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAF1C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:20:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49A616141F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49A616141F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bbSsGmup9O/wsGbJr0wdbbQ+BzgVzEiFRx2o1hUCvsQ=; b=LjA+laP4l6+LcMDCv7duwGGwC
	ezWIj5R8JgnrbDgj3CAzojollMh8aZWfVF9Aq1CjAGNapvwM3LZCCCJPWMts1k4V/JnpoomEYUr7o
	tn+6tlJ6A3Y+4lmH/mCxDaTXn1TE22n3xk9YMmYgVdRI6aUG/s0xof5fHW263AWgHtU12+4HzjJXI
	gC8JgmupIvvx/k7hZSC5Bk8MQY1Ryby4oC/Iqc49XPnMOxVA5X497vNR2qqi4I3D11FIdCcdW4kHr
	VjtTr05z0krRBNGm3RRlehFkIcv6VgqogymzFh0FJhJ5KpT2PNsO/uvG22pJWIeP1rfcvuaIk5K4/
	LBeemu8kQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ0bL-00DKJF-VF; Wed, 21 Apr 2021 00:20:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0ad-00DK9x-Vg
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 00:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=; b=z/4xEGqLtrYKft8S5P4mljQPmt
 RE6D0t7TwkV7CZT3FrtGAa+eO09A+sGsyF9TVLFIuZo0hc5Nu167ra84OgTiCA2Y7I4eUdxA6kQI2
 nLrsVcTd3g0ABs9q/4hrSoj7zzQ9dePYr52WYweqk5SnjguRbUyALRW7gV2F6Y2ne1l0nQvRBx/dr
 LJpA6dJHAdWYpbiuw8wirPxhU2su7OJyZ1wkhaYv++pxk5PvBYlYXV6vRbjrvTvCpsq1Rvftb1tXX
 D2AuYFvGk9U7/mIDJEJsO9tJntVqKKcjTS+qM7q8Lyx6yr2c97ooUPgcptqtwlyMiAHZz0Dc4rFii
 X9ynvtEQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0aY-00CVKl-Rr
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 00:19:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id t22so20292208ply.1
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 17:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=m86Akho6e5NFRQG+D9b5XKy1PM6jBUdw/OAXHb0gNMKjnsjAWo5nsN1SanDXJ3iNCL
 pfHEaIvhgdU29LPWVXVMQtU//JFrjVcsKlnAmg+kjZw84uDn/dy6b4khV62ciU9plhJa
 lMVfjivc8cIq7ok/I0nblMrd/Gbniy4M+Ev3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=NdzYcA1zmx9T4A2eSezVUejWmjIU67zOUn9Yxye+cVAcRcdFd5mR5oe25WF1kev3GM
 /T3jy034x8Nm9K7E34rfiUa2heXqisZhOTP6QL8VAZufq9zBFMf3JESy4GPYM5oRIqkV
 v8ZkhXHEkbt7mwJBg8mohjrkiwuvJCi3/yknANSQeqvZJMnPtiZCL9uza+vLZ0jQgcjN
 gVTOKRz0238Er+vhF9PYLjct3bAZWuKknjJjOyfR/yuFGciWIRd3J9PNhXzFuCn0L2+E
 fXnJnFwzgtyZEKYe2+4MrLR1T3eZIWDj5PTB9vUOz2QZG5kXhqDsorByJxan07Sl409p
 mU/A==
X-Gm-Message-State: AOAM531fnFScANeg57ATqeSCcTRdLQZXjRKo+ZsgXikFqWGdXiWrMd/K
 jmOSHzhanDTDQo4XJ1yFSlP98g==
X-Google-Smtp-Source: ABdhPJwPcD332xjlRJLIeFst3MzhfSb/LQ1n4pU5CTQv/wJO0T4lmQXl3wRtx/vDfJA1pFQZD+KMsg==
X-Received: by 2002:a17:902:6544:b029:ea:f94e:9d4e with SMTP id
 d4-20020a1709026544b02900eaf94e9d4emr31488680pln.16.1618964369761; 
 Tue, 20 Apr 2021 17:19:29 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:95d2:8c89:b629:ff49])
 by smtp.gmail.com with ESMTPSA id d20sm145494pfn.166.2021.04.20.17.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:19:29 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org,
 Neil Armstrong <narmstrong@baylibre.com>, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v12 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Wed, 21 Apr 2021 08:19:08 +0800
Message-Id: <20210421081831.v12.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421001908.813625-1-drinkcat@chromium.org>
References: <20210421001908.813625-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_171930_919667_941F0C29 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for MT8183's G72 Bifrost.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---

(no changes since v7)

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
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
