Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2437FC88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=; b=z5vKwpy1iASN7RqH3r+W0+pTx6
	cVMmaG1yO899r8/DXDEerWm0a6VBl+VkD5WQeRir+I5jtl0F+oEFpR4eFb4yv3vi5y8RDJDNKu3YY
	3+C8cdTVOaAIw/uOkLpR+LgGta1IsmqD5UvpBiVZZYhqXwdBLiZMQCAs4cmFy1b6mXpfZQSKIvej5
	8s5pPi4TO6Yf/5JeVqwq6JF+sVwZw7vYfrcCd+n3fOWuhypOUTCUhUIhzOp+ckzYw/mTpV6UqLpIO
	FzPiQ9Z8xhSfztLY97oFpkZTL/SgtQLU4ogagA3ddr4LBG8l4QYNV97n3tvaWM8QETH+C7m40eMk6
	R+2ZyOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9q-0000000160W-0c2L;
	Sat, 12 Sep 2026 19:13:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9l-000000015yN-0Zvq
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:13:01 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so437733a12.3
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240376; x=1789845176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=Y+5fJY1er/XQOwE87PfQZJZYSYwYznO8SQQxiw+qn6IEcyBz4adoV1uZnvEdr6bpmZ
         4S+eqXzpKfH6VgAeUxr3hr4AFiy0JGyUAkWsmlFB2T4GNHA6VLPbZR+26W+uriWRE5AG
         8xZHiV44+Z/Oq3K4nzjETXZoU7vNyu2RmUJkP4DgQDrorQyjUdrUux7ciyxgGWVqv27a
         cbWRUL/VXoTPDQSIvFDn4Snvm5qenFNucA2Hq6vwb/KxBofQMX09kLsfS/RSAZOhd/Mi
         FCJCVgV96caZAh9GAW5jZI3DZ2MgHx81OEkLc53Z9L7u1j0DNz8stQLznaVRoSKGkL/2
         JeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240376; x=1789845176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=lXLEEP4vRYX4hZkHFCxkO7kw3ciSYsU1BVYx1uw/z/uvwCrFR7UOPJDMjqOibIZ1mB
         fVkXVGLCeXQDPD28uvKCZVtfeMB8RZv8bvYGiKXkcHYj4WxAvX1+UIDXrWFIU8VRzusU
         fqHSZb+hhp9iKR1lOAhCIfQF+gy1naecJqfjycHieIB1/lEuMmj+GVl/Og49xEuSNrg2
         T44VtCzP4KXCTz+YnBy0sPub+ce6xgP/is7FCZVM3drUraJ6bufEuEupBCkJBA1++zva
         4oFkDfjrB6y3BKCrVpakBFCMnQTscx+wM10JjTHyZy9ncN5S3srSF8FFFvlA3uHuuMW6
         /xLA==
X-Forwarded-Encrypted: i=1; AKwUvBxDVtzwqZw6u/zaeUs9WQg0dNAWLMp1Uc1CLC7j8fUH0UgZIuV3If8sHgE6Yp6dleAHYzyi5CsgZqps6mRmyg==@lists.infradead.org
X-Gm-Message-State: AFuF++k+SRS38mOfGW4Q8H0RQFURCOfQtKYwkoq/SSd/oHxqLKS6ERJv
	0vOZd2sH49H3fWE78phFPKdV8PYThtNVZo+7lwT0LlJ/VLOtrXI7cUve
X-Gm-Gg: AYBFou19a3h+L/ddbw4QhJFw6++i9bb5rAZI580SykvWTmWfed1On21InH0QoMITf5E
	rFA+H6avIF7eVE2Zo2tuaFY3r74Nx/RkSYZ43narUEWsEDasHjNL4izKp4FlSMtMNBx0k4nP/gy
	xvii3es8DyDZ+FFoDmTKEl+/89lMJnYPt7AqvKAhId5nh+m9PagVZyi5aVieNnP29RpN9noiTDJ
	DCp8LJD63Rdg0Z3W0aKp3FKsUjQjTjvTMV0yUnF6FNGjyn2uqLXVHqm9GcnS0VBgUQi95RRnSDU
	FGLQej81GRp0ZV8DiGjk+6kYgHCoOk5hLqe1WpaooxP/Y4yI7GGhBE1p+raD17uOr0yEip0HKAY
	368V5Gi5CEvI26+ZVev8SfbBwNzNZHfH1DI595EbxrqLeqSZaq8GmWPDCStzukL8rFaAhoEmz2e
	JtOOMmAd0hEAAY/5GeNWFjLOHf/0KrhmUAT0FACYj7R7oNFmSQjucPZbb+TpCJH8aU3OQD
X-Received: by 2002:a17:90b:5745:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39d9bd685e6mr17887143a91.10.1789240376247;
        Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:55 -0700 (PDT)
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
Subject: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:53 +0530
Message-ID: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121257_187384_E337A799 
X-CRM114-Status: GOOD (  12.25  )
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


