Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DCBC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUvdSWvlelGy1WbXkwFcUNCtjmz5cL2Z3yoJim8fyN4=; b=GFIE7aiL2dYuHkaCiBdKi19zC0
	KmnKgAtrqCZLRSfrp37BKIxz1PP9B/qQk2HO4b0FqJnXG60f6svyFg+gVb6MTVMMhRayV3zwpKk8q
	cVA2Tjct7M93UwhkCY4AJV7gdRQ7oSNAWriAHwWWQACt0f9sv8/hKMxsUnMbz9vS37XmioeVZ99nA
	7N3AbdTrYH/6O+qVxRhD7UWicT6j3bJ5gyxUkmj1R0haLXQ0hEv1Ls/+l6nxiL73EpzPwy9yWOqcu
	iahXetrp3wOoYvlpxNVDtHps9Kk88BUdQ2Fug4IzX5X0k3dFP1eWnkikm5VnVmyPSIJd0ebnpiCBF
	6lin7YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6f-000sYA-0j;
	Wed, 29 Mar 2023 15:53:01 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6Z-000sSq-0S;
	Wed, 29 Mar 2023 15:52:56 +0000
Received: by mail-oo1-f50.google.com with SMTP id n3-20020a4ad403000000b0053351dadc20so2495852oos.13;
        Wed, 29 Mar 2023 08:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUvdSWvlelGy1WbXkwFcUNCtjmz5cL2Z3yoJim8fyN4=;
        b=aisEJMQeOkOVR+SMsyEThIGOLH8EJJgsuBBb0THMaIHvtI0AkBKN3wqIo0h6KNHqdU
         2ue9Z8JzjMeISFORNrvR8EAYqzRXNLJ6ES6G0Ug2M4Tfmj1PGsXUhbWARqC83HOa6ohR
         KToD5DxgFKcavrJaDQSbXtWUPaYwwIClkjc9EbH3bPPW6AEzanl9tXrkEGwKipGhmX3X
         iqioh1d3c//GJtog40pXd4Ba3XeydxGyc5vFJVg5nxI5NjwSjOqMY+6+AHQr2wvSNln6
         o/E+u/9ly7ImtiXiPJoLWy9UJs1DGioTemFosK8bT3fR6OG3YTlO3PwqnWx7b4v6AI7K
         AeeA==
X-Gm-Message-State: AO0yUKU275iP0yr0+JM+YKsuj0EHP2oy1kIHLRxWVqF0TkOFE3dLhTVi
	2+UKiyBuqrMyt00nqzj9hQ==
X-Google-Smtp-Source: AK7set8fZmNpueyLlqRjeVxsIcrGmIm7sG0omBAJB7zOEj3TTntZfmKbMnjZiGlZRcAnzZ6+ha8iMg==
X-Received: by 2002:a4a:4191:0:b0:538:4d29:30cb with SMTP id x139-20020a4a4191000000b005384d2930cbmr9034039ooa.8.1680105171818;
        Wed, 29 Mar 2023 08:52:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 129-20020a4a1887000000b005252d376caesm13850273ooo.22.2023.03.29.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:51 -0700 (PDT)
Received: (nullmailer pid 3198095 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:14 -0500
Subject: [PATCH 17/19] irqchip: loongson-eiointc: Add explicit include for
 cpuhotplug.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-17-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085255_184645_5555D57C 
X-CRM114-Status: GOOD (  12.75  )
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

Removing the include of cpu.h from of_device.h causes an error:

drivers/irqchip/irq-loongson-eiointc.c:420:9: error: implicit declaration of function 'cpuhp_setup_state_nocalls' [-Werror=implicit-function-declaration]

This driver doesn't even use DT, so all the DT includes can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/irqchip/irq-loongson-eiointc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index d15fd38c1756..fd9d87f1470e 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -7,16 +7,13 @@
 
 #define pr_fmt(fmt) "eiointc: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/syscore_ops.h>
 
 #define EIOINTC_REG_NODEMAP	0x14a0

-- 
2.39.2


