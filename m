Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:01:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3922313B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB3922313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PINomCuEONRiOhxVa0JdWPvRn5CtsAyjsK5ukVSBhZQ=; b=kifMIvaUDCY80uVcE+GKnd8/F
	i7ewbAFgHlqiVo8k16uQXN7USH0Sp611yzKtyOfiPsaEfMPMTOs8gCoqBw+5THYGkkzo9dQsw7G3M
	iyGiNSogtK/PTx69E8fGirjBF8NmPYdunnByvB/qZKnB+lHYBXzSB6ozmlWvzH3W7vyRLu97R8EmV
	ra+C1lwxA7IbF4V5hwh2ECn47AkSHLNY5odWmlnfn8VbpCHPVt2ex1UGdA0LmLSDjn8Nwx3deKd+C
	3hx5ZWVSSYKWYvOa8s7rytMbZVSKH3FaNFw5U7QR2MYp3NJh4YGBaNbjQ1cdcfKzGsGNsQdpau7vL
	juBXAfaJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRA8-0003Od-AQ; Thu, 07 Jan 2021 09:00:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxR9w-0003JR-3r
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 09:00:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 11so3461671pfu.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=KBjUR7cKDtbkIB9nXZkdYy6KZLbDztMb7bpPE5DYa/Uhzlb+aomoIpSUm2Nf3IsA7Z
 HF8iljHC3ztecNW2kB3MKMuf5MVwqpxRcWRGYYcEcCTscSj8BL9f6NppcQGWRD4tLxAf
 w96Ucac4FF0t2j8TbDh3mXTWduA2XhtlSlMmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=t9PnqQmZLponRmeyPsOhHDyK190/44wQYfjh3HzXG8I1z5DpFQ+dBLgjoTO3ybylx8
 rZQF2JpXWklAq0tNRcxAkW1rnpDz8B9bD4/eO2ZoGMemUkw6eFA6BRuYbVGHB4HifPeD
 yz0cmJdX3nFn95pzuFs0Fohr2r6TBgkVDSgAm5atf6I8aOH8cH9+BPYpZrJSH8qw4PmZ
 dqDIVNYzqLFhzTCXU9Dk69XbI2FffVQnM2YPe9Rlwhcd4cjKtkSNHG1B3Gbog+3HTtP7
 5gZae7FTmb/yFnCRR6VBNF1WI3gHvfjzYh4u0NEo6HAIh1lzsN9TyYe8zyJmr3Y6qPJT
 wFaw==
X-Gm-Message-State: AOAM533iE0ArfIMEGPgzgZRqRBa0TTvS8ahIR0kdRN7ocYIAc0flE9eG
 akiVp7f3FLZRdYdldEezU1uNMA==
X-Google-Smtp-Source: ABdhPJz2oX6i0uSq5oG2BCsKviSBLJpZXSuggJX25/8IOjFtCKTNKuA0kFKHElV8j2Wfx4x7qw4mCg==
X-Received: by 2002:aa7:93c3:0:b029:19d:e081:9751 with SMTP id
 y3-20020aa793c30000b029019de0819751mr8088831pff.73.1610010041700; 
 Thu, 07 Jan 2021 01:00:41 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:41 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Thu,  7 Jan 2021 17:00:22 +0800
Message-Id: <20210107170017.v8.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107090022.3536550-1-drinkcat@chromium.org>
References: <20210107090022.3536550-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_040044_426022_A8D8A76E 
X-CRM114-Status: GOOD (  15.10  )
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
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
