Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C6BC77B74
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWmtLeCB2PTcAHpGNr0ZZYDBf99xMHUdOSjMIZXheFk=; b=dDYK1NvFVdiaEhBoiNXeqMAFvg
	FTsHu2Eh2g9urGxaywNJZk1ouSHkr/syiKoaXH3nvp1WsByKQQDulcYCfVLPPZBMt2dcGhEUnQAue
	1DS5ceTFTNOYRBUbCl18W87PeXyU8uHT7A3WagWWLa88lGrCLR8mxPIysQxOTUOiu+jYvQt/0Q9vV
	puIMJuXm9X+yyJlL7PfBLFFFkVx+aTj3InItWLL3Yewo+C3/Ag2oVg1tEdjVD9xCy5pNyKT5TzDWq
	73XcdjfTzyNjco7mfob4UoSQEOPi/Oc68OwnHMne888DEOcFOs2StlJWUKloL9SjIIxzO+mFn2m3e
	EDy/QReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY7P-000tFA-2j;
	Wed, 29 Mar 2023 15:53:47 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6v-000snP-2c;
	Wed, 29 Mar 2023 15:53:19 +0000
Received: by mail-ot1-f48.google.com with SMTP id x8-20020a9d3788000000b0069f922cd5ceso8440195otb.12;
        Wed, 29 Mar 2023 08:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWmtLeCB2PTcAHpGNr0ZZYDBf99xMHUdOSjMIZXheFk=;
        b=ePIeJFA54AjuxPD7DMipdbunJvfRUH7tvFqAXYGFa7qAtnICPp5QoOms7Cma/THWKo
         h4mY5ej7Inf+qsPxsh5OsQtuubcc4W9onsi79aOUMSk3Zk4FSW/YvRW1y1StKDSpGGms
         zfrgoZAgzauAliwopls4S1p0vereYDOfMeY50MQRBxwgkLpuZtTewQ36gN+KH7jPLwCr
         jR+yzvwivM9DL4vQkJjkofbh7CoJ7wnqumyVL8WFVolViOkZrf6vgIJL5/UVgb94+HNj
         4545OqIbRh2ORTDcjsmRqHITzmFzYodxkKW41p6SlwwiYEVe0uxh+reNxWuKwFj2jh63
         7G+g==
X-Gm-Message-State: AO0yUKXjwnKpdN4L/zSjw7gFhFv+dMMNT38D88f+p+iHsUUqUGbksVE7
	L+lwxF1L+U1p5eqnKv61zA==
X-Google-Smtp-Source: AKy350by63hvThVx+G6CTPOFFLOe4lmhMruBxp6akfw7h8ZCmJHsyJFTMVn+Dn/8by4Bc4xtRU8hFQ==
X-Received: by 2002:a05:6830:1695:b0:694:3972:dbae with SMTP id k21-20020a056830169500b006943972dbaemr9305044otr.2.1680105196435;
        Wed, 29 Mar 2023 08:53:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q4-20020a9d4b04000000b0069f509ad088sm5047619otf.65.2023.03.29.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:16 -0700 (PDT)
Received: (nullmailer pid 3198067 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:00 -0500
Subject: [PATCH 03/19] of: Move of_device_get_match_data() declaration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-3-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085317_866637_7204AACD 
X-CRM114-Status: GOOD (  14.37  )
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

of_device.h mostly defines functions for bus drivers whereas
of_device_get_match_data() is used by drivers. Let's move it to of.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h        | 2 ++
 include/linux/of_device.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 36cf94596eba..b7118d68c73a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -416,6 +416,8 @@ extern int of_detach_node(struct device_node *);
 
 #define of_match_ptr(_ptr)	(_ptr)
 
+extern const void *of_device_get_match_data(const struct device *dev);
+
 /*
  * struct property *prop;
  * const __be32 *p;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index e4aa61cb2bd0..6af4c3acd502 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,8 +26,6 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern const void *of_device_get_match_data(const struct device *dev);
-
 extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
 extern int of_device_request_module(struct device *dev);
 

-- 
2.39.2


