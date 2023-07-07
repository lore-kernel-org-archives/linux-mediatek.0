Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C9FKQaL/DjhwSAwt3ArSmfw7wijMULRc04IKf+RB6c=; b=ND87YTE5Fq3btcEguytVdP9Bex
	Yf5pCx8LMFViAhPwCOQPBJc0o2Ub7gpINXeKLmLLMZaxWjYM4TAwqBDgmcsZGJFUE0N4HGztvEp9g
	DQdKfc0h8CLGS0HKF0PyZS06fw6Qa5sw1RLbQY5vmAj7MIu2oQ5RZ+pZSkJryQ3+iccBkHiAdxDep
	eE5y4sFKQTl2ZceW4ZEaH1hEMwxnbzw4OWLTlTjZVQPm+8I+kd/Pv63QVXn+mwOaRK+jOylCY4XPJ
	oA2Xd5YPgXNc37t9n1MkTZswA1ec/+AjKF3sBKTAPK073u+RhYk2HX8NKGH6NKUfMo46/ef3PqLif
	p0hoOWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm53-004oR5-0I;
	Fri, 07 Jul 2023 14:05:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm4q-004oHd-0O
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 14:04:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6ff1a637bso30905761fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688738691; x=1691330691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C9FKQaL/DjhwSAwt3ArSmfw7wijMULRc04IKf+RB6c=;
        b=JhXWmV+T447FKYsYy6dzhvKCW6juQUSijMSScTTi/Vg7iA6f59CwmTplfO221r6YH1
         Ru43D7CE7iM4eTo+xO0B6q3tnI5fQtzTwWCdmG9X6Ud2CMD1lPUyxc7LZEeQndf8oW3j
         TgWzcg3sttamRQvHTWcIIuC6Nj0a73F+Jb68Tz0u5Q4ETeom+/6C3osqTB0SkRIPhO14
         AuVwUFy5FsIw8lGcZuQ6+CppiH2Spp3aMRTyo+z3fY0l2CPBwwdHSyk0wX8+GMLDkPCc
         3UsYSKMXfe3p9LT9EOf6PF3Ji6YARY+SQ2367x6aKW9agMKORnZ/w8FgBTPMK+TKwf4y
         aM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688738691; x=1691330691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C9FKQaL/DjhwSAwt3ArSmfw7wijMULRc04IKf+RB6c=;
        b=OaGT94F5cijFAIUGzfMoEIRBWVs5bgSmvfOj//5LcSqXYO0MkGcDHIw14ORFLi8uB3
         ujzyMaMj3Fyny3lHT0T8kjlvVpn5Fu6OE9lf/2k3lZirczd/VMGgVywslzDo6UspRZDE
         2PiCTZ0V93d15PPysjcf3EKjZPF5U4S2FJ48hoQD1JA5DsIJyFi3isGNOOYwJaJ7fVoP
         bCpddvWjCUGLT6c8E9uKyD5/7zr9e1+1n95JHiFuXwCZoXSxdPT6A5s5OSgobrRk3k0h
         fdat9VnVgJ+cwEZzTTs9XFuGVwywUvbvjmtr8HQbusZv7vaeuMx+Nx46u6Zsf0f33ZDV
         AkCA==
X-Gm-Message-State: ABy/qLaK1ZWOmu9oqM1BZWztBFuvGdhla3yLffJf6rSJJaoiQhTZvO0J
	NLeTFoU8INVujN2PXzuS6MJu8Q==
X-Google-Smtp-Source: APBJJlHBmMeXjugK8v9YuEhL1V3jLnXeidwnEj3l3uiEN5XJ77pwCTcdYgDDx1GbKdO/iL6N2yp8wA==
X-Received: by 2002:a2e:a40f:0:b0:2b6:efcf:1463 with SMTP id p15-20020a2ea40f000000b002b6efcf1463mr3811395ljn.6.1688738690802;
        Fri, 07 Jul 2023 07:04:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e8555000000b002b6cb25e3f1sm760341ljj.108.2023.07.07.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 07:04:50 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 07/18] soc: mediatek: Move power-domain drivers to the genpd dir
Date: Fri,  7 Jul 2023 16:04:23 +0200
Message-Id: <20230707140434.723349-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707140434.723349-1-ulf.hansson@linaro.org>
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_070452_177575_853AE337 
X-CRM114-Status: GOOD (  12.47  )
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

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/genpd/Makefile                              | 1 +
 drivers/genpd/mediatek/Makefile                     | 3 +++
 drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h | 0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.c    | 0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.h    | 0
 drivers/{soc => genpd}/mediatek/mtk-scpsys.c        | 0
 drivers/soc/mediatek/Makefile                       | 2 --
 14 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 drivers/genpd/mediatek/Makefile
 rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)

diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
index 6b9e9fe907f3..1a0a56925756 100644
--- a/drivers/genpd/Makefile
+++ b/drivers/genpd/Makefile
@@ -3,3 +3,4 @@ obj-y					+= actions/
 obj-y					+= amlogic/
 obj-y					+= apple/
 obj-y					+= bcm/
+obj-y					+= mediatek/
diff --git a/drivers/genpd/mediatek/Makefile b/drivers/genpd/mediatek/Makefile
new file mode 100644
index 000000000000..8cde09e654b3
--- /dev/null
+++ b/drivers/genpd/mediatek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
+obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
diff --git a/drivers/soc/mediatek/mt6795-pm-domains.h b/drivers/genpd/mediatek/mt6795-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt6795-pm-domains.h
rename to drivers/genpd/mediatek/mt6795-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/genpd/mediatek/mt8167-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8167-pm-domains.h
rename to drivers/genpd/mediatek/mt8167-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/genpd/mediatek/mt8173-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8173-pm-domains.h
rename to drivers/genpd/mediatek/mt8173-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/genpd/mediatek/mt8183-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8183-pm-domains.h
rename to drivers/genpd/mediatek/mt8183-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/genpd/mediatek/mt8186-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8186-pm-domains.h
rename to drivers/genpd/mediatek/mt8186-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/genpd/mediatek/mt8188-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8188-pm-domains.h
rename to drivers/genpd/mediatek/mt8188-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/genpd/mediatek/mt8192-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8192-pm-domains.h
rename to drivers/genpd/mediatek/mt8192-pm-domains.h
diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/genpd/mediatek/mt8195-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mt8195-pm-domains.h
rename to drivers/genpd/mediatek/mt8195-pm-domains.h
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
similarity index 100%
rename from drivers/soc/mediatek/mtk-pm-domains.c
rename to drivers/genpd/mediatek/mtk-pm-domains.c
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/genpd/mediatek/mtk-pm-domains.h
similarity index 100%
rename from drivers/soc/mediatek/mtk-pm-domains.h
rename to drivers/genpd/mediatek/mtk-pm-domains.h
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
similarity index 100%
rename from drivers/soc/mediatek/mtk-scpsys.c
rename to drivers/genpd/mediatek/mtk-scpsys.c
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 8c0ddacbcde8..9d3ce7878c5c 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -4,8 +4,6 @@ obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
-obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
-obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
 obj-$(CONFIG_MTK_SVS) += mtk-svs.o
-- 
2.34.1


