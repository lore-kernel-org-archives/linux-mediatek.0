Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D626C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353FF20842
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MC4a9A/e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/1c1OC0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 353FF20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcQ4YhEziSscBpOUF7wFkrAjABaqO7iM9fC98LsYHM0=; b=MC4a9A/eHHGc6O
	5v+qpldeRL+B4OT9MNLLIwG+x/V0Om4Ib/wAcyJsrZ+V6iiKrupu+2FR0WG6fv8vTnZYTBSlqn+IT
	yHkzG7iKKCzsmNAPeFBzo7D8q0PSkIS6FstQfuX5f4QiN+ZyegBeRtgzE7GD9ives7bYbJDe8BqTJ
	mEn60PiVRTJV70V7Kdp7ho6RkJ6v6Bn7HNaB2sBv8TcCPf4YFlx8s9lajF2lnILrfcCk0w64DwREg
	W9+1IhJnNXXu+mHc2RSpGvmHqNp/Z7JovbM3RcLZVtGU3etZEItHekl7Wq+QCtzMOUdQLQx1EYN4P
	qqjsOir1tQOhzFsSWvJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR3F-0005sI-3X; Mon, 08 Jun 2020 23:19:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQuN-0003rW-9A; Mon, 08 Jun 2020 23:10:25 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEEA6208C7;
 Mon,  8 Jun 2020 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657822;
 bh=mS6E5KdtOU9+7cFz8Yn3gX2S53udT9uaNWpGg0utQBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e/1c1OC0+TIplm/MdXHNey5q9LSCxYDT2AHVXg46J2PdHSe+erEFTdKnP1PEkJNJ4
 97jJATeWkq7SJNXqAsNxLKI8s+QQxPc0i5qyFkerhquFNwZC2afm9dEgGuFx33ROi8
 +HGV415XMb32+JvpiwCOVAI+2g8sNyBPS38An8vw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 195/274] mt76: mt7615: fix mt7615_driver_own
 routine
Date: Mon,  8 Jun 2020 19:04:48 -0400
Message-Id: <20200608230607.3361041-195-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161023_347205_DDC1FBA4 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 338061619185133f56ac17365deb1e75eaecc604 ]

Introduce MT_PCIE_DOORBELL_PUSH register to fix mt7615_driver_own
routine for mt7663e

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 0d56e0834bde..29a7aaabb6da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1526,16 +1526,20 @@ static void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en)
 
 static int mt7615_driver_own(struct mt7615_dev *dev)
 {
+	struct mt76_dev *mdev = &dev->mt76;
 	u32 addr;
 
-	addr = is_mt7663(&dev->mt76) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
+	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
 	mt7622_trigger_hif_int(dev, true);
+
+	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	if (!mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000)) {
 		dev_err(dev->mt76.dev, "Timeout for driver own\n");
 		return -EIO;
 	}
+
 	mt7622_trigger_hif_int(dev, false);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index f7c2a633841c..de0ef165c0ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -65,6 +65,7 @@ enum mt7615_reg_base {
 #define MT_HIF2_BASE			0xf0000
 #define MT_HIF2(ofs)			(MT_HIF2_BASE + (ofs))
 #define MT_PCIE_IRQ_ENABLE		MT_HIF2(0x188)
+#define MT_PCIE_DOORBELL_PUSH		MT_HIF2(0x1484)
 
 #define MT_CFG_LPCR_HOST		MT_HIF(0x1f0)
 #define MT_CFG_LPCR_HOST_FW_OWN		BIT(0)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
