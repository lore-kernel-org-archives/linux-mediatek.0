Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D661C43460
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 02:09:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B38F61407
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 02:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B38F61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qv/VArT1tmAMzDeKImpESVnAF3VUSUWS5uqwfmd/Wtg=; b=Yn5OfWSnFsuvVFBtM5btdm4qp
	HTStIeIbJslg3/RnqszcYOPM6d4Ggr59IVccIjyOLhPgCA2O3IVM0WRKT7Euzor9NLEn414R5Z1MD
	KleHuljp5gM636NSy6Ised5kH98H+JIR7AgGvsrOZPFKmE6bnaBJJoe6ib1GrQRGfaHdpIhfCYUqC
	YFFyX/Sr5/az3J52Sbk4V8Bj5pDX9/ftU6xkrQrBlXg58ZBLWHcYIvlVzGGnXr/q01fjcUNZzd0jS
	We/F/8hhTtJuX0cOZrmxK2OeYDtYKxIf3QOwnxPm5v0gh/FL37QuG44WKk9TueTqPRCDi9hFqgml5
	FI9ukifrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbZdu-002axs-PE; Wed, 28 Apr 2021 02:09:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZdT-002avq-Jg; Wed, 28 Apr 2021 02:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=fm5qC5TlC8KRETLKll6bok1TfwAM4YoTKi+atb8rdo8=; b=lk3DbMbNoWJkO3q4TYWNUT5tXw
 uQVairEv4m8U2AUQOEIwO8dAsOzJVWzNGPqDb0AQc9vQdJgqO0Q21iRg1f7VRypwPYd1Bt51QpP34
 T1gmCeKXopUrV+2lZmbYir7+jkA9NOaEBqf26VZ9wXVaS4ogD9PsVXvmGNO7tsxyP0ETUhrkUnACz
 O1gdRSiQwjb9G6gxvlP09KCWBlVJG+hC7Oa28V40k4pbhrtHvYHdEnAc1W/AdoDNPwJ1hbpjRf8A+
 g8AbFUYf9KtmRE6wty+K+icDvAzxWCgDJWiZBk4pkTMPB0vQ/AFb7m3JtEO8h4Ua5Pe5jSoeZNxky
 kHJpuwGw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZdQ-00H8p9-W5; Wed, 28 Apr 2021 02:09:06 +0000
X-UUID: bbca28c579644bf4b8a7b52708d76efe-20210427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fm5qC5TlC8KRETLKll6bok1TfwAM4YoTKi+atb8rdo8=; 
 b=lZzB2z35pY4Cb3jMW45/dE1p+VKX+UxhhHJuf8do6arzty83PY3Nv4cpjfunxCHRSejVB6ABZqs2y0PqClMraWxvbgnGdk5yGsedHV2DbKQb072mK5bul0fsq/xuHhPIBI9DEbMsW9ZVIua0ziFNrs5gqNq4ldDyV6EckPEvv1c=;
X-UUID: bbca28c579644bf4b8a7b52708d76efe-20210427
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1890692314; Tue, 27 Apr 2021 19:09:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 19:08:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 10:08:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Apr 2021 10:08:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v1] soc: mediatek: MTK_MMSYS tristrate support
Date: Wed, 28 Apr 2021 10:08:51 +0800
Message-ID: <1619575731-23388-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1619575731-23388-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1619575731-23388-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_190905_056809_8617D330 
X-CRM114-Status: GOOD (  13.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

MTK_MMSYS driver tristrate support.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig     | 2 +-
 drivers/soc/mediatek/mtk-mmsys.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index fdd8bc0..1437ed0 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -66,7 +66,7 @@ config MTK_SCPSYS_PM_DOMAINS
 	  tasks in the system.
 
 config MTK_MMSYS
-	bool "MediaTek MMSYS Support"
+	tristate "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
 	depends on HAS_IOMEM
 	help
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 18f9397..55a104e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -6,6 +6,7 @@
 
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -370,4 +371,8 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	.probe = mtk_mmsys_probe,
 };
 
-builtin_platform_driver(mtk_mmsys_drv);
+module_platform_driver(mtk_mmsys_drv);
+
+MODULE_AUTHOR("Yongqiang Niu, MediaTek");
+MODULE_DESCRIPTION("MediaTek MMSYS Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
