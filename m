Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56EBC9833F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKZ8oc8IA+KkaKuxtAKDlCC3SZXocaZH/r6Dx0YeWrc=; b=QVFWeq0v6Iz5a5KIs08uusFrYK
	0D/Ytj9RZOHCyyVETaPVOgRi6Iqe4IEXKhYXER6JQ86yoBw+SAppabc08isT/LLPcgvbMn7eOpIAv
	JB0fTBDihqMoxJ8OFO+mykDD49BVQqbxH5hLarNOC78lP+Il1RrIkgLQ1iToOFCplQb5PTXOYeith
	SqHNBe13KOmC8d5TpRHlTPXUd/CtsddD55qWGpZj6zi3GLIi3QhNu5xBWo3qAbcr5CU7A9yvHFary
	27idNGU5d5bN6j9RGfdNvSflvyhsMKTgtH9kZQvX6T1Z19CIHe73CHvUNq8MP1xI78j3IJ+6zl/8y
	lRjkq74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8m-0000000Gs6o-3WYS;
	Sun, 27 Sep 2026 21:10:32 +0000
Received: from mail-dl2-f40.google.com ([74.125.229.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8k-0000000Gs69-3mLZ
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:32 +0000
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-142dd04be84so2956565c88.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543430; x=1791148230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKZ8oc8IA+KkaKuxtAKDlCC3SZXocaZH/r6Dx0YeWrc=;
        b=C3KfVepQpMQawKVFEiR+annjLgxt57zv+WezAHxA6hDLA8pZt0kzjnEqMpgBKNkvnx
         FKe3hSdXLE01cBoeTlJX0t03v6c+iIGT1HVKYGCUwgJtyVlOd0wj2BDc0p6tatCABMtQ
         Pm6cwHZ02QvcURViEB9jvNSC/vAKV7jcT5u/p8FZykDCppIqqHpGJ35CXKVuhqQ+pImT
         VOG0D0ctMdCWo2RcHvCRVAX3p3uDK5Xu9a4PnNmUeGgBvoKc5G/8ueXRJ/Og6nDMh1Ix
         p337dRAk1WFrJR5b6gcv54Jn74yrdmhxRyebr6rsgNcRHO1Ctut2Sk7Dw9fFk2zWqT9t
         f7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiyem0DNUNGP07l2QPcFXlvEwdx0vFVmVpUg1ATpN+tsN3tpjLcDMgx1XyDEvrqH/nDoE5zNFhlPZoV6dfKA==@lists.infradead.org
X-Gm-Message-State: AFuF++nBANWwng6Ma1cveob4oOwXYITgEJGO3IkaxqOxcPslQdhnrBXr
	0cuSaHx8eHYSu4EC3K88rEmswPCiNv1PHF6ioAYjUAPxz5NdyOjHwXZ+iw2L5RAQ
X-Gm-Gg: AYBFou0VmB4A4SfWOaeO+As1/T1GuH9dsBqId86vooOPK7rP4N+/BxPCodoikaec/XV
	LE7IUVcFw3miSC7FXCwMUgIsos7nJpdSiAFjcD2SHBk/tFdP6TyDcRpipelcNf1UHIl8LINQBCH
	mUPXpcy02dcbvkmXj8uc5RNdXPxKJdQrUyNb63+3xthc6v4VKB8hG5VpNxonpqGWFxzggviEpnI
	1JznS6aViwPXLaDedHlWj4oXGbpAJPNVdcFEo7OzmIGOrI7VPKeqd4jKQ2gjDQn1+5IFhL0M8CC
	SLI+jwIj2pOuYym905rGFX3D9ri7aMzMRLnQy5SHdT40sU/WVgQ4RZV/eoj4DX7FrI6vyBbZpSD
	lSx21AXxfD4ghy4yyxNVYeSs9AZjeqHn8P1qB07e+F7UT/ndVRWDH1gtisMoaAO+wEnLevMdn1o
	2oYHCCMqWhK2jHvY/Sqng4AOfL3K8G94PtaaEBEhwz0qJUlRuQPQH32V3ZNhZZFZbknw8089gt7
	TOZDTyNTKd/L5IMZGs3fZHQ7lWgrLn++wid0+BGUm5dlu85cUVDgNiyvOftzGTel9rHin0ev3bJ
	9rj2
X-Received: by 2002:a05:690c:6d82:b0:8a4:b0dd:c849 with SMTP id 00721157ae682-8a649f61d9cmr57019707b3.52.1790543068928;
        Sun, 27 Sep 2026 14:04:28 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:28 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 21/23] wifi: mt76: mt7925: stop queueing resets once the device is being removed
Date: Sun, 27 Sep 2026 16:03:03 -0500
Message-ID: <20260927210306.737669-22-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141030_942557_7613542B 
X-CRM114-Status: GOOD (  16.40  )
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

mt7925e_unregister_device() cancels reset_work before it tears the device
down, but every source that can raise a reset stays live past that point:
the MCU command path, the system error recovery and interrupt handlers,
and the MAC watchdog all
call mt792x_reset(), and the interrupt tasklet is only disabled at the very
end of the function. A reset raised in that window is queued behind the
cancel and then runs while the device is being dismantled -
mt7925_mac_reset_work() sets hw_full_reset, stops the queues and
cancels the PM works before it can notice that the device is gone.

mt792x_reset() already bails out on !hw_init_done, and that flag has no
other consumer: it is set once during hardware init and read only there.
Clear it at the top of the teardown so no reset can be queued for its whole
duration.

Measured on rauru with kprobes on mt792x_reset() (queue), on
mt7925_mac_reset_work() (execution) and on mt76_unregister_device(), which
runs immediately after the cancel and so serves as the anchor, while
chip_reset was written in a loop across the module unload:

  before: 205 resets queued and 415 mt7925_mac_reset_work() runs after the
          anchor, that is after cancel_work_sync() had already returned
  after:  no run after the anchor; mt792x_reset() is still entered but
          returns early

A chip_reset on a running device still triggers a reset as before, and
unload/reload cycles stay clean.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 09153d624fd5..f7b57a82f2d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -46,6 +46,16 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
+	/* Stop new resets from being queued for the rest of the teardown.
+	 * mt792x_reset() bails out on !hw_init_done, which is otherwise only
+	 * set once at init, so clearing it here closes the window in which an
+	 * MCU timeout, a system error recovery interrupt or the watchdog
+	 * could still schedule
+	 * reset_work behind the cancel below and run it against a device that
+	 * is already being dismantled.
+	 */
+	dev->hw_init_done = false;
+
 	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
-- 
2.43.0


