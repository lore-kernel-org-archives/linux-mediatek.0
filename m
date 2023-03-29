Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA1DC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL9zh/S00J+cmPfrAtv4vflOTxQVISfijtGfdl2R3L0=; b=M1+S69yRocx8YEnfyZ/QCBUzzH
	UYxdps7aQRquzUjF7LypAuHJf1FnAWaWK/k0BIO7OcMJ6IBpbD4mW72DvrXUVbIx4R4XNhRXIGCzv
	2b/WSK0rpEcY5bfzCAcPEfV0Nppf+eX8z+tcKbbrxGW9llt7X69UVU6op1hq4j0vT1Jmz4I+46jkN
	6iGmiPE7hF8uLM92SiLcEirICTfgnT20zi3r43uC4+fpt5ybAg5OKy/hik9lsH++OhqAqxxutzJhW
	Ytyfhlsi0O947jg+XJWzxir3D5R3PHdQuc+kaKGOK8frb9YH0nQhj7pmAPOa6BMiDSIWI1tXLxsU3
	2bK27n/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6b-000sVZ-03;
	Wed, 29 Mar 2023 15:52:57 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6W-000sSQ-1S;
	Wed, 29 Mar 2023 15:52:53 +0000
Received: by mail-oi1-f170.google.com with SMTP id r84so10635031oih.11;
        Wed, 29 Mar 2023 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UL9zh/S00J+cmPfrAtv4vflOTxQVISfijtGfdl2R3L0=;
        b=BKsMKGW8DYBrhxXfQHIW+cQfDTXisldfLg140ErlOOMI18UVt7TXB0enxpzzA4Xm4M
         3lA13fSGkMYdvvr/5sPINTlRD9nIfxTsj88cNbSUqvAwaHEGhG0p096zzbQBd7lmJZDG
         BQOm5LEaLoTl1QZFeNChBeqkw31fcRiOFda/zie3B+zyu8kkiD0XEDJBtYqu7UJIF7X6
         KUaYkoTYcgNc8O6V1rd9jcD0lU1nSrUMN9DHu4Fo5ZceoK/IVKrcbdNPZkmE8gclmXub
         pJnNzFVPmxkmfSyznhZg6kMp9aufuX/IVUKwF/rJz33SGvw4JavmGH1FW1wPHp5EGrok
         VhLw==
X-Gm-Message-State: AAQBX9e9LvQTVHHASkReQUDB1MlQmBLf4Og7HQqsptY7pl/3c8mg5ViP
	RY5Ub7bG9q3lRdycTqhFBQ==
X-Google-Smtp-Source: AKy350YWPg6naXojJ+dh5QDGD5h6eaepx41Bc/m1xdmR3LQVsEP9dglulW7uPvOZ4q19z4rMeJNnvA==
X-Received: by 2002:a05:6808:4da:b0:386:9883:ca9d with SMTP id a26-20020a05680804da00b003869883ca9dmr1291968oie.2.1680105169571;
        Wed, 29 Mar 2023 08:52:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v184-20020acadec1000000b003871471f894sm10161090oig.27.2023.03.29.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:52:49 -0700 (PDT)
Received: (nullmailer pid 3198065 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:51:59 -0500
Subject: [PATCH 02/19] of: Move of_device_(add|register|unregister) to
 of_platform.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-2-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085252_499671_AE0E1841 
X-CRM114-Status: GOOD (  13.72  )
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

As of_device_(add|register|unregister) functions work on struct
platform_device, they should be declared in of_platform.h instead.

This move is transparent for now as both headers include each other.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of_device.h   | 4 ----
 include/linux/of_platform.h | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index f4b57614979d..e4aa61cb2bd0 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,10 +26,6 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern int of_device_add(struct platform_device *pdev);
-extern int of_device_register(struct platform_device *ofdev);
-extern void of_device_unregister(struct platform_device *ofdev);
-
 extern const void *of_device_get_match_data(const struct device *dev);
 
 extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index d15b6cd5e1c3..8ac5cb933dc3 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -52,6 +52,11 @@ extern const struct of_device_id of_default_bus_match_table[];
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
 					 struct device *parent);
+
+extern int of_device_add(struct platform_device *pdev);
+extern int of_device_register(struct platform_device *ofdev);
+extern void of_device_unregister(struct platform_device *ofdev);
+
 #ifdef CONFIG_OF
 extern struct platform_device *of_find_device_by_node(struct device_node *np);
 #else

-- 
2.39.2


