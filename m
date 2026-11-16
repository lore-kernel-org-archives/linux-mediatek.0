Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D13606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VmDJH2Zz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vYYiOFzTjYSCr6Fp7dl2UeRPDz2kE3dHsqu4/v2K5CA=; b=VmDJH2ZzLvx0Bn
	1PcWCzmeII3bGtme0kSbosq9HLNdNmrV97te4nUPVXMciK/F2OFk2/po7BIH7sXhUFUgydHskyDS4
	f/piZ9HvU8Zqr2wrQpz/Mhyfj3iHykOsBQuBZRJC+Y7uIYZuQmA5TGE8Q4JGu26C2aTzD59wiUDfH
	VIu0Bl7311AhbxxyJwiwTykPyvEzWad4/tHvY3xA3IxW+g8od28n15hWkPNRiJ+tqf4DXvXgwGQOZ
	oVh7pbikDRA/7TGRXArcXUIMlp4OejQnQOOL4gOlFU/lecv6BhCF4gaGwvFh1vVz9rDATdFM/7q0u
	b9m1TTGTUs/xW7n681ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zP-000000049oT-2GXQ;
	Mon, 16 Nov 2026 23:19:55 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zN-000000049n0-1Nx6
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:54 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8490a7d6696so3091334a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871192; x=1795475992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYYiOFzTjYSCr6Fp7dl2UeRPDz2kE3dHsqu4/v2K5CA=;
        b=b0kwsCe9inResAKNZCBd6uD9eyYgK3ir8QCOjLm+tMV4GwmkPki88LhWTWyQCExPh5
         fRI1jsa+nde74/mwCbv+rE6zgLPofm8x1s9e9meez3YCoH96qc0a5gIyic/FvElmzMlt
         aXwSVyqon8jS1+r5cTLWHOEzPlIlbDVlQ8iPbE9KqNGqQu7epwDoGO1fCopVjOeBMIWR
         p3Rlu9gMH6ylkw0G5lYXd6affG+07zr9nP7uR1EBUkhPrvfW6ufTVsVThZiU6/cvSLDD
         waaLSX46Ob/bswasE4JnO27O7Fged9FaxH8KB420yak7OSTKCm3+CVtKi+coLHTJwiyC
         3Zxw==
X-Forwarded-Encrypted: i=1; AL+hErGProKvvSaqZAljzUdTbl8WL6HlEbUS76odEzIbyZy0Bw7VmGx2cB386NpT+7sV550KvxVtInUV+oirjl6F6g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9kqOVbK5FgxEqwfwnvw3SyGAi8kaoqoZcRdG+pdOPjE9uXR74c
	MOZJwCKu8YkhPO/cWEifht6p377uNZ25BoAB+m5xxmFW2LNTdQ7xzfT+MY9hBA==
X-Gm-Gg: AYBFou3pMNq/QlmODX1t2te/28UGPplUMifnuyT6CZ0mECjKOtvNHGxUIGAuZy98Y0u
	hz9GqkRi6t2rdOQSi19CVbvDp/uvpkEaC26pT2wOQWzNwpZRAHrvM/ml8MJz1+xiZqH+1ZTA+lm
	vXfhJC03uFq4K/wS4nXdCbj22sTPIyJquPjRvw7X2eaeSh7LCR9Y7U7jFf5pFuOqaTpgaydbX1O
	ewM7w2dBTR8bxuIXe4WU+7pdtW5qfFhvdULejsYE17Nni+P2isFb8B95jSwc3dho5sSpf7Q8dt4
	LZ6nxX4wdeWwxKnzpDRnmMIUh/XJo6mH6VnqLUnSybsJWAenlQ9WnJHRdHL+8CcNN64pPPhJhj3
	TaxTSCqZ+4GzJLmcXFbYwqL/FNclD3C4gNQJQbX8YaCG0uIXIyj0hZ2FtCYhH9MDT2imI2q3FLV
	pM185Hd+ok0l15DZ/0tART85rUOJhNJNQiI3yVu1fNYF52VppjgQ4XlhhVFw94zCAONXrGQ0LQp
	XL6iUo7ZsLgcbfm/RYC2szGdmD6d45IFe4QqVMyWTv28YtWag9tRyRaa61VcpM2uTEz7Z1Tb+ZQ
	2rwoP6HIJLCsXbFkRwSG5Qx5NMXggqk4W+bKfW3YmnP32aRGLfphIE0Ney35vST3WXBPTsPit+0
	rsdNePEbLcA==
X-Received: by 2002:a05:6808:5094:b0:4d6:90d3:e189 with SMTP id 5614622812f47-56e645e3178mr12285184b6e.50.1794871192310;
        Mon, 16 Nov 2026 15:19:52 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:50 -0800 (PST)
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
Subject: [PATCH v2 15/19] wifi: mt76: mt7925: disable only the RX NAPI instances that exist
Date: Mon, 16 Nov 2026 17:16:26 -0600
Message-ID: <20261116231630.1733906-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151953_382664_1AFD7641 
X-CRM114-Status: GOOD (  15.06  )
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

mt7925e_mac_reset() picks the RX NAPI instances to disable from the
interrupt masks, but the instances themselves are created per allocated
RX queue by mt76_dma_init(). On mt7925 the two do not agree: the tx-done
ring is only described by the mt7928 DMA layout, so q_rx[MT_RXQ_MCU_WA]
is never allocated and never gets a NAPI, while mt7925_irq_map still
carries rx.wm2_complete_mask.

A MAC reset therefore calls napi_disable() on an instance whose
net_device pointer is NULL. The fault happens inside napi_disable()
while the reset work holds the RTNL, so networking goes down with it and
the machine is left answering ping with no usable userspace; only a
power cycle recovers it. Repeated NAN data path setup and teardown hits
this reliably on a busy channel, where MAC resets are frequent.

Iterate the RX queues instead, the same way the restore path further
down re-enables them, so only instances that were actually added are
touched.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 7f6da681b4a4..6189615d6604 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -132,12 +132,19 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	mt76_txq_schedule_all(&dev->mphy);
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	if (irq_map->rx.data_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
-	if (irq_map->rx.wm_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
-	if (irq_map->rx.wm2_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+
+	/*
+	 * Disable the RX NAPI instances that were actually created. They are
+	 * added per allocated RX queue by mt76_dma_init(), while the interrupt
+	 * masks describe what the hardware is able to raise - on mt7925 the
+	 * tx-done queue is never allocated (only mt7928 defines that ring), so
+	 * its NAPI has no net_device and napi_disable() faults on it while
+	 * holding the RTNL, wedging the whole machine. Iterate the queues, the
+	 * same way the restore path below re-enables them.
+	 */
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
+
 	if (irq_map->tx.all_complete_mask)
 		napi_disable(&dev->mt76.tx_napi);
 
-- 
2.43.0


