Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24298606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k2rMKxf4;
	dkim=pass (2048-bit key, unprotected) header.d=medichon.fr header.i=@medichon.fr header.a=rsa-sha256 header.s=ovhmo3801317-selector1 header.b=P4tTyd3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZRRTB6tWjdlBw8MET61qHeq4ie6fC3tCqKffLXdLHGw=; b=k2rMKxf4lEwVE6NdcYrB/3cF/6
	u0qXjVhKqXmkid5J017amxN86FnmicD5z+i8goWHiJxhMHNtrQVJz7X0cAgGitTiH+Wdpszg+Fz0C
	PdXAfYqO59v+OkuoVnp+qYKCIJn1ghqWdiQWRVlJ1uCngkEKYl2MHhDQIlqWEuU8/ST5tgxBTB8xP
	ogVlMPe+68wSD0XjBjRYa+eExeSY1Glo99v8B/0AoJAEj2jA9ZIKC4A1c1gagqohvNL+JGGnpq5FA
	geMMfZ2fGDK3kLkewoHekcEbKP3bMXvMHb19k/EdtbGItF2XKdzGQm6uN0uX9VAcGZs9TT/pi8NrB
	Lq4l/zLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBia-0000000G3vS-3Qv4;
	Fri, 23 Oct 2026 09:37:44 +0000
Received: from 18.mo550.mail-out.ovh.net ([46.105.35.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBiW-0000000G3uA-3OGj
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 09:37:43 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.37.160])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4j9yc00Pmgz60yW
	for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 09:37:35 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-zbd2p (unknown [10.110.118.184])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C9321C0CB1;
	Fri, 23 Oct 2026 09:37:34 +0000 (UTC)
Received: from medichon.fr ([37.59.142.113])
	by ghost-submission-7ccd8bbbb6-zbd2p with ESMTPSA
	id ZeeuKd4q22pW2Q8AKSMJ1Q
	(envelope-from <abo@medichon.fr>); Fri, 23 Oct 2026 09:37:34 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-113S007ae3fb8dd-bd0d-495b-af3a-0693ed38505b,
                    4E1EE381F50BCC5D3752DB0F3D6F19972A1B9F27) smtp.auth=abo@medichon.fr
X-OVh-ClientIp: 88.190.90.129
From: Arnaud Bonnet <abo@medichon.fr>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	Arnaud Bonnet <abo@medichon.fr>
Subject: [PATCH v2] Bluetooth: btmtk: remove redundant memory barrier with helper
Date: Fri, 23 Oct 2026 11:36:45 +0200
Message-ID: <20261023093645.4669-1-abo@medichon.fr>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3089187869984448094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTGEJ30CtTo2ePHI7KoCCi5RSv3yvCC7JaTTxD9OvkUBLQMYXrddqfQslQhAOERqmKYhJoth4DOC2cfb4A8bzrO4I2dXm1n11Px3jO2qsTxIGoRPKOIjR+yM1+qNGOpNMFmiFLbyl7c3iePsV6vXm3CklZ2iS4SQF0/vurLd+st14AWFxUEgJN9c6TuOk4qygon4uF/Zfa3PYXunO0mCxa6E3mEZEstzB9Z8rkoNqXKaSq7SGjvivrtvX3BToiLLRcLoim0yji0lNTqRDDC23J672P6hgeGE5NyVlRNNUitQXWcmsh3lnM5tfCoH3AaTPk2Y1fQpOatci219euD9Cv6Am3N5kvvYnvQ96JJS/LQ8S0xBBuug7WtpDk+fCsztHsbKrmQvYSmG+wxa6afIuZp9ey17c5y6cfe+3wa2Eyb/brJ1LnFhZVRzCWCGCcLqazVcLwAkC9SgcOR/nHlQNIBdsfxWomG74uxv74Bd3paYiLel0JTx0TdIZMb/zmG0IepFagQ8zWZBgm5i9+pNfVkSAxwdDb2+MBbbdEVyWEg9bdeDLwc0sBt7vu0fIC2jmKsvmkIBrS3+7knCD185xGcDryxRSRNe4NaxkExB5lu4Jne2oYOFcKoE0mWOK2SdJGuKu4DTbgr8IaUvvJA7NY2ED6u4jolapd1yL9ipR/HoFQ
DKIM-Signature: a=rsa-sha256; bh=ZRRTB6tWjdlBw8MET61qHeq4ie6fC3tCqKffLXdLHGw=;
 c=relaxed/relaxed; d=medichon.fr; h=From; s=ovhmo3801317-selector1;
 t=1792748256; v=1;
 b=P4tTyd3asudec34GpxvJux8V+IWF0PdqbsbK/GR5HeTLf5hQCrQxnkOfjV6JKSABr/hgzpJr
 hcL4ix0BmCiLtdhvfjp17KzWk/lZeGlqPpufTg3kN6XA/+4Y4Xi+cWrkVcM0TEUehealpAAH6Ak
 kFymHcNe9A062Mx4UB/40XSQ+IOPOxGAKNrf8FzgH4JfU3AXunqXkNx/8A9rrIQ7I4IJNIDrjHr
 fS0nv10FzSDyBjTXM3uOv3wVR/7Cco5ghPb8CUsTt0Xi7AEy0u0YRG8QUhh/EgyurJjy1sm6ZjJ
 GVfaEN8f5qZcB/vmh2+dxMSbSLDhsWJYh6GPKQ4VpGOHw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023742_009604_E2652F83 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The test_and_clear_bit() call works as a full memory barrier, thus it is
