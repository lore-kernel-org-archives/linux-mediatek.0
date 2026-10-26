Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27861606A328
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pPUSGFZd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BonthFNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=; b=pPUSGFZdnPZLSw
	EHHSLuzmIt1/gE5TNDCwNL+8vhi/zmPZAMAg2R0JhV06vI8J1V7oT3RQ0fuoeJFy1CLcp1kpnuGYn
	5rPR9ilnapd4atj60GUo1vLiMam9FFMzgBkkumI6qOi8xZvGbWdqkZa/WmPKwpbyRiGiuC8iKLuXs
	0KNUH1PfFC0G3qgspdLkiGC3NiWft6QqojEMh4ccn1Tn4F522ZGNJBRwCJ7QzqOuaMATzWDgoJIFj
	PKwEbkjLUsd1Q3RVEYaoVpFsgZhQu6+rAsEUeezASWaL4NkEQyjLnx5sHwiO1i+PDk59REjCh823x
	TdRFPfcHaGWkeGgfrDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5q-000000038Um-3Smp;
	Mon, 26 Oct 2026 19:10:50 +0000
Received: from mail-oi2-x08.google.com ([2607:f8b0:4864:32::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ5n-000000038QF-0AtX
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 19:10:48 +0000
Received: by mail-oi2-x08.google.com with SMTP id 5614622812f47-4b94bb43008so301433b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041846; x=1793646646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=BonthFNXR/e3ra+/r8BgFJtrF1bTzw5p2h7JdhucK8y/CG/I/XjPpQ0mLFEgPSu8aS
         LHgx4RNqa2651I2KEvjYRYrocRO0ieGPq53+GjxFhLvFA/sW+OGNw+ACAaUQ8rzbw779
         iybKb2IwHJz6ZRMFR64dQByb98kfQSP4PxlP9ums+agBmDFldVzOqBZbS6shXuW0iSGN
         Ix+eGDTHjwOPl1tRr2Na+OCCb7tzsXgvlR8ub3fNQaL1dDIgzRpTocBzAkHv2ZperU81
         mlK5sz4PdUhMoi14mmz2104je+00XgP3PVkqw78HJl6wyRQOCnkTo9zqA5E++cKPyJ/P
         GTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041846; x=1793646646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMuTtuJ1h4xjmqX6Q6LPbxG38lJtzTTle+6VtZKNkrY=;
        b=UxaNQsrg+jQmOflPvcSw2AKWMKmqAJUybcLg3cZD+t1Dpb6qzGt8e/319Fpbq20/Es
         5iQQ0A2h7q2XiTBwe4FGF5ibcMj+ImM7+060NTiaGRJ5CdHwG14NIsJJyhTpFR086nFs
         MUVK4MCvcQqvX+B6UF//R8lDJcBut7J0FrCG2uajV0mEunBrKhs9ltn6GxC+ko58syx8
         0ZLjWG7OgJ9aPHEjPjDMrTB6TBWDWm9RrJb8/hKdLLm/wghGmRpyoLbaOYuTh/YqwSwi
         /6IFT89RQeqNFz/u8Pwk1gDqNG2CpTm5jG+MDQOk3YysbUijUJyvIh0l+Ij4zf+coVG9
         cAfw==
X-Forwarded-Encrypted: i=1; AKwUvByeDDzm6rgpnD2sGqWDELiMvckUsLh80dVcRJ8qxlLcs+Qjdp9m64yeLeBo4OxzM98mXHsf1a7c7AWyQNAJ6w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLqWdvlOopmRDIeD0boCDZwg0i9t/G2PhLdKown/b51KicsXqNp
	+GecFztSISFsydpz47ECDJK9oOULfRu5RBr04Vp/bOhAnQryWRx0WsYC
X-Gm-Gg: AYBFou0qd7xCbZD3nF1tVWxOitq2r3RNgP0AnCoar+x8BYASjlcMWb2Ennex/CDh020
	bKb5A6vN361u69fNebk1Ki/Fko8qi447yxU1JVRV3zFQb85kbYBERkZSFPd9VFKPaZlmnE3VA2W
	1lfz9n82kay2M79WKtg62tQXUOja3i5CI4/DeuOrzOGUGjEM4FsTEEjFKtG/C3BJKMA88N0Mqp1
	5StTmGPi0rS2eHRxL8J39e3Cyo0sDmDb+c+6H2AxpigY0Vi6SUwf1c8ndUBnEFPs+SZlWR4ps/B
	eIcFSSjDq7cZE8IuG96bHe7EbxemkZWZmOLPN2B1DxXLe/Mr9eMmB5Hbtp1svJu6EvQV18gPyzs
	dJEVhsuOsVL9fDL1vs07tIUBQoDNugZCbG+nf+i2gHxh06BjF65F7dle58X4TBB3tRemjIDOXzE
	J0e7vivrfcQP5LQ5JFdeOfQlTM5yaXs6BOx3AnP1PeNpgWe4eonz0U4x7+AIwsYw7O07axeUPec
	PwL1OR2b468VZuFwrkskj4Osxf1vemUDR6fZX6PtIi/Ekhfq9kzHpcvr28+msA9b1mtegKFnUti
	OyebcU2n0NaHbE7ZIQKzmzN/IVJ/elHJxkn9vAHLFJZqxHs7gerzq+xtuDxxqu7hyM8=
X-Received: by 2002:a05:6808:1919:b0:4d6:90d4:6bc with SMTP id 5614622812f47-55c002d9eb8mr6575517b6e.46.1793041845770;
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:45 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:10:37 -0500
Subject: [PATCH 2/4] wifi: mt76: mt7615: wait while Bluetooth downloads the
 MT7663 patch
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-2-944b1f7e63a8@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2027;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HkEhUCJzkwct3RuygSMeROndtW02Wv2ZhGyJ5rVshHo=;
 b=Xp3Ukesylfb4khPHpZ11/Jn435KT1nrvFR8ZhqyM/mUHsf6//IDNqy25niqgUN/TogKP5/5MO
 H4QgjZPCBcVCwSr69a0/W6h771CNP1sQjSp1Qa2GvYgSEJiwTO2+/Pa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121047_130420_9AF4B027 
X-CRM114-Status: GOOD (  14.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT7663 the Bluetooth SDIO function (btmtksdio) shares the ROM patch
with Wi-Fi, guarded by a semaphore in the firmware. When Bluetooth wins
the race at boot and is downloading the patch, the semaphore request
returns PATCH_NOT_DL_SEM_FAIL and mt7663s gave up:

  mt7663s mmc2:0001:1: Failed to get patch semaphore
  mt7663s mmc2:0001:1: failed to load mediatek/mt7663pr2h_rebb.bin

Retry every 100 ms, for up to 5 s, while the semaphore is held, then
find the patch downloaded. Tested on an MT7663 SDIO module with
btmtksdio built in: across repeated boots, whichever function downloads
the patch, both come up.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 152b75178b27..e5c2ad5fb458 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1241,7 +1241,7 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 {
 	const struct mt7615_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	int len, ret, sem;
+	int i, len, ret, sem;
 
 	ret = firmware_request_nowarn(&fw, name, dev->mt76.dev);
 	if (ret)
@@ -1253,7 +1253,17 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 		goto release_fw;
 	}
 
-	sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+	/*
+	 * On MT7663 the Bluetooth function shares the ROM patch, and the
+	 * semaphore is refused while it downloads the patch: wait for it.
+	 */
+	for (i = 0; i < 50; i++) {
+		sem = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, true);
+		if (sem != PATCH_NOT_DL_SEM_FAIL)
+			break;
+		msleep(100);
+	}
+
 	switch (sem) {
 	case PATCH_IS_DL:
 		goto release_fw;

-- 
2.55.0


