Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392CBC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaKQY99G3HY+F9cltbrOFgoelmJMxNBfQJcO0sLBgas=; b=WKkmpDBIDSD+l+/uzhdI3wI3td
	BA16iXxreEDvejOmxhnjGYLnN7TvuXmqglZ/Q2euvc8Q1CXlQSr+/7iHFNzhp2HobPFhTtH8zINnr
	jaIP+CaPG0BFzdf6/pXLimdrGEqMEGw25slvv1Ln1V5gGrRuVkTDoDH9570CVeZAT4fr1zricMV6B
	rtf826Jwl45d0+SW3/8tw6TFinbaLitp1hQvxY9vsyM5Hedqxywj4a+LZuu8B2tN/GqphPoZkLf8g
	l1yI8n1UiTGa3yheLKWay7A0r+iZsITAlkFHttGpv0iFaKcW4toY3y/nnzi4uPvQw+Xtr0geTaI52
	P8Fl+Bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6s-000sks-0v;
	Wed, 29 Mar 2023 15:53:14 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6e-000sWd-35;
	Wed, 29 Mar 2023 15:53:02 +0000
Received: by mail-oo1-f41.google.com with SMTP id n7-20020a4ae1c7000000b0053b61145406so2495080oot.11;
        Wed, 29 Mar 2023 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaKQY99G3HY+F9cltbrOFgoelmJMxNBfQJcO0sLBgas=;
        b=pOdl9sqZPRoFPUCUIvq64nbGp7hW4CN3E+32SjKIxN0wDY5Ni4Wp7hG4IVxJM+VYoA
         nwbeO3zKB6vJYmoWi+FaabYndYqt9eGi3WeFbwsu4ZS8OKABlsNSXr/bW+WCnUd3LnPJ
         anqs3IgYuKemvz0qZnenBaF3YXf+ZZselm9uwT8nFf9a95VHkFzfZ7uUGy2mzNwwOSWA
         XG1/lw/r5iPV80SL8PsaLRKuWO7IPBaxWLy3EIDjCHn2c5a8zHHGznbJYzeVEXr4ZWdv
         2OLukaDGhM1+iOjbTJ9DjrAsXH6p3sTRhRGk9z9NOjUcasDbsBYFxZ1SQ/QNHE4zln3N
         P/QA==
X-Gm-Message-State: AO0yUKWhGU/v0VPvlQ+hEkuToKv0xXZLZz14XoC9dlsAazXEcB1L6vU/
	ECkEXwzvgQsujgxuaijFIw==
X-Google-Smtp-Source: AK7set/NHlve/5dROzrE0RjwFIfWzeZwZim5jtRZxJnjvVhB2968rp1PLl6KK6w8FucuWDAPMr2x9Q==
X-Received: by 2002:a4a:890d:0:b0:51a:6ea9:5053 with SMTP id f13-20020a4a890d000000b0051a6ea95053mr8240938ooi.9.1680105178376;
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c192-20020a4a4fc9000000b0053b88b03e24sm8091146oob.18.2023.03.29.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:58 -0700 (PDT)
Received: (nullmailer pid 3198071 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:02 -0500
Subject: [PATCH 05/19] of: Drop unnecessary includes in headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-5-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085300_993756_4C41A233 
X-CRM114-Status: GOOD (  13.90  )
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

Drop unnecessary includes in DT headers. Some simply aren't needed and
some can be replaced with forward declarations.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h          | 5 ++---
 include/linux/of_device.h   | 3 ++-
 include/linux/of_platform.h | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 1f1e847a1c13..96979c67c5fa 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -16,13 +16,10 @@
 #include <linux/errno.h>
 #include <linux/kobject.h>
 #include <linux/mod_devicetable.h>
-#include <linux/topology.h>
-#include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/list.h>
 
 #include <asm/byteorder.h>
-#include <asm/errno.h>
 
 typedef u32 phandle;
 typedef u32 ihandle;
@@ -1517,6 +1514,8 @@ enum of_reconfig_change {
 	OF_RECONFIG_CHANGE_REMOVE,
 };
 
+struct notifier_block;
+
 #ifdef CONFIG_OF_DYNAMIC
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 910951a22eb4..5cdafe19dc80 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -7,9 +7,10 @@
 #include <linux/of_platform.h> /* temporary until merge */
 
 #include <linux/of.h>
-#include <linux/mod_devicetable.h>
 
 struct device;
+struct of_device_id;
+struct kobj_uevent_env;
 
 #ifdef CONFIG_OF
 extern const struct of_device_id *of_match_device(
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 8ac5cb933dc3..d8045bcfc35e 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -6,12 +6,13 @@
  *			 <benh@kernel.crashing.org>
  */
 
-#include <linux/device.h>
 #include <linux/mod_devicetable.h>
-#include <linux/pm.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+struct device;
+struct of_device_id;
+
 /**
  * struct of_dev_auxdata - lookup table entry for device names & platform_data
  * @compatible: compatible value of node to match against node

-- 
2.39.2


