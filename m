Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA28606A321
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A8VydHLZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQK7+wsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=; b=A8VydHLZDbEb7qlFRdYhYLQnyl
	s8++5Z7U1jgXp5TvM2vQQzTqLXrFHHAo/w0/6YIr5jFRb7P0blOi6NX23OqiaDBYgN3fS5IhkH1Xo
	+bivhQPxlv4N6Zclk4OTC6gUrTtMMgcIV1aBE/xJZvoXKIS9YlvAyTaUcVbVDdBNZnNbw0wJYBLq+
	S4E9RsJ0ZP7Hlv7DWJCSW/f+fu6XajFcSKF7mmE00huRDCYJXqOnNfA2GbMmzemHE71KMv7hLNwMf
	rEkWgH3TZGP3f27ZzR3p0EYi4UsVBXu/lXxASvXKoLzUNCZAoCh2ujfD0rnwdowXIcqNSHHEiBlJa
	5XhysvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGxK-00000000j6Y-1ohd;
	Sat, 28 Nov 2026 11:51:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGxF-00000000j5R-1OBv
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 11:51:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-491971ac844so7821333f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866655; x=1796471455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=DQK7+wsrURcdxGuzgS/t0glsXEEAGgn70TVV4x82YLgdY4FAFgzafb11G5yRT54gRc
         b7EG1PAJxQ8X4PXzRbb90kpD3MvhYvUoO6lHTBzLKDunBF0pT2VGLaojpRgPnK7OmRuU
         Shv5ZpyxSFhB1C06YnlOfo6Szy9ewDodZwcbiAhFgHnO9p1o67aBLGNKn3KVV6cEh92L
         hCjSR/UNIETiZPC2WpS5J2APoid42iglIaB+E14UE1xtOpL4S+zCqymv6cylyhCCikqm
         9vHGVsIzAjQ4hgiuY9+yqMX6dmUaNiBRzwnbohmQOAJets/CmJkD3aIhiLIXurUzgFAi
         W6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866655; x=1796471455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=a9cIQzle1b7jND0DeN7tgoIEQ83/CPDuBisMc62fHdOJUcluyiWs6RTLs9zaHl/Vwe
         u/ZhksAd1pI9bf+FlIN3PaoDEzJ/OobjAXh0DAhOrtrMTj1eh9bYoFt+rVichYp36gte
         sjnXWPFRPeO12kNa+Y7Iya/YK6TwcTin7pBCncXPsTIGjTHa23DA88qwDtRAsArf4jp6
         QhwR8tiZVIu3qxguFfjBrvqa2LDt480N2p22MHBPvQDx7lDxvgCc3+dN8EYGOWkPwqrS
         mHRV0DrTbT194WSnZLvPbphDvX8Gn9/Jp9WOsr/FEnIiUZlbKefxCIZZGvq2gCbOonZe
         yi0Q==
X-Forwarded-Encrypted: i=1; AL+hErGac24CgG3426fDvcj/DuwBZEGZiTuZMXQ0jeWWqNc7fX8tuoAtw4Ii7q9hjgTGd+SL5HzJbx2GJJmb3lo/XQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+jnneP8cdbk8AuRTGOFOTPnKUZdOgHfYjbuV99HkpsV3RJ3e18
	atBnf2Y7Ih/XiwoNulRzwozB2L4s6q71IGn++lBSeyBWYX121Mz9A8lf
X-Gm-Gg: AZFdTZf3I3fN+xyf0kekNRTZO+qfTa73MZGdWDgebXYsO7yvEpGCLaIOHmt85b7GpGl
	frpbhwQx+Ctj0u8wGA8GSmVdjZMYQ53oiGLUDLHrzAQwtKoP2SKCXyFzg35gDe1DdsUY0lcKlL+
	RBF0ZHg9LApmLXAE9vyFz+5l3YzR35eoADkioqYdjshCEBenHQqJzgy8Jao9ZDngyMveKsC7qcs
	Ml7myYM8WiC0rN9spPZWgTxo+mlf0nycDVdak0HN1sJGTbBbfkM9F/JCnBZWJgBXHX45E1JCZhR
	rQQKVXT2xfd9slePsVglxe0eeNqO4fDhQFkY3SJY1NKWUeLut7yCYJpaQWtm45mwQ5tF1f08fyp
	TtMPEGMZXqcoFOnYd0w+lB/S/oDwT1YjLVNbgcPN8OLWP3A+e4GhRetNaG5waFlzvJc3gUJxqeU
	ZgIB43XYfeGrEzef8IlOFg174KEeiH3T9iz/CjhNgVo3ddqrsIkgUYZ3kikadoOLi9GW2PIELlA
	jxqaNcgZ9dsFoq16MC1bXEphi8+YxzOSWltTFHjlEpeS/nuFaRKB0d3mQpRaIWy9UElKdXnsflt
	uXMjqYRBw6/IpRjj2leavgE/ypGOhO+/H6BrV9Y=
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr52266863f8f.32.1795866654635;
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
Received: from DebianTestingKDE-VM ([213.16.57.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm51953284f8f.37.2026.11.28.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
From: Valentin Berezhnoy <dreyksmail@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Valentin Berezhnoy <dreyksmail@gmail.com>
Subject: [PATCH mt76] wifi: mt76: reorder RX frames when WED does not handle RX
Date: Sat, 28 Nov 2026 13:50:48 +0200
Message-ID: <20261128115048.84165-1-dreyksmail@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_035059_504072_3D72FE47 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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

mt76_rx_poll_complete() skips mt76_rx_aggr_reorder() whenever
mtk_wed_device_active() is true. MT7622 WED v1 offloads TX only:
mtk_wed_get_rx_capa() is false, the RX rings stay with the host and
mt7915 does not set up WED RX offload. So on MT7622 + MT7915 with
mt7915e wed_enable=1, nothing reorders the frames of an RX Block Ack
session.

Out-of-order frames then reach mt76_check_ccmp_pn() first, and those
with a lower packet number are marked as replays. Since commit
1c5ed3eb68a9 ("wifi: mt76: free a replayed 802.3 frame with all
its subframes") drops such 802.3 frames, 5 GHz uploads from a client
fell from 814-840 Mbit/s to 378-593 Mbit/s, with 5031-7630 TCP
retransmissions per run instead of 583-822. Debug counters marked
2171 single and 5661 A-MSDU 802.3 frames out of 228603.

Check mtk_wed_get_rx_capa() as well before bypassing the reordering.
The bypass stays where WED handles RX (MT7986 WED v2 with WO,
MT7988/MT7996 WED v3 with HWRRO), and the NPU path is unchanged. With
this change, at most 16 single and no A-MSDU frames out of 757567
were marked, as with WED detached, and uploads reached 826-859 Mbit/s
with 66-157 retransmissions per run.

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Assisted-by: LLM
Signed-off-by: Valentin Berezhnoy <dreyksmail@gmail.com>
---
Measured on an MT7622 + MT7915 router with OpenWrt 25.12.

This patch was prepared with the help of an AI assistant and reviewed
by the submitter.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 33f2bd5..4e56de3 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1751,7 +1751,8 @@ void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 
 	while ((skb = __skb_dequeue(&dev->rx_skb[q])) != NULL) {
 		mt76_check_sta(dev, skb);
-		if (mtk_wed_device_active(&dev->mmio.wed) ||
+		if ((mtk_wed_device_active(&dev->mmio.wed) &&
+		     mtk_wed_get_rx_capa(&dev->mmio.wed)) ||
 		    mt76_npu_device_active(dev))
 			__skb_queue_tail(&frames, skb);
 		else
-- 
2.53.0


