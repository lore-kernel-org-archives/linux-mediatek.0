Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C8AC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z93vs5MNpoShVM3NXCv352HhKZSF+mhz1gZ7jjrNYU0=; b=B1MrjTgzE4BlftN1D0DNZDdB9a
	mfSy3qgsNaF9+u2DCXeIh3XXlmyOb6Mt5r7t2/HVEH40iRH8Wyg+tjjG0T6SnYGeRiKq6LH1TJ9I+
	+85+T9mqXJoRLELpclB80/mSWD80fKIhGI8WFFYNhYFM1PIV3W4xe3VKE0w+8Qx0UeiJw0x5sE+/L
	UwaC3W4xcqTr744MhXRDmDL7WUm5F1bDvvcmAaOAdI+mHpwnwUt4Og2BwoR9gI6YwNq2XGbRykP4F
	9i2gQJqMnRJ+ZVNOMp9eKzLtd5ONKSvA5E+kfKxcFJa0mXuCG74fmYDH5E+tYj7wMB0e2Smk0yd98
	XgG8CKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRf0-00EaxJ-Db; Wed, 28 Sep 2022 07:39:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRev-00Eat7-IV; Wed, 28 Sep 2022 07:39:11 +0000
X-UUID: 82181fd88f0e457aacd4dcff8a937846-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=z93vs5MNpoShVM3NXCv352HhKZSF+mhz1gZ7jjrNYU0=;
	b=hbAjAo+YWwMpfyaSToJNHCbscGpWxM2yC/CA9PlRL2u5gohNBD5zWFk1Pcqg2kjuCC1qxXdB5zbBMWdRlGTjcPl3bShMUxARIk55lVKRbs3W6O8Lj+FFCKhqgd4EjufuyK8aGAVhx3KeiD/exJ39TVoGhFGREXvFaNmUOR+AEXg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:be45d530-5c26-434b-aae3-a230d1d09fd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:55b44907-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 82181fd88f0e457aacd4dcff8a937846-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2015680786; Wed, 28 Sep 2022 00:38:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 15:07:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 15:07:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH next v2] phy: mediatek: fix build warning of FIELD_PREP()
Date: Wed, 28 Sep 2022 15:07:46 +0800
Message-ID: <20220928070746.5393-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_003909_789243_EFB64D2E 
X-CRM114-Status: UNSURE (   9.12  )
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

Change the inline function mtk_phy_update_field() into a macro to
avoid check warning of FIELD_PREP() with compiler parameter
-Wtautological-constant-out-of-range-compare

the warning is caused by mask check:
"BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \"

Fixes: 29c07477556e ("phy: mediatek: add a new helper to update bitfield")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: v1 will cause merge conflict, change comment, s/should/shall
---
 drivers/phy/mediatek/phy-mtk-io.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
index a723d4afc9b4..d20ad5e5be81 100644
--- a/drivers/phy/mediatek/phy-mtk-io.h
+++ b/drivers/phy/mediatek/phy-mtk-io.h
@@ -36,10 +36,11 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
 	writel(tmp, reg);
 }
 
-/* field @mask should be constant and continuous */
-static inline void mtk_phy_update_field(void __iomem *reg, u32 mask, u32 val)
-{
-	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
-}
+/* field @mask shall be constant and continuous */
+#define mtk_phy_update_field(reg, mask, val) \
+({ \
+	typeof(mask) mask_ = (mask);	\
+	mtk_phy_update_bits(reg, mask_, FIELD_PREP(mask_, val)); \
+})
 
 #endif
-- 
2.18.0


