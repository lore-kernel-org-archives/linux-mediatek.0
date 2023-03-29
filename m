Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B40C87FE1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOFzIiTcs5glICtXCi7orAKYw6mLzzis64IJ8Etn534=; b=T+Rm0jNHQBo+yPxlANUXdhv3V/
	7lq/ln54163fhiHzkKcJmfWwOlvJAmYjhXTBdsn6SuMqsSpvWLHMCvBGlaINAPk6nSHPQSJYm1bOy
	OY1sDRCQElantpIctc0xUDoNbIzP9xgnXl/Df3qy+g32NGILTvQWjhLtHHCIebKw2s2dwlnSP8Gpu
	GoUn+wydEs12/RMvSdyKxOsFchV9CHPj3xMmkda4rtXL/eRLByvkFA2bPFauMvw1ONfsmdLqqdFZp
	lj1AAIKDEanhdlhVPugstoNtNjNwZxCZDmF95+dRDJ+KUkyMPbNIKMBK84zPaqxhStqrZEq0q0GWD
	uxJHnfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7M-000tAc-01;
	Wed, 29 Mar 2023 15:53:44 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6t-000slG-24;
	Wed, 29 Mar 2023 15:53:16 +0000
Received: by mail-oo1-f48.google.com with SMTP id p2-20020a056820044200b0053e5914a50fso1233309oou.2;
        Wed, 29 Mar 2023 08:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOFzIiTcs5glICtXCi7orAKYw6mLzzis64IJ8Etn534=;
        b=4V8d0tBWvJKBB5o5WF2Bp8yWPWZUv9t8SOVRb6jUAjgAEnTfyiFoOCnfRAJqYVcnKg
         wcfpTooIosbT71DYRF5hFCpcChB/yjBbdePyJf0qP54Dv48ZMa9nxA5LgwQFXb0HxnAW
         sN6exEbSWMmcHHtRi2LJJF11tbjVSSMJ6Kx3B/xMeoB45nQO+95VAx9Mc+QMOYbK6wwM
         ANo93hJZ0KQtFUW4GvbIgEHV/DZ/Vh52Hn+wjLs1AWF6Mzgfa1XrnfEOSELocJx4k6e0
         lK4bqmweiAE0Kj4cNXrHRMFAsXbwBIqfxer371MjhE4ueKAX1cInBI45tcn8oRA8yCnF
         TZbA==
X-Gm-Message-State: AO0yUKUjHCZHQkkG2wbhpMkGm+h+QQn6cpzEtoZCWoCXhAUEI5BPrYkJ
	UhDfEfZAh8jvXjNeZNP3fA==
X-Google-Smtp-Source: AK7set9MAD4tg5pc/rHdBuixw1K3iao0K53LrjqhMjiHjl+aL1ahzPwsk7GYhgXBJpfdS1Uabklemg==
X-Received: by 2002:a4a:41cb:0:b0:537:ad3c:d74f with SMTP id x194-20020a4a41cb000000b00537ad3cd74fmr9577499ooa.9.1680105194254;
        Wed, 29 Mar 2023 08:53:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q125-20020a4a4b83000000b0051ffe0fe11bsm14001119ooa.6.2023.03.29.08.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:13 -0700 (PDT)
Received: (nullmailer pid 3198073 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:03 -0500
Subject: [PATCH 06/19] ARM: sunxi: Drop of_device.h include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-6-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085315_680948_3BD0A635 
X-CRM114-Status: GOOD (  12.62  )
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
implicitly including other includes, and is no longer needed. Just drop
including of_device.h as of.h is already included.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 arch/arm/mach-sunxi/mc_smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index 26cbce135338..cb63921232a6 100644
--- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -19,7 +19,6 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/smp.h>
 
 #include <asm/cacheflush.h>

-- 
2.39.2


