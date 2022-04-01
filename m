Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C28C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZFSdYh+UxLfk2YuoKK1GD8ePhKqmS/TTHWDww7jUUo=; b=k3hRqrY0wYjAFO
	ko9JAwKjodO/vfzcoZSuiN2FsITxWyTdg5kDV4qpqzfacG1UvzRPKHFppogyhz3FoHg1Y9I3cMOpS
	GdpHOcx/FdFW35XhnZTN93EgvMSnN3TkxmNkRGGy/b+XakqipGBEE6OS44ZFnDbp0TYBo0U4XfbXU
	rfWglSea15VZdfzlsDlq4otZwRIBYXkWBLxLuT5KEoOkeX+dRM5POwCMAaX9toQzWO2OmCLo4CMYY
	jfCMs0eTVuqcmv1HMWQuUMvTqFKKEquo8kkscsXJRmdUh7l497pAnNpnnD9NX7XJ42zF6W2t9houM
	eTn3HnnYHGVpUQ26jE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIb2-006Dk4-7R; Fri, 01 Apr 2022 14:49:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naISF-0068qA-TH; Fri, 01 Apr 2022 14:40:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 116DBCE2590;
 Fri,  1 Apr 2022 14:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B30C2BBE4;
 Fri,  1 Apr 2022 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824043;
 bh=A+UDM1TEHilalJ8beCCwgyHiDJnZ7mGbfMSUawaUWNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Voj/MDdiQUWoBU2uoAZmbhQ12+8JBtQ2N7VZ9c3UpkBKJHoY3Z8blPq5580GMMjWV
 X7JgAIpmfiX3mlE8uMfnTpr2+wczv2ABlLMJZkNI/s6JmEd4bKPmP/BLqq6whbhDk4
 jSTEz9vHWdnMnYlxtFrqyV77R6CPPcqYDADdvgjZaVazxJg/su7HBjf5EmmTll37i+
 LQtDqH9pLYRIe192gi5n2ewsy89Ceem8SwN6zElc52va2CQtUY7vk8Yl68xJTrVoIl
 Jh9pFyGa77LFDOjA8tsm7CWQX5GNphMF/p6E0gS/gYh2Jy5Y5cQ3qZTlhgGva6EdDb
 h6nlZawDMxbTQ==
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
Subject: [PATCH AUTOSEL 5.15 61/98] mt76: mt7615: Fix assigning negative
 values to unsigned variable
Date: Fri,  1 Apr 2022 10:37:05 -0400
Message-Id: <20220401143742.1952163-61-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_074048_188137_52B979F3 
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
index f2704149834a..1f0507692174 100644
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
