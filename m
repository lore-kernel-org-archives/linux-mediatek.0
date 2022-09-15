Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795BDC6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EG2etWdzHVJ/Z46DWpBkxuYmBqpu6l6/fcaWloTD+4=; b=ulVbUTArk/eCeiQsjBvab8YoKL
	p4fCs+vHel7GyercHxCyRk+auXo5GtwrB/G/Cez5ztwNF//+CV4onGxryAILn8yPyu6NwZoZaRx4G
	DdPIt9RQW0t7N6QpoaKhFQUSPm/vbUtBIXIie9+uIOXS14M9vR9N0i4yQJ6+nsmYnbus8j0+enXd8
	YAftNahAQXOJiKJSn2cqXpzag1F37ti/oszyXPjH1HXNlNojYKkW2Tb/fffkN6kQ3KbhOJr+bmZlf
	o2LH71fubn8bCaEV64DJYvpEYXRII8tELkpUOx3oGTLvistI5TZHfiofDVSZrVGQoNHbX7rCLJAv+
	7Dn1CqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk8L-003e2c-7J; Thu, 15 Sep 2022 08:22:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk80-003ddE-3q; Thu, 15 Sep 2022 08:21:46 +0000
X-UUID: 5d0b61ab9d784eb0922a02d2e3b94f0c-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2EG2etWdzHVJ/Z46DWpBkxuYmBqpu6l6/fcaWloTD+4=;
	b=FbP4E3YyTxWWZCgD1+K0/jt72/LQTDxwjedBXkqzqATGwk8y477EYZytavI0+IU2SxuAjrA8/+pikc0mI9c2KWocD5dBjPxfuo7jsjgjjzGciIt3poKroTUkDkEfuzXdiL4cvSYMVCk2bvzmGch7juDLX8SG8WmQBAjCgCgpDiE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:56bb8419-4d74-4e2b-b605-b67eaac00750,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:2e6cba7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5d0b61ab9d784eb0922a02d2e3b94f0c-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 177348336; Thu, 15 Sep 2022 01:21:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 15:50:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 15:50:32 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
CC: <matthias.bgg@gmail.com>, <granquet@baylibre.com>, <daniel@ffwll.ch>,
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH 2/3] drm/mediatek: dp: Remove unused register definitions
Date: Thu, 15 Sep 2022 15:50:27 +0800
Message-ID: <20220915075028.644-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220915075028.644-1-rex-bc.chen@mediatek.com>
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_012144_198943_F55A0270 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some definitions in mtk_dp_reg.h are not used, so remove these
redundant codes.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 096ad6572a5e..84e38cef03c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -153,8 +153,6 @@
 #define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
 #define MTK_DP_ENC0_P0_3094			0x3094
 #define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
-#define MTK_DP_ENC0_P0_30A0			0x30a0
-#define DP_ENC0_30A0_MASK				(BIT(7) | BIT(8) | BIT(12))
 #define MTK_DP_ENC0_P0_30A4			0x30a4
 #define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
 #define MTK_DP_ENC0_P0_30A8			0x30a8
@@ -171,8 +169,6 @@
 #define MTK_DP_ENC0_P0_312C			0x312c
 #define ASP_HB2_DP_ENC0_P0_MASK				GENMASK(7, 0)
 #define ASP_HB3_DP_ENC0_P0_MASK				GENMASK(15, 8)
-#define MTK_DP_ENC0_P0_3130			0x3130
-#define MTK_DP_ENC0_P0_3138			0x3138
 #define MTK_DP_ENC0_P0_3154			0x3154
 #define PGEN_HTOTAL_DP_ENC0_P0_MASK			GENMASK(13, 0)
 #define MTK_DP_ENC0_P0_3158			0x3158
@@ -206,8 +202,6 @@
 #define SDP_PACKET_TYPE_DP_ENC1_P0_MASK			GENMASK(4, 0)
 #define SDP_PACKET_W_DP_ENC1_P0				BIT(5)
 #define SDP_PACKET_W_DP_ENC1_P0_MASK			BIT(5)
-#define MTK_DP_ENC1_P0_328C			0x328c
-#define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK		BIT(7)
 #define MTK_DP_ENC1_P0_3300			0x3300
 #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_VAL		2
 #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK		GENMASK(9, 8)
-- 
2.18.0


