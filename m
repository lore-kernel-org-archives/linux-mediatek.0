Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60E6C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WurTN6TQClVnhKzRVCxCDshUnc0lAKMY5Mp4cC77h0Y=; b=0mQ6wEebHG5zxuoO4o4Io6N/y7
	aw47mK0mNQnqkjqx6PPRX4cZJd6o3tzz3uXdhM8UIyXBPgJC1E6DKnSzXjOCB1ioj0/bLyehNdh6x
	3XbyxhMtd3QaI1/DaazGXU91Gtj7tPYrUbe/WK/AiX2ykEPEg7+s7VZ/fXWeWWiGq7J5pNwx/WlHf
	uwMKhZWo5zlRGsGTgneJMduVCtGfeyoKh3dYKvhG8oceo1d0HbixSlDkCURny0a+O4l731VvtATPA
	nyYUFLPKpWhpYptfevn9ODyozi50vBZJOw4Pn5JwrfjtrbBrvZXaFtnSZVYpwmc22N76PfUaqYHYY
	Kv/BlxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7I-000t7x-1f;
	Wed, 29 Mar 2023 15:53:40 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6r-000sjV-1J;
	Wed, 29 Mar 2023 15:53:14 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17ab3a48158so16687094fac.1;
        Wed, 29 Mar 2023 08:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WurTN6TQClVnhKzRVCxCDshUnc0lAKMY5Mp4cC77h0Y=;
        b=f8znrAxYN2GzZSr25Ez+y2Yqvs4pPgsAdX7dwsR2fj92g9rhhZCYZEI0o6f2XbNHJl
         8KWJ9FyoTlKej58yovm+SJAIj3KiC+hBEoFxoRLvfJSIrZIruk6KilzMuu/ZmgpORHTb
         sqkgfwPFjMUuwqyzMXHNIYnLiKIsADJyO9E+TaGWTFpwYkNXpCM5XaJp6SaGDb3FYwCz
         olwLc8LwxGxVZgRxpmU+f6uZXYpTZOuklZhcN816Hp3KTpz7s2gKWPMaF+dXDtYsxC6W
         2FUAbhc+ELLBKNENeYS7OtM46RqGdHmEgtg+ecmS2Vzx/Qb/xDSChvCkiiX3xj21ZsUp
         gArg==
X-Gm-Message-State: AAQBX9errTOMwSj0ZpQKbxF+dnn6wzkrqnzeBo3uZrW7KBpt5lCdwrIB
	gdshvzEvkehEU3Z72TCDJw==
X-Google-Smtp-Source: AKy350Zo9NclgwNBZoANioCGcuLyMicsG3a/5+eN9bgHMpdMdqlYEHn7LZHT8hqlsIh4r2ZmsXlMnw==
X-Received: by 2002:a05:6870:2194:b0:17e:cb7:29c0 with SMTP id l20-20020a056870219400b0017e0cb729c0mr13838293oae.13.1680105192039;
        Wed, 29 Mar 2023 08:53:12 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id aw8-20020a0568707f8800b001762d1bf6a9sm11897731oac.45.2023.03.29.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:11 -0700 (PDT)
Received: (nullmailer pid 3198075 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:04 -0500
Subject: [PATCH 07/19] ARM: cpuidle: Drop of_device.h include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-7-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085313_443968_5A0FC888 
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
 arch/arm/kernel/cpuidle.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index 437ff39f7808..fba1f8bb03b5 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -5,7 +5,6 @@
 
 #include <linux/cpuidle.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/cpuidle.h>
 
 extern struct of_cpuidle_method __cpuidle_method_of_table[];

-- 
2.39.2


