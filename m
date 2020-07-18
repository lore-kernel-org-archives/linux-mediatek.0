Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2DDC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28DB20691
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GrJ532L5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="eaB2T02E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F28DB20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DtKxkCORsPlcehGXe7MrYdjKPoQXGcalWoCUrIPkxTM=; b=GrJ532L5lP04qljvGVL1MLTBm
	hDspPEAqJ6AADPkBO4yYTi8voOx5lqGB0enPGCQHUU/TM9MNAttCpijGfEv+HvksrCoCs1ieSr/Us
	ad6hJWd3r/DKwZUi6WNbEgnZskWR2lEyIBVJd+j/vOnLesEuZrk78nApP0HCn5WHc0POwc21DbZzu
	S3k/7koqyRBpPlitjn1+UKewBQOLE8KvRNCRJqxa2fNSFKLMkoJY6pHGtFV5snI+GiOiKwCkSRkhR
	LNvoCXuqDNn4s7Ft25B9ogjmB8aEyLFLviCGV9VJkM0tifmz4MumjrcHb4ab2VFaM3PoJ0W860djp
	1vmz3VdxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwaNU-0001xC-JT; Sat, 18 Jul 2020 00:06:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwaNO-0001sQ-Q5
 for linux-mediatek@lists.infradead.org; Sat, 18 Jul 2020 00:06:51 +0000
Received: by mail-pl1-x649.google.com with SMTP id p6so7555736plo.8
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 17:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DKGRFKWlyGqgvFuZLsoVKcLXRUmmTtOYHyvcndsSP+U=;
 b=eaB2T02EB8g0y1xZXeHPi2mGLg8poIqpVgJ7BZUCLc/EEq3S9kRsfSNNVOCKuDD0Tp
 x74rVZSROfJKsOJm9ugF+T1Hp/iX0XD+d22Er6E2Ibg96Ah5e8rAy3JrWpf9H2Z7OG+d
 YfBGYGnHBr3s3ccaS/U13rr/1gTn2YsvYde1+xHImpDp53KqpLwJSlZ2wApaMUKIJsf3
 crIVaak6JWU7DHb9Yi5DC8e+5EFRBpqVcvzTXx4P24HIAMBgrJPX7czTcaMGSWVzUDhV
 MEo1D+Pw+zcwU39+Qrp+uVsSPuLqyQXoE6/DNJ8WbV/EYVgi81q5pq3cK0C/DF/L+LlF
 vZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DKGRFKWlyGqgvFuZLsoVKcLXRUmmTtOYHyvcndsSP+U=;
 b=Lo280qK5SQ7lH/9/YEjtRLOK3F+s07tU8O5rw/zZREvSLmGpDFHTZpOCqz0mSvtjDO
 kDennCVKvoS0I1fJHLv8v/D9mFVs7icabWWtRHYQ81d+7mTumLbkxehkwCd8Eg8r6ChY
 UUS7WuYNXAdemS2UPnS9Z/ZoS1stGJ1eDF1k4AEClWZb7MmWkU6pgYGlqywo5paDntAQ
 rsHaAkvfUT9P1+CHApSSWBl9BntLsjh0sHOeyoepS4Day8lKpDkj62m+xcYK2FC0o59d
 ju07WkbTQID7fn3ASlA/1dTq/dmyMUXRPt01EMUwHpBMb5TARSNkGRQJphzV8NkSHQnu
 3lmQ==
X-Gm-Message-State: AOAM533DIGgR+cw3omKLn9fylPHmXOuBfQ4PLrMlTE7I7K9ncZmKcRMp
 bFPm2hPM41mDMhvAdWJYR2FMdN330w7oO2M=
X-Google-Smtp-Source: ABdhPJw0Oq4D37hE7WRVSZZsPHqDRMN/reFgLscACQLoMocTAkUGaDa91/twwV300uYzLONkac+Q5pfdV9Natf0=
X-Received: by 2002:a17:90a:32cb:: with SMTP id
 l69mr11006149pjb.205.1595030805133; 
 Fri, 17 Jul 2020 17:06:45 -0700 (PDT)
Date: Fri, 17 Jul 2020 17:06:35 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-3-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_200651_025225_EF5AF97B 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Saravana Kannan <saravanak@google.com>,
 linux-arm-msm@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, John Stultz <john.stultz@linaro.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch the driver to use the helper macros. In addition to reducing the
number of lines, this also adds module unload protection (if the driver
is compiled as a module) by switching from module_platform_driver to
builtin_platform_driver.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5b624e3295e4..c1c5dfad57cc 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
-static int qcom_pdc_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *parent = of_irq_find_parent(np);
-
-	return qcom_pdc_init(np, parent);
-}
-
-static const struct of_device_id qcom_pdc_match_table[] = {
-	{ .compatible = "qcom,pdc" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
-
-static struct platform_driver qcom_pdc_driver = {
-	.probe = qcom_pdc_probe,
-	.driver = {
-		.name = "qcom-pdc",
-		.of_match_table = qcom_pdc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
-module_platform_driver(qcom_pdc_driver);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
+IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
+IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
 MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
 MODULE_LICENSE("GPL v2");
-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
