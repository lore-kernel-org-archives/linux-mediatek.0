Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE6FC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E02238EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E02238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AlAuayZi1dSa+fmaAiMkEDU3i7CcfD8d9Y6gykaPjzU=; b=LSzzEod3IUYHZN59J/xgdAA/a
	tY1nqKMzcdCamKODG938yeWRYJohkm9Qrh2WVrAxtmL0Qt8IS0GS9iXFTl9yBE6pQYWdWjAdPsRJx
	HGdtpCxvM62YE/EtvgAlS/5ic89VNAa8GuC8Bf0cNWcL4bZFUItqmGqgvagGuBjFG42KrkgnMWXE+
	bARKeQ8F90PZRQRlk4XdinxVcszljvpLynWFf+Fjxpk5E+z7byXAY8fKzyJVzF4JUWHdLQziRUHwf
	icG+s9dhl1iRMLmQ23bbgHtnMBR+1Yxl+ZObyGLinD59Ma0+fmFvsgxfvluUYE4ZKHNcrgJPMszNz
	ZgH9TtIOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TXl-0003dD-2j; Thu, 21 Jan 2021 06:34:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TXh-0003by-8t; Thu, 21 Jan 2021 06:34:06 +0000
X-UUID: b84c1893db9641248457c212c75ef926-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v4tfapMg2ZzA9xEv1+2MPHFrNUHJ+FWRarMftvCe3oo=; 
 b=TNXRTwUDcBzPX0C64mS0Q73IFM5lVP86Jxao9yslrFlEm9/vJMYLB0Yrc1Vzqrv9muH/NfCkcvu9O+ldFOlsXC8ScQliPzLy3RLqaZePeHwdhEgYkRiMdJDYpAsZMV1S0TSO1DuRWYls9WjKoe4bjXMtMVzTvobTwdQdQQpiDCc=;
X-UUID: b84c1893db9641248457c212c75ef926-20210120
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1559051696; Wed, 20 Jan 2021 22:25:40 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 22:25:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:25:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:25:29 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH 3/3] memory: mtk-smi: Switch MTK_SMI to tristate
Date: Thu, 21 Jan 2021 14:24:29 +0800
Message-ID: <20210121062429.26504-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210121062429.26504-1-yong.wu@mediatek.com>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_013405_501171_783DAABF 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch switches MTK_SMI to tristate. Support it could be 'm'.

Meanwhile, Fix a build issue while MTK_SMI is built as module.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
This patch has a little conflict with the mt8192 iommu patch which
delete the MTK_LARB_NR_MAX in smi.h(It's still reviewing).
This patch rebase on the clean v5.11-rc1.
---
 drivers/memory/Kconfig     | 2 +-
 include/soc/mediatek/smi.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 3ea6913df176..d5f0f4680880 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -173,7 +173,7 @@ config JZ4780_NEMC
 	  memory devices such as NAND and SRAM.
 
 config MTK_SMI
-	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
+	tristate "Mediatek SoC Memory Controller driver" if COMPILE_TEST
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	  This driver is for the Memory Controller module in MediaTek SoCs,
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 5a34b87d89e3..29e2fb8f33d6 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -9,7 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 
-#ifdef CONFIG_MTK_SMI
+#if IS_ENABLED(CONFIG_MTK_SMI)
 
 #define MTK_LARB_NR_MAX		16
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
