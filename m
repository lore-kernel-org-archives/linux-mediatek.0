Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7799FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Se5J/NBpb0C0kBgRaSxAUQOT+LaUgAc2yeOCCdIGC3k=; b=S9Ikk0gWLAMTUL
	9SsmQuQLrsIhAROzysQMHC0UP4jDyEPycjdlWK96K1gG5MwvrnCNaaq52jUxMABMXkLTspn8gfxEm
	UjSV1VdGKT8zxm10sp3VR0x9UswlPGvNB0MRxmK9vO9AYOm1Mp0vwTC7AtFhvh5kRYqLLyzHEQLPa
	HcqEm0kFIIXIpm5PMi9GB6Idk213VEz2ao7k3bcpiFDCWitideBOsTOZZiVHc4oscTDLa4nNouzP8
	xOeqCB7xuKH1ItXi4UfWXUGxCiLupGN5PfWeGv51WDHHlFjSi7wU5F2cxCunN97+4mBY2hTQ/sBtc
	PpFvV+Dv7HA2dm05TqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAGk-009UTM-Jd; Wed, 04 May 2022 08:21:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAGV-009UKR-Ed
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 08:21:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so4578039pju.2
 for <linux-mediatek@lists.infradead.org>; Wed, 04 May 2022 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGHn8biVzkArfif1A3GGDNCCNtu9nk8kwnWV4EieXww=;
 b=ovuglYP6XIUlR99cJzmFGcviclvTUlrxiDBD5INA8pVtqhRoQM6hLt+Cff8YnmJkDa
 j1sZc375hNN0vGZXiwU3NCy5HBOt9CXrOjV8Lzs81sgXN/HjEi6lmPYAeTa3mxkqFIPc
 2GrKSv4JCXh6SwJMPQXFdmbalWFKhhK6BSDzuCu50kWn/usf3Fb3+3HwOZT6fdH/fyuy
 ipNn57BZf//zwh64eqnCaXAnV3mcPv2uvTgtbikkakLbcl6AisH+9L53vcXDJ9AwKDpi
 sdqxB4n8Xo+gV63I/b/PjIFLYcQ680Neg6R6HKhX0WDy2qDVbbcpRt+Kt+58Y9NsxZbs
 Px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGHn8biVzkArfif1A3GGDNCCNtu9nk8kwnWV4EieXww=;
 b=gnHTGXaOq8EBa6mc7CquLz0fFOR39BhAz4CzC9XOxU7voQHo+v6B5E4tKKnPwD3Ezg
 jO9cx/PZc5090uExqGfj7JcUDLA6F59Ak2ZN6NZlthYzPWcRZ9U53c+6gdtvbj//xLjC
 s1urTCgQjv+zoF45SDp153roRTfbnZMVqnFA7eSl1dyYhOgip7z1snFx90ZA6BRLf8bE
 PTpdNUpNN3zagWj2HBIQe0/5bUVaptGB+sHVHOeWU5QdGeNEpurFuMZ3j9QTaR1vm/4p
 mudCmybOjGHIeXcy0sOD9eALAqL+Fi7psMLeWqdd2bive3vy2a+llD1H1h/mkEM7BJji
 rnBA==
X-Gm-Message-State: AOAM532gvbgFf2ZDyOjtYI1r6P54r4eAkCICRm/NXGLCuJ08MouSokjU
 oPiMKVI5+gT46fr0DV3oH/H9WA==
X-Google-Smtp-Source: ABdhPJy+Ar/gTjEhiBq3udBPTLyLW/kvpVmkDs3NrFb1w1kzCGG7xkVwWss2TJ8eHql/kS8ynEH0bQ==
X-Received: by 2002:a17:902:a406:b0:158:260d:1ed2 with SMTP id
 p6-20020a170902a40600b00158260d1ed2mr20541941plq.49.1651652501758; 
 Wed, 04 May 2022 01:21:41 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 b10-20020a17090a550a00b001d954837197sm2639962pji.22.2022.05.04.01.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:21:41 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: Avoid unnecessary frequency updates due to mismatch
Date: Wed,  4 May 2022 13:51:35 +0530
Message-Id: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_012143_523183_33DA5B14 
X-CRM114-Status: GOOD (  12.39  )
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

For some platforms, the frequency returned by hardware may be slightly
different from what is provided in the frequency table. For example,
hardware may return 499 MHz instead of 500 MHz. In such cases it is
better to avoid getting into unnecessary frequency updates, as we may
end up switching policy->cur between the two and sending unnecessary
pre/post update notifications, etc.

This patch has chosen allows the hardware frequency and table frequency
to deviate by 1 MHz for now, we may want to increase it a bit later on
if someone still complains.

Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d58b0f8f3af..233e8af48848 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -28,6 +28,7 @@
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/tick.h>
+#include <linux/units.h>
 #include <trace/events/power.h>
 
 static LIST_HEAD(cpufreq_policy_list);
@@ -1708,6 +1709,16 @@ static unsigned int cpufreq_verify_current_freq(struct cpufreq_policy *policy, b
 		return new_freq;
 
 	if (policy->cur != new_freq) {
+		/*
+		 * For some platforms, the frequency returned by hardware may be
+		 * slightly different from what is provided in the frequency
+		 * table, for example hardware may return 499 MHz instead of 500
+		 * MHz. In such cases it is better to avoid getting into
+		 * unnecessary frequency updates.
+		 */
+		if (abs(policy->cur - new_freq) < HZ_PER_MHZ)
+			return policy->cur;
+
 		cpufreq_out_of_sync(policy, new_freq);
 		if (update)
 			schedule_work(&policy->update);
-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
