Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A1BC87FE2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=022ntgbo/qozcpOEnF6DlWHlLfWcIn+6VTfzUh5A9FY=; b=dHwUi91ioSqtL987q7ylva4ht3
	P2ljCnUMT/6RypR/YtInE/FoL0LCGa/HzTSfX8Q4t4jRIuTDODGx541ALJqr7aoD0Bd22xGlJQDcO
	TSf+JBHvb+6Qn94kv+bDCvPhZLaoj7PxnoqjSJMjEfBV7hBKUrJjL8z5c7mor0nl6I4hFrTzx9T9N
	qSrDD8K29Q6R5ScCaduFuR4dcfZ9mqVD0GeMc+5FwCCuPngHJi6Z7AHNdYsz/zhU+OEgItbspC7/i
	C6gC9fpxy29Yuss0odGDWVX/bhcVezHvTy3z1xybnEvZsU2J8uM2EGEl3GmMjXECOaGvRiagHpJv7
	4EvjTw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7r-000thO-1v;
	Wed, 29 Mar 2023 15:54:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7D-000t3T-0q;
	Wed, 29 Mar 2023 15:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=022ntgbo/qozcpOEnF6DlWHlLfWcIn+6VTfzUh5A9FY=; b=hUKr/nD5ay4RJHuscvkTQdPmD9
	/Tu6BwTJOshI7mgReh8lYsAjP3ZfrGyodatU0kw5hIgNRN8S6+FW7tepC3W3RIqBz8qZIaC9qo5GI
	28yVUE6ySaLVjt2k0tBi0BLEKRpchRcg/IeACTpLqpLARsaDyzQ6yfzdnHleF83MKk7CPzStE30xa
	+khEPtjQKpTJie1Z4dYEQ+QgockpIO67uUhTU+gRiPHjldz8sbeBq1RdK7VGHLGZHqaKjH0hITjTi
	OLoybl1wzykkR8ugcE/tB5K8yhf1AC7WDfoSf7nLXPdh6aZBr+1fJnN0Z6eqB4YPD12bxjRZMkqMm
	r3NsXUEw==;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY79-006t48-2p;
	Wed, 29 Mar 2023 15:53:33 +0000
Received: by mail-oi1-f176.google.com with SMTP id r14so6243157oiw.12;
        Wed, 29 Mar 2023 08:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=022ntgbo/qozcpOEnF6DlWHlLfWcIn+6VTfzUh5A9FY=;
        b=fZ8Ri6y0JgmTCiYjFX5GQTPhL0K+2yUWaSArKcrMNE6xTLD/AUAzEbgQv/kzwgQjga
         3uKrQwKrbahvq7aBX4I722BjGH7WranyHFk522oxxBlu0uDiHYW9vwwDMJyPFT7GDXNa
         BwR11mWS0yPnQ/dhCFXaANHbWgj06Lhpa56IjKS4Ix+SAjIsvX7qDA7l4WkDANc37b6N
         WOOSEdnQTXWnPxliyskBDEUbKj6JDJh8s/bbkPb341BvO4XK4WmEmAA/GNQYiaRKj/ZG
         6K6mQia672YNjGjlGQ7aWzmhGp2AX6otr0pHo1qvAyuQYtEOZuXYxV6XY/AlO2YZpgbh
         oXIg==
X-Gm-Message-State: AO0yUKVCambFrnugQcyjLZgY5ZNzOrkJB3Mkg5bldG8iFgRa8/yG1pSi
	6aabKQ+zUUaN0av3iPqQWA==
X-Google-Smtp-Source: AK7set+mgwqrtp3sj8LCfLB0ZJyIWcTnGcbFer41ylAZRGD0ZYDF+G/GFDHWLU149fBQcrWXcPEKPQ==
X-Received: by 2002:a05:6808:616:b0:386:db46:f6fb with SMTP id y22-20020a056808061600b00386db46f6fbmr8106850oih.17.1680105207535;
        Wed, 29 Mar 2023 08:53:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l8-20020a056808020800b003874631e249sm8002092oie.36.2023.03.29.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:26 -0700 (PDT)
Received: (nullmailer pid 3198085 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:09 -0500
Subject: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove
 of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_165332_049629_8AF491A1 
X-CRM114-Status: GOOD (  12.91  )
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
include files with what was implicitly included by of_device.h (cpu.h and
of.h) and drop including of_device.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/thermal/cpuidle_cooling.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
index 4f41102e8b16..6f6daead485e 100644
--- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -7,12 +7,13 @@
  */
 #define pr_fmt(fmt) "cpuidle cooling: " fmt
 
+#include <linux/cpu.h>
 #include <linux/cpu_cooling.h>
 #include <linux/cpuidle.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/idle_inject.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 

-- 
2.39.2


