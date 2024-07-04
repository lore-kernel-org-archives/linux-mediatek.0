Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE3C3065C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=; b=2TBTfmop2AsPkQ9jhg0fojU6Tj
	94cCKyK0AxBqIh3bAJ67rUx/He/YJnYJXjQC1sCvsw1ULoSG+dP9P05LMGpZLdD07p7JpHaFJyOoZ
	DO9K97DJCXA5+/AjKo++wUpT9fuPWn2t5nJSr/L9nWk0UPEGmKOhLb5/3CBLfO6rfsiQ4ZTAn7F/N
	/WTj03czVVpbBvJ9XOLNt84GKoBKhvLsHvgVpJs5MZ1TIalvl9FsTBgGc47E/fMAZNZKG4mZgHGFo
	GsMvtfG+NvoLqruyG0ahnT+RyctRdLIZBst1DwCsLtLQ2OLyLlat5ErXWrmsDOal0/V3yy2P/eSZR
	sps1xpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPGML-0000000COG2-1uxL;
	Thu, 04 Jul 2024 06:54:25 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPGM7-0000000COES-2lqR
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 06:54:13 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7611b6a617cso89990a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720076051; x=1720680851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=bZLeOnPeVnLs+7LWvqwZ2WWX4wAvPdwVpU7mDBJ0ytM4HA1ksiX1LHbO9oF1C7l6Il
         SjdN4NBnz7vrZ2qos0kuPUqhYYHaYWuJ4UB/uxzwKL6qslGtmqYKGSbS6nuOezS9vMFK
         WFZ2yawXxvm27whSN09MteVCZ8G8B/Cp1WFeNK0H+3lF1aYBuX9o/TYfUT6IbpPHqBih
         AwsV90y7uAbkUlUIh30rfrTdhCJ5Y1dax8drYgDYRSwSY68owLjYMs3oGraDVjoyzHBW
         j7jbqZH958puE70TM4ngbKbHBlwnsBNFEnFTGr67OCIjGmrHbLyBp0D+aDFq43WnD58a
         S57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076051; x=1720680851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=RPRxY4gThJxCI+g3sRfMCr0YuO3dvnwS6O/8CCBnuOdatRDEi28a4zO/riIFQIeS77
         jVD+ac+D8UFLejM6Rb2YmIbCb8RjGJouW0PQkXb/xyI3pJ3oB4xnN69wBLf5WWGHAUOX
         pjx6tPLYa39uM1QygwNODmZiL5LE5SqW2jC4Y2uOKzk8PkwsiUREVSlIa7Lomdh0uqTr
         je6vmK3aiFjTNqEvJnYpnJX+xZQiFFvDRjZq1ax5qifjmKHKGFxTHaYniLwgcjROuuXQ
         EpcvLIaQ7lSMbZAAV1GQ8fvYXwofrUSEZozcfR0JMYKo0JyvrYr562oJN9JY2ra8iCK8
         CnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MKy7aINP9ifoE6hJMnz5vshPuCrI79LcrU6BuAnqD6B5Ia/hodAboKMe9uaoHW7hQsC3zmS0sgWZYZ5W8J4Ocyvr/WnlCbsRG2qL8TedVabS
X-Gm-Message-State: AOJu0Yw9aERLZzWvjToHuNm7c9hWOhZflQkpeKKGrmaTp5oezXkZ4JDU
	qzjBJEeRWhFFAZNwvpCV0idjtRxXN+T1NXPIVpuG0lgO51LGrLRivTqoa2adPCA=
X-Google-Smtp-Source: AGHT+IFgHGJtYuDCHwF2hfQyaKB/hypmybNqgZV2mdKvHoDVjRkC1GVw1vaa0cTn5Yput+q/r8OwGA==
X-Received: by 2002:a05:6a20:2594:b0:1be:f080:6d27 with SMTP id adf61e73a8af0-1c0cc742219mr739965637.22.1720076050677;
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a989416sm711460a91.29.2024.07.03.23.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huang Rui <ray.huang@amd.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH 0/4] cpufreq: Make cpufreq_driver->exit() return void
Date: Thu,  4 Jul 2024 12:23:51 +0530
Message-Id: <cover.1720075640.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_235411_736792_851C667C 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

Make exit() return void, since it isn't used by the core.

Based on initial patches sent by Lizhe [1].

Rafael, I will take this through my tree for 6.11.

--
Viresh

[1] https://lore.kernel.org/all/20240410132132.3526-1-sensor1010@163.com/

Lizhe (1):
  cpufreq: Make cpufreq_driver->exit() return void

Viresh Kumar (3):
  cpufreq: nforce2: Remove empty exit() callback
  cpufreq: loongson2: Remove empty exit() callback
  cpufreq: pcc: Remove empty exit() callback

 drivers/cpufreq/acpi-cpufreq.c         |  4 +---
 drivers/cpufreq/amd-pstate.c           |  7 ++-----
 drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
 drivers/cpufreq/bmips-cpufreq.c        |  4 +---
 drivers/cpufreq/cppc_cpufreq.c         |  3 +--
 drivers/cpufreq/cpufreq-dt.c           |  3 +--
 drivers/cpufreq/cpufreq-nforce2.c      |  6 ------
 drivers/cpufreq/e_powersaver.c         |  3 +--
 drivers/cpufreq/intel_pstate.c         |  8 +++-----
 drivers/cpufreq/loongson2_cpufreq.c    |  6 ------
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
 drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
 drivers/cpufreq/omap-cpufreq.c         |  3 +--
 drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
 drivers/cpufreq/pcc-cpufreq.c          |  6 ------
 drivers/cpufreq/powernow-k6.c          |  5 ++---
 drivers/cpufreq/powernow-k7.c          |  3 +--
 drivers/cpufreq/powernow-k8.c          |  6 ++----
 drivers/cpufreq/powernv-cpufreq.c      |  4 +---
 drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
 drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
 drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
 drivers/cpufreq/scmi-cpufreq.c         |  4 +---
 drivers/cpufreq/scpi-cpufreq.c         |  4 +---
 drivers/cpufreq/sh-cpufreq.c           |  4 +---
 drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
 drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
 drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
 drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
 drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
 include/linux/cpufreq.h                |  2 +-
 31 files changed, 37 insertions(+), 102 deletions(-)

-- 
2.31.1.272.g89b43f80a514


