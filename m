Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D5C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:27:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D0220725
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHzdt9Bk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cQ54tMtq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D0220725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=83B6zV6dt8j+D/epMS/UfgjBSGgUpOYS8cfx+M+ubHU=; b=EHzdt9BkrTpfx6lYa9gAdbroo7
	Rj+7D8Qo0i73HV+AYgvStZlcEXQKaF+kQAB+1DDQsWYStIuVUkK4ke9L4UyTKlY5iXXOwQcwwGPeE
	f+V99n/s/4KOSTwP4gNJUwSZ1JFSRu3eTv0S4DY2wQAHnLy5S782vJFTwTE5veoDpWR7oNEZNkdxu
	Yy1mXad4P9mZ9xCKVPuMwi6qcN0W/3onsx7EX79sEyWcwx1+pkGKAITTvWg8z7b7sxKY+rzhmMu8w
	11fv2z2yUwLP8xu/Uj9mNBl3isA1B1bpXnro7MQvC0YSj2mqOSnMQT4UmKXD410za/FFxtXqd/OIt
	TlKmcZDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSGaX-0004U5-B1; Tue, 13 Oct 2020 09:27:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSGaR-0004Rs-QC
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 09:27:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h5so13058456wrv.7
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ7jRoPXGiiAoDBzp6DBsjtx/DuGJsa9AjjDde8Qs2M=;
 b=cQ54tMtqQbU/rbyhWDIkZM7lwDcs2jxlxfyBx5bPEBf8BeqFrSi7X7vCtcH8pK2YTW
 6s0Jpf2qf2E7imqT79CYWPXFfJslyeu2TrCIPVsUJJyXjZEPKD1ebcQXy8qnLnDVrts7
 tpCwGNEWtxv9mzWU/01SCi5SkXb7vGEaFwCOaKL+DLkRBA2TRysw2cUPwZX3qZxlE6Eq
 nuidr+y0mMmbs4oP+grNn/EdCN1DrdH6wbh2/WwV/j+TP5rhPpljGxjNF5WJZpw888HY
 O+OIhOw5zWDAJ5HR6V8mUfFP0kAsenEWFWUXbCr3KdQA59SD7WmB2bOIN6XixCHD/I7e
 XKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ7jRoPXGiiAoDBzp6DBsjtx/DuGJsa9AjjDde8Qs2M=;
 b=oiJbok+a0YKgurCCADF1aoIXhZK35xCT4oP9PhOqnfMJAAEaANIgiswACVZUlx/W3y
 Z9kUgPwyBDk/gMotTrBKwwz3UMzG8rVDNZ97W9soI+ySc5bKK7eamD3orFvVebfHkvDS
 n70DREwD6GR2lNCze+m0R2D00Yzdedvmtu8JLbEWisImBUl/Hl122H/Y5rM5gVA6iytf
 EcKfRDtMJpStFQ0aJv/vhwmXxu7YjIy1VmGxWEfjqrSg2pxRPiOboX/r424/TC7qwSNu
 U5BgBAbYo6ZGWm3RhuLu67xuN/bHDtqjZj59wqxTRXqxxdkGyR62J0o1FnirQwUPhyqH
 zJyA==
X-Gm-Message-State: AOAM530nGH8xgvofvkibBEHVPectkKxUXs2O0HsA9Lt8VqS6Vdu6abTU
 MRxJR6ud652U23bKxskkfRzfKNpZTqGPGzmP
X-Google-Smtp-Source: ABdhPJy14F6d0h2r7/4p6oqrAM5LS8peDKXMcattGlrM2R297ZmvNMjauNFeh/ITF40zFAd3D86YDQ==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr34705235wra.21.1602581234070; 
 Tue, 13 Oct 2020 02:27:14 -0700 (PDT)
Received: from localhost.localdomain (147.169.185.81.rev.sfr.net.
 [81.185.169.147])
 by smtp.gmail.com with ESMTPSA id f6sm14484830wru.50.2020.10.13.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 02:27:13 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: mediatek: Add support for mt8167
Date: Tue, 13 Oct 2020 11:27:08 +0200
Message-Id: <20201013092709.3336709-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_052715_929764_F5D354D8 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: matthias.bgg@gmail.com, viresh.kumar@linaro.org, rjw@rjwysocki.net,
 Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for mediatek mt8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 drivers/cpufreq/mediatek-cpufreq.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 7d01df7bfa6c..b8d48ed37156 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -119,6 +119,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "mediatek,mt2712", },
 	{ .compatible = "mediatek,mt7622", },
 	{ .compatible = "mediatek,mt7623", },
+	{ .compatible = "mediatek,mt8167", },
 	{ .compatible = "mediatek,mt817x", },
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7d1212c9b7c8..c09bff86bb9b 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -532,6 +532,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2712", },
 	{ .compatible = "mediatek,mt7622", },
 	{ .compatible = "mediatek,mt7623", },
+	{ .compatible = "mediatek,mt8167", },
 	{ .compatible = "mediatek,mt817x", },
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
