Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58C606A330
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycJUNptG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pgZv5fz4JauIRnSeskFB3jlJVm7Slh3mCCf7c9hqyD0=; b=ycJUNptGvtY1FC
	bF4vkCfuWnt/30xoVR0Gi/cR6d9ic12VbPE49gxL9fehpGC4Fc1nmUqJgVH734mUDDW2xzIdObbCV
	V96Y80YDayodtlw2BSE1r9SpVEWqGJ6RN6durNU6rf+fzKdzaZMFElACeHutmPqQ7DqQ0wENypLbS
	2IRFYbc5TmZtH5wh5E88RfnL8JCXrjaMbd4f+IILwaOzWwAwodoBfxyq7rH0x5c0OIawENr4ZjiHN
	eTLj/jCzLx+tXyJlHHBXejwKJgSNyjARW2VI/ubx3/bXANUh8qYM8GPMPaPa5IemByf+m92yuu3Bd
	q0w7yx0dvL8ncwTuFesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yb-000000049Te-3WX7;
	Mon, 16 Nov 2026 23:19:05 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yY-000000049SO-48L4
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:04 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so6415971a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871142; x=1795475942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgZv5fz4JauIRnSeskFB3jlJVm7Slh3mCCf7c9hqyD0=;
        b=PlNmTFSpkDeYrklbkofFUbJ1ONGWkj67ds9qlkt6RJZT8vRzqCVUZTRnzToJ1YbcaX
         0nnBBLW4WqUXl5+wh/co7ljT+WwZ025vxJ1oAD8wW/TygDVYk3OwuniAtw793cRWdpZA
         +3M9mR5zaO/OyyF6ot8mmL3jTviSTHSL3sHgEuS/108irsFkQFNKMdNgRek+Yz/O0dxZ
         JQFJWctWDgAmJSxduLcjeESoPV9RpRSo5M2Rc5mwc/hcOqHfLFtaSu5Kvw1+tdFQye//
         0kzTdXr0Gnv6XBEBOTr6p/NiJK4iLcdr41PAEksYizVtVVVv1pWsGH70Q0Qd4RXRWqzU
         ZlYQ==
X-Forwarded-Encrypted: i=1; AL+hErFjMonSe1nIbWp4I6Z4bc+JGnFjQz8r92jUOehjv22VIF453M1+ptx00T1Xs1AbAxv8nqbJK9aXBtlNJkCy3A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8IIPmwTDnA6sPwjEvQlDjkWLM4fouckHX4qkmtLxRPs1LxR0Vk
	zT8/7rQzphB2LQCJNFmnwUfkoeo5FeKUiPE7jBajvOeZ66mlabRouu4M
X-Gm-Gg: AYBFou2NEAhauh+NMVMYMuCSlOHbM1r1//zSezz7mDrtlSnhA1y8J9Ol2OxQvH77G6l
	hgwNIhLE4XAuRmCXXIawJrRKHMl6T0kPG9IAgYtoiHEO30wt7/vKVnjl/qZhVPeYszJlxYA/zYE
	nkSAgUQSdtjTHPJml6GGJk1cYfh1s7fKiRb5qHoZxORAfB7MfuhZ6wCVy3znx5xSW0I8tUThTFT
	RWUwAo+AWfgj//5o8Imwzb93/C3MR1zw2+Bwwm9EmtK3/1tSCSqPFThMYoaEQc/9kp+uUCZkE4B
	15eSvbehsq1O5JuTiXTjs/al/y2QgoGAe5p1smzWQA85CDi5bKR1WwbaUUGmjG6tMhFpjyTVt29
	8G5uUbw1N/6crveiDgMugP5CSP9bCmuwZSTjymn0+I+ok6eSrQgnZ1oF4iT47Faj/aXO7Vl5Qdk
	r/AULt0cNxd0DfmZqvhvErNb80Cg1UBpemehY8VzCcPZst5AM820KLZFSOL4Z7YB3wfdsaJpbgZ
	Z3VKlf61SPvDNSSna9KVxEYrDQkevsHXqm69gYlF2CvA0G/Xblwp+seG47Sk7BOeBlTqSVRoYBG
	pvMgJbZtqJXupDUDllnsw/0s6yxJv1ujF+mLLJayfLoquqQ6NMWnVFcdul86GX6q/kOcBE9ZbhE
	AXQzMJfuW
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-56e63285bd9mr12458314b6e.21.1794871142127;
        Mon, 16 Nov 2026 15:19:02 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:00 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 06/19] wifi: mt76: mt7925: do not disable RX NAPI twice on unload
Date: Mon, 16 Nov 2026 17:16:17 -0600
Message-ID: <20261116231630.1733906-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151903_027394_2EA1AD0A 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -0.4 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 0d477dc1086c..8d0f8f72d2f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -97,7 +97,6 @@ void mt7925e_axidma_cal_cache_init(struct mt792x_dev *dev)
 
 static void mt7925e_unregister_device(struct mt792x_dev *dev)
 {
-	int i;
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
@@ -108,8 +107,12 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 	cancel_work_sync(&dev->reset_work);
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


