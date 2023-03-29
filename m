Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A95C761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=myNahkzgyzJXsmSpdQrVTovV/3CgUWg7sSEu7RQwjG0=; b=h1WI/W9NCkCVK0
	hGCnh172FFxmg3EJox4xCTquN1A1+qUCETL2/VSzbxrFTLm0IcjLdtFPo0sjLAM4XizxQ0AcdJ4u7
	hy7TG4WewvficNQeYuz+Jhk8SPNUBAItPaDidlQSFF7AAjrC7MWHZXT0VAjZ3d0um/T5QaGamo3uz
	CmE7b6Z+jHkgxOd2Tag4cdK94Fr7O93ZW+hHyeF7FdFNnnzQ1M4rOclIefxeZw5BVqSz508xbz7wH
	4rcAYuSbILdfgl3fojfwqFWCi+TjpnTJXfFSRACytcB+bO1wZbF6v/x4MlJSgKBZTv9Dvk2ubNhAT
	UykSwQMl9lnAsFHt0hQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6Y-000sTl-1k;
	Wed, 29 Mar 2023 15:52:54 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6T-000sS0-2O;
	Wed, 29 Mar 2023 15:52:51 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-177ca271cb8so16672939fac.2;
        Wed, 29 Mar 2023 08:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myNahkzgyzJXsmSpdQrVTovV/3CgUWg7sSEu7RQwjG0=;
        b=1K8gn7LXYJSMcjXoAfq8hSAyoJHIVEI7uB74ab2Q+bR6XFimGkF4LOd1TsZJrfNf8P
         op8pUGldJLyYIVPxqDbm5dg2/4onf6t/RRtGkPPhZUW4fcOWE6dtP214JWQ1VWByfT9X
         maMX7ErXHwNp2Ftvxura0Mucayd5dIEoI3KK5+909CsM1LUWxHu+2InV8SgfMYKA+0Dw
         LXI8benkmBe32IjzfmCpSuGEAzK8OMbauMFDq3Mxn0vLiVsV9vlWPEWg0DECaCfVBNX+
         u2XX5yDhCO9L1Ul7ynypwYWt1XDwDjQNFEhOs1jMEcoPuQC+EUQD5ewFVhf2iAJuRPIS
         xNlA==
X-Gm-Message-State: AAQBX9dRyKWHj1liJopQ2eo7fOnGW9O2bZZYP8+pO9BZyOGEXEilmXNV
	AoJGYRZ6/eR+6Rs42nrfDA==
X-Google-Smtp-Source: AK7set9u04Mn8XGtckt02xXgvmDdYPAodmqaRmO7QbQsn4pMne9ZnJvBTvxw9bjwWx1vNoyCfeyKQg==
X-Received: by 2002:a05:6870:eca0:b0:177:baf4:5b10 with SMTP id eo32-20020a056870eca000b00177baf45b10mr12821109oab.31.1680105167283;
        Wed, 29 Mar 2023 08:52:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hv12-20020a056870f98c00b00176209a6d6asm11896178oab.10.2023.03.29.08.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:46 -0700 (PDT)
Received: (nullmailer pid 3198060 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 00/19] DT header disentangling, part 1
Date: Wed, 29 Mar 2023 10:51:57 -0500
Message-Id: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1eJGQC/x2NywoCMQwAf2XJ2UBtER+/Ih7SNNpCqaWxi7Dsv
 xs8zsAwG6iMIgq3ZYMha9HybgbHwwKcqb0ESzIG73xwwV8xfZD7xCyUZCBXoTa7Ip+jpAu7GE4
 eLI6kgnFQ42x5m7Wa7EOe5fu/3R/7/gPTb5swfQAAAA==
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
X-CRM114-CacheID: sfid-20230329_085249_778413_4D9B8E6A 
X-CRM114-Status: GOOD (  18.20  )
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

This is the first of a series of clean-ups to disentangle the DT 
includes. There's a decade plus old comment in of_device.h:

 #include <linux/of_platform.h> /* temporary until merge */

Who's this Grant person that wrote this? ;)

It gets better. of_device.h also pulls in of.h, and of_platform.h 
includes of_device.h. So naturally, drivers include all combinations of 
those 3 headers and sometimes they actually need them. 

