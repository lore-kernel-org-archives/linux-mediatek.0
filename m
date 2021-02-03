Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D68C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:54:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BCA64F58
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BCA64F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36uKvF3Do2nkjKUVc9cq43jJROabgU03ZXnZRaioOyk=; b=1ld7osAcHaLJ0SFI+Nd4UOQ8uS
	ZlOPGDgSLlgNinEBg6oil2FlhRKRyJ7CNG3ytaUqcAbcQQ5zmJmERexaInVH4Sn8etjXfLwsKXK5O
	+Okz2OgQh7n+5q0PQKr6Lqcdt+vmP5wS/pwxW7HuIAzXhhGf5dzu4lKWOowjeq+J08b1pgGwX1EMr
	B/dmKYQKxp4KX4SbNWV+tdWTOCuVQfHrJzKtEyptLK2UMaAsWLXZbOT04amebSnRS9QMrRdDIK4SM
	l8lKaTOhJYB8Tw4t7spDXepGe0uguLo1DGXfvIxYTZ/5dCZq0SIk+cAWeRKCUm4YRVrLxIC70NbzV
	7h60U2CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Fnx-00079T-Mo; Wed, 03 Feb 2021 10:54:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Fnu-00078b-4e; Wed, 03 Feb 2021 10:54:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id D6EDE1F45484
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: Select all the MT8183 clocks by default
Date: Wed,  3 Feb 2021 11:54:23 +0100
Message-Id: <20210203105423.682960-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_055434_298068_69AF5A3C 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: drinkcat@chromium.org, Stephen Boyd <sboyd@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-clk@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Mars Cheng <mars.cheng@mediatek.com>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If MT8183 SoC support is enabled, almost all machines will use topckgen,
apmixedsys, infracfg, mcucfg and subsystem clocks, so it feels wrong to
require each one to select that symbols manually.

Instead, enable it whenever COMMON_CLK_MT8183_* is disabled as
a simplification. This would add few KB in the kernel image size but
will make the life a bit easier to the users, anyway you'll need to probably
enable all of them if you want to have proper support for that SoC.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/clk/mediatek/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index ce8475098b31..886e2d9fced5 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -426,66 +426,77 @@ config COMMON_CLK_MT8183
 config COMMON_CLK_MT8183_AUDIOSYS
 	bool "Clock driver for MediaTek MT8183 audiosys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 audiosys clocks.
 
 config COMMON_CLK_MT8183_CAMSYS
 	bool "Clock driver for MediaTek MT8183 camsys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 camsys clocks.
 
 config COMMON_CLK_MT8183_IMGSYS
 	bool "Clock driver for MediaTek MT8183 imgsys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 imgsys clocks.
 
 config COMMON_CLK_MT8183_IPU_CORE0
 	bool "Clock driver for MediaTek MT8183 ipu_core0"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_core0 clocks.
 
 config COMMON_CLK_MT8183_IPU_CORE1
 	bool "Clock driver for MediaTek MT8183 ipu_core1"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_core1 clocks.
 
 config COMMON_CLK_MT8183_IPU_ADL
 	bool "Clock driver for MediaTek MT8183 ipu_adl"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_adl clocks.
 
 config COMMON_CLK_MT8183_IPU_CONN
 	bool "Clock driver for MediaTek MT8183 ipu_conn"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_conn clocks.
 
 config COMMON_CLK_MT8183_MFGCFG
 	bool "Clock driver for MediaTek MT8183 mfgcfg"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 mfgcfg clocks.
 
 config COMMON_CLK_MT8183_MMSYS
 	bool "Clock driver for MediaTek MT8183 mmsys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 mmsys clocks.
 
 config COMMON_CLK_MT8183_VDECSYS
 	bool "Clock driver for MediaTek MT8183 vdecsys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 vdecsys clocks.
 
 config COMMON_CLK_MT8183_VENCSYS
 	bool "Clock driver for MediaTek MT8183 vencsys"
 	depends on COMMON_CLK_MT8183
+	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 vencsys clocks.
 
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
