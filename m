Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2147DC43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C6D20774
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0JJ++0w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U47aYvLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C6D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8CdwbzD2rz12v6ENUpCQWg7ZocrneCyifk5zvGqPS0=; b=P0JJ++0wbSyx85
	mujU2BWrhtSSoOb5zSstRbXxuyQTK0itTD5zx7qrL8ui59lU4lzkAAlLdfvX1cJEbpYFypQtJo/pB
	T3PC2/PzlANWrfpeJ48obyFgIKbukmvPupkLXtGlLO3ZeC8HKFjQKPfwYC3VWvg7wmXv7VhT6H8af
	45IW6b4kEp+XdRAcKeUyLoLYs81CIbiia20/iWIF4QMYS6F1UUK16oH/i/tsIMkbEkP4Nft2tBapu
	u6pgYZ1UjC60sybtM/Pmg0VVhRtXPDtRlghE8Nz9+Fvy5/POJg5+SF1ZYJiZ6UqM+CsS/mdesLd62
	KprFOpAdUuz6DiMlig2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIt6X-0005xB-IR; Mon, 30 Mar 2020 12:01:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIt6V-0005wR-6o
 for linux-mediatek@lists.infradead.org; Mon, 30 Mar 2020 12:01:20 +0000
X-UUID: 83dc6281f4cd45e3b12522f144c10c7b-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Kiqp2ZjN5cJpdx9vGYZmzVbMbWNtHznGsl1vNvxEzyU=; 
 b=U47aYvLPHqj6cL+Y+Xvjmi/XM4YHXmU3pHACfsijZkn2cdt6pPUDmB5G4UoKGqtrqJpMKpCLlotRahuOUe9DU9ZU04wFZsa5FxrX2soyNqhukJGctowftWIdXSXn0maAKL03aoolwInIF6s7ztzo/8K2e0Jx+gytaKgxrxIo/d8=;
X-UUID: 83dc6281f4cd45e3b12522f144c10c7b-20200330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 238225264; Mon, 30 Mar 2020 04:01:09 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 05:01:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:00:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Mar 2020 20:00:48 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v5 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl ready
 for buiding loadable module
Date: Mon, 30 Mar 2020 20:00:48 +0800
Message-ID: <1585569648-14017-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
References: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_050119_254335_1375E2EC 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

This patch make pinctrl-mt6765 ready for building as loadable module.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6765.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 551ac71..f32d364 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -87,7 +87,7 @@ config PINCTRL_MT2712
 	select PINCTRL_MTK
 
 config PINCTRL_MT6765
-	bool "Mediatek MT6765 pin control"
+	tristate "Mediatek MT6765 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 905dae8c..2c59d39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/module.h>
 #include "pinctrl-mtk-mt6765.h"
 #include "pinctrl-paris.h"
 
@@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
 	return platform_driver_register(&mt6765_pinctrl_driver);
 }
 arch_initcall(mt6765_pinctrl_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
