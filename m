Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771CBC88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=; b=GSWmE165ciq7GpJGPxdh8pXk15
	wX/NdttQEbzBslpqzfelOkqZ0BxRPx6HFoCfqBCoFU2J+oaLHnrSccT9MG+7uvCm3uEp93PIXtdvD
	Ip5Gqw99W2xvfduW9xaVCh4PpK+DPd/LLYimCak0H+8qNyQDNZCBHL0FqS6HYU4XmDCBffqHafnQE
	vK7M6DzzqVIXv6fTetXgkrmNg+Mv7KsnNTGGTyUFCCmNtqVeC1GC2RCGR+LErjT/sq1cy8O8/vKJk
	AKuGBnBLn5SdUwSH2CW+6CebW6qcx5Xhk3ATaYrG7drcxZJS9LO/NRdc1TTNcaCzx+gjIQkb1/7r9
	HZZ+B14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9C-000000015jI-1qaB;
	Sat, 12 Sep 2026 19:12:22 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9A-000000015iA-0w4T
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:21 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1015132a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240339; x=1789845139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=k58jrngUlqH6cMygfOO4B5yJyOazJUp3+I8RqAtGcomUl0DE+GWAVnwHPeqE6z3Nia
         57RIr9DEQ/lg7T6eIcTpJcuxtPkxVdlq7masKdlpX4N0a3MZxY07xN7lP4r1k0+ogdeD
         3SjMpTeW6orvG3CuBY4KnN9kC72G46/Mpdp7abLWG+5zk6tjLrbR7njlDJyuHr2Upk4J
         RLgi0OCpL68X8NVGqcgxFdRSv88JLsIZJS16++Vjb328upjSnAajbU9VLDtqxq/AK47p
         ELXJA5Kk9tNxqnrbe03tYskVVm2aGakdxrKygYi4RmwHhk67z39WTCfenHT6r1rFUsqs
         PvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240339; x=1789845139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=AX8AgBwieSeuN9U3tcFniZPR/JWIeeD1FwfWgjwgKC29g/660aHbm+Vz+ZgyBk9iSE
         I31Wwz/JkOqP0Qw3jTznqSUuwDbhUVXnxzTN2tmfTSXaPe8ju3eIKIw0rghw1hQa/i0h
         eiBwiDrBKf7JbKnZyS60cOHG9MA+Mg10ZpluHmgQqPOV3QLQzfIZs7g2rviASjBnxDCp
         y774UcEV6BKcw+7fzMfljuAIxcMoyuriArXVR7JWOSRnj12Pdp0drXYzBt1dj4CtXom3
         iK1P6jNwfMoYKKNqgg9ugGTm7BC69GIw9u8QZBg9TJe4c5K6SHTAWPjPsSHjywkRS4gJ
         Lk/w==
X-Forwarded-Encrypted: i=1; AKwUvBw7l5/8u1dv8uGxhNGvQgLBNZFTsoyHNdqBpqJfpJESx7px0aI/KE1vbWBYpKqSkrZ2Iqv4usXv30Mu7a4xHQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mntb0ehL2exaUBfdI85Ko/N5VXTqn85pMw3IIjg3YNo1SlEhL6
	T6lrz5cn0AWBW6pUG27o4q636fzWeTrrqZa2QR2frBF8UiN7lo2BAdDc
X-Gm-Gg: AYBFou3zaYfzy4OhvbvWqFXzW+M6JvdXYvNyUBeQxvD/1ZQGLUfkpMEjg++/PpjKPA8
	+NUVNl1wP80PU9WN/C0u4MAhLCpYJyFHxlLSY+CUxt2dFQ4ITx9Sy7WNG/ic3pFLHPuXGTqvdZW
	8fPpd5pN0drYYQaZodnrYt5hPYYcZjMYJN4br3VoN4G3vHPs1+cO+4H5FlVTL2aVW76fKOhwyGV
	v1w1e+lv8uHNO6hsBrj4AixOm1Nu9tt/26SiOhnYb4Orxk9SHWrYUCgFxGz7HKUyQk/0jSm+OGp
	ST+ZX7de8p3Wn+/cJzTjDgMY3ThNt3lexZhm3h9ygHsGyunkktFDgX1UX5dBNcayBNBe8l1glHl
	EbFaWITs/xpiuyMiQDuoG1kToXtcWlho0msGsScATsbkrjJpiFGfXg0LDQ0WiiGUmFbeo12BAp+
	TsFutr5gr6kTwlb0Xrgz5bhJynrKPqI2rV77X1EufqAgPrarB4gS4Sc9oXGcxMDDjyN0Pk
X-Received: by 2002:a05:6a20:a128:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3daed19f362mr18812158637.9.1789240339105;
        Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:18 -0700 (PDT)
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
Subject: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:50 +0530
Message-ID: <20260912191156.185448-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121220_285715_1C130FD2 
X-CRM114-Status: GOOD (  11.37  )
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

This patch series is a cleanup for subsystems under power management
(linux-pm) that converts several instances of error pointer printing
to use the `%pe` format specifier instead of explicitly casting with
`PTR_ERR()`.

Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
print error codes returned as pointers. By switching to `%pe` and passing
the error pointer directly, the logging subsystem will automatically
print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
`CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
numeric value otherwise.

This change significantly improves the readability of kernel logs and
dmesg traces during debugging, without introducing any functional changes
or side effects.

The cleanup has been applied across the following PM subsystems/drivers:
* powercap (intel_rapl_msr)
* thermal (cpufreq_cooling, devfreq_cooling, qcom)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc)
* power/supply (various battery and charger drivers)

---
changes in v2:
 - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
   for *_probe() functions during review of v1 series. This will be done
   in different patch series.
 - Here in v2, reverted the changes for dev_err under *_probe() functions. 

 - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4linux@gmail.com/

---

Sumeet Pawnikar (5):
  power: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  powercap: intel_rapl: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 14 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0


