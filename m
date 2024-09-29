Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5368BCF6495
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mnfjPfodqDw5EgjVHclvMeONT3nDh9xuYN3QzGdkxtM=; b=bGOxjAjiIJRge50UE0xE3z6ptP
	47H0wZ5kjWYI/wXGPir2EaP5MbPYSF0YsxaJSfFqhfMASHbT4ohWM+1E5HdGTB63RSCxdedPJPr4/
	fi8bh1NU2WvpPRhB1PmSQQnWXEW2eI0GB/eki3/BGo8JaYmHg8aSxl6ozY9ZIhf4nMKdSMJGls696
	TzbghN20vn/3b/cfnkaHls1V0YUuvggqdzoYHC2TcYlnvKPS0nG4hXvLkjYxFy6xzWTI4YzGJl1Qt
	krWZostK5wMn7Kwgzryr6Euw8Qx07o7Prfu7ivWaSRP+bi4STx9ejuKrHUnAggN4HCPbU3j0mqEJq
	LqcK6lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suzzd-0000000FHIL-1EVP;
	Sun, 29 Sep 2024 19:54:09 +0000
Received: from smtp-73.smtpout.orange.fr ([80.12.242.73] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suzzY-0000000FHHn-21LD;
	Sun, 29 Sep 2024 19:54:07 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id uzzOsWpetUr3muzzOsoFGG; Sun, 29 Sep 2024 21:53:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1727639638;
	bh=mnfjPfodqDw5EgjVHclvMeONT3nDh9xuYN3QzGdkxtM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bFPhXa2cn+9H9Hxm/lauaUgMA+xMIR4+9UiBbHItciK4dpQ7OPyq2ERYDgoKODNBt
	 LNsbBzCedHkcj2vPr6F56bYlpBvoHPRLyhjiKRBfHUvzsO8Sl/XTpMQ1vKvFXScSGc
	 3U8N6RPxrhPoQHjupH62N7gXyPQMgeg2qaTWtB5qTXBLBaHOfwB4g4b+Sn7HT7EU7M
	 DQdHf0bucNXPlYaFZImbCzib7y9h1UJ/8IYs/rCE4nf4Kv4Hi3vqhKidEG0D735XnV
	 nXevBZ2ZnRBI0tE6UeHDT1kQClGzN1TS6auAqInsPOuOkGgaLii6bnXRGiFmz8ecHi
	 93aF4Et4tFdqA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Sep 2024 21:53:58 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7915: Fix an error handling path in mt7915_add_interface()
Date: Sun, 29 Sep 2024 21:53:40 +0200
Message-ID: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_125404_955280_28C6E84E 
X-CRM114-Status: GOOD (  10.26  )
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

If mt76_wcid_alloc() fails, the "mt76.mutex" mutex needs to be released as
done in the other error handling path of mt7915_add_interface().

Fixes: f3049b88b2b3 ("wifi: mt76: mt7915: allocate vif wcid in the same range as stations")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index d75e8dea1fbd..bea8b77b1b92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -246,8 +246,10 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, mt7915_wtbl_size(dev));
-	if (idx < 0)
-		return -ENOSPC;
+	if (idx < 0) {
+		ret = -ENOSPC;
+		goto out;
+	}
 
 	INIT_LIST_HEAD(&mvif->sta.rc_list);
 	INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
-- 
2.46.2


