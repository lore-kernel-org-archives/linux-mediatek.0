Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA39C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414EF60E08
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 414EF60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a7Cyh0Pp4aLXcYyMSe+oTEvGvj/aymxY/1Qc1kfT3sw=; b=CPpOlFGKMuKEVT
	toABJQYHmeTe6dkY114uxvLJ+v6K15l5QPcR01ao4pXw34ixGxWKzUQ9ZN+46pi/Mfz0aeKFaJ67c
	pEqOB1Zj67BpqubIutis/FTov++Lb0CD8M3zZwYwgCkmeYocPD9GiXxZR3eaeivRMDnPqzZEK677Z
	htHZc/yjlrA6ONxNMJkOBXvkIbZOK+R0FrsfS9UDxkLsxuxAP/cSVLmd7c1DecgiD8M2ZbNGXY5xP
	GFdk0VKF9iV0FQi2U0yJJamkkFGlR7fX0crHuMByysbOM8o6alhzbQk3w3rl/v6+U5czKOsqu11uP
	Ic/DLNpvfFWuZSrE3iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mho6x-000lMS-Lo; Tue, 02 Nov 2021 07:21:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mho6j-000lHf-8Q; Tue, 02 Nov 2021 07:21:23 +0000
X-UUID: 792100dbd129456d8c0af89ec0180229-20211102
X-UUID: 792100dbd129456d8c0af89ec0180229-20211102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1726057504; Tue, 02 Nov 2021 00:21:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 00:21:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 2 Nov 2021 15:21:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Nov 2021 15:21:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH] soc: mediatek: Add support always on flag
Date: Tue, 2 Nov 2021 15:20:58 +0800
Message-ID: <20211102072058.4107-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_002121_325272_EB7C8BA1 
X-CRM114-Status: GOOD (  15.03  )
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

There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
used by PCIe, when power off its mtcmos, need software reset it
(workaround way, usually hardware do it, but has an issue on mt8195),
but it has side effect to USB2 phy(works with USB3 phy to support
USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make its
power always on;
Another reason is that USB3.2 Gen1/2 need keep power always on when
support runtime-pm due to hardware limitation until now;

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
 drivers/soc/mediatek/mtk-pm-domains.c    | 2 ++
 drivers/soc/mediatek/mtk-pm-domains.h    | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
index 1379aa39bf16..b6949874c72b 100644
--- a/drivers/soc/mediatek/mt8195-pm-domains.h
+++ b/drivers/soc/mediatek/mt8195-pm-domains.h
@@ -67,7 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 		.ctl_offs = 0x334,
 		.pwr_sta_offs = 0x174,
 		.pwr_sta2nd_offs = 0x178,
-		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+		.caps = MTK_SCPD_ALWAYS_ON,
 	},
 	[MT8195_POWER_DOMAIN_CSI_RX_TOP] = {
 		.name = "csi_rx_top",
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 61973a306e97..b89e5e3e3363 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -446,6 +446,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
+		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
 		pm_genpd_init(&pd->genpd, NULL, true);
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index daa24e890dd4..419d23d5e394 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -8,6 +8,7 @@
 #define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
+#define MTK_SCPD_ALWAYS_ON		BIT(5)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
