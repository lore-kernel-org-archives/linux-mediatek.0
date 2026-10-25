Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E3606A320
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u34qgSYS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNtmjfOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RBXEyiBxEqTcY4/PxfqPyH3YehtswKJJfdQPjmnmlUQ=; b=u34qgSYSppsr7oUalrf4SCa7xI
	QPnrc8IlZPoPzyogYcCsUhsro7hkatgXFk6v8SN4Uf8P2K+F9NzWa+2XKVfRAudBPT6olUXU/86OR
	9JtVo2M3Jqm0H8qTnd5nbL6VqWgwX8ovxAaC2T2p+L1SdlemEPDYr/gJglbNFRpBk2Ba9eeNTAjxI
	8pvvuDxitLBgnOLc/XwDgb5GZ3t8ffRn2KD6i4pIyMFSDCD5Llnr/sVI2q/C2k/h+hQYU59uvKi/p
	+HMnAv1cBDy3uJvpoKgp97CvWtQEImFloT45rJtGLjsX3+46zx8/Gm3Pu1lH/vKu1QVQuDUO8mZh2
	kTCpLXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxOt-000000012wk-1uQu;
	Sun, 25 Oct 2026 12:32:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxOs-000000012wI-0brr
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 12:32:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BE4E600CB;
	Sun, 25 Oct 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931552;
	b=edlafhfubr157NPanI5MlLucq9Ma1v5Fmj9Q6JNs85p2d1wGq/ea6eW9FLn7e2NnmrNO
	 bto9XaQRK/BLA+4/sBYQAOAnUDL05Rn63UZUAzzroscnEOhEmaEvgUx2NVITRO854ZGcX
	 xTDOpEOZiFKjnnlO7azdlqzbyDHretcTqTGSktoumR8u+zfK27JnLt4u2nP26/70BEr0B
	 JPRV2cpyjBZ8YneOEj1CukcpuHNuuwhJk8ceQFYUYDqVkZHqTLgEW2sNoVAgHRdxYgrQ0
	 NV8QuPNVv2a3wDQhASvpewej2jj8r8obaAAicL/GX4OgsbQKNrc7t7+7qbnKLart54A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931552;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RBXEyiBxEqTcY4/PxfqPyH3YehtswKJJfdQPjmnmlUQ=;
	b=PvRPYE08D+t9pRTC5bFGHynGkcCNraMA3QzN36DKFEDu+4pW1NBhftFj/T+zoQ5LUMOF
	 7wVCaJqM2Bq/C9oXnq/72MR0FpuUhA81EJ0kA2VLVjg0ehgqWmmeAUFwA6MoNU7oMyjdK
	 bP+GKUuvpPxtckJZsdnld7JRz6JBc22IEUpDRdJa3nx9rwcw8iY74Tg8WzaHjVDPNaO9N
	 kBfc5yQhbeWyrK7ZU6UmYp/wfvdthO3h0+wH2HpTYxIIB8WrYxURn4rHxoIS0fFf1TFBH
	 sLW4WxmbbX5hQlJY9Rxfm17Y9CY7QggrRtfXRaSUOGwZ23T1ChL7UTiCPEgGhF9DSZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7B9D1F01829;
	Sun, 25 Oct 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931552;
	bh=RBXEyiBxEqTcY4/PxfqPyH3YehtswKJJfdQPjmnmlUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aNtmjfOlkknIWwJIH7BqtyV9FrWnEp51LMeiSCm+7cFKJJ1+XtifbMrgNY63WwXuz
	 SatjMShQaBFNdfUkc3P9upr2uvklwAUXvsIKoZ3YB0tbv4w+TaZJLY9nxRA20aoTAw
	 ne1aBTEkr1Zw3hkxHIE3exG78to9FcuIDkDMT/tkfbwLsw6sk+/OLxA7x7+douVg4d
	 AGMlysaPgLDcWNp9aicnL3/LMaP4cvyY7/RHGk5GeMnqg+i2qKd5DSj6ys94qlWxWx
	 mUu0qy0W9IrMmfd+4rXhJ+Aw8PgVyi5fi0IsrXxhdTh8rOi4FPjOyZDVIe/JHf8YVh
	 xxwXRpwaPVzTg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F78944A1C;
	Sun, 25 Oct 2026 12:32:31 +0000 (UTC)