not required to emit a barrier using smp_mb__after_atomic() before
wake_up_bit().

Replace the whole sequences with test_and_clear_wake_up_bit(), which was
introduced later in commit 52d633def56c ("sched: Add
test_and_clear_wake_up_bit() and atomic_dec_and_wake_up()") as a wrapper
for the correct sequence.

Signed-off-by: Arnaud Bonnet <abo@medichon.fr>
---
Tested by building and manually checking generated assembly on x86, arm64
and riscv64.

Changes since v1:
	* perform the cleanup in btmtksdio.c and btmtkuart.c as well

 drivers/bluetooth/btmtk.c     | 8 +-------
 drivers/bluetooth/btmtksdio.c | 8 ++------
 drivers/bluetooth/btmtkuart.c | 8 ++------
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 75483d8230e1..a620e24b6c17 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -607,13 +607,7 @@ static void btmtk_usb_wmt_recv(struct urb *urb)
 			return;
 		}
 
-		if (test_and_clear_bit(BTMTK_TX_WAIT_VND_EVT,
-				       &data->flags)) {
-			/* Barrier to sync with other CPUs */
-			smp_mb__after_atomic();
-			wake_up_bit(&data->flags,
-				    BTMTK_TX_WAIT_VND_EVT);
-		}
+		test_and_clear_wake_up_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
 		kfree(urb->setup_packet);
 		return;
 	} else if (urb->status == -ENOENT) {
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b9563df72983..b6e16716b169 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -442,12 +442,8 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 		goto err_free_skb;
 
 	if (evt == HCI_EV_WMT) {
-		if (test_and_clear_bit(BTMTKSDIO_TX_WAIT_VND_EVT,
-				       &bdev->tx_state)) {
-			/* Barrier to sync with other CPUs */
-			smp_mb__after_atomic();
-			wake_up_bit(&bdev->tx_state, BTMTKSDIO_TX_WAIT_VND_EVT);
-		}
+		test_and_clear_wake_up_bit(BTMTKSDIO_TX_WAIT_VND_EVT,
+				       &bdev->tx_state);
 	}
 
 	return 0;
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 4af6fbbbd302..744a87acaadc 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -229,12 +229,8 @@ static int btmtkuart_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 		goto err_free_skb;
 
 	if (hdr->evt == HCI_EV_WMT) {
-		if (test_and_clear_bit(BTMTKUART_TX_WAIT_VND_EVT,
-				       &bdev->tx_state)) {
-			/* Barrier to sync with other CPUs */
-			smp_mb__after_atomic();
-			wake_up_bit(&bdev->tx_state, BTMTKUART_TX_WAIT_VND_EVT);
-		}
+		test_and_clear_wake_up_bit(BTMTKUART_TX_WAIT_VND_EVT,
+				       &bdev->tx_state);
 	}
 
 	return 0;
-- 
2.53.0


