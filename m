Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA300C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 03:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0CEA2089D
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 03:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnhPaOxU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhjxDrCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0CEA2089D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=i3bdzHecW4IehCCgx1d2CCaZ1DlMDGQ5wO/miqt7tRg=; b=Lnh
	PaOxUZ1I9sKsnQOIA2YpFyMcREInT5Jr5llvmpQmC8MjOY9yGApge/fA6ztTjMXWw18Q6KdvKsqm5
	PZaA6OPQkFcgIKXfiQDJmQqjH2vtxX/6ntfV52SjVSbIwsE+Zrd1YAD5BlvMzMYAMQEZBIoLVzIHJ
	PLmcRVHrCO5Uvix7XtbKM87XHnAXLT7y/MNbLKVL0DFaK6tmJvBixqJmBlEUvQdPryqns0poYL4Uu
	rqnJYzlTwXl4OL9KpWQgcmA+LB9K+DWktzSqTmXmPCdScPYIx3JaANfi5bN38n0y7S6Dl4FM5s0I5
	XCgnyDsxU8HC2aaIhOe43uBAQgFBpow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXczu-0002Y3-J7; Thu, 21 Nov 2019 03:19:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXczk-0002QA-NI; Thu, 21 Nov 2019 03:19:02 +0000
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2A6820898;
 Thu, 21 Nov 2019 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574306340;
 bh=9Ksqhhd1L7R8tO8N1qP062uhuD/S93g4xX+3n7nrjuk=;
 h=From:To:Cc:Subject:Date:From;
 b=dhjxDrCGeRc2byEQxgwNLsSWWxA7ebiuc5DOawNk7mBXmN8SBRIeMGPYM1L+rtUsk
 jw5AuZek5sXPBBufjND8mFIc8AMxc1Xv0+fQ4GjTQqcegDJyr8JlxRHhMzoDZbTaWx
 V8psmrv+ovo0Q7Mfd7RsK//vg6HkD+Uq/hzXOUYc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 04:18:55 +0100
Message-Id: <1574306335-29026-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_191900_802567_D2F5743D 
X-CRM114-Status: GOOD (  11.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 drivers/clk/Kconfig           |  2 +-
 drivers/clk/mediatek/Kconfig  | 44 +++++++++++++++++++++----------------------
 drivers/clk/mvebu/Kconfig     |  2 +-
 drivers/clk/qcom/Kconfig      |  4 ++--
 drivers/clk/versatile/Kconfig |  2 +-
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 0530bebfc25a..b8ebf7b93d63 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -27,7 +27,7 @@ config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
 	---help---
-          Supports the clocking subsystem of the WM831x/2x series of
+	  Supports the clocking subsystem of the WM831x/2x series of
 	  PMICs from Wolfson Microelectronics.
 
 source "drivers/clk/versatile/Kconfig"
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7efc3617bbd5..e4c7cb518cda 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -174,36 +174,36 @@ config COMMON_CLK_MT6779_AUDSYS
 	  This driver supports Mediatek MT6779 audsys clocks.
 
 config COMMON_CLK_MT6797
-       bool "Clock driver for MediaTek MT6797"
-       depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-       select COMMON_CLK_MEDIATEK
-       default ARCH_MEDIATEK && ARM64
-       ---help---
-         This driver supports MediaTek MT6797 basic clocks.
+	bool "Clock driver for MediaTek MT6797"
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK && ARM64
+	---help---
+	 This driver supports MediaTek MT6797 basic clocks.
 
 config COMMON_CLK_MT6797_MMSYS
-       bool "Clock driver for MediaTek MT6797 mmsys"
-       depends on COMMON_CLK_MT6797
-       ---help---
-         This driver supports MediaTek MT6797 mmsys clocks.
+	bool "Clock driver for MediaTek MT6797 mmsys"
+	depends on COMMON_CLK_MT6797
+	---help---
+	 This driver supports MediaTek MT6797 mmsys clocks.
 
 config COMMON_CLK_MT6797_IMGSYS
-       bool "Clock driver for MediaTek MT6797 imgsys"
-       depends on COMMON_CLK_MT6797
-       ---help---
-         This driver supports MediaTek MT6797 imgsys clocks.
+	bool "Clock driver for MediaTek MT6797 imgsys"
+	depends on COMMON_CLK_MT6797
+	---help---
+	 This driver supports MediaTek MT6797 imgsys clocks.
 
 config COMMON_CLK_MT6797_VDECSYS
-       bool "Clock driver for MediaTek MT6797 vdecsys"
-       depends on COMMON_CLK_MT6797
-       ---help---
-         This driver supports MediaTek MT6797 vdecsys clocks.
+	bool "Clock driver for MediaTek MT6797 vdecsys"
+	depends on COMMON_CLK_MT6797
+	---help---
+	 This driver supports MediaTek MT6797 vdecsys clocks.
 
 config COMMON_CLK_MT6797_VENCSYS
-       bool "Clock driver for MediaTek MT6797 vencsys"
-       depends on COMMON_CLK_MT6797
-       ---help---
-         This driver supports MediaTek MT6797 vencsys clocks.
+	bool "Clock driver for MediaTek MT6797 vencsys"
+	depends on COMMON_CLK_MT6797
+	---help---
+	 This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
 	bool "Clock driver for MediaTek MT7622"
diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
index 415e6906a113..ded07b0bd0d5 100644
--- a/drivers/clk/mvebu/Kconfig
+++ b/drivers/clk/mvebu/Kconfig
@@ -29,7 +29,7 @@ config ARMADA_39X_CLK
 	select MVEBU_CLK_COMMON
 
 config ARMADA_37XX_CLK
-       bool
+	bool
 
 config ARMADA_XP_CLK
 	bool
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3b33ef129274..f37f3cd615f2 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config KRAIT_CLOCKS
-       bool
-       select KRAIT_L2_ACCESSORS
+	bool
+	select KRAIT_L2_ACCESSORS
 
 config QCOM_GDSC
 	bool
diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index ac766855ba16..c2618f1477a2 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -9,7 +9,7 @@ config COMMON_CLK_VERSATILE
 		COMPILE_TEST
 	select REGMAP_MMIO
 	---help---
-          Supports clocking on ARM Reference designs:
+	  Supports clocking on ARM Reference designs:
 	  - Integrator/AP and Integrator/CP
 	  - RealView PB1176, EB, PB11MP and PBX
 	  - Versatile Express
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
