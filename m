Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E233C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yItqnZ9vRLGQesakQq7xospJXeaAueRctcAXfNX28w=; b=uNotQN+QpQ3herSJrdfyGpkSNn
	aCGEdjatoFZD0xkrMe222Hkw3WqGrv9yP9aVQWnNCd5oLFzWgS9xbmgVqjNt84lwvIhEKpylMde0B
	MOeEB3sI5ZyDcMRkKvNFL+O1Mxm0WdiWMvPqf3jUVrye7OOywx2MBYVSHNMP5B8u6yRSl8JpGrgNn
	ccmrcflW5rilHfiiqqgwyKBxtT3n4hlKY8GYDLYsDDKnRr4S0LTk0eNwGCRJ392/h8hip5s1dvckk
	NrnJ2s3hCRUN2UJUC+eDjOwJQIvmkoU265iD/r2SxJeFmcp191cRXMwZrfBF7zAGevhXrB7Y/mGNq
	JJmWdnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6k-000sce-0W;
	Wed, 29 Mar 2023 15:53:06 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6a-000sTk-24;
	Wed, 29 Mar 2023 15:52:57 +0000
Received: by mail-oi1-f177.google.com with SMTP id b19so11913537oib.7;
        Wed, 29 Mar 2023 08:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yItqnZ9vRLGQesakQq7xospJXeaAueRctcAXfNX28w=;
        b=O9eII/5Hb+w7PW/wyFk9Kvx5yJJSnEUJ6uaSEsZQiTSvO/d72mfd0JdvDhrmAI0S2k
         +uboKDWZBOTU3WPZpsU6npokapASdkLc2pajbdiHlItWiMD2nzlOw3Fw8uGAoyWohM6y
         VBH/vOvAuXFNHCBKhwKHpS8cEIvs0s+nAUkKbkEaQHt9GZQmYtVbZEj+agHIJWw21JoZ
         uK14cm0m2XAEjmpbjdHjuPCYT/BamjaQ/4jERTOeVTOAcTDdV9Ov9RK0kWNvvq/pntIV
         MryqA5WTf2TYReb7K8sbzF/3uwLBQIjxwSCmS1TRlKsDCTwQAFrbaQctBeeHWjr5sjeY
         mH6A==
X-Gm-Message-State: AO0yUKWessEIJ5DGDa+jnNu2bCU0wYgALxmOOPFOkCQ44+aqen5i6X18
	LKc3pVOdu5KDou6nCyFrow==
X-Google-Smtp-Source: AK7set8VenL+CVecLJkZQ+2YD6HECaZWNdDHKrwGAWt0Tn+DIRoRNNZ1eYx2LdRkWm+8wMeNY2nxyA==
X-Received: by 2002:aca:1c07:0:b0:386:9dba:4571 with SMTP id c7-20020aca1c07000000b003869dba4571mr8390718oic.25.1680105174043;
        Wed, 29 Mar 2023 08:52:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q132-20020acac08a000000b0037fa035f4f3sm13719284oif.53.2023.03.29.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:53 -0700 (PDT)
Received: (nullmailer pid 3198099 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:16 -0500
Subject: [PATCH 19/19] of: Drop cpu.h include from of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-19-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085256_692414_6C4A3FB4 
X-CRM114-Status: GOOD (  12.19  )
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

Now that all users which had an implicit dependency on cpu.h have been
fixed. the cpu.h include can be dropped from of_device.h

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of_device.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 5cdafe19dc80..7ac9a8ae9c80 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -2,7 +2,6 @@
 #ifndef _LINUX_OF_DEVICE_H
 #define _LINUX_OF_DEVICE_H
 
-#include <linux/cpu.h>
 #include <linux/platform_device.h>
 #include <linux/of_platform.h> /* temporary until merge */
 

-- 
2.39.2


