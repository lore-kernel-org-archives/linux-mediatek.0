Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3CDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A9722B51
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95A9722B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x0RezBC1RH4PponM7ANbnurg/1EbeX1VvoYS53HWFR0=; b=S8uR7yNzkUIXpgbL2ScoMsn2Fs
	ZnBh2D++iHCWHYDejorsrz1gUmeh4FjWwmZl+eFgAFOpG4BK3vHCOBHqqu8L/tsojWWqh3bL6A7DT
	aKsnZDFPWEUN9sBf/lByvEU6dlEX8+HfTm1ar8J5mohGsJWzfb7MpbpLbLfB7Txmnxlb07vGBugId
	AY3LDUyEi8y18T8IlhOAcnFXEQd1l0O89QISN6F4i3ulbrPOX4uzCOLKC4NQUblko8Bmm6sar3LcX
	dEici9QLvLFqCdKXgo9nuUxt10vucBobC1is7gnAcM0VJFhu3lSmUdr5a0aB3mLjS3N8ucu6OP/9p
	li+dF91A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4HQv-0002K1-Ls; Tue, 26 Jan 2021 06:02:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4HQn-0002Ie-9P; Tue, 26 Jan 2021 06:02:27 +0000
X-UUID: 498159e1e8054036a02f1a489639195f-20210125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l/HAbLI9W8TqHj0++xg4JOCdh2jWmfTi1JIoMueced0=; 
 b=AEaoyix+XcldL8dwjKooREtFfKYLW40QWqbOggYcUv8H/ML1yvYIVw+k5f6stVKYbH3Ivm/EpBkYrt7lLNml3Qz4XiOtPErPB1y4CETuHd8NBJiA7BcCFjbVxzKfJVxvrbXhc3ZOUF/HFMT6wFyKN02e4v6niY1P1wJ3QSNVwtg=;
X-UUID: 498159e1e8054036a02f1a489639195f-20210125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1882075626; Mon, 25 Jan 2021 22:02:19 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 22:01:12 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 14:01:04 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 14:01:03 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2] memory: mtk-smi: Support SMI modular
Date: Tue, 26 Jan 2021 14:00:55 +0800
Message-ID: <20210126060055.11050-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 413277F7CA28486647A4C0608B164AEC3EA3B448FD5BFC262DF895F4FE03C3FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_010226_297778_DFAE2502 
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

This patch mainly support SMI modular. Switch MTK_SMI to tristate,
and add module_exit/module_license.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
This patch rebase on the clean v5.11-rc1.
and this one: memory: mtk-smi: Use platform_register_drivers
https://lore.kernel.org/linux-arm-kernel/20210121062429.26504-2-yong.wu@mediatek.com/

change note:
a) squash the last two of v1 into one patch.
b) Remove module_alias
---
 drivers/memory/Kconfig     | 2 +-
 drivers/memory/mtk-smi.c   | 9 +++++++++
 include/soc/mediatek/smi.h | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 3ea6913df176..05c6d4a32285 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -173,7 +173,7 @@ config JZ4780_NEMC
 	  memory devices such as NAND and SRAM.
 
 config MTK_SMI
-	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
+	tristate "MediaTek SoC Memory Controller driver" if COMPILE_TEST
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	  This driver is for the Memory Controller module in MediaTek SoCs,
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e2aebd2bfa8e..3a269415db73 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -597,3 +597,12 @@ static int __init mtk_smi_init(void)
 	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
 }
 module_init(mtk_smi_init);
+
+static void __exit mtk_smi_exit(void)
+{
+	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
+}
+module_exit(mtk_smi_exit);
+
+MODULE_DESCRIPTION("MediaTek SMI driver");
+MODULE_LICENSE("GPL v2");
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
