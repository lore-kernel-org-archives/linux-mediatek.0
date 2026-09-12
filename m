Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C6C88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=; b=FFlOpnNy0xHH/4yVb+1S9Lo+Fx
	DrioC+kP7UWT+J9867IzIgX5JuOdVnm/VBMbB5y7aaDLIQdAwLo62zIZtZ4c5i23CDdTBpMLi5itm
	ZkOVlJ8qKFUAKCJE+H3rtH9vVR10xvCAhPLXmxdYN6Uw87DEImxmfbbZMwwnalWy2Z2eg/gloBQ16
	oSFeROyY6zu/maUtnpXTeZ40h85AwsMV0LGeBck49/P2gtWDFKmqJZ/1uTmaGtsfL84lhNVZJ3K8q
	4C35a1zrjsRQIyw7lakUBGYBsPuAQhp6XjRzyVAeiptq7t0DCfj+QS703F45Z7NX/CLOFBRYfTu/G
	ztWDHPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TA1-0000000166v-25hD;
	Sat, 12 Sep 2026 19:13:13 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9x-0000000163v-0cJL
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:13:11 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso964932a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240388; x=1789845188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=dAtSSGF+nitKtfe1If6jV8wLF8bptcb+t4IkEI0Fs/R4gepRjxI/Npy2zVd5hixVSV
         s0ntLomDuRCasmc8bjcx1X/vK/25G/AwtAvE2haE4URgo4zaodiVfgaxZe9EDOa1EEFp
         q5vEmyr3QXi5GtdhRLgNXTU6xu2YK5GT18SW4QNLTu6GPI1MV+5NTv+vvgHiN+egHeQE
         o+O349uQd+u51IDe9n+DEkn+sYw7oU6AuOrNJZKzZSO8QNE86sFU3tmub6yf9i3SEatU
         /mMi4KIXRs9KgOT8xFoGpfvIUT832QdRyLsEJwFJKSTbI1pnh3dTNx3gAcs50HK0ncDt
         vMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240388; x=1789845188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=GU74GJMkhNU7GaFhDNHdVgfn3fIkMiMGRzPPGGCX9eiPKqNDv9D0OSgxwL6w3iYZ3f
         FN1l83avPaSqRrf7vf7TljOzA72+0k247LIEE1UhozYQcNjF3pCmpB+sDTI76gfiI7xa
         FyqU+jq7nkNztfaRkh5WN29axMzdFGpUlBYnxEfM7TDZgP83SUn/ylheAwPj2d5I4tXb
         vzY7QV92lX8pPjZryCuy2fNQwwU0nB+mdPXFUXeR69JU2g65KZVU5BwSzY7Q4CY25lkE
         d8/q/QfOT8oVJyMcEecOEeoto/PrIOdThRnruvlS5797tMrrW5cY1lfZI6t0BXCDls3N
         UBow==
X-Forwarded-Encrypted: i=1; AKwUvBwHpibt/oBKPi1BRbqjzaHRdjV64AANXXm5gwROctB2H7ROUpGcrlOkJ2OYEIg//7mEpHBtYbkHM/MYy4AOTg==@lists.infradead.org
X-Gm-Message-State: AFuF++ki5mVDBg/wbHStkq8tLARvm6h8F4VbTyNhf/QA8qOvr+uly6D5
	uo1jUcEuHjyDoj7Pgf7UTS5nLw44kclV4bF+3bTkPREkpJzoGtFUsCk1
X-Gm-Gg: AYBFou0loS6C3/eHOKlsF+7LeNajKAiui6bGOgy0P1gqCAaoha2TcqXvYpqGbm0X1/V
	qoEcKoU9by2rxx12Mc1er1uqjG0VL6W76zpeGAPbekIYHc0cvBXeEFLNTLAin7+/cL/Q1xzwfkz
	Or9+oRGkd/8XtTA5vWFRYWAJwOLJ3ZiZtxf3vGqvddWPG4bLmbZTBxAe+LoE8NDuzo2z5uNlpFI
	BtdeyHyVc7g5IzHIWSX0wzlE4mC9nRei3N0KHwPJVqb3/NMOT2RIUUuEH65Wh+lRI38P+/hD8U3
	sDpTyL5jXvGIIiTzveLyUmxQ38oegl+yib3rK5A3tkqDO3HK7vV92lzmJQJMq2c/FSmKZLsL+HP
	dYOMV2Nr6D+rthwY9Uw4cUe4+i64CtFEo2qzT34HIWvf+NXARmetm6tjpSJZz4C8xAU8IR+wRnD
	wGsOVNSDh2YfQEyzhzfltk0cO8/SQOktO2zcZY6sRoNNDa5swgubLuMszNkYNhb/JGqtr3
X-Received: by 2002:a05:6a20:d807:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3daed15f5b6mr20435411637.8.1789240388372;
        Sat, 12 Sep 2026 12:13:08 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:07 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:54 +0530
Message-ID: <20260912191156.185448-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121309_355045_9444F577 
X-CRM114-Status: GOOD (  12.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
-- 
2.43.0


