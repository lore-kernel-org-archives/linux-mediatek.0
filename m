Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB11CC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v2NjfL8vKFIp+RYMSsu/KombmxM79y0wpYBAxMatcPU=; b=ddq96RwRzB23AsHNEZpVG8Eqal
	F7Uf2lWiU2k1yBkeJ2OTDbBMFEflYL1IESaBPVbn5WHCupcisuP5HcvYpYkBNhauCKsYE7HE5fkO4
	dTq/dudniX69IK1DdNWe6PfbtLv8mvPwnlnF0X7zPsq0s74Hnc8JUaFruP99xBnkZIPCGq395NKjH
	5Chmp4d4f27pcz+xoWpzBs55RQoST18mtr3gJTv7qef1HlBKHKdibLuoaB4dKXlVgtOCxndwWtb8X
	1ncCtxyTA6l13U/OcU2SU/AvCNnENBxeNcOpcXUAEqVIlnLg1aO8diKwc4T4+52x+C1GOpdwSDp0N
	9nrZhweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okJxp-0089Q4-L0; Mon, 17 Oct 2022 06:51:05 +0000
Received: from out199-4.us.a.mail.aliyun.com ([47.90.199.4])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okJxe-00892b-4q; Mon, 17 Oct 2022 06:50:56 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0VSIvXR9_1665989362;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VSIvXR9_1665989362)
          by smtp.aliyun-inc.com;
          Mon, 17 Oct 2022 14:50:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: nbd@nbd.name
Cc: john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] net: ethernet: mediatek: ppe: Remove the unused function mtk_foe_entry_usable()
Date: Mon, 17 Oct 2022 14:49:20 +0800
Message-Id: <20221017064920.83732-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_235054_467761_60A0686B 
X-CRM114-Status: UNSURE (   5.65  )
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

The function mtk_foe_entry_usable() is defined in the mtk_ppe.c file, but
not called elsewhere, so delete this unused function.

drivers/net/ethernet/mediatek/mtk_ppe.c:400:20: warning: unused function 'mtk_foe_entry_usable'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2409
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index ae00e572390d..2d8ca99f2467 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -397,12 +397,6 @@ int mtk_foe_entry_set_wdma(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 	return 0;
 }
 
-static inline bool mtk_foe_entry_usable(struct mtk_foe_entry *entry)
-{
-	return !(entry->ib1 & MTK_FOE_IB1_STATIC) &&
-	       FIELD_GET(MTK_FOE_IB1_STATE, entry->ib1) != MTK_FOE_STATE_BIND;
-}
-
 static bool
 mtk_flow_entry_match(struct mtk_eth *eth, struct mtk_flow_entry *entry,
 		     struct mtk_foe_entry *data)
-- 
2.20.1.7.g153144c


