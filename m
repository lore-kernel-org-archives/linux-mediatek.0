Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA7AC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avhGoClAu60FK+4OH3axA1tPVPlExeBA2pd36OTtZtE=; b=QW94QIRIFrySUnk+Ttya8DgA6j
	Z0rpzIZAHXFRqA5uAChKYxsqkEbZnVKs6Sau05TGO1RQ2NvDoxPiVaZwLusDRrvAl97OUaSJIUy0a
	oLpx89bgDPB9XaKIy4Xvb5DJNEn0HsxnnJuHpUc9JFUIKxuxElzxIyOBDTkmD6dF8cBrSdi7aIYDJ
	cfHk9g0tzxc9LDK9nfhbY9+20fg1Q/oPtfSdZkh3+kqbhMYCCTLSVAfKUe63zP4dXnOihbtxwGZLo
	/7eRUyTJZ1ime7ADpQ0oA6+uAV2t8JFWomLJbs6Dayl0w+nwHoRiA1Cts+Xc6sUzE8HV9UKiAdK6p
	0dJTJcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7d-000tUl-2T;
	Wed, 29 Mar 2023 15:54:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY79-000syp-0m;
	Wed, 29 Mar 2023 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=avhGoClAu60FK+4OH3axA1tPVPlExeBA2pd36OTtZtE=; b=mV9OkgaS690gMTN5Zk/PJQ+vqS
	9oBjG9j0WZ+SmIV+93uEqNljDMIVFynQvV/M0dZrIg4ENes+tvH57lixcLvxoEa4HBoLDm+hlm/bh
	WfOZ3Kdq2CDdB5ZIfh8byQThNnQ/mvT/+0dak3P5urn4enGUba93wHTtDSDoKK6vyqx09VGXWEy5d
	0EuGrT+3goa+R1R04ynd2NHo4xClQDS3+WG3UYbMxrKlmqit73jQC39ztRbm6omMAMO1mVFvopir0
	Wl/9bcpHSkqoYGUkQ7+rLkDAvdcIBn2ja79i/3d3l7t27XpmMnXKJiKQSLEJAG7EgoxiVVMy1X2oz
	jolXEnEw==;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY73-006t3W-34;
	Wed, 29 Mar 2023 15:53:28 +0000
Received: by mail-ot1-f41.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso8431071otf.9;
        Wed, 29 Mar 2023 08:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avhGoClAu60FK+4OH3axA1tPVPlExeBA2pd36OTtZtE=;
        b=FqKsuJg51rMuudkiTejhlF0vogVdbwOTpGoCZQ+Gq6SXcNbYP4LBcXqSFUd/1Zghoh
         uZ5LF6hw1tSqT5Bfko8QeOd3OVJM61bQjitWte02vmw7ESNobowZdFTTv77vzykeFncx
         udqchdLpp3G0xCCuwYDRpLWF3tiWpgjHQlVIQi+aOfftlplqqCdkYp2bisH4GG9FnTW/
         fI+Xq/9Mt/H9G3Oe74NpkgxDUw4WfIJu3UYIxSYdu7M46XwRhFdCjdKz8zIOiZBCOL7N
         dDYgU+Mpo+1WRWfkRwgMvU5Yy1pTCsTuSWoUigxJZLpUXZ1bdZzerrSeo95rfi6R2Aib
         aELQ==
X-Gm-Message-State: AO0yUKXOxlahpfqU8IDVFhObR0P88isCHrRZI3AjnHWYDH28VETPC+jw
	M2Vskuw3wcFwW10+x506Tw==
X-Google-Smtp-Source: AK7set+ZOHjqyI4LzxgjdsE15Cx5pZk+wokjAG0VqGy5aA+Dncm2MiNsSACjR/bJ9bGa9YBaDIKZXg==
X-Received: by 2002:a9d:67c6:0:b0:697:ef66:e7f4 with SMTP id c6-20020a9d67c6000000b00697ef66e7f4mr9233955otn.24.1680105198532;
        Wed, 29 Mar 2023 08:53:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s14-20020a9d758e000000b006a154373578sm2278866otk.39.2023.03.29.08.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:18 -0700 (PDT)
Received: (nullmailer pid 3198079 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:06 -0500
Subject: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove
 of_device.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_165326_190429_65E73ECC 
X-CRM114-Status: GOOD (  12.83  )
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
 arch/riscv/kernel/cacheinfo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 3a13113f1b29..e3829d2de5d9 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -5,7 +5,6 @@
 
 #include <linux/cpu.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/cacheinfo.h>
 
 static struct riscv_cacheinfo_ops *rv_cache_ops;

-- 
2.39.2


