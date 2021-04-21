Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB56C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:32:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B5B6141C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B5B6141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bbSsGmup9O/wsGbJr0wdbbQ+BzgVzEiFRx2o1hUCvsQ=; b=UxhIg1aW85Xe5iQa9S8x6ts1r
	I95GQzSai5Q3ViBnzpOz9W+BTIAo+iyHizrQR77JXz0sP4ktkAOomBlT0sgAJqKkk356cwOdRhgV6
	b6z3C2Ghs94yGv7vO2tcsCXO+EBCtkecN0UlbOyJijxbwZC1dH9fGuNcb+KBc7SbwMsYWN7IEGbJA
	lVa3TPiNssJ85eeWv/zW7plDYhFz37n89fZN9jy34Qy4/5WdqcMgirwwR/A0OzDOs1csDVL9FQDyG
	XYpPlyDjpsOiATFZaELjItuB358XuqHBk8R/SyA5QzhqgqIdCcYUFP6Bu76Qmcw7VGcvhW1nxdBPk
	qkPNpUMJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ5TP-00DiIe-5G; Wed, 21 Apr 2021 05:32:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QP-00Di5e-A7
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 05:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=; b=h2XkV7IlCQXNcX8mASJ3NyvJWX
 bhIISNVWvYQgIPJqZuloqxtx+WMNzR7d3zRAS5mRHYlz3h+YgXJ7YG5l2TOXP+ottJBxg8bDYOCap
 QyTZqRWtXKrqfErYpyN0UM9u2poFce7AbQSx/+N8qanDGR8NtcPAuqXvtmIL+cKjCL6RzWVHCcR+5
 iV+8JoDis/lSKr/3geKJ1iKPG5ATKL1Fjq67rljrFV791QEhfS1u4A5q/M/y456RjcveCzbMIbk7f
 gt0duGL43qkHTfqCu7XTK3/eSahPR87XOn6B65IAdsy1dkNI3a0YOTNNNzSMGz2fHxHwDm6LJhYO1
 6WAWrvVQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QK-00Cc0h-7S
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 05:29:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q10so28665991pgj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 22:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=GSqR/tNLV3h2WeySeGfMGXOdlSgUpYvKwLbgArv7aByT94uKy05vclZyhRVEgxk6z1
 y2lzKfsYfERoExvktOFnGzS6Nit5WD4J93WIFbcrCCn5ypodHnnkR6Xb9ApUv4tRIkTX
 X4dQbkBfnwKACwTorawRek4NP46rAGerLZ384=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hFZoL/B1X+TSHMC73OVlRCB/m5eFhUPf/0EsulpbQc=;
 b=Vvt3xWA0phj5QXlxo9tMgRZUC2e5324+1a/u7Pv/oyo24kEWMMHBaUXeU69x+qX+E2
 UElvC/TAO79ZLx/VvU/O2bftC0jCoGmbFmcYVUBuXrBU1RvOZDilLhGy8/pnuhE/i7gV
 ElCbWSbzNvJH6Yt2EqOZiE+aFf0zDF0dRmNZ28m6OgDkaNN6by9IwpIW7Aui8ZPJG8SY
 6+mQMfkNN27WGBo6hujficIwLKAItzrfNeg8xzU316ze6+ARXW51c1pkv7sEmLzEAuc1
 bU49NYjWXmmYEIctauUwSec80/iIBVUlr9jr+ZPXW6SW0DNXALlCl1OZUpM5F+wYJ71a
 EvwQ==
X-Gm-Message-State: AOAM5304EMoZq3Gl0muedzO+N44xBfjTSNaxYE2J9grv8bpx9iFChZm4
 zrL7BX+ptuZtNepjePjnRFt7lw==
X-Google-Smtp-Source: ABdhPJyZDRqJdOcJWbtPfs6X/UaeVpCly9Jbo3Ob3dn5LLzwTPwfK1AOmwpC17pOPG6/nzFx3YPVUw==
X-Received: by 2002:a17:90b:808:: with SMTP id
 bk8mr9347798pjb.128.1618982955584; 
 Tue, 20 Apr 2021 22:29:15 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:b3e5:49c0:4843:2bbe])
 by smtp.gmail.com with ESMTPSA id b6sm602537pfa.185.2021.04.20.22.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:29:15 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v13 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Wed, 21 Apr 2021 13:28:55 +0800
Message-Id: <20210421132841.v13.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_222916_280307_CD3801F5 
X-CRM114-Status: GOOD (  12.42  )
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
