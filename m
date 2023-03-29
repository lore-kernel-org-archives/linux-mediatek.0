Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C4DC77B6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcRNyMomlVIyDJBO4v13lmumWoZCHsVn17zoo+wPdkk=; b=QtLfWhezk38m+T6BntwrVn2NTw
	cHqSCdaHO11mMldxPbi1Faa1POruBZUbqVtP8WsrAFTgAzuwtBdg4U0B9yj8KBACxUZnUPKeuh3qN
	a9fqPprwEXovxcx5TIjuHFarqRxKpFFQN6FjvJKUS7x4D/3wKV2NxQNZb990+GkvqbaX1xkgoGl3n
	DyTjhUbDlvvKiQxwF8GdoBOBCy1FPSv/3OzTnZHxC/1rH4dh0LzH3Ab3m83X8CfR5nvmQYQ2qvS5K
	O4Fr9uBi7+3Ffkz5tpCYEM2zajehE147wGq+pGngOX4rAc2YGMsw4yuiAALD4g6z1a2U9uqcdyym+
	qOwQ2lFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7e-000tVH-0x;
	Wed, 29 Mar 2023 15:54:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY79-000syq-0n;
	Wed, 29 Mar 2023 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GcRNyMomlVIyDJBO4v13lmumWoZCHsVn17zoo+wPdkk=; b=PHVsA6iP2XffLba7L4v8fujkWM
	aPtb6U6GfiXE+0iLi6Ym1+eaGaIlvaxHVegTUUfagttTeUT59afFVK5HyuDVB1oUejOXEROhSV36S
	PSceyOqAkF2GzB09Tu/TMdUC4ZgFhPoiDNP3dXPq/bqc6Fvh9NCMSuprygS8gelMDGlZJdE66I5ia
	b5QLrYxxz6gmmjBiWp4HxVik6ori/Icc6pwkn6Zpfzj/w+vV+XOaAt24BmaXXP/xmOOchHDX8EeFp
	C++68ChmR9/FTiYWWODKmCdfuxJBY4iKUVhWtnL5L1k7PiA349tLe0fUPdy28ch52aaKBTldU8OcC
	fKosN7dA==;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY73-006t3Z-33;
	Wed, 29 Mar 2023 15:53:28 +0000
Received: by mail-ot1-f41.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso8431196otf.9;
        Wed, 29 Mar 2023 08:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcRNyMomlVIyDJBO4v13lmumWoZCHsVn17zoo+wPdkk=;
        b=menYUoPlbpw4i2lQp34/J4AXbxNVwll4iVg5uLEt/VAUofvfk7dDc8/4UCTVXEOu9v
         0gCHDo+zgbp9YM44FWbdqDx09+mR1V7U9RTq7HkQWd0PlnVdqx15Sl9Ir09w0Wf42MLB
         zz7IThoGAGj60uSryABdTk7NjetbBx3f6t0tInufzrVWD4lZmuggdMDUyU9vAy5gcUk+
         SEw/F4dSU6+XDRmsxe5p7cMxWCKb3VrgatZh1T8zSosjNngX0UMm4/0M4gXWGgB7bLwz
         7p8N6Z2CWAcGXFiCCo6vQwVTVNOAwzchJozUfZpqWgqPxh7vzKhcCBfOJdThvAAW+k8K
         Ztjg==
X-Gm-Message-State: AO0yUKWrLcVczu0x/yULYXMXyKWveo6+wdGxIlXKH16PXAaZpP5wb/er
	u949EmEn3rLKqU30BPdwHA==
X-Google-Smtp-Source: AK7set+G4RUI7e7LVlBDXGQ8p8x17CahM2R0t8c+RybdcRc83FcjeXtVKZHsxX3oO+Yqeus+IJNu+w==
X-Received: by 2002:a05:6830:124e:b0:68e:da51:2cb2 with SMTP id s14-20020a056830124e00b0068eda512cb2mr10233310otp.37.1680105202916;
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y26-20020a056830209a00b006a06e7972ebsm6242943otq.38.2023.03.29.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:22 -0700 (PDT)
Received: (nullmailer pid 3198087 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:10 -0500
Subject: [PATCH 13/19] soc: mediatek: mtk-svs: Add explicit include for
 cpu.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-13-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_165326_209657_FDAA3817 
X-CRM114-Status: GOOD (  12.34  )
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
of_platform.h) causes an error:

drivers/soc/mediatek/mtk-svs.c:2134:41: error: implicit declaration of function 'get_cpu_device'; did you mean 'get_swap_device'? [-Werror=implicit-function-declaration]

of_platform.h is still needed for of_find_device_by_node().

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take the series via the DT tree.
---
 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f26eb2f637d5..1b7579a5bec6 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/cpu.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>

-- 
2.39.2


