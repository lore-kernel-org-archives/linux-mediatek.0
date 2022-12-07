Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64A7C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi/s8C1eEMs6of3JA85kDoSQTJ/ep+T3e352nQtWXoA=; b=l8hKG/A4ihh/CWp5fbk2JnPhUT
	JnfLMGrpvshEYC47PIYdRycXwVFnTZNxpUtsOutHvxwRX1UilLogIDZqHcAmjTTaIDdxbdUX8Nd8y
	kCf7arARxiBhPcS6tRJZ/QhA5chsmNv/4r6JSROmU6tA25EGe/xJTQhydrh2dUNJq6wm4oDJdGQXz
	4wQtu7XRZiRNcW1+KUf8Zvp+zId7ovxQsrmCxemPWfYjJFhHcomfr2bnn9XU8duhP5Mqk8+RKxsvD
	pbRe0lJ+chR1GAbze7DXO/+kAr4anoBDmLDgOCx0ohB09JOxDvxiPuZB1HdMZ2qddFv0c/0a8ZM3+
	idEQwRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3Q-004SeM-Mm; Wed, 07 Dec 2022 14:05:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3N-004SWh-5G
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 14:05:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74B43B81DF4;
	Wed,  7 Dec 2022 14:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3ABC433C1;
	Wed,  7 Dec 2022 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670421938;
	bh=sRaak4KLeCok7dS29659RMJxhIRUiWs94IOmcA+/uIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqQ7bQNh5/D/kXndvbEeFCOeu36ZFkIWH3EF5Tj8kSR8+zqgDsz2RX004OgTgOZ7E
	 6n7yvTBECDl3wGu1SH28FQJEC1IlZXOSGHasY3hLSzHI1aSHPFScQuAuu6LUI7gEw4
	 KT/9Gm4WkxGAtTCMCm0TT/ZTDLft7UUJpZG79L+qX5i3HSUQLrpcaqmCA7cWPj1mt0
	 yM4ce/VtFomWtZg5oO/QDPo5p6vsinnHHGrAqYCia8AuHG4GQkdhST1O23em/tXiXg
	 1OU+mSv2ORwiV01Hj5N8zlppIPnLjG+pXYUi9CS+8SgBDuihtng30dakx1siWpwL5h
	 iUqFVcdVmnGHQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	leon@kernel.org,
	sujuan.chen@mediatek.com
Subject: [PATCH v3 net-next 2/2] net: ethernet: mtk_wed: fix possible deadlock if mtk_wed_wo_init fails
Date: Wed,  7 Dec 2022 15:04:55 +0100
Message-Id: <b28b55a639002a56b77c0651a4122ebede041936.1670421354.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670421354.git.lorenzo@kernel.org>
References: <cover.1670421354.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_060541_432872_A5553991 
X-CRM114-Status: GOOD (  10.34  )
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

Introduce __mtk_wed_detach() in order to avoid a deadlock in
mtk_wed_attach routine if mtk_wed_wo_init fails since both
mtk_wed_attach and mtk_wed_detach run holding hw_lock mutex.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 4ef23eadd69e..a6271449617f 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -577,12 +577,10 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
 }
 
 static void
-mtk_wed_detach(struct mtk_wed_device *dev)
+__mtk_wed_detach(struct mtk_wed_device *dev)
 {
 	struct mtk_wed_hw *hw = dev->hw;
 
-	mutex_lock(&hw_lock);
-
 	mtk_wed_deinit(dev);
 
 	mtk_wdma_rx_reset(dev);
@@ -615,6 +613,13 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 	module_put(THIS_MODULE);
 
 	hw->wed_dev = NULL;
+}
+
+static void
+mtk_wed_detach(struct mtk_wed_device *dev)
+{
+	mutex_lock(&hw_lock);
+	__mtk_wed_detach(dev);
 	mutex_unlock(&hw_lock);
 }
 
@@ -1497,8 +1502,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 		ret = mtk_wed_wo_init(hw);
 	}
 out:
-	if (ret)
-		mtk_wed_detach(dev);
+	if (ret) {
+		dev_err(dev->hw->dev, "failed to attach wed device\n");
+		__mtk_wed_detach(dev);
+	}
 unlock:
 	mutex_unlock(&hw_lock);
 
-- 
2.38.1


