Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9B5C11F68
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBB961DAD
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 09:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBB961DAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtwY8VczK8FgFZz2gWxpjTUnt+I+DRxTz2frG3lxIgw=; b=QdaGK2NesgihS5
	rIXTRVUne7pWuzMqhhKg8WX2YtJl4WtqI8Etu3MBFf1msOA9Jeuoj26GlQ21BdSJkTID8tfpcIs72
	mVtBUbahpolJ+YZBfB6yPE3FYYmbQVs0F2RXQSqOr/tz7sodfllXf5WhscB2oPWCaYHuCj0TA9ujk
	1MhgJAsevEFuDJeeldI63V0PSnCb3iwCebeXJmrzcdP6m+1gF9XlTJSK75Qin0N+upiZn9VCJJeGz
	udFtmLpcNRGpUy+YZ44qG8BOPkQ4H/IAmc1rSEGWiPAOmUW8FIpTu5dcylcpQggvPpOThtSSTvNiN
	/XCgxTPc8TMLKF8bi3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyAIO-00AQcw-Jv; Tue, 29 Jun 2021 09:44:44 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyAIK-00AQbQ-VJ
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 09:44:42 +0000
Received: by mail-pg1-x532.google.com with SMTP id m2so17988381pgk.7
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Egp2INH24GecpOyqDXmIt9wlO7BC40kEajevlBy0j3c=;
 b=KKfflM77Ww5SOuzT7DmT1GIeX0x5VOmSxBpbMVKSG367rvUR7Vs891hZ0rA8JD9LPN
 DILqKomfHn3hcFb271ORqCNsH8OeRsWvkJaHYPjsU3VqqDMAJZOL8SY0BDahznO0nkqP
 PJEd8dFPfBPPTfRTNpraJHZetghwEMyuu4Htk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Egp2INH24GecpOyqDXmIt9wlO7BC40kEajevlBy0j3c=;
 b=tlVQDn/ZFQeiUEQ5Wx6h+P8nekqqdzSeTbIKGiDDWc8Y71J54LqmCtGHrXviCqgNXL
 ucF6ou4Gew0zej9B5sR9WGgLL2Egt9lxdbCzF1s0ACCj8jM2ygwTJ+Hfx9cd9B6VSW3l
 xMkSAE8FH0ETXtWMSyhXk3KVObDKnFqje0qMmu7eHOYxftLjzYF3bs1hn0a1vaCicDZJ
 cK0BeGCxViw2jw+MRIwIhrkaMRgueAQZUovVifBwbLFGKaQvK+x6G1ACZVW3yKq0cNaM
 88oa6rYFjxKpwfTpoTwubb/bRu0LDEsmFEPhAJ0D9p6+ULPumIDTkBw6Hv9wFA6/fqJL
 1ltQ==
X-Gm-Message-State: AOAM532OKN/NkZtGGYp1JAHG2mYOg1GHo6vBy81tQK8nRqBrbI0bYyW4
 E66gvkhkYhffPBcHYliQGLfyhg==
X-Google-Smtp-Source: ABdhPJxb1UAMqIPOICuhB0EY9ckYxXlb4L4WE5yeqXUyYXEGPBE1qDSui7jr01Ta0sSJ701ROVAxVw==
X-Received: by 2002:aa7:8090:0:b029:300:18db:4e11 with SMTP id
 v16-20020aa780900000b029030018db4e11mr28988541pff.22.1624959880119; 
 Tue, 29 Jun 2021 02:44:40 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:ebba:3e19:7691:d53e])
 by smtp.gmail.com with ESMTPSA id f15sm17891538pgg.23.2021.06.29.02.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 02:44:39 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: lee.jones@linaro.org
Cc: Fei Shao <fshao@chromium.org>, Gene Chen <gene_chen@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] mfd: mt6360: Restore error message to regmap_read failure
Date: Tue, 29 Jun 2021 17:43:39 +0800
Message-Id: <20210629094339.874120-2-fshao@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210629094339.874120-1-fshao@chromium.org>
References: <20210629094339.874120-1-fshao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_024441_073463_3AD9CA06 
X-CRM114-Status: GOOD (  12.33  )
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

This adds back a missing error message for better log readability.

Fixes: e84702940613 ("mfd: mt6360: Fix flow which is used to check ic
exist")

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/mfd/mt6360-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 6eaa6775b888..0ff8dae4536c 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -351,8 +351,10 @@ static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
 	int ret;
 
 	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &info);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(ddata->dev, "Failed to read device info from regmap\n");
 		return ret;
+	}
 
 	if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
 		dev_err(ddata->dev, "Device not supported\n");
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
