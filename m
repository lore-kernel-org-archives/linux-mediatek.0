Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD6C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4/7KPsNb+9xFZnBvWPuvHxFUZ+0wY+oqrqhzOTeb8U=; b=sFYO8nYMJr0alI3dv8doRRJqtS
	G13W7bXajyaqTQWTHQRRjMAa4nC9vkIpzRBk6gOHfqgHYuNgQDWQGeAQnlAfBd3Tb3VvKdUKYoTo0
	dV147Tu6Hst5GdxFfQbr3DjQ1gZz6ua02ITBezQANgDgZ7FHTRxZaXAR0AT2R7x1dssqNRq3yHgLd
	MXJ4IVnb9EtOb6cjwwRWKlF5/iR007mWawSv58XOoJplpNKmoQkT/UXb9U5a5Jx1zzzCktP2J/NYj
	/qPFWBbIuEzh12WenKxKann6A+virxbErFW7fNMYPQPiJiitQGHC4muTVd9N1f45HKUS88xTVMBJc
	azkICuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phZA5-001DJA-00;
	Wed, 29 Mar 2023 17:00:37 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6m-000scN-0c;
	Wed, 29 Mar 2023 15:53:09 +0000
Received: by mail-oi1-f179.google.com with SMTP id w133so11926554oib.1;
        Wed, 29 Mar 2023 08:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4/7KPsNb+9xFZnBvWPuvHxFUZ+0wY+oqrqhzOTeb8U=;
        b=vH71QVSsy78rRABXuNZZfd9oHySbvIpT2JTlhTk7uOo9/TNwk+d/BkgqJOkaXt5Kqh
         WTO416gBdgrWBsXVcAyoqDNdxLZkBzAHlhQDsQGZt/9ZoPsDQfPsGDx1fm0Cu5/zy3m1
         GN8SIIRjawWwQ7tky4sD9Lj3QffJlpW3BO07iYiCy4nffWNrG5vmT+R2f1H63Q1ux0mJ
         yLUu8pibmnsnGtIQ9w/sNdck8DxaxuebGfxcS7WORsFsLJ9UU7BaS7RplB6BJww3A1b4
         rAzOtbt3rRNCat1cba76BxX+05NvveYUv8voxeK8ETzX/fL4Cma1QKgSTc7QfPayDloI
         NV3g==
X-Gm-Message-State: AO0yUKUls7qQn3DQbbu8wZuaAgsop8iTHWaL7q117T4FvCK06fVaB5Yo
	xkv4o0CSGGmqoTPGzZHxYQ==
X-Google-Smtp-Source: AK7set+4b8TVt2XSxmpWLVvJqTy6ovjjoLfneQ9RKzw6pkGeQwoKn8nerPqu8oZLFPwkmZXWaUmfeA==
X-Received: by 2002:a05:6808:2995:b0:37f:7770:4c01 with SMTP id ex21-20020a056808299500b0037f77704c01mr7467612oib.28.1680105185402;
        Wed, 29 Mar 2023 08:53:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y184-20020aca32c1000000b0037841fb9a65sm13730637oiy.5.2023.03.29.08.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:04 -0700 (PDT)
Received: (nullmailer pid 3198077 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:05 -0500
Subject: [PATCH 08/19] riscv: Add explicit include for cpu.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085308_231475_E1B9D0DA 
X-CRM114-Status: GOOD (  14.77  )
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

Removing the include of cpu.h from of_device.h (included by
of_platform.h) causes an error in setup.c:

arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')

The of_platform.h header is not necessary either, so it can be dropped.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..dcfa4b6fa4b1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -8,6 +8,7 @@
  *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
+#include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
@@ -15,7 +16,6 @@
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
 #include <linux/sched/task.h>
 #include <linux/smp.h>
 #include <linux/efi.h>

-- 
2.39.2