I started on fixing this years ago, but just dropping the circular 
includes and fixing all the fallout was massive and didn't sit well. 
Pulling in of_device.h in all the drivers that happen to call only
of_device_get_match_data/of_match_device didn't seem great when the rest 
of of_device.h would never be needed. of_device.h being everything that 
works on a struct device is not a great split because several types of 
users deal with struct device. The better split seems to be by user 
(subsys driver vs. consumer) which several subsystems now do. For 
of_device.h, the users can primarily be split between bus 
implementations and device drivers. Device drivers also typically need 
of.h to read properties. So let's move of_device.h towards just bus 
related functions and move device driver related functions to of.h.

This series is just the first step. It makes a couple of clean-ups to 
replace some includes with forward declarations. It moves 
of_device_get_match_data() and of_cpu_device_node_get() to of.h. The 
former move is transparent for now and preparation for the next series.
The last part of the series updates drivers using 
of_cpu_device_node_get() and/or relying on the implicit cpu.h include 
which is removed in the last patch.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (19):
      of: Make devtree_lock declaration private
      of: Move of_device_(add|register|unregister) to of_platform.h
      of: Move of_device_get_match_data() declaration
      of: Move CPU node related functions to their own file
      of: Drop unnecessary includes in headers
      ARM: sunxi: Drop of_device.h include
      ARM: cpuidle: Drop of_device.h include
      riscv: Add explicit include for cpu.h
      riscv: cacheinfo: Adjust includes to remove of_device.h
      cacheinfo: Adjust includes to remove of_device.h
      clocksource: ingenic: Add explicit include for cpuhotplug.h
      thermal: cpuidle_cooling: Adjust includes to remove of_device.h
      soc: mediatek: mtk-svs: Add explicit include for cpu.h
      cpufreq: Adjust includes to remove of_device.h
      cpufreq: sun50i: Add explicit include for cpu.h
      cpuidle: Adjust includes to remove of_device.h
      irqchip: loongson-eiointc: Add explicit include for cpuhotplug.h
      OPP: Adjust includes to remove of_device.h
      of: Drop cpu.h include from of_device.h

 arch/arm/kernel/cpuidle.c              |   1 -
 arch/arm/mach-sunxi/mc_smp.c           |   1 -
 arch/riscv/kernel/cacheinfo.c          |   1 -
 arch/riscv/kernel/setup.c              |   2 +-
 arch/sparc/include/asm/prom.h          |   3 +
 drivers/base/cacheinfo.c               |   2 +-
 drivers/clocksource/ingenic-timer.c    |   3 +-
 drivers/cpufreq/cpufreq-dt-platdev.c   |   1 -
 drivers/cpufreq/kirkwood-cpufreq.c     |   2 +-
 drivers/cpufreq/maple-cpufreq.c        |   2 +-
 drivers/cpufreq/pmac32-cpufreq.c       |   2 +-
 drivers/cpufreq/pmac64-cpufreq.c       |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |   4 +-
 drivers/cpufreq/spear-cpufreq.c        |   2 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c |   3 +-
 drivers/cpufreq/tegra124-cpufreq.c     |   1 -
 drivers/cpufreq/tegra20-cpufreq.c      |   2 +-
 drivers/cpuidle/cpuidle-psci.c         |   1 -
 drivers/cpuidle/cpuidle-qcom-spm.c     |   3 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c    |   2 +-
 drivers/cpuidle/dt_idle_states.c       |   1 -
 drivers/irqchip/irq-loongson-eiointc.c |   5 +-
 drivers/of/Makefile                    |   2 +-
 drivers/of/base.c                      | 187 -----------------------------
 drivers/of/cpu.c                       | 210 +++++++++++++++++++++++++++++++++
 drivers/of/of_private.h                |   1 +
 drivers/opp/of.c                       |   2 +-
 drivers/soc/mediatek/mtk-svs.c         |   1 +
 drivers/thermal/cpuidle_cooling.c      |   3 +-
 include/linux/cpufreq.h                |   1 -
 include/linux/of.h                     |  28 +++--
 include/linux/of_device.h              |  24 +---
 include/linux/of_platform.h            |  10 +-
 33 files changed, 261 insertions(+), 254 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230329-dt-cpu-header-cleanups-c7bed8c0b352

Best regards,
-- 
Rob Herring <robh@kernel.org>


