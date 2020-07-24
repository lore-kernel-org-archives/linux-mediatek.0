Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F3C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:53:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2442068F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LoErsiyo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU+ri9XT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D2442068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5ymhddQrTUYn1ko/4b7hIZ/t40cEH/ilgvDIZM9g3o=; b=LoErsiyo3j6f616d5OOlsECL5z
	qFxCTORCJGWLtiGlHyW8uRfCcJaXutMiC+0TVDOq/KiPBsMIrPGxXSf/i8xccLEHZcqBg5sG+6DSZ
	hSl1qFjlSUiQQlhrkug0YgFRIhRly5hW3izTVf+Qwr9gtbukmvw4em7rnj6YpLoLNZyvGBpTZ8SOE
	2CaElVXnmBOXhGSOMuf8nVQz/y8DBBZvLWFYLgXSE0WD2nIogkK8XCmw9Cd/Zg1ytW8KuSuX247p4
	3Mk7rDmFtIx6+HnGWMLfq86ij7UDYeT5t7l4FireuaJehqMhEezpuaCsVmu97i9Qv3TvGvI75NY0A
	bCIM5J6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysVf-0008Jn-7g; Fri, 24 Jul 2020 07:52:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMe-0002y1-OV; Fri, 24 Jul 2020 07:43:34 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FD5720786;
 Fri, 24 Jul 2020 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576611;
 bh=01DVBx+cUJU2MUx86mEXbPPRcD1lVtSvl6DAEX/P6uE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lU+ri9XTeXV7fdDhxC3z7c5crNIvFy/Om3bddXaemL8BaUIDVVuX9FV6jrqSXkBWR
 ErCM6ROOyf8AQp9eff/vfdrUX6AZ3oLt20pPHW84/j52XGmZkRf4N+7T5vd23jUQIG
 gv0egVrlDdHC8WMUScaOHw/vG3Ki388NlnpxjqgY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 29/29] memory: samsung: exynos-srom: Describe the Kconfig
 entry
Date: Fri, 24 Jul 2020 09:40:38 +0200
Message-Id: <20200724074038.5597-30-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034333_042118_8C31484A 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Write short description about the Exynos SROM controller driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/samsung/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/samsung/Kconfig b/drivers/memory/samsung/Kconfig
index 20a8406ce786..8e240f078afc 100644
--- a/drivers/memory/samsung/Kconfig
+++ b/drivers/memory/samsung/Kconfig
@@ -23,5 +23,12 @@ config EXYNOS5422_DMC
 config EXYNOS_SROM
 	bool "Exynos SROM controller driver" if COMPILE_TEST
 	depends on (ARM && ARCH_EXYNOS) || (COMPILE_TEST && HAS_IOMEM)
+	help
+	  This adds driver for Samsung Exynos SoC SROM controller.  The driver
+	  in basic operation mode only saves and restores SROM registers
+	  during suspend.  If however appropriate device tree configuration
+	  is provided, the driver enables support for external memory
+	  or external devices.
+	  If unsure, say Y on devices with Samsung Exynos SocS.
 
 endif
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
