Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D138CC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782C020884
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZXhAkDd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZ7plkCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 782C020884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFrPazIGVdoIrNlSiacVyzmkNU2n4J0U6/aAtfqxDfk=; b=AZXhAkDdNmFIxD
	SQ7oh6pcAyneOTpoGfT/CQY2XtK3nfExgNHzjNgqdx3BCiboY+iR7keqXjkbHL2nHaGMI2HByzn5D
	0oIlzEFQttkTp+K/hmpf/X4nbAIS/LR8DdY7jhXMPPYUwhQ9txiAmfJjeeSMJtvTERfGLdBekVKXG
	CdTb/xBSyGhbYi96PSO6sJS89IO9bwwfo6ZpbMC2lk6ayxG5u6zz/xxuCBWmEyXRE9tm2QIsnC75t
	Ieviqwju/dtrUw0cRSWEc/iHIdej4ucF6MYh+WawK1kWOgQq7f99ERW8MkC7WSNtKI3GBmjjfKtWU
	Wsk6uVhFWyl83kLXexWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR17-0003zx-1W; Mon, 08 Jun 2020 23:17:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQuG-0003DN-Nb; Mon, 08 Jun 2020 23:10:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 243D4208A9;
 Mon,  8 Jun 2020 23:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657816;
 bh=5itkUDluYpaS3Zxz7oL2dZm1OCRzVTnguZY9d4Ovqcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CZ7plkCrPkDrRgea6NdYDVaUTu/XP1wglSFD+VvXneIOnMABxu4hKk3uJOcFLRP8i
 ea9XDisjhl/Tgdf8wAFtlKnTZ5ep3K+wv4z+zr3oAMeF+qd6NEA826f1wJnHqCviEA
 gVRyCgNyI3DjEOsbAZs0IfPFSjkZ6I8hWqGOIpT8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 190/274] mt76: mt7663: fix
 mt7615_mac_cca_stats_reset routine
Date: Mon,  8 Jun 2020 19:04:43 -0400
Message-Id: <20200608230607.3361041-190-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161016_898813_7BA74E6F 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 886a862d3677ac0d3b57d19ffcf5b2d48b9c5267 ]

Fix PHYMUX_5 register definition for mt7663 in
mt7615_mac_cca_stats_reset routine

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 8 +++++++-
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a27a6d164009..656231786d55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1574,8 +1574,14 @@ void mt7615_mac_cca_stats_reset(struct mt7615_phy *phy)
 {
 	struct mt7615_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
-	u32 reg = MT_WF_PHY_R0_PHYMUX_5(ext_phy);
+	u32 reg;
 
+	if (is_mt7663(&dev->mt76))
+		reg = MT7663_WF_PHY_R0_PHYMUX_5;
+	else
+		reg = MT_WF_PHY_R0_PHYMUX_5(ext_phy);
+
+	/* reset PD and MDRDY counters */
 	mt76_clear(dev, reg, GENMASK(22, 20));
 	mt76_set(dev, reg, BIT(22) | BIT(20));
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 1e0d95b917e1..f7c2a633841c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -151,6 +151,7 @@ enum mt7615_reg_base {
 #define MT_WF_PHY_WF2_RFCTRL0_LPBCN_EN	BIT(9)
 
 #define MT_WF_PHY_R0_PHYMUX_5(_phy)	MT_WF_PHY(0x0614 + ((_phy) << 9))
+#define MT7663_WF_PHY_R0_PHYMUX_5	MT_WF_PHY(0x0414)
 
 #define MT_WF_PHY_R0_PHYCTRL_STS0(_phy)	MT_WF_PHY(0x020c + ((_phy) << 9))
 #define MT_WF_PHYCTRL_STAT_PD_OFDM	GENMASK(31, 16)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
