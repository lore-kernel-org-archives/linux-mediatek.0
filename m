Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8A5C11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F73B61DC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F73B61DC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EbVHY57Q0utuMkbwKJMLLfTNyhgAJfupRdKpN/sHMyM=; b=FcX0wqL7j77BYe
	YUWSR2tK6OLVECcfzCD9M2m+u2J6XDtyqlWKhhWKth76hywcBUWvie++TH+ofkCj2hE6ljBphRLwv
	PGZz7uTMX6cEIoEg7PR3mgQ9eYicGTzAdOdFixIr0LzPVIqkyjf432E84KBjiCDyKe3sIsyEo3qQe
	TRvqO78AC02jfXJpzrXQ55BUA2ESvI+lJffRd7Q+AqACx/waU8s16wZ8QsL0LL54wGdqeICVbYXIq
	dNPz6WWlNdEqOnN0dSJ7QU8V18nsVruCQ6Wg3vWLZJV3ACaX6kXOEtSJLXsJsFxGTl2LrkZpP4IIX
	Pn+SizkfvybcXC3kHlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyAIN-00AQcQ-DY; Tue, 29 Jun 2021 09:44:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyAI5-00AQX8-2d
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 09:44:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id v7so18015219pgl.2
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dJ37PQ0DUdpFn0rnRJ0yJT5LxxB3TZY0VJaQvUIpRAc=;
 b=NLAgUarWn5AgV3j8EjWc1nVme0dHFSRQeoYdTW4OesGN8EIARL9cKJR+wmp5r37Fn2
 fRg9Xd/5/HP2HeA9vinT2g0ewkKNdMFnw8vu5qoRXrVG2+KBZKHcePlk/PTy7Wh5l1Oa
 TslX4PrI5Npy2FmW8kyi2Q+8crZglFuhIO40A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dJ37PQ0DUdpFn0rnRJ0yJT5LxxB3TZY0VJaQvUIpRAc=;
 b=c5wOTlYjeE14WlsETWWKu+DpU16rkRTaUtA80T2B1P9K40/5zzICPuDkqU3O+Su0zr
 MkgA3Io53caC7ZD45bT43jLTTu9DS9p2hf3l+F4E6/izMQ4deo73adEq29r9KCy5/jsn
 9t9xBAOrRI2uasPbNmUcnKLkadx5ANdr5OPTa1++Jw66eviTK/y/aQlPVuksf/sictTk
 7UCMaHEuCnMgANcwIp/BzHBj09yExL+1YWzUWZzOSa4D9tQuuYFltU/+ZXhcNLL7HByc
 EbO0WQRJ+mcAGHxDeCerbSs5kQspfhTQvHwOwXtUR2wPdrGvqrdTkqHTFWK9H28PQ/Na
 FoiQ==
X-Gm-Message-State: AOAM532dQtqHYcWaIFjzOuotY10922P4OsFVUxQ19UZ2CRkT+2nSYA/L
 1kiVwo+QaZ/D6My5mtHPnGTxPw==
X-Google-Smtp-Source: ABdhPJwf7am0fWVPDWZehB1xgbHGOk/B2M0vX1pYPiCsPRZk3hm0S1wfBKt2uJSRfpD/aBlbPtH27Q==
X-Received: by 2002:a65:61ad:: with SMTP id i13mr27649776pgv.345.1624959863421; 
 Tue, 29 Jun 2021 02:44:23 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:ebba:3e19:7691:d53e])
 by smtp.gmail.com with ESMTPSA id f15sm17891538pgg.23.2021.06.29.02.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 02:44:22 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: lee.jones@linaro.org
Cc: Fei Shao <fshao@chromium.org>, Gene Chen <gene_chen@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] mfd: mt6360: Sort regulator resources
Date: Tue, 29 Jun 2021 17:43:38 +0800
Message-Id: <20210629094339.874120-1-fshao@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_024425_153463_BFAC598D 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reorder the regulator resources.

Fixes: 4ee06e10dd26 ("mfd: mt6360: Combine mt6360 pmic/ldo resources
into mt6360 regulator resources")

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/mfd/mt6360-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e628953548ce..6eaa6775b888 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -319,18 +319,18 @@ static const struct resource mt6360_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK2_OC_EVT, "buck2_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK2_OV_EVT, "buck2_ov_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK2_UV_EVT, "buck2_uv_evt"),
-	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_OC_EVT, "ldo6_oc_evt"),
-	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
-	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
-	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO5_OC_EVT, "ldo5_oc_evt"),
+	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_OC_EVT, "ldo6_oc_evt"),
+	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_PGB_EVT, "ldo1_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_PGB_EVT, "ldo2_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_PGB_EVT, "ldo3_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO5_PGB_EVT, "ldo5_pgb_evt"),
+	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
+	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
 };

 static const struct mfd_cell mt6360_devs[] = {
--
2.32.0.93.g670b81a890-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
