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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD6C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:53:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71229206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oz/hDS/n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RIy8nzGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71229206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q/WtMtBDjDA9DgytWIl/VDOqVRVg8STuABASgWRcwEo=; b=Oz/hDS/nCUiswqn99AVgP53lG
	qVYoRSmtBDX9TJjIEKiojztplFnlwVNd+vu8v+74wV9L6+aDMFmyLsnzCU1jwgHq1atVzM4+vH1bW
	stLPWXwIzXonvkO5CHWShlUoHy9gSW7F3avYpIawe7Dl+vjVDr2UcTPjLMvER3/u3SvNatbT1uaXF
	ESijkyBbwySC8W3YTq3g277UXBcDczyuvYtByx4i9Y5bAW12BXnEgDYBoN+Fyuf37bTf99LmIbZj/
	76zHj2BIu4aXH2R0dP4dbZ9NHABL2kLrKrOhOfbwhZsfPhvEMozeM6+af+dF3OUDmFWtpMQFWJFq4
	lY+5lL7gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcpca-0005Ve-J4; Wed, 11 Nov 2020 12:53:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcpax-0004Z3-Nr; Wed, 11 Nov 2020 12:51:34 +0000
X-UUID: 39fb64d80f9743cda4e3674475b17173-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tFaMjaNYgCsCgR0iGOh48eyE9PaE+L5rG+vY3ON9VCg=; 
 b=RIy8nzGED9Pigbc/CGy8rAei/G7prcYG+hXNLDoD/DQfliUvaE+Q/rVblW9LTBTiPjwdR3syL3uyewQ2NjhFWQJG+ry6t05SAuN/Y3M422IN/ZQkQMuLU0XOlmGiAA3gkkVCcFqffPRRWjgNZxXv4DsarZsYwC+AdkHDra89ZKk=;
X-UUID: 39fb64d80f9743cda4e3674475b17173-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48222422; Wed, 11 Nov 2020 04:51:20 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 04:41:23 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:41:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:41:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 17/24] iommu/mediatek: Add single domain
Date: Wed, 11 Nov 2020 20:38:31 +0800
Message-ID: <20201111123838.15682-18-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201111123838.15682-1-yong.wu@mediatek.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_075128_388983_40DE58B1 
X-CRM114-Status: GOOD (  14.71  )
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

Defaultly the iova range is 0-4G. here we add a single-domain(0-4G)
for the previous SoC. this also is a preparing patch for supporting
multi-domains.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bf3f4e0f4748..a7727a3899d1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -161,6 +161,10 @@ struct mtk_iommu_iova_region {
 	unsigned long long	size;
 };
 
+static const struct mtk_iommu_iova_region single_domain[] = {
+	{.iova_base = 0,		.size = SZ_4G},
+};
+
 /*
  * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
  * for the performance.
@@ -922,6 +926,8 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.m4u_plat     = M4U_MT2712,
 	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.iova_region  = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
 };
 
@@ -929,6 +935,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
 	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
+	.iova_region   = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
 };
 
@@ -944,6 +952,8 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
 			HAS_LEGACY_IVRP_PADDR,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.iova_region  = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
 };
 
@@ -951,6 +961,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.flags        = RESET_AXI,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.iova_region  = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
