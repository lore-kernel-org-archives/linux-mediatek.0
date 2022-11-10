Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09987C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8W6/VsKY9UBnV+rl6xlAuNJ77NeZ4guQ3Yk9GbydsY=; b=FS0qhAzbrVxuSrJCbGDqDRG4vX
	zLkk0dMbksNzEAd0L9bsiedLSbi7R/cL9VZNc6QL0bsY6oGWDO4zraX47L7Nrvw9VJFmWkhNgvr//
	ghy+xYskRqae+ogLaUxQ0Z/jhV2NT0SMPG6//HMIoQNbOQG8FtuNKngam39mxEVqwpuWxF/08neQ3
	LvFh2MUfMQM+DrF2Fxv8EjqO0lHXDeLxPgEEnY8ZcZBBkV+NmqPakqDA9g0euxRZhuL06H8MJyrHF
	GCgbQgl9APg9MbBUIWTzTVCklvLxOtP9mgc17qcXAMbCEcIe3/NytlRUI7rTRNtVsj+xX3JMhq7kJ
	zgWxDO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7b8-00612g-AV; Thu, 10 Nov 2022 13:28:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7b4-0060yE-TI; Thu, 10 Nov 2022 13:28:00 +0000
X-UUID: 471cb8f788f543d9bb00372f99d74982-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=S8W6/VsKY9UBnV+rl6xlAuNJ77NeZ4guQ3Yk9GbydsY=;
	b=rgnvi34RUZgE7I1TKuea+OOjW01mxCfJArfXiccXJFrtnCcQoDcpFzeMrPjo/2uUDYfTqJ8dYLnS9fbT5KCF5J0e75m/2G7y944/SlNQYk2PT8ID7wV/Xs6/cZWSPrQfdSd+55WPcsTKE45mksLQQxRhFKcfTaToxjDhz0UhG4M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e280bbfe-5f23-4300-85e6-4e1491a72daf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.12,REQID:e280bbfe-5f23-4300-85e6-4e1491a72daf,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:54dded50-b7af-492d-8b40-b1032f90ce11,B
	ulkID:2211102127412RLBA9Q2,BulkQuantity:1,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 471cb8f788f543d9bb00372f99d74982-20221110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 409421687; Thu, 10 Nov 2022 06:27:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 21:27:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 10 Nov 2022 21:27:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
	<trix@redhat.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>, Tianping Fang
	<tianping.fang@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/3] phy: mediatek: fix build warning caused by clang for powerpc
Date: Thu, 10 Nov 2022 21:27:14 +0800
Message-ID: <20221110132716.12294-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_052759_006319_4D045BA5 
X-CRM114-Status: GOOD (  11.73  )
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

Remove the temporary @mask_, this may cause build warning when use clang
compiler for powerpc, but can't reproduce it when compile for arm64.
the build warning is -Wtautological-constant-out-of-range-compare, and
caused by
"BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask)"

After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
checkpatch.pl, due to @mask is constant, no reuse problem will happen.

Fixes: 84513eccd678 ("phy: mediatek: fix build warning of FIELD_PREP()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4 new patch, I'm not sure it can fix build warning, due to I don't cross compile
    it for powerpc using clang in office.
---
 drivers/phy/mediatek/phy-mtk-io.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
index d20ad5e5be81..58f06db822cb 100644
--- a/drivers/phy/mediatek/phy-mtk-io.h
+++ b/drivers/phy/mediatek/phy-mtk-io.h
@@ -39,8 +39,8 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
 /* field @mask shall be constant and continuous */
 #define mtk_phy_update_field(reg, mask, val) \
 ({ \
-	typeof(mask) mask_ = (mask);	\
-	mtk_phy_update_bits(reg, mask_, FIELD_PREP(mask_, val)); \
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
+	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val)); \
 })
 
 #endif
-- 
2.18.0


