Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2F5C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D34BC206F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NtUYTKys";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzWsWUxn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D34BC206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EUpzPkNedw3LyaP6AWY4eP6TideTGGFGWhMx6bnNSs=; b=NtUYTKysL2jvtb
	wvyi1lfIAN8IuQbKMPFgT1ps/n+ce121yYOYPknb33ye0zKlA8RzKWgT2M4xWHH26hKaYLSX3+7ou
	YwjisvTrGwp1V9OL098LV8rR5E264xwGGYKd90df4R7wgQPMcmN3p5qM9kbRrsfKNmMayAH5I+0+C
	wqj0pLm/Q+uu13OUbXVKvKVsbhCGLrkbJ9izQ58iRR5rrvplpgnmdkmK2VDX2Dn0RMlLGIhteaAp1
	ZumvU858JBh81lVYNj2JDcdAnP5FKwLddnNgwnnlEtaVStGY9oG/J7X8sDEGmda2SknlbVI4SGvyR
	EGskxGiWfUUdH79Na+YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzZK-0004nh-Cr; Thu, 02 Apr 2020 13:07:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzZI-0004n2-Nt
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 13:07:37 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16E37206F5;
 Thu,  2 Apr 2020 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585832856;
 bh=Bi6G1MBCsKgox0GNF9MhtgVmuYfRFKSdL7Jv3Cl+e0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VzWsWUxnUs1AVF7Z7EyPsUd2rIyR/b1wZU1i+iy1eGMXCnRfKGGcYttSM6HSeclW2
 h9Mh5agUdYVgXn65xKRUJoiFMVSj0AssgtLtsn2KThPyRS8dhurywXpvzhe4OcP40G
 rxCp+kTioE/WLQ0FcgBDF7IoZKMUSWPYb+LqxCUo=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 02/12] mt76: mt7663: enable nf estimation
Date: Thu,  2 Apr 2020 15:06:32 +0200
Message-Id: <8a0475040d343dd94b0f6ffc8ec343b8df63985c.1585832458.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585832458.git.lorenzo@kernel.org>
References: <cover.1585832458.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_060736_797672_08B57AB3 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable Noise floor estimation for mt7663 driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 16 +++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 656231786d55..5961650e7245 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1556,10 +1556,12 @@ void mt7615_mac_set_scs(struct mt7615_dev *dev, bool enable)
 
 void mt7615_mac_enable_nf(struct mt7615_dev *dev, bool ext_phy)
 {
-	u32 rxtd;
+	u32 rxtd, reg;
 
 	if (is_mt7663(&dev->mt76))
-		return;
+		reg = MT7663_WF_PHY_R0_PHYMUX_5;
+	else
+		reg = MT_WF_PHY_R0_PHYMUX_5(ext_phy);
 
 	if (ext_phy)
 		rxtd = MT_WF_PHY_RXTD2(10);
@@ -1567,7 +1569,7 @@ void mt7615_mac_enable_nf(struct mt7615_dev *dev, bool ext_phy)
 		rxtd = MT_WF_PHY_RXTD(12);
 
 	mt76_set(dev, rxtd, BIT(18) | BIT(29));
-	mt76_set(dev, MT_WF_PHY_R0_PHYMUX_5(ext_phy), 0x5 << 12);
+	mt76_set(dev, reg, 0x5 << 12);
 }
 
 void mt7615_mac_cca_stats_reset(struct mt7615_phy *phy)
@@ -1691,10 +1693,14 @@ static u8
 mt7615_phy_get_nf(struct mt7615_dev *dev, int idx)
 {
 	static const u8 nf_power[] = { 92, 89, 86, 83, 80, 75, 70, 65, 60, 55, 52 };
-	u32 reg = idx ? MT_WF_PHY_RXTD2(17) : MT_WF_PHY_RXTD(20);
-	u32 val, sum = 0, n = 0;
+	u32 reg, val, sum = 0, n = 0;
 	int i;
 
+	if (is_mt7663(&dev->mt76))
+		reg = MT7663_WF_PHY_RXTD(20);
+	else
+		reg = idx ? MT_WF_PHY_RXTD2(17) : MT_WF_PHY_RXTD(20);
+
 	for (i = 0; i < ARRAY_SIZE(nf_power); i++, reg += 4) {
 		val = mt76_rr(dev, reg);
 		sum += val * nf_power[i];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index f7c2a633841c..b7e25b91733a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -170,6 +170,8 @@ enum mt7615_reg_base {
 #define MT_WF_PHY_RXTD_BASE		MT_WF_PHY(0x2200)
 #define MT_WF_PHY_RXTD(_n)		(MT_WF_PHY_RXTD_BASE + ((_n) << 2))
 
+#define MT7663_WF_PHY_RXTD(_n)		(MT_WF_PHY(0x25b0) + ((_n) << 2))
+
 #define MT_WF_PHY_RXTD_CCK_PD(_phy)	MT_WF_PHY((_phy) ? 0x2314 : 0x2310)
 #define MT_WF_PHY_PD_CCK_MASK(_phy)	(_phy) ? GENMASK(31, 24) : \
 					 GENMASK(8, 1)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
