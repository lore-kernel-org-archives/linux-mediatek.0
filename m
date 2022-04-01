Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3io+RvSPmvOIukYXkfqcR0F83cGZNSF4MLMnXz45Ms=; b=A4YYzK9mgjL9df
	ccIwyd84nhlc/6RuI/Fol+xAXVB1b6cD4kVukBETE9KL59ueFIXAe+sTHDT9RN6Jm4l0XuR6Y+Si8
	RJKzd6BCfiR+X66SWLHRh1WMYfQLLv/RSAHav6C7yjJF/3u3rwXzsonnW02ZKO2t40b5BOAg3cAZZ
	yPXyjjKD08OqZNRAuPtxHVhj3yQMKrN2sT685UrIgujbVnjjl0zneITqCr7j3qdXO+WNudkQ5xopu
	bBHsAtcdx0Ndtg4u9iRgp5N5cj9rogUEvKnCenS36RrGAOeOBJwq+jv2WKr3qMj1EpnVbdmDBnodE
	FVqqcbQFwSLmuIV224zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIVN-006ANZ-5K; Fri, 01 Apr 2022 14:44:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naINx-0066Y2-Q5; Fri, 01 Apr 2022 14:36:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA34360B8C;
 Fri,  1 Apr 2022 14:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F68C2BBE4;
 Fri,  1 Apr 2022 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823780;
 bh=8CFmazhXImik3BIUnQsKZe9iS5ZceAaTZVntSr+XZt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jYhjXhVs/QdWQ+CrsqtZ0BYyj101ZaKvlC1YtnX43Q7WsEDMIheq3z7MH+anTH+Od
 5llK+Y/Y6AMkSuciR5MZjomHOMmtJjMPgF77prdBI7+h8+oTjH018pZTRZMtzGQr1R
 wlA9DMpWQmBNIehGP4rDJU6LORznl/DF15sEl6pkWOx+kk0+XOKJcRFSbEX5X3jHgL
 MlyHE0DImaktGDuTsLoKFiNEbN1HwcEx6U4dY5I08QKa/djngY+OIuVcJ6fyRG5+O0
 57G5m4YqBVPGNhd75AzOUUdNo0Gj92XPRR5ql+98lSW9KalBxNMK1wH8q9FewNj+2z
 Dh3nKfovjMKig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 xing.song@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 072/109] mt76: mt7615: Fix assigning negative
 values to unsigned variable
Date: Fri,  1 Apr 2022 10:32:19 -0400
Message-Id: <20220401143256.1950537-72-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073621_915741_A7C6F403 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yang Li <yang.lee@linux.alibaba.com>

[ Upstream commit 9273ffcc9a11942bd586bb42584337ef3962b692 ]

Smatch reports the following:
drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1865
mt7615_mac_adjust_sensitivity() warn: assigning (-110) to unsigned
variable 'def_th'
drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1865
mt7615_mac_adjust_sensitivity() warn: assigning (-98) to unsigned
variable 'def_th'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index c79abce543f3..0089c8b29b7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1732,7 +1732,7 @@ mt7615_mac_adjust_sensitivity(struct mt7615_phy *phy,
 	struct mt7615_dev *dev = phy->dev;
 	int false_cca = ofdm ? phy->false_cca_ofdm : phy->false_cca_cck;
 	bool ext_phy = phy != &dev->phy;
-	u16 def_th = ofdm ? -98 : -110;
+	s16 def_th = ofdm ? -98 : -110;
 	bool update = false;
 	s8 *sensitivity;
 	int signal;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
