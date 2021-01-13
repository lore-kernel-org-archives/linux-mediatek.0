Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A667C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:09:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F65423120
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F65423120
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UWUqV3S4ujrsZQd+dF/fVbtE3jJ4/4ysCEw7x95YKsE=; b=bjWprvUjyhvbAzv7r+uxydScB
	zZKlog3G0dOTlirogcdJ9fn9UFuCQQJveFIXPDV8BBn3pxVwQJxgPanwaDMlreiV2+vL+yY6QlY3p
	90HEJqBohvwV9/VDaOkUXggFUxO+V6FivZOHc1ZSxpR5pAw+eTlfefuGz13Baj2GJNx7+g8GPYM2Z
	LOpau9Kh8ukkdXleAfzzvemlsGGx9NOnHP8ZFE96a1lgVWWAB3pAQUigBWK0y604lbHnxAFj+RiKo
	yVd4pUSYLayXwjO+w4DeIsWPMIjh2noam4czkBdwfSlJ1/QFDM4PeqjC/R1lwnNxqEUnbkYrfpeXO
	sYwy+YhgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZL7-0002Li-I6; Wed, 13 Jan 2021 06:09:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZJy-0001cD-90
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 06:07:56 +0000
Received: by mail-pg1-x536.google.com with SMTP id c22so797976pgg.13
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 22:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8oDQSUPDPIZ8NaaCZ5DAZUEBj1ULsJVWJe4P257n4A=;
 b=A7Kyq5kC/V5KEnMvYnWznp8obfbZFNz7Q75x+j9cybVRIEJVj8RRvtYgkvCdfkj4nU
 521LMeZBAl85703xY6xQhxoKkgW+wH62+4FyLws2+coNUH92ka0w496chxiqiDpKS29h
 gSUHmfnYX3KpR3Ojyj/Ngd9/Sg8z5kcl8xH7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8oDQSUPDPIZ8NaaCZ5DAZUEBj1ULsJVWJe4P257n4A=;
 b=PWAbqnLLYZyotBBNz4hpjhEZDRy0NzTG9XRMcfbti7oJaMXWi0jw/w0Kwcn5Btq1t7
 Cs9McJHnxVeVuxfFsGEE1tR8dv18iqALJI7rLBgx7mEQDzT52cwCQS4Adl6oX/YMan/J
 xhcBKYH/cX1cZiOmYKouzoyZyvDC3UhsFpP2qoCKPVINcXAx8DofgBt2FGsCNf2mm/Ax
 i53gpFC6bRqdOyOXnYRtxwqN0hnp9MgRgx0pMBO5HrlpYTBJD8I2z6V5n1ML1ZemcVKs
 P7ePEK1cgvNEfcnOiaWUDmTC4q/6YbaOkIzc48GC43TvmUR6LV2w6/4/+xTddepaXHI/
 QWiw==
X-Gm-Message-State: AOAM531GkPRoIBUmJljVopUhUquLcEE7/Pm4SHFFfHpkcXcq0ls27HqZ
 IaPneAh9tPqe4gUg+PbN3/XSKQ==
X-Google-Smtp-Source: ABdhPJxpSKoqoT7Wv4sRg+G/uwEEec2IxAJzJ0Qjx6lnTAm6pNTO31P7Hpdv227om5lIq3s+h6RCWg==
X-Received: by 2002:a63:34d:: with SMTP id 74mr619389pgd.388.1610518071493;
 Tue, 12 Jan 2021 22:07:51 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id y21sm1263556pfr.90.2021.01.12.22.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:50 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v10 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Wed, 13 Jan 2021 14:07:03 +0800
Message-Id: <20210113140546.v10.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113060703.3122661-1-drinkcat@chromium.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_010754_413131_CAF60DB6 
X-CRM114-Status: GOOD (  15.24  )
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
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
