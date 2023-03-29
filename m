Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB3C77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxrilhvfwDlef/A2YTUefG5k1p916jMGPiiHrDKkFR0=; b=Tg116hiTleBAhfC2Fg/OHGa4kS
	LjXuezEr3g4jCA3GKzxYtQKWe3X2xOp+vdpxxLIO5u8uJE8P5dEimJGo1TRNNt7u8uMxL4PMlEfx7
	JV+yxSXEQXgeNFrM8/l8jetuosPMy5gsNCZpBtVFAii8/Shi/eqBST1tI1eKu/IhWCss5YBXh9WFl
	GA6yMbrk08q39A4UvF7sIU1KFk5iKDRCqWyLNbxQFDx/2DsBMhZrGvYj7sLLWyqumPEC+p+DihoFb
	CgLtG1AESI60FHW4FseIkD2ISQkhZiZIuzYKrsvpcuJVjF/A4bGQqpCjIybOJdd7B7IAxJDahsy9b
	5TtiZjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7Z-000tQk-1j;
	Wed, 29 Mar 2023 15:53:57 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY75-000svV-1u;
	Wed, 29 Mar 2023 15:53:28 +0000
Received: by mail-oo1-f49.google.com with SMTP id m6-20020a4ae846000000b0053b9059edd5so2497344oom.3;
        Wed, 29 Mar 2023 08:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxrilhvfwDlef/A2YTUefG5k1p916jMGPiiHrDKkFR0=;
        b=XXIlHBDkA0Og/+BxjYmlFbZ4POHJ2qVkwZzrENcHeb5CrviotEN1XZMLZHKFDe8yj2
         qoAMG6fxV+pNmx3Ikj50V20dnwWmFm3AZBei3uSYERHjRCYvF30GxNuy+qicS9K/u2A1
         7kYxjRo/a2qtdFWKMQQqbX2yP8RBnK02HHPxANK61G+7UbJJN/hdF1b1CNqzWYmzQnIb
         F1Tgx6LHxBPO1nnUjU/5Xc5Kh4LsgN2u6CCBLOenyYrStIzQ1NE8qswL3YeLC3sO1nNo
         X7gPotLsH9IY1/NxXsHLHIa5g7qZHsqSkE4nIYwFOYDvjpo0f1sox6dm9suE6femhCIE
         xQbQ==
X-Gm-Message-State: AO0yUKU7BJrMpVswSpWqzvabl1eOyAMyiG2nYx0CiPPofdIOgAH6ZZX/
	j9SaHBrmWm24quv8U/dn7w==
X-Google-Smtp-Source: AK7set/IvKP58b96RyfRxVRB8Yjm2uXbhHwCU35QLNRLqkqctfQoMFiFz1/Ijy3GHwDVb/O3xlHYvQ==
X-Received: by 2002:a4a:52d4:0:b0:53b:8b5:48d0 with SMTP id d203-20020a4a52d4000000b0053b08b548d0mr9782179oob.1.1680105205203;
        Wed, 29 Mar 2023 08:53:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 4-20020a4a1704000000b00524faf3d2d7sm13940444ooe.41.2023.03.29.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:24 -0700 (PDT)
Received: (nullmailer pid 3198097 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:15 -0500
Subject: [PATCH 18/19] OPP: Adjust includes to remove of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085327_631297_EB6D2015 
X-CRM114-Status: GOOD (  14.35  )
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
 drivers/opp/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index e55c6095adf0..63b126c6215e 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -13,7 +13,7 @@
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/device.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/export.h>

-- 
2.39.2


