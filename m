Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7407CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:11:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3274323447
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3274323447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PINomCuEONRiOhxVa0JdWPvRn5CtsAyjsK5ukVSBhZQ=; b=3K7aZ2oE1EGGdM5NlTVo+3bs4
	jCwAixxiaoJ6Y4+CVbYugCvx4MWb3FLMTtjH6XpQ/EMPyWytfcWxy6utavIAkOgNEINizhtjbx5B1
	0awsqRJAWWloPRE8BPPLWO/iJNlJWAi+r4hXENIbRpwrUQNieITay3h+WISxHC4FAaWD7mL4KZSkg
	GmRVyeZahyXWnJ+DYyHxJoktm9uG9N2F6YVZiIQ+gdrAZovPPzhI7vLuI63/lsmgnbb4wcuXrIavU
	tNQA/irPCBlhGybnRle6SQoezANZNTnN8G7CAfPCZi0eWj69AEjoyk9WJy2JTBlPFO3gvskzC96EK
	vjMnJLTNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxgIr-0007XL-TY; Fri, 08 Jan 2021 01:10:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxgIS-0007Kb-Om
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 01:10:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id be12so4807845plb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=n0zubLTLrm2Wv7t/owFX7AFemCfdq4PFQy8VbP2q+HzxunvaKkUrlYYCuvHcIKdlB/
 IzGTQT7lFsgeWUt4WseXOYynCHdwqzFEJunICyF+mzSmnnyz9AFQszAhyl100jUrQBM5
 wbBA5BwbE6dqbswU8n9ezNAp3SijeWFSFegg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxRssKJ9dAC1Cxvvi5KyIPIbeBOqG6VrSD6Gdw3ud3Y=;
 b=XykvVtAyyEsKSpNWpv7n9vW74OjCkk83ZeLSypW1kkBJZvXvajyFW7VA7dvqUJkyO4
 /LjiCr1EkFREYuuVuYmKCvM/WNyXM3AwjaM4CFvaDYxISY3OydXmQaVEa5hacmG7D8ZD
 W0Mbd6101C2ipyJiLHNWb2bxMrTf+gHgl8dN5hQKNu2y0oTY9tct+oVTJXFHtUVknMQc
 zfZMxhiA2SPLsh4s/gbdj4l0xgwRtXC0a/7attqQnKsGEdrLlj/lycLlMJEAAVK+pdeU
 vBz0eG0+l9Aj8nz4mSdPnd3wmN+vM3U7cKDpJyS6aaJ95Eg0DL7J2u2OyBgpxpjVoy64
 mP/A==
X-Gm-Message-State: AOAM532vwOEnOdBYi3lrezcfDO2CVQclQVeXftqgr4VKJl3Uvyqg3gWn
 kkFxvgpLxcWL7GyiXvm9aWDivQ==
X-Google-Smtp-Source: ABdhPJxDJLhEExP7v8L1Yb3lej7+5pDFBeQ9kztKaACVW2NvEKvbWvqudR5ghwxWFFmhMX181+yCkg==
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr1129382pjk.155.1610068230563; 
 Thu, 07 Jan 2021 17:10:30 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:30 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 4/4] drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  8 Jan 2021 09:10:11 +0800
Message-Id: <20210108091005.v9.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108011011.4061575-1-drinkcat@chromium.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_201032_918067_C936B258 
X-CRM114-Status: GOOD (  15.07  )
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
