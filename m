Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C098DC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXYasbFGyOzjbVgkFYQhHdq2LiUoVceQJn8x4Q7U0Lg=; b=pHwQn0v1j4WZXCJgQK6yoB3BSo
	i6fVi3sP3IFLcXP7S1q/zIZdt0Q1QWpCIDTPp2Y0oKJBypfYZwZ2c+Tr/4cFhEstltjvuhMGfxMDL
	YPYf9l47WDE1kqk/R94tjvJdwtGPclq2uE0wotVJJ5nJ39y9WYQADcf0cWaig+Iol3QBeyp+EezZ6
	xNU1NX+JaxOXh/KjJncTsfHiOhHPeSzEVU0PFxkMcKsfmh+eFbesLSM1uznNgBu5PqtxaHON3ULY6
	pIfQoaiZjWXYcyF8E8yy1opnH/jP+b17ejwG1jly3vOXcGjUXQ7p5x21C49pBzPSFUFikrodcr7+b
	UAURbeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6k-000sdD-2b;
	Wed, 29 Mar 2023 15:53:06 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6a-000sSQ-27;
	Wed, 29 Mar 2023 15:52:58 +0000
Received: by mail-oi1-f170.google.com with SMTP id r84so10635315oih.11;
        Wed, 29 Mar 2023 08:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXYasbFGyOzjbVgkFYQhHdq2LiUoVceQJn8x4Q7U0Lg=;
        b=zVWqK1+q4pC584Z9WZqHC/psiWZugeOjf3v53/unbZysemoa0yToyB+ZtPJK+um2gA
         MQAL2eQZb2yzckudtH0DbTf4MhhJWFhYuj9UMMPg4GJCfydXIANOMwg0lWKfewa1itEo
         YmXYXl7U8h3OhzPAVvlOzAHL7SXhOecsA1iA2x5Bpt74IjyFHPnyLyR7PzIhiudpjoU9
         3PG7b3bhlrXJrwjVu/W9F5ZohkRY/8YRBUsl77JZFFIIo40xCv20t5hM+jE5QCFhKMBC
         p8Y+qtPD1PNFQz152saA7N/PR7FGVntsk/u761Qk+dJ/A8qB+y5JbkTKy3BqEWMDgEuq
         ySag==
X-Gm-Message-State: AO0yUKWbCamK8CWmyMoqSyqgqwwajY/VXVBYwic4tZFkRKOUfmYhANF7
	W7nkkesaVCvnrr4DwLSYeg==
X-Google-Smtp-Source: AK7set9WFLmG+nDxrfFiYKr/Y1X4gukEgmYRhjOb4gvixi7TQjjzvpWDqSzTEx2qAniqrP2lpYSRIg==
X-Received: by 2002:aca:1316:0:b0:364:ebf2:735f with SMTP id e22-20020aca1316000000b00364ebf2735fmr8517999oii.24.1680105176210;
        Wed, 29 Mar 2023 08:52:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bx32-20020a0568081b2000b0038733b00a5fsm8526890oib.10.2023.03.29.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:55 -0700 (PDT)
Received: (nullmailer pid 3198093 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:13 -0500
Subject: [PATCH 16/19] cpuidle: Adjust includes to remove of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085256_724558_615FF8D9 
X-CRM114-Status: GOOD (  15.24  )
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

Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
implicitly including other includes, and is no longer needed. Adjust the
include files with what was implicitly included by of_device.h (cpu.h,
cpuhotplug.h, of.h, and of_platform.h) and drop including of_device.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/cpuidle/cpuidle-psci.c      | 1 -
 drivers/cpuidle/cpuidle-qcom-spm.c  | 3 +--
 drivers/cpuidle/cpuidle-riscv-sbi.c | 2 +-
 drivers/cpuidle/dt_idle_states.c    | 1 -
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 6de027f9f6f5..bf68920d038a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/psci.h>
 #include <linux/pm_domain.h>
diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
index c6e2e91bb4c3..1fc9968eae19 100644
--- a/drivers/cpuidle/cpuidle-qcom-spm.c
+++ b/drivers/cpuidle/cpuidle-qcom-spm.c
@@ -11,8 +11,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/cpuidle.h>
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index be383f4b6855..ae0b838a0634 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) "cpuidle-riscv-sbi: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
 #include <linux/cpu_pm.h>
@@ -15,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index 02aa0b39af9d..12fec92a85fd 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "dt_idle_states.h"
 

-- 
2.39.2


