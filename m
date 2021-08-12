Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47981C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 04:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49EB60F91
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 04:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E49EB60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CofTADnScMm+jbImlI+A73rnpXbWMjBqKw6nYSJBhZo=; b=0W9F+QY9tpzBHr
	bs+SSNYU0vFxcvhJjJW08lu8r6n5PDHjZLMSfx0Filc4YNCR5GO3HVq2qOvk2Zh+9jPbB10r9mhRd
	naNu/fzGJrNgFgAQpa4Udm415UCDRBdNR+j2FukxpVQmKq1FrAPq9h3pqo3yw40AIED719Qun4rQJ
	6UlTOHx0xki3b1xsqhZRBoU7ajNcVIpR7msSgrqwc9ek9LuvdjuciGojsF0Az26QJbNjsoq1A+FBb
	fHKz90/B/4er77jR6b4PJXnPXs7/cPZTwQdEbK73iO2pdUKMEi4BKdjt1EZcoGCOtLfyVzXqV1Zxv
	swsjKiGqPOkzLFoj9v1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE2SB-008adY-5D; Thu, 12 Aug 2021 04:36:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE2Ri-008aWb-Tu
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 04:36:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so8784456pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5B6LAGyn6qpvhvvXqvmp0F5nk8/QX8RYvQTVx1M0/gM=;
 b=QP4d91nKyPuYgkXOj2993WRqr7vFWjzAt2pAYEpOqBJrX79KK7X7Lye9RW33nVemOS
 glTh3230AbIEle58TNmDHg+mGlObfxcChEqEIgpM51UFcNuoT5t2gwEZYo9rstSe+BUh
 G8oAVPZc4Or2lHFxR9TnUcIaCZpTTeNW497UmbMV9rdrFsDQX3C4DbEyHzT9ETDcJuHH
 44M487nZNgj5a1TirMtTv5x8vkPi0ZRWgBVRFM/hm1MZ4gPWlnqSsL9XbuORZM21Fqvq
 2Kb9HOtRennF8T/9AvDxP+8H2lNL1JiYws1Z/YqfyQ//45J/2m8OCM9lP/bKaiSF0mx/
 SA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5B6LAGyn6qpvhvvXqvmp0F5nk8/QX8RYvQTVx1M0/gM=;
 b=ZTfdQArBDNgPoY4ZHJKQ0SQOprXhu4D+NpfqvKTasU7PCGYWM0gin7UTCOqpjcYolf
 86ilojCCVWekXISIH9T2uaE2xzHNZrzBI79N98EaxQjaTzPvBwKlShJscSLKPjdHn7Gx
 omigtZdztfEWQRgPfvQOFUizezYEhSZZ8h8hRLEk7x4Kv/JlkAqAIiuvypDkaYUti9Lj
 5EGxy1tvLUSOjIpQfcScRbNdsFCDLcUvBBjQ9kw+3SLhbn5FdZetS9vDRnZapV30gajB
 MowSWARPoo5afcmt55FReYdDHFEdemjBCP6QgGAB+1ryjUI4odENwROz9yR0lPvSv1zJ
 Acew==
X-Gm-Message-State: AOAM531hjE61CSFpXQzlOCKenQU8IfO/xcHADuyWd5eBLZJv9eBDuvFX
 q0AowQFerQSfGFsQjN3pjDjmEQ==
X-Google-Smtp-Source: ABdhPJywxltlmffoNhquAq7k75/erYD2KPWkiClGULINl/c/3BgHh8iADap4QiF3r0hcPTmn6BYUhg==
X-Received: by 2002:a17:902:bc41:b029:12d:3f9b:401e with SMTP id
 t1-20020a170902bc41b029012d3f9b401emr2042045plz.47.1628742957070; 
 Wed, 11 Aug 2021 21:35:57 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id v31sm1420379pgl.49.2021.08.11.21.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 21:35:56 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Quentin Perret <qperret@google.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH V3 4/9] cpufreq: mediatek: Use .register_em() to register with
 energy model
Date: Thu, 12 Aug 2021 10:05:17 +0530
Message-Id: <3701fd64a3fb947fc805ca0d108ab87562a9659b.1628742634.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628742634.git.viresh.kumar@linaro.org>
References: <cover.1628742634.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_213559_024475_AAE110AC 
X-CRM114-Status: GOOD (  11.58  )
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

Set the newly added .register_em() callback with
cpufreq_register_em_with_opp() to register with the EM core.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 87019d5a9547..866163883b48 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -448,8 +448,6 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
 
-	dev_pm_opp_of_register_em(info->cpu_dev, policy->cpus);
-
 	return 0;
 }
 
@@ -471,6 +469,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.get = cpufreq_generic_get,
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
+	.register_em = cpufreq_register_em_with_opp,
 	.name = "mtk-cpufreq",
 	.attr = cpufreq_generic_attr,
 };
-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
