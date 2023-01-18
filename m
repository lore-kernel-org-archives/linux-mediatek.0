Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECEC004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMsEjrNX6H23fsk7/ozyqr2EUputJ3iJ5LlAwuMnTaI=; b=VPw/paQoMYsSeqGqc4/it6Kizb
	s10f59DjPYcSd5aLIE0ZfUvJos1pjUXnhbx6RTsb7bcKHxgVxOD93yZDehn+ZL/ZTIskSogJaZwmr
	ZK7gWC8e2AnpZK+J3VL7nFRke3J1EXjIShcV7FMwtHsoJzrq2KzeR5Fk4b4MtvTW3xHyc90LTUTm+
	5v5Tuk1HSzyGclUXvRvjvVQxYRsYrgqblHTbPcvjwcC1Xg/wFa7c24LXQwOg8WpixV+SJNjrpwnpH
	RL9/UkTRjv669HCwWDC5HdMPAYrVH9X/Xnd+9hdi4Y82Z35Ipk1R10oMigzsmU7BidqpgOJcx8cGS
	ZOxU4FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI44W-00HX35-Qi; Wed, 18 Jan 2023 08:45:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI442-00HWqK-Fl; Wed, 18 Jan 2023 08:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RMsEjrNX6H23fsk7/ozyqr2EUputJ3iJ5LlAwuMnTaI=; b=bLFGU8Vx8+/dEqgxoWFo3YIyOg
	ZSACZZdbo9+ann5LSTRn+1BtkhdLYR4nHqQR19H7g9MC/S5lUHQk2Vf4Ws9WKQ2csEOtW+6Tsh6FL
	ILGfZPGtxd1SHvBtvWknPxJ1O5xPDaz8OQpvZVZ4ZRhEPaPP5bjNwjAdN0HlQ2rv8DiiS32/G0pUJ
	AhOng3MjIfsqAMH5iKWtD61h3Hm4KibZFtzEzbUH4X0q+GIrVAwr3hNMkKLS1Tih13oqO7de5GgvY
	LVGhKn457hcE0bqp7wLJ/IkAYcUMbiQ4vL6UrjAFHjUpEwT1qBv1cFhh51NpOdAfRYR8h4tVY6Fty
	mARki8yw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI43k-006D8A-2g;
	Wed, 18 Jan 2023 08:44:47 +0000
X-UUID: 4d019ac0970c11edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RMsEjrNX6H23fsk7/ozyqr2EUputJ3iJ5LlAwuMnTaI=;
	b=QQjbedCWEVP2lYXaCh0VZn5C03pLV4345viEjd/Zx0vNR7O5aNLCrGETqZDdSuI14iWM2pJA8gRI5CMlDHDbcUwEiaxkfH1X7ZAi3YkbTPA+WiEWplta2vXcdEjr9PaREhdlHrfDfjy77LrwOYjJkk5bnErYT1mb6TppC2/27Dk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:7368b590-ac84-4ae5-8631-314505269f4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:6c45ff54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 4d019ac0970c11edbbe3f76fe852e059-20230118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1811396783; Wed, 18 Jan 2023 01:44:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 16:43:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 16:43:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>, kernel test
 robot <lkp@intel.com>
Subject: [PATCH v7 1/3] phy: mediatek: remove temporary variable @mask_
Date: Wed, 18 Jan 2023 16:43:41 +0800
Message-ID: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_084443_682644_936F57D7 
X-CRM114-Status: GOOD (  11.81  )
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
the build warning is caused by:

"warning: result of comparison of constant 18446744073709551615 with
expression of type (aka 'unsigned long') is always false
[-Wtautological-constant-out-of-range-compare]"

More information provided in below lore link.

After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
checkpatch.pl, but due to @mask is constant, no reuse problem will happen.

Link: https://lore.kernel.org/lkml/202212160357.jJuesD8n-lkp@intel.com/t/
Fixes: 84513eccd678 ("phy: mediatek: fix build warning of FIELD_PREP()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v7: modify title suggested by Vinod,
    modify commit message and add link tag suggested by Nick

v6: modify the title
v5: no changes
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


