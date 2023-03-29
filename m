Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37FC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxkTC00mmtvkJ/ocm+Trr4LHDuiGbRgef51Eh65eFno=; b=0YZHdE0PvMlLYHCo9+EtbqIzNu
	5UBbgPtp1Vrdg+BVQZGyHe4H++LSJG3WcACssbEIZ0gjH4jmT5wssYHOP8viLv0Z1q+YdNJBceTiW
	VRtZIw6PNbB1zgFpbPqyOVS3huUe4met13BJCIBr79X4fItP5bij0Sopw33Tu3dC0IY3q6SWZIKd5
	RuVsz2Ynr9kMs6wcMG+4dwnOZ5mxDAUgzB1qkn5jsIPblCCTDtDiay9hwvKaaZvKcwq0olVKd/CkM
	vC9Basa6ESovdnSKeQ+yV48GiaGpGxksdSLdFsGf7sZK5SJm8ZGL6EoN0V8/WfWs8LaCd0rx0OQ4M
	xhUvHjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY70-000ss2-04;
	Wed, 29 Mar 2023 15:53:22 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6j-000sZT-11;
	Wed, 29 Mar 2023 15:53:06 +0000
Received: by mail-oi1-f178.google.com with SMTP id w13so543657oik.2;
        Wed, 29 Mar 2023 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxkTC00mmtvkJ/ocm+Trr4LHDuiGbRgef51Eh65eFno=;
        b=nWZMt7/igFhDhifOmQIervoF2is8rxPLrN1paMETwARgswPmDG0DAdHF720PLXp8Jz
         tRaaKphER1whufjn3yBK7A6YJ7BZgxkzYO7KMznVM8a4W/LV3fIyknjyNyFnplhZ1jKS
         lC6CwfbPhKtO6GJNyHy3WB3aI6KYBI9PmTz37e4Wzm5ADDR/R2bkJkcaOtehV1U7JIyB
         4BwjwPn3aAEvGsuW7S4ofJj52xOYaHJRgX+Qpyk73bHxbwmP9vejTwAosM2TJrnxEa5V
         /fYbXoEHGnwEbqx8JQfY8eksMzk3iKkfSoH1g0zsnFo2uZlIUDUUSR3So8b8wIWtsxhv
         YVzQ==
X-Gm-Message-State: AO0yUKU/EoBlfre6be/gxu1Jf9Tb+xen/O6T4ph9CHDv/vQSj58GlukZ
	/0qmyxmn5BiII0YFLTOFYw==
X-Google-Smtp-Source: AK7set/XHs0DeHUv3FR5klH7bLctWLDiPHbV4Bgynq9MiBxHYJ127vn5iRHwUkAWb6rjGdajk82w8Q==
X-Received: by 2002:a05:6808:1445:b0:387:715e:56b8 with SMTP id x5-20020a056808144500b00387715e56b8mr10764982oiv.56.1680105182676;
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p184-20020acad8c1000000b003896e31867esm228723oig.49.2023.03.29.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: (nullmailer pid 3198083 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:08 -0500
Subject: [PATCH 11/19] clocksource: ingenic: Add explicit include for
 cpuhotplug.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085305_377396_6B5BFFCB 
X-CRM114-Status: GOOD (  13.00  )
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

Removing include of cpu.h from of_device.h (included by of_platform.h)
causes an error in ingenic-timer:

drivers/clocksource/ingenic-timer.c: In function ‘ingenic_tcu_init’:
drivers/clocksource/ingenic-timer.c:338:15: error: implicit declaration of function ‘cpuhp_setup_state’

The of_platform.h header is not necessary either, so it and of_address.h
can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/clocksource/ingenic-timer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 24ed0f1f089b..089ce64b1c3f 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -9,13 +9,12 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
+#include <linux/cpuhotplug.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/ingenic-tcu.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

-- 
2.39.2


