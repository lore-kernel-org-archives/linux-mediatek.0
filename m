Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D4CC388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:49:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1431F2068D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BxZbdzb8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GPOuXvRi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1431F2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kI6Hu8hvokL69j7vuazmSZhmb9EaSVBD4EO9qW1go8=; b=BxZbdzb8+mFmpoqoqjdWXJ7B9
	o3qpLpG+jooAxaMcbWDg5sXmxMVWV4crFSKdidpJz1bg+dm+hUc8cTrUKUaCvLp1wulVjPKv8YurL
	IIx4P7pgIyrK99c8wA046gmOHUqdogvR/JVK9dnFeVmBW2VuxPHUWdtt5KA2kkFZgBCroZgloigtg
	lxHvp/EeOgOU5Rj9QPccQ4ucVbo9Ye74xT59duzGIs6csxOp2dZu+XiGQ6BFtlD+d6H2uoNeor0Zd
	LRM4T8Fysrz7K3y6tGAtecCt761xBaRGN22XXFU5rt8M2MlfRc6Kx3UjRJlXJ/TSA1ku4rF47xh/q
	mPCcu8Qog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcpYm-0003SX-MA; Wed, 11 Nov 2020 12:49:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcpYj-0003QI-65; Wed, 11 Nov 2020 12:49:10 +0000
X-UUID: 602e60f8a2454689ba2c433ecc46476c-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xPz+LaxhwDqs4KXEuW2I0V4ISNVtBZx2tivHrSu/B6E=; 
 b=GPOuXvRiCPdyfADAqK4vxtO0CjcepMJAbz0PRE3Gae4mFwTufdY+M+5BNCnC5QFg4l4zYvpqJjX5niqDAHKx4ZPAbeVpVnw951S0T6qAjFe2wB0R5JPhurcY3sBLea49VM7AS63C7gEezBga30Q9EvLDIp0bT/XR+PHOIczNyQQ=;
X-UUID: 602e60f8a2454689ba2c433ecc46476c-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 840411554; Wed, 11 Nov 2020 04:49:07 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 04:42:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:42:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:41:59 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 23/24] iommu/mediatek: Add mt8192 support
Date: Wed, 11 Nov 2020 20:38:37 +0800
Message-ID: <20201111123838.15682-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201111123838.15682-1-yong.wu@mediatek.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_074909_421382_263240FF 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, Greg Kroah-Hartman <gregkh@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt8192 iommu support.

For multi domain, Add 1M gap for the vdec domain size. That is because
vdec HW has a end address register which require (start_addr +
len) rather than (start_addr + len - 1). Take a example, if the start_addr
is 0xfff00000, size is 0x100000, then the end_address is 0xfff00000 +
0x100000 = 0x1 0000 0000. but the register only is 32bit. thus HW will get
the end address is 0. To avoid this issue, I add 1M gap for this.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 355052a98b14..22f01eea0a61 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -173,6 +173,16 @@ static const struct mtk_iommu_iova_region single_domain[] = {
 	{.iova_base = 0,		.size = SZ_4G},
 };
 
+static const struct mtk_iommu_iova_region mt8192_multi_dom[] = {
+	{ .iova_base = 0x0,		.size = SZ_4G},		/* disp: 0 ~ 4G */
+	#if IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT)
+	{ .iova_base = SZ_4G,		.size = SZ_4G - SZ_1M},	/* vdec: 4G ~ 8G gap: 1M */
+	{ .iova_base = SZ_4G * 2,	.size = SZ_4G - SZ_1M},	/* CAM/MDP: 8G ~ 12G */
+	{ .iova_base = 0x240000000ULL,	.size = 0x4000000},	/* CCU0 */
+	{ .iova_base = 0x244000000ULL,	.size = 0x4000000},	/* CCU1 */
+	#endif
+};
+
 /*
  * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
  * for the performance.
@@ -1019,12 +1029,24 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
 };
 
+static const struct mtk_iommu_plat_data mt8192_data = {
+	.m4u_plat       = M4U_MT8192,
+	.flags          = HAS_BCLK | HAS_SUB_COMM | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | IOVA_34_EN,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.iova_region    = mt8192_multi_dom,
+	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
+	.larbid_remap   = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
+			   {0, 14, 16}, {0, 13, 18, 17}},
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
 	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
+	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{}
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index b54862307128..e96b1b8639f4 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -43,6 +43,7 @@ enum mtk_iommu_plat {
 	M4U_MT8167,
 	M4U_MT8173,
 	M4U_MT8183,
+	M4U_MT8192,
 };
 
 struct mtk_iommu_iova_region;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
