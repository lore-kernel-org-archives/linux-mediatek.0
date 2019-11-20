Return-Path: <SRS0=Qt5b=ZM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18037C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 13:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBE2224FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 13:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVVMHs/9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vm3m4UtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDBE2224FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PurXA9j7N1We8Kz906yRF63/eHX090gvCAU8gNIvPAE=; b=WVV
	MHs/90yMKGOenAkgfBvlLSSipR/2JAnugDFPcTBDBbkenXsgdSSU3WoJDvxvYcBuFhye2M+Y0UQQL
	5g+ADo3TYogYVWnHubPG7EIpP5nf3UnPSWTPnmn0Iuahuu9bQ4G1JNchfQ8pvguSSe5KM7x0GisuS
	VbVZuVXzCrymU6ii9kLsAlXmZyJJJdibDUrATxT1R0VqaxumEoUbGsMqMNPjPD9CrSSVg0UN2qi9Z
	BEZqIEOToTE5Xbd6hvQyaIpY+6/ULhMjNC4ZLi9fddFzPeTCuMu62QLE1hPefsb3TCi497Q1ICvW1
	7IEmtpLssjTqWc7fsA1UywFV+a6p4CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXQG5-0006mQ-KQ; Wed, 20 Nov 2019 13:43:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXQFq-0006aC-LI; Wed, 20 Nov 2019 13:42:47 +0000
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5D60224FA;
 Wed, 20 Nov 2019 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574257366;
 bh=x9PdtJWTi7+JVqhkTZzfttMMYAGgMkp4exsnlD+LpJk=;
 h=From:To:Cc:Subject:Date:From;
 b=vm3m4UtI2mxxRe1lNV4Nb9rg17Od+eqB0XeLpUsBR2J49GBYkjOpmyPHdHBMFZuO+
 0V/Z73YhSdyi9kUBz7IQqbaPAy06rOukyRdJ1IyrOv4K+yLArQ1Ln9OwzvL2zn4WQZ
 oFxb5C7K9RRs8mUHKbmkuaaQNXE2+kqMkUkensRY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:42:41 +0800
Message-Id: <20191120134241.16017-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_054246_735824_A804416A 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
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
 drivers/clk/Kconfig           |  2 +-
 drivers/clk/mediatek/Kconfig  | 10 +++++-----
 drivers/clk/versatile/Kconfig |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

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
index 7efc3617bbd5..5ddd813521e7 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -179,31 +179,31 @@ config COMMON_CLK_MT6797
        select COMMON_CLK_MEDIATEK
        default ARCH_MEDIATEK && ARM64
        ---help---
-         This driver supports MediaTek MT6797 basic clocks.
+	 This driver supports MediaTek MT6797 basic clocks.
 
 config COMMON_CLK_MT6797_MMSYS
        bool "Clock driver for MediaTek MT6797 mmsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 mmsys clocks.
+	 This driver supports MediaTek MT6797 mmsys clocks.
 
 config COMMON_CLK_MT6797_IMGSYS
        bool "Clock driver for MediaTek MT6797 imgsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 imgsys clocks.
+	 This driver supports MediaTek MT6797 imgsys clocks.
 
 config COMMON_CLK_MT6797_VDECSYS
        bool "Clock driver for MediaTek MT6797 vdecsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 vdecsys clocks.
+	 This driver supports MediaTek MT6797 vdecsys clocks.
 
 config COMMON_CLK_MT6797_VENCSYS
        bool "Clock driver for MediaTek MT6797 vencsys"
        depends on COMMON_CLK_MT6797
        ---help---
-         This driver supports MediaTek MT6797 vencsys clocks.
+	 This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
 	bool "Clock driver for MediaTek MT7622"
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
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
