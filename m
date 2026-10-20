Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08C606A329
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wqWj6z1B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WuCYCPUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxre4AtewTJSInxw2JUwhQj2XUPHhCudcMSclvhy3+Q=; b=wqWj6z1BYphVFZU7tfkG30v/RN
	nMqKf1yKEf24xd6KoDSCG6JuMK3LZ8JiVQyhHcuGezWXtnNWq4Dj/w/M+35dwwC3nor2dWOXDi8MZ
	ZPLrZ1uSr7ErnljJ3Vwl6TEiO7Gaasvh7qy0PL34NsQRs5Acj4C1TZhTl4U7mqFmZ8EbIFvD9yHbi
	qm9n7p8IBb6i7a0hVEOdD106unDambRlcVFlkCBSIyFD2q9uB1TPmyJEeYbupg88Ou2uJ6N1Zwvo7
	qUoR1Wl7wW8GvMvwsmEghFaggpaK54pYahcFly7FOBOyAWbQg3Gzxp3/sp3uXMqtNSbI5wwAni29I
	IfNs1tMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ78r-00000009RJb-3jII;
	Tue, 20 Oct 2026 10:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ78q-00000009RJ7-3esx
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Oct 2026 10:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wxre4AtewTJSInxw2JUwhQj2XUPHhCudcMSclvhy3+Q=; b=WuCYCPUK18Ro1+gdbpzRCZ6k+3
	EZK3mV6lrKkI6YEXF8N+I8qF0hPW1FfkPWuBWCAxxDoDTvyoJf927Eos20AhTGcVH6VxwDt9le+tZ
	pWmsPrjFSyUkbiJvWHK/U10AzhrlOZXsvtugJhLZlZ0GxoL0FreFOUmmvarYnfgj6s6iI9j+RXGsA
	wRD0hMd6PA0an2Z0OF6xTitzKG0Zdray9D0l2CSsxiub9Cs/+beEAtIlSHYaPXJDOEjo5sNKNfuzk
	JBxdhiBDaZzyFfyMYxIuUYRw4PZu7AUIJ14MjHo7YUUdn4/mB2Bfny3fzk8sA9X+e5EJjuaANv8IM
	YV0EdQ9A==;
Received: from mail-e842.seohost-mail.eu ([213.239.133.37])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ78n-00000004bGO-0oYg
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 10:32:23 +0000
Received: from static-46-238-236-132.awacom.net ([46.238.236.132] helo=localhost)
	by h84.seohost.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <piotr@kubik.pl>)
	id 1xJ78l-0000000Bk51-0PQF;
	Tue, 20 Oct 2026 12:32:19 +0200
From: Piotr Kubik <piotr@kubik.pl>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Piotr Kubik <piotr@kubik.pl>,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7996: send no MLD group in a non-MLD link operation
Date: Tue, 20 Oct 2026 12:31:26 +0200
Message-ID: <20261020103126.46675-1-piotr@kubik.pl>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: piotr@kubik.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_113221_438805_4FFBC762 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver keeps the link of an AP after the AP stops, and it sends
the link operation again when the AP starts. The command carries the
MLD group and the remap index of the vif. Only an MLD vif gets these
indexes, so a non-MLD AP sends 0 for both. When an MLD on the same
device holds group 0 and remap 0, for example the station MLD of a
repeater, the firmware takes the address of the AP for that MLD. The
station then sends its data with the BSSID of the AP as transmitter
address, and its AP drops the station for inactivity.

Send 0xff for both indexes for a non-MLD vif, as the BSS MLD TLV of
mt7996_mcu_add_bss_info() already does.

Fixes: e7ec71d9f8fa ("wifi: mt76: mt7996: Add mcu APIs to enable/disable vif links.")
Cc: stable@vger.kernel.org
Signed-off-by: Piotr Kubik <piotr@kubik.pl>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index cd7587c..c0b467f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2701,8 +2701,13 @@ int mt7996_mcu_mld_link_oper(struct mt7996_dev *dev,
 	mld_op->link_operation = add;
 	mld_op->own_mld_id = link->mld_idx;
 	mld_op->link_id = link_conf->link_id;
-	mld_op->group_mld_id = add ? mvif->mld_group_idx : 0xff;
-	mld_op->remap_idx = add ? mvif->mld_remap_idx : 0xff;
+	if (add && ieee80211_vif_is_mld(vif)) {
+		mld_op->group_mld_id = mvif->mld_group_idx;
+		mld_op->remap_idx = mvif->mld_remap_idx;
+	} else {
+		mld_op->group_mld_id = 0xff;
+		mld_op->remap_idx = 0xff;
+	}
 	memcpy(mld_op->mac_addr, vif->addr, ETH_ALEN);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,

