Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE257606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LIZ1cx1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=30mv0nAY+X0e7kbeDLKp5NE5Bmu3C/uzutIryO3Tepc=; b=LIZ1cx1aJHclD2
	0dhxTYkwMWInRTQ8TLji50hWFjew4t8Z055eOZZESwig36uo8VQ6He0neTcQJGpWpTvASk1+WnVJf
	+JjMeWmKkYE+kPlDakqVHmPXylUPk2l78bnl+5ergtAZe/m0eiS1wKJLSq1dmLaBBAjnsu3dSWTpx
	vkle+8JAtVK2HhF891gBK8ccHLsSHpZjsYGr3Kx0kvRZDMM0JVO+PcOPDIrwWR/ft2S6f82aO7vEi
	GDPAw+0c0+HkEOESOHNPfmZILk9RJaXMKu1d6ht/Ig3NwFG3bwExE7uJs6sbv7YR3cyqnzuO6iz1w
	HpReXrwNyqLLjIjRuqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zY-000000049sU-2XGV;
	Mon, 16 Nov 2026 23:20:04 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zR-000000049pP-1WFa
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:58 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4e4a4d77e5bso222833b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871196; x=1795475996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=30mv0nAY+X0e7kbeDLKp5NE5Bmu3C/uzutIryO3Tepc=;
        b=ZkAasGWk0KWspn96XKmE8MZSmN2QVpXyYkxbHdsTDvHmaY3ODRmOxReSsX/t1VyVIV
         y7lHj5I+j6ECEJoP5rOhcd9u4AlAAiB8ZbNz44PR+3NnxT2EYqeNAsBpAX0IAI+rAyVs
         b2zVp6oYAcmGU/i03oRBPZRDdZEJZrEB/oGZCacy6TTSjQ5yt3Wc2fnou2hRZASu7qbA
         15wYOV/m9FIflhc0nWZQP1UD5G4cBFpBKG8e+WXS0ooqxtK29DOwgDFY6+EDfeqBWEHN
         sJ4etzZCAGFgmKly8G5srntce+YFcept1pg9bfAyZxwXGEdzSO9VgtfmMJE5OrJ0BMlm
         dlVg==
X-Forwarded-Encrypted: i=1; AL+hErF46tfoTlK6EXKbA+i6pdQoP0xmLiqI7OzEBIhF8nfEVgBVv15/l0IVRzmHG2wA8iQR2nUIlWo/u5qSog1vMQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+DQnE/QrJKnF1YuiN84YUkAIoyd88Jle8PNkh6mkvELRuOfSC0
	5SinWTm+QHXxvGarf/WqgckVEFZ4Fu5GaYSasIeBxSa7vw+or7KMDKp1
X-Gm-Gg: AYBFou14UtLxfH4mATg8vBIxfXc3ssUEqywz1KJjuLVUGl/B9Qi9HsSNGdgzTkBL7hq
	9IM7QCeP5qBrna4Iyw3zLrqN68gDIU5EiZ5Y58raQrbwMd4K51nuBo3a6nrV3pdtgRwdL1mqQ7M
	uj2mmrVhvJflsiEQ6+eyFSImVfCAZrrTLUQt12E6FJPW5Y65RRGLlnravlOw77TSADwzEzchWk0
	iIh+zqSHBcxiimHvEvViJmiZdz5TW4AT53lpwXRkmrE0YPTQb4EAZdFozV37hEGPCWtweBqySGg
	WfsQgK6VIe0GMfwf2z8ZTxcdH788ANFSWAHrPAIKqMiJYpHFfkrEByoP15NeaJO80Sb/qOOfiRN
	fv99tyRK23y4ydwwPawSlbZPjco8tT1hdPYs+sDzvoEtRmkf2eRRf3eREVmfvJ+NXQ0gb7WVQ6Z
	HyNkT7vOlnhInhgqxP2oXBYSyUip6z5y2wOBfqpkW9fbGIbcNTikuDz9pt38WLU0/zivDA0vsvu
	V0jGSUga7JaxYDjC0HqWLAPfEaalANaDBmwgzNBQiKOCeUg3SalM5tFutsoaATB+j6h8ohnUnZt
	gA6frPWDHiOKFEbXiobpvUmTFRt4MK33qp4uUJHzky4woJP6dRj6UrhLcifdgh4LINwOYOWdm5R
	eUJEbVlpYPwmLvt9zNK7X0gqrUCky86g=
X-Received: by 2002:a05:6808:c1ba:b0:4d6:9133:cff1 with SMTP id 5614622812f47-575dc245878mr716250b6e.24.1794871196401;
        Mon, 16 Nov 2026 15:19:56 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:54 -0800 (PST)
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
Subject: [PATCH v2 16/19] wifi: mt76: mt7925: stop queueing resets once the device is being removed
Date: Mon, 16 Nov 2026 17:16:27 -0600
Message-ID: <20261116231630.1733906-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151957_404764_33C40863 
X-CRM114-Status: GOOD (  16.40  )
X-Spam-Score: -0.5 (/)
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
index 8d0f8f72d2f9..fe168e00b9eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -103,6 +103,16 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
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
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
-- 
2.43.0


