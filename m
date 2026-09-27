Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F27BC98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TTonhnwGQ3c4+ryD77q2DmYJVEgRAWoW9sUOCsWdn8=; b=vgfJwiQHQ7h3QBr+ANvdEFebRD
	kKQxLD9T28lgEKqMlBMQkJCQThzaPc4YNhPgVyRd99HjSWkyPcqrqAItiFqhJYaZPyyXTteXyO+V1
	u7auZdUpkHa1L5y8cUY3sl07SqtJY8H7UXZNAX3yEM8Z/YB3KTuVZw1fgiEbRVrBc/xT/5qNyTqdQ
	AldN8me6HYlzEjL1KeJkP9KOkuZmsN0IznyPa8eKz7/25M2zpbd63KpgWBBLFdW/GRP4kEuwpAO/M
	5R2znSDaFKxDR9j6wI7goyhC6597tlD0aiOMP8X+Cl/ML+cxjSCwBKCbJpEVTDWr+sAgIDeAk5qev
	ePVGsE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8p-0000000Gs7n-3hb8;
	Sun, 27 Sep 2026 21:10:35 +0000
Received: from mail-vs2-f37.google.com ([74.125.227.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8l-0000000Gs6A-2glI
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:32 +0000
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5cf31bdea6cso472554e0c.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543430; x=1791148230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TTonhnwGQ3c4+ryD77q2DmYJVEgRAWoW9sUOCsWdn8=;
        b=II42SaytUlbUiAIKgzRx3xI11xeIlXksE3JDsbNEH+GU5GJ5lgqo8jeobfJcRhWW0k
         Tthset+fRj/DJ0Zziw6poy5SbwdYMiubClfOZPhkX2WohplGSVElFJNFeG1844urMI0Y
         7K2hpRNtxOO1gyyGSxBxzcxSJZeN7xSTuQeQ9zlfhGzWuPHT9H/E387fAcBLqqRFxsCj
         M4sLnOeElsEeUvyy9695It/FwJiX0+gqluM0CzRFWSyvxbIAj6nKnuJPacSP/KZ5yVTC
         3tKjfjsHSrgpg0LhgPP6Ikatm/3otR2Yt0sxBIgKRnNbiwD4mnUZ0uOdNAZSSUq64N6h
         vs9g==
X-Forwarded-Encrypted: i=1; AKwUvBzflPmgp8whZqZoli66g+p2E4Cpd5rRrH7HsvKTZIn4pgFGGi9MOtTRv6EMZoSYdl0WUeCu9yraI9edfQ2qGg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL+haE9egSpgDog5Km/p438dgSSSf6t3Gtenw8J/V5WkmZuRKum
	9Q6HJZjzrdmqS35XeIisXiM9Nw27axri82OQn3stOXqkMh2xzLZHfawyTqDi46ms
X-Gm-Gg: AYBFou1QYpC4eJmkaRA+FsVS/rDmQIrPGLgN4AfQ3nXAkRpouw6Zk54Nq9COtHwyYJb
	biAvl1/raaVclNoXnlQInP9JqAA66YncC37Q/EeKet9nguWww/ErtmL89oDyK+UKbj1TLJPXLVd
	bypLT/xL5cSfWjrjtsf9XfI6IKx0NtJsw86iCkHV1AiLafF/oLn3sgNPnJI+Dei5gsRwCHRRzUK
	/CU3OA22RbFgr448G2Cu+PVF3CxOCmIK7l2p7AVkupkgIffvTg+VcUFSkZHlTfPia/vJQOipKEc
	qWPWftSk8i0dxmwdph383mW2L7OokY+QXmP4eYiU0pPKpazel/7nsyq0qkt+gK+dU9RdVgKsj57
	bJt4aYqVCGxiAYA27VFjxqJ9E50Xcx/iAlkgSoNb9AWpaFPvvvrhFiL3xNP4yq4XEwVFDuWsFm/
	Oak8xDfMobSAgCUvqR9J4EPwdsBokk8C0B1XmFhOkCjjRIKTI6n619YP/BMnI3QvoA/btqVL4EG
	B/H3serf7ESj23LYbuAfW6kXFuVy2f3oPDwv9QjH9gUJJzwmjYuhasTFfqj2oPYL25/Gw==
X-Received: by 2002:a05:690c:660b:b0:8a4:b228:26bb with SMTP id 00721157ae682-8a64860b2c2mr55294797b3.8.1790543039743;
        Sun, 27 Sep 2026 14:03:59 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:58 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 11/23] wifi: mt76: mt7925: do not disable RX NAPI twice on unload
Date: Sun, 27 Sep 2026 16:02:53 -0500
Message-ID: <20260927210306.737669-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141031_694068_0D63B410 
X-CRM114-Status: GOOD (  11.55  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925e_unregister_device() disables every RX NAPI and then calls
mt792x_dma_cleanup(), whose mt76_dma_cleanup() disables them again.
The second napi_disable() spins waiting for NAPI_STATE_SCHED, which the
first one already set and nobody will clear, so module unload hangs in
D state and the module refcount underflows to -1; only a reboot recovers.

Drop the redundant loop and leave the RX NAPI teardown to
mt76_dma_cleanup(), making driver hot-reload work again.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 24585c992ff5..09153d624fd5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -40,7 +40,6 @@ static int mt7925e_init_reset(struct mt792x_dev *dev)
 
 static void mt7925e_unregister_device(struct mt792x_dev *dev)
 {
-	int i;
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
@@ -50,8 +49,12 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
-	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+	/* Do not disable the RX NAPIs here: mt76_dma_cleanup(), reached below
+	 * via mt792x_dma_cleanup(), disables them as part of the generic
+	 * teardown. Disabling twice makes the second napi_disable() wait
+	 * forever for NAPI_STATE_SCHED to clear, hanging module unload in D
+	 * state with the module refcount left at -1.
+	 */
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
-- 
2.43.0


