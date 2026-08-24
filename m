Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80EBC5DF8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 02:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8j7/FGt0oFHCAupBVOrQ+nukdA+Ej2PxRli8y7TFGPw=; b=BvGFjjzQqYm8efaSxt5tcXdmAI
	w7PLEzOm9+UdtUB2uSa0NhmnzUEFDIDxQeof2XLjupVRcrbHYbd7m7tv4F21laMf+vBCDbK8bWdb3
	FrOffyy4MgwDM753YR0OBxnA4gI9leW0oWHrb4DwSuv5aXFAtaSIadLJIgqnZCnV/LogkCvj/qNYs
	tdQz3Nuwvsy5lnxSMgi6obrLVHAs/HpfJ0FNwOazOgk4RGyO+flAW5wIQQBz/kFGBbh4A6swT1Fel
	GTbQrq7vN5uodfPCA4YOExLOKWhNDqGm/0OLeDW2xBovm//cjTP0S0+GBLFiLpgdEGZ6pdqnZa/NC
	+TGIqPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKDH-0000000Flb7-14kj;
	Mon, 24 Aug 2026 02:15:03 +0000
Received: from out-121.mta1.migadu.com ([2001:41d0:203:375::79] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKDD-0000000Fla4-2XH0
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 02:15:01 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NtQ2IOM/Mh5R17rSUOh8SsBc1MqYsMk2h3KzjPHs0PE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787537693; v=1; x=1788142493;
 b=wQVvXueOFLtDN5Vz2tgoyaSRzYAX7FfBDKUOiijLrQlo2B4jI0dhYuab3bIgZezb0devHpaf
 8ONXFs7as3ZARCG/vhHg2mxL52GZlfBk9BR9XRzM04jrRUYlAxcprZSyp1kk9GYUnV9DyaHQKSR
 uxGLG0tcaX8dIPAVqwNrobIo=
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from localhost.localdomain (116.128.244.169)
	by mta10.migadu.com with ESMTPS id 9bf3271d94a12da4;
	Mon, 24 Aug 2026 02:14:53 +0000
X-Mizu-Trace-ID: 9bf3271d94a12da4
X-Migadu-Flow: FLOW_OUT
From: Yi Cong <cong.yi@linux.dev>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Yi Cong <yicong@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt792x: fix negative errno truncation in offload capability
Date: Mon, 24 Aug 2026 10:14:29 +0800
Message-Id: <20260824021429.43761-1-cong.yi@linux.dev>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_191500_020031_8DBA6BE1 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Yi Cong <yicong@kylinos.cn>

Returning a negative errno as u8 turned -ENOENT into 0xfe, wrongly
enabling CNM and NAN caps. Return int and default to no caps on error.

Fixes: e8a264ccd2de0 ("wifi: mt76: mt7921: move init shared code in mt792x-lib module")
Cc: stable@vger.kernel.org
Signed-off-by: Yi Cong <yicong@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 0ad33f74c2285..297c8a9f41ba3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -857,7 +857,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 }
 EXPORT_SYMBOL_GPL(mt792x_init_wiphy);
 
-static u8
+static int
 mt792x_get_offload_capability(struct device *dev, const char *fw_wm)
 {
 	const struct mt76_connac2_fw_trailer *hdr;
@@ -926,13 +926,20 @@ mt792x_get_mac80211_ops(struct device *dev,
 			void *drv_data, u8 *fw_features)
 {
 	struct ieee80211_ops *ops;
+	int ret;
 
 	ops = devm_kmemdup(dev, mac80211_ops, sizeof(struct ieee80211_ops),
 			   GFP_KERNEL);
 	if (!ops)
 		return NULL;
 
-	*fw_features = mt792x_get_offload_capability(dev, drv_data);
+	ret = mt792x_get_offload_capability(dev, drv_data);
+	if (ret < 0) {
+		dev_warn(dev, "failed to read firmware offload caps: %d\n", ret);
+		*fw_features = 0;
+	} else {
+		*fw_features = ret;
+	}
 
 	if (mt792x_needs_cnm_runtime(drv_data))
 		*fw_features |= MT792x_FW_CAP_CNM;
-- 
2.25.1


