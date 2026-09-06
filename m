Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA65C79F8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 06:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=; b=cAdDNeS0zaaYiuPWtPhkxqTQ8Q
	ZsAjTpuEeTkFxleqaULOoMz2YoeLOo8geHqJlM2Hcph/ep6xbq3e0Figd8aegPdt24EvLlHzJ9LFx
	92hr+Xi31yGlXZJZpWEJh/x1Km/yG1kQrlD42ZPZwNo6v1r6tQCSHhKnMu0Bf4LHgEQsQjtIrqzQP
	v/RiZ+QrPeyDqIpp2iWDIRYBiLp/t4A39EjQN3JT2kQrSZPkXY98o76kMHnxmPtDTtFsCK/hehVva
	Cyv3vmUxHD3w9xCy3xCJPm8OwMrQk24mTQvzzV0tY5RCHpRCloYz3la/t72X5U0ear40A1JfLvfhM
	abSE5qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DP-00000004kCU-49V6;
	Sun, 06 Sep 2026 06:18:55 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DL-00000004kA7-4B9X
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso1650982a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675531; x=1789280331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=B55SyVRDqYVJGJdikfKYj0QLLzwkuoiUIv8LkDLjYOHs4On+YN34Sa8XpQvlJCVHIp
         N5DpR74HKGCeDCOEsBkMPJPCjXjmRwzxDGRM+cBUoNEsUE1CGCctEfHYEozek9Ye7iiQ
         fDMSzlm2pIenPmsBOY1jx9528wLHMtJFevwQY3ryjKbn7x0fyzzII738DPqmPw3h9Egh
         h1niUCMspEO1adJbiExRaXAT8OM/vtt6IdKZj2nHoObNwUVSz44dvLlD6MrRC23aRb+q
         1sAmV/U04XDEhWW5du21SlzHtLSD8HpsnVv4vmA96ThJNLvcINjEFn2pJ6KaycekfDHS
         sa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675531; x=1789280331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=Dqo/lJoLVBwkynBhDsiS+u/YW6hnsxVqM+/qwm7uvnSZVgsuklZ+e+kGJpAHc+Alkz
         MjhUkaNQOyRP5s5jEg5L1fM8N1FOFEhlYLTRJ8Cx4AGlHRDIP/gWI8KtqO3511XQbfkb
         JMUNFE/J4nRRhmXcJAuApxrmDF/sA15gLrDle6LfDNNcwP14gO6hksJ2OeXCCyY/ciu3
         orh2MVawPNz4HkSNr188o7ApVXLdC3KtGc5MLLoccVI0BKGoN9d+hzKD6pUetvAc7nrh
         G85g2oU2l3m3LmW83lQvVHDPbjI/QhhhHYLujrNz8MZd+55ZrvgspdRfcWLLKMwT5ey7
         NNpA==
X-Forwarded-Encrypted: i=1; AKwUvBylyWuK4hSe/PaL1L9WCnZeS/FrePf+zAOXHqaNgX1kONO4fnf0HVyMRfLmYUfnPO2mfNKek+JPvDx2ewSvMg==@lists.infradead.org
X-Gm-Message-State: AFuF++mbVGd7qZbWN1nzRP/S8AYqDdNritL+Ct9kszBcBdo2/mjFrlt8
	XlDO9DdsDuELoKUoUp1XjZ7cx9V0794Q3nWf8HfN3YQeiUsDxq1wJxKy
X-Gm-Gg: AYBFou1+Oi45l+psKaaa5TVTPSjmUcHV6wkno52efXk2QMz9cuCwUdhwAtKN27NujHt
	+26H/T0gXdVTzqV+bJllQ1Obmc1ewBTMSKwgx0obuBGZqN1xi2rkKQl5hKx19QsQGgsvAn1UgsZ
	y5ANrCGM8JqNq0JyMOlRsRTdtBJofpkJanIMRM6Up80PIFE/6SwICIMjkrNgZVoDH/W/WCCv1sL
	QZmmnZ/Tc765BDsNOaH9BwuTz3I5JZl26/nEKF77naU9DdJGP7z2s76hkRZlL523VpLPAk1wPfR
	d+802LuYowpNtX+imHkJFA6Gtr/bMA157wJ5Ir1kebx/bcZBdZ+XkcWp/o7ivb3X0UPwH09QIsJ
	g60yRTg/jjDqK7Ek9C1Uo3KNSTgUSTGj5AvU/39eDytu0HXYMZ2Sn6Fad1/D80krto+H7iBgIje
	Rh2GanAu48vzFy/Vw4aD2NDknhlkjLCM6s1MVQ0IeZfSbls72JfIQ4GXmGeocbUjabBFCunA==
X-Received: by 2002:a05:6a21:6003:b0:3d3:adbf:7780 with SMTP id adf61e73a8af0-3da3a16a4e9mr27908167637.21.1788675531001;
        Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:50 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
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
Subject: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:52 +0530
Message-ID: <20260906061755.5103-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231852_043092_354440DE 
X-CRM114-Status: GOOD (  11.77  )
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
to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index a8e35bc75fb2..389fff5e6f65 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
 
 	freq_table = bmips_cpufreq_get_freq_table(policy);
 	if (IS_ERR(freq_table)) {
-		pr_err("%s: couldn't determine frequency table (%ld).\n",
-			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
+		pr_err("%s: couldn't determine frequency table (%pe).\n",
+			BMIPS_CPUFREQ_NAME, freq_table);
 		return PTR_ERR(freq_table);
 	}
 
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 80893844353c..f767898ebfb5 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
 
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
-		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
-			PTR_ERR(kworker_fie));
+		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
+			kworker_fie);
 		fie_disabled = FIE_DISABLED;
 		kworker_fie = NULL;
 		return;
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 42edb41ad459..0652e5df0278 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
 	/* get platform freq by its clock name */
 	pltclk = clk_get(NULL, "cg-pll0-div1");
 	if (IS_ERR(pltclk)) {
-		pr_err("%s: can't get bus frequency %ld\n",
-		       __func__, PTR_ERR(pltclk));
+		pr_err("%s: can't get bus frequency %pe\n",
+		       __func__, pltclk);
 		return PTR_ERR(pltclk);
 	}
 
diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 9cef71528076..9a01592425ee 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 
 	policy->clk = clk_get(NULL, "armclk");
 	if (IS_ERR(policy->clk)) {
-		pr_err("Unable to obtain ARMCLK: %ld\n",
-		       PTR_ERR(policy->clk));
+		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
 		return PTR_ERR(policy->clk);
 	}
 
 #ifdef CONFIG_REGULATOR
 	vddarm = regulator_get(NULL, "vddarm");
 	if (IS_ERR(vddarm)) {
-		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
+		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
 		pr_err("Only frequency scaling available\n");
 		vddarm = NULL;
 	} else {
-- 
2.43.0


