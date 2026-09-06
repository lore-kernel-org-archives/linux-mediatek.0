Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B040EC79F9F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=; b=Rj0x/BHY7eCapuwAQUXLGI9nX9
	Yl6EMSpyHsaloUrewcRWjDNcYLdF6UgNXi9VUaTFeLN9yBfDtzk0m3Ly0lU9ZDq57FtvR2md9wQbC
	gC0+Lezt0qf3Wa4+ohxukrTjmiRGhZ0xou9+LnxcGHFmAphOmbvm+ID71ejyjxeBQWUdxcG428ZHA
	dXNop2kLdclVLaIrjhhK7vuaoY/jMxhSHgm7iDkpc4yWRiD2cbufUquP6vKHD264kdDRlnh8FIGKS
	fWugYwimrtJoK2ESpA3wwB6C2FK4BjPRGu0SCJw71lcHKHfRsZs5x9GemCBZkHudRmgvpO/Fx0JfI
	UY1rWxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Co-00000004jyz-1AOc;
	Sun, 06 Sep 2026 06:18:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Cl-00000004jyG-3Tmx
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1c7364550so2692235a12.1
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675492; x=1789280292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=iM1/dxvKjNMPmJy0tT412mJ530RXXFp230UOho62AXFxPMJEG5W/U9OeFFIJPQjDu4
         l/N7i8U2FSd39RHIiBCR4D81ELkoUMJ0Kb/bLg9+veJ80XeeFZzdlcBuCasTO/tqJlpz
         knRMzSeNy4wNZLuOoXUXsGpWFmIXXWxXGtm3tAwNIw7nKmc2Ef9HM6+jc7RKbfXSY0QW
         QyqQv33IBBVIKaZH2hj7OLiI6keT6pv2NyHA2t63bimU3woYFiH22hsU9Mk8h1Sq+HIv
         A5zliWlHnU1lRgihIka4YLPl69rjGWNGokAZEEXeUmMF2GEI+3VCz9vtD9Kz6F89qc5i
         Vqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675492; x=1789280292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=mwIJrZPRHVeNqyrOOwrfwyX0s2R1WH/NLuY2oXMpSuP73NyEYtMi5BY7YpBLNtpwLN
         oGAEaqUd628YXbk+sLS1VmCsEPq/5F2y7lFNA2cat+q+0YR4H/MzEDhA+uO0M1oaFbRJ
         2v6MB7EBvS6flxg5zoGxOwfx5B/r51ruxTbTjaspRYnC5CPmS9VNFEph/gvYXXHrkO6L
         UUfxkd5LjfTDvi9ENUtQwKTpxGpufUb1yCuPSLL2JUvT8YbJPSqJruoPk3TJRT2fqHyJ
         OhSPv8cY3GK3YKQmZfARAVrs7sj7MI4f69e7ZGwHtv+VcsLlitUtdYqqHxHYMLoO43zF
         2JBg==
X-Forwarded-Encrypted: i=1; AKwUvBwNX++xMtHtgeGTpIjQR/GcC2jD/ff3qf5A+y74FU70snxHUzDbQn7DK9+jXG5f05AFXDvwH5fBDPTumrG4qw==@lists.infradead.org
X-Gm-Message-State: AFuF++lD0QwdS6v7VwTPtuUWQFZ73G/Zfm/ZqcMI/CTAYwaWYerA2Ubu
	GUEc7jI1YiHjw4B1kvHD+m+YendNP4/NMVt1V4iVouTz40TyFst25i0T
X-Gm-Gg: AYBFou1F4J0vrcI6c2xizUapkcTNF5SpzA5VmvjjH7gfVmqxn3DPyPKjUa9+Hq+EXlR
	wZ878ZY0q/lspGYVcKp/A8cUkc8zH9X3objaVxZmhywYNuBDMtigjjbqB8T5PTeaCNte1g1ZTwl
	GqQIHj6SKmgqu/xGQveWmkt0MWlhZO+Nf4gKlCf9GjBx/mpjUazqzdTM4Spjn1fAUk78zVCP5F9
	WIeD5YKa9GD5G+Cxs7j4dwU2gWNhiCmJmyeuLCjsS1meeVyNI6LsZXnxbK3fpvH7RtT8vRZ13YT
	Fs4oXvaDFPTX55D6o/FI5mvTHua3sv32kbg3+QKTtgQeckBasS1bXGownR5qovVFykrvqYj+rEm
	1w7Odno7Q6vK+p2HMQqx9YaTL6IwN+PCkErjwD3/hcHoOVfUV84A/MhRF7m8d1qdfqkHgCNdKDv
	cHZP2G4ImiBMEWuhb8p8/TXPsQpEr8HxYq5QzROgCStU8WEBxn5fP/n8ezrc4F
X-Received: by 2002:a05:6a20:9c11:b0:3d2:3e73:29eb with SMTP id adf61e73a8af0-3da39bb596fmr24951780637.1.1788675491987;
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
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
Subject: [PATCH 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:49 +0530
Message-ID: <20260906061755.5103-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231815_865032_BCC8EADE 
X-CRM114-Status: GOOD (  10.53  )
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
* powercap (intel_rapl_msr, intel_rapl_tpmi)
* thermal (core, cpufreq_cooling, devfreq_cooling, mmio, etc.)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc, mtk-cci)
* power/supply (various battery and charger drivers)


Sumeet Pawnikar (5):
  powercap: intel_rapl: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  power: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c          | 4 ++--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c         | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 drivers/thermal/thermal_mmio.c             | 3 +--
 drivers/thermal/uniphier_thermal.c         | 3 +--
 20 files changed, 35 insertions(+), 39 deletions(-)

-- 
2.43.0


