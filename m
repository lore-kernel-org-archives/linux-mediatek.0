Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB533C30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A4X3RVWF4rjn4rp6pZS1mnQHtxJgZ3taz/52O8AUygM=; b=J3psFy3+zvlNTdJxgVzpRW5rAz
	PT2CgptYFUladmMfacS80zsaNDYQMOChuhi9FXc8dR7KFqTQ1ER5zgg5cO9QgvDq2yFbU2zxdWyRZ
	GTiWZlbOdaNswxAfedPsPFjxsxMpPj4ddPoowRC3Ab49G1TA2RIGqoecC6iPr9KCJYoJGYtvrs2yN
	n5BbqzaqjksAJKgW7Ah2p536Hfl9/Arc9cW+8tvUk8Gc6J58ZLiPq8Y9Q8B7+fPYYnpgzp0mpLQ+b
	rA6f/4XLjFzJmRjQDKjjwFp3FW3oEhHQLSO/92j6dYjrDwykGIMPXLptcH2lvJCZorF0WjBhf06c4
	P7ToD1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOx7H-00000009jUD-3aEL;
	Wed, 03 Jul 2024 10:21:35 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOx73-00000009jLq-18KJ;
	Wed, 03 Jul 2024 10:21:23 +0000
X-QQ-mid: bizesmtpsz4t1720002040t6vk97a
X-QQ-Originating-IP: n6zjRwGAKCMFCZ6mbmsgCHh7bIUV/Bm23uhF1VR3xxQ=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Jul 2024 18:20:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3367246597831120100
From: WangYuli <wangyuli@uniontech.com>
To: kuba@kernel.org,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	guanwentao@uniontech.com,
	sergio.it.consultant@gmail.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] drivers/mediatek: Fix some mt7601u vendor could not connect
Date: Wed,  3 Jul 2024 18:20:31 +0800
Message-ID: <E552B9CD8228F9A9+20240703102031.74932-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_032121_758315_113BBAA0 
X-CRM114-Status: UNSURE (   8.66  )
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

Some mt7601 devices cannot establish a connection properly.
This patch fixes the issue.
We do not know why, but it just works.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301/comments/52
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301/comments/53
Link: https://github.com/kuba-moo/mt7601u/issues/64
Link: https://www.mediatek.com/products/broadband-wifi/mt7601u
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/mediatek/mt7601u/mcu.c | 1 -
 drivers/net/wireless/mediatek/mt7601u/phy.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index 1b5cc271a9e1..15751d11b4dc 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -446,7 +446,6 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
 	mt7601u_wr(dev, 0x94c, 0);
 	mt7601u_wr(dev, MT_FCE_PSE_CTRL, 0);
 
-	mt7601u_vendor_reset(dev);
 	msleep(5);
 
 	mt7601u_wr(dev, 0xa44, 0);
diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wireless/mediatek/mt7601u/phy.c
index d4cd2215aba9..f3c14a1552df 100644
--- a/drivers/net/wireless/mediatek/mt7601u/phy.c
+++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
@@ -589,8 +589,6 @@ void mt7601u_phy_recalibrate_after_assoc(struct mt7601u_dev *dev)
 	if (test_bit(MT7601U_STATE_REMOVED, &dev->state))
 		return;
 
-	mt7601u_mcu_calibrate(dev, MCU_CAL_DPD, dev->curr_temp);
-
 	mt7601u_rxdc_cal(dev);
 }
 
@@ -1160,9 +1158,6 @@ static int mt7601u_init_cal(struct mt7601u_dev *dev)
 	if (ret)
 		return ret;
 	ret = mt7601u_mcu_calibrate(dev, MCU_CAL_RXIQ, 0);
-	if (ret)
-		return ret;
-	ret = mt7601u_mcu_calibrate(dev, MCU_CAL_DPD, dev->dpd_temp);
 	if (ret)
 		return ret;
 
-- 
2.43.4