From: Francesco Palmarini via B4 Relay <devnull+palmarini.unive.it@kernel.org>
Date: Sun, 25 Oct 2026 12:32:31 +0000
Subject: [PATCH 1/2] wifi: mt76: mt7615: fix lost first mcu event on mt7622
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261025-mt7622-patch-sem-v1-1-e16e31c1face@unive.it>
References: <20261025-mt7622-patch-sem-v1-0-e16e31c1face@unive.it>
In-Reply-To: <20261025-mt7622-patch-sem-v1-0-e16e31c1face@unive.it>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Francesco Palmarini <palmarini@unive.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931550; l=2743;
 i=palmarini@unive.it; s=20261025; h=from:subject:message-id;
 bh=nZIy7Q+1c7rjrVYCS8D6XKjnp7Yxneq+NYbfLfBT9rU=;
 b=eYy0Di5u76izSd5zCNoHhDr+5xw58UCUHl2ekvy5zY2HCdSeR2zzqhqVNTholHq5BHZZwUXEF
 cDPakYsqenaAQkTKIxBb6pv9Sw9qDBXcvYC1RFjnyj1DXWvGzH8Qawt
X-Developer-Key: i=palmarini@unive.it; a=ed25519;
 pk=3OQ6zyqkl8a98pNobVtrSRWmLpTk0XEeKGtpd+/yK70=
X-Endpoint-Received: by B4 Relay for palmarini@unive.it/20261025 with
 auth_id=1317
X-Original-From: Francesco Palmarini <palmarini@unive.it>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: palmarini@unive.it
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Palmarini <palmarini@unive.it>

On MT7622 the 2.4 GHz wmac fails to initialize on most boots:

  mt7622-wmac 18000000.wmac: Message 00000010 (seq 1) timeout
  mt7622-wmac 18000000.wmac: Failed to get patch semaphore

The rom actually replies to the first PATCH_SEM_CONTROL command and
grants the semaphore, but the event shows up on the data ring with an
extra zero dword in front of it:

  00000000 e000001c 00000000 00000000
  00000000 e000000c 00000104 00000002

Since RXD0 is zero, mt7615_rx_check() handles it as tx status and the
event is dropped. The command times out and all the retries in
mt7615_pci_init_work() fail because the semaphore is already taken.

Detect the shifted event while the mcu is not running yet and strip the
extra dword.

Tested on Xiaomi AX3200 (same hw as Redmi AX6S).

Signed-off-by: Francesco Palmarini <palmarini@unive.it>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index aad232c5a..54c70a427 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1590,6 +1590,21 @@ static void mt7615_mac_tx_free(struct mt7615_dev *dev, void *data, int len)
 	mt76_worker_schedule(&dev->mt76.tx_worker);
 }
 
+static bool
+mt7615_mac_rx_shifted_event(struct mt7615_dev *dev, __le32 *rxd, int len)
+{
+	/* mt7622 rom can report the first mcu event on the data ring,
+	 * with an extra dword in front of it
+	 */
+	if (!is_mt7622(&dev->mt76) ||
+	    test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
+		return false;
+
+	return len >= 8 && !rxd[0] &&
+	       le32_get_bits(rxd[1], MT_RXD0_PKT_TYPE) == PKT_TYPE_RX_EVENT &&
+	       le32_get_bits(rxd[1], MT_RXD0_LENGTH) == len - 4;
+}
+
 bool mt7615_rx_check(struct mt76_dev *mdev, void *data, int len)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
@@ -1597,6 +1612,9 @@ bool mt7615_rx_check(struct mt76_dev *mdev, void *data, int len)
 	__le32 *end = (__le32 *)&rxd[len / 4];
 	enum rx_pkt_type type;
 
+	if (mt7615_mac_rx_shifted_event(dev, rxd, len))
+		return true;
+
 	type = le32_get_bits(rxd[0], MT_RXD0_PKT_TYPE);
 
 	switch (type) {
@@ -1624,6 +1642,11 @@ void mt7615_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 	enum rx_pkt_type type;
 	u16 flag;
 
+	if (mt7615_mac_rx_shifted_event(dev, rxd, skb->len)) {
+		skb_pull(skb, 4);
+		rxd = (__le32 *)skb->data;
+	}
+
 	type = le32_get_bits(rxd[0], MT_RXD0_PKT_TYPE);
 	flag = le32_get_bits(rxd[0], MT_RXD0_PKT_FLAG);
 	if (type == PKT_TYPE_RX_EVENT && flag == 0x1)

-- 
2.39.5



