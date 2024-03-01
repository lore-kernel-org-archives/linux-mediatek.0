Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914B8C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zyCBaXUAE5a5edh6bvFxtATvJHIPBJYNND68hadfLf0=; b=2x/3DLgFineK9vawQ+4eY1Z19O
	VN2WWEu9abAdepWM4rArsbdYk6K1aF0hn1TxxzigRnUoXqfLH3G5GtIwRYhhpvBKEAA5tGLEVnskz
	z6SSFH6tS/hVaLG4pGQal6JWHSil7GAAAfDXd3WUhl6YDkXXmOYcZSDln/xHwUA2FA8KA+CV1ellB
	CS4HlDdLUQYiV2s/gSXlodjhZCxkZU0wTg6utyzu6uGn13ZWik0ZMajMhC3u5i4U4cy9pBYpecdGy
	of0FH0NOEd6XK1coqY1iTFtdQN6FDnVCYU+w7jjLSUEBO8+XwDL89+gcBsUkyjBYv/OhhfFK9tyTT
	cdDoQFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg479-00000000l4r-0fza;
	Fri, 01 Mar 2024 14:43:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg474-00000000l2A-2K2v;
	Fri, 01 Mar 2024 14:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709304229;
	bh=g/5FdFmANw8vfKyQblOhb3dPtLnfPxgu5rTqDPLM/k0=;
	h=From:To:Cc:Subject:Date:From;
	b=xxNTTc97xWYp4JHtRwbQppAyuiFMXatZr52S8x9U/4TFPZ1ascmVK8vAU4mjYEzBq
	 Ykt+7E/MR8BSvG9PeoGYfiaOMmtqXUhN/4DXG6vrhD+soagLQbiuEmmdy+4r0lrAZO
	 RAkqLMeNDa2bZHflQJJ6NLEfW2xGoyaR/9g0V7Ag1l3STfFDbmhVYpNDer3cyPAwAX
	 pxzr8htRsrWFkVP7HF37kkPIkduT3wUHBMbuyru+2XH4Qwl94k/OkkvE6cjznHaxCa
	 be6nP4OuhB7n7xer/eWCg3+KKmNflNZMbl9Xo6uoH8Ej7o265Ya7KFGXe+NvmujkLp
	 7TQEbUwPHkSdg==
Received: from localhost.localdomain (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6DB837803EE;
	Fri,  1 Mar 2024 14:43:42 +0000 (UTC)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	kernel-janitors@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: connac: check for null before dereferencing
Date: Fri,  1 Mar 2024 19:44:06 +0500
Message-Id: <20240301144406.2808307-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064350_760671_A7F5F8C3 
X-CRM114-Status: GOOD (  10.63  )
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

The wcid can be NULL. It should be checked for validity before
dereferencing it to avoid crash.

Fixes: 098428c400ff ("wifi: mt76: connac: set correct muar_idx for mt799x chipsets")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index af0c2b2aacb00..7af60eebe517a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -283,7 +283,7 @@ __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif *mvif,
 	};
 	struct sk_buff *skb;
 
-	if (is_mt799x(dev) && !wcid->sta)
+	if (is_mt799x(dev) && wcid && !wcid->sta)
 		hdr.muar_idx = 0xe;
 
 	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,
-- 
2.39.2


