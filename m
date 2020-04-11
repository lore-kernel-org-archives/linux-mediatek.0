Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E3AC2BA19
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB4D21744
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+TLNuvd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6QS8Tvn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB4D21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yq8TbVUe7dNk0LgcPMtqhTZntIemQlcgRKu+1RBep0k=; b=g+TLNuvdjD44lq
	fOx6Tskgxh1y8vRfAY7t82cnu4pS9KFCKld4DhE1u5TVt9hc1+wUDnpc7ZkzxlbNPWnVrmuf6Wgvb
	SrTXEQSfIPK6chHi6sxUW+Lq6S1orYuojdKN2eUtSU1+SkeiUcxJqUuwjslSmKloAxR3E7plGPZuX
	Ojfqx2kh0KMsVpGgxTmRsEeMKdS9+6cZj+gCOtNzio0cQC+FpVktr+nXfoYWoo6MNrtcLixBAtRhA
	LzQwhh9hRg7kwEmGEtUtP9btXfRAfJGYkhx55tsrm9+QhBi2NkHxxNPT4KNrdqy/RrzlACslSHjrA
	iLbx/8QmS6kCBAp00pMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNPJu-00015i-Dx; Sat, 11 Apr 2020 23:13:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNPEj-0002Yt-Ry; Sat, 11 Apr 2020 23:08:35 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AAD021835;
 Sat, 11 Apr 2020 23:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646509;
 bh=s4vRQIJwcxkL6l2FldF0HlhnWS37JsVCYYVOD5lTqjw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6QS8TvnS9OwRHruvz1jucCejeZVVfT5XzVdxONzKn2LYtJYnAWWo5ql/AFtcLaN1
 +jVi3wxGev2iaa7PVd5Mqm5SLRZcro1D4hawq0outzVT5ggGJHYNmp7FR2WeolPolU
 oGIzRZ38Mn8xlLFYt0ZnzKdAx2MjiRGUQwNeagVA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 068/121] mt76: mt7603: fix input validation issues
 for powersave-filtered frames
Date: Sat, 11 Apr 2020 19:06:13 -0400
Message-Id: <20200411230706.23855-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_160830_005581_ADFF4976 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit d55aa5e17461b8b423adae376978032c4a10a1d8 ]

Before extracting the tid out of the packet, check if it was qos-data.
Only accept tid values 0-7
Also, avoid accepting the hardware queue as skb queue mapping, it could
lead to an overrun. Instead, derive the hardware queue from the tid number,
in order to avoid issues with packets being filtered multiple times.
This also fixes a mismatch between hardware and software queue indexes.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7603/dma.c   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index a6ab73060aada..57428467fe967 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -30,6 +30,16 @@ mt7603_init_tx_queue(struct mt7603_dev *dev, struct mt76_sw_queue *q,
 static void
 mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 {
+	static const u8 tid_to_ac[8] = {
+		IEEE80211_AC_BE,
+		IEEE80211_AC_BK,
+		IEEE80211_AC_BK,
+		IEEE80211_AC_BE,
+		IEEE80211_AC_VI,
+		IEEE80211_AC_VI,
+		IEEE80211_AC_VO,
+		IEEE80211_AC_VO
+	};
 	__le32 *txd = (__le32 *)skb->data;
 	struct ieee80211_hdr *hdr;
 	struct ieee80211_sta *sta;
@@ -38,7 +48,7 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 	void *priv;
 	int idx;
 	u32 val;
-	u8 tid;
+	u8 tid = 0;
 
 	if (skb->len < MT_TXD_SIZE + sizeof(struct ieee80211_hdr))
 		goto free;
@@ -56,15 +66,16 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 
 	priv = msta = container_of(wcid, struct mt7603_sta, wcid);
 	val = le32_to_cpu(txd[0]);
-	skb_set_queue_mapping(skb, FIELD_GET(MT_TXD0_Q_IDX, val));
-
 	val &= ~(MT_TXD0_P_IDX | MT_TXD0_Q_IDX);
 	val |= FIELD_PREP(MT_TXD0_Q_IDX, MT_TX_HW_QUEUE_MGMT);
 	txd[0] = cpu_to_le32(val);
 
 	sta = container_of(priv, struct ieee80211_sta, drv_priv);
 	hdr = (struct ieee80211_hdr *)&skb->data[MT_TXD_SIZE];
-	tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
+	if (ieee80211_is_data_qos(hdr->frame_control))
+		tid = *ieee80211_get_qos_ctl(hdr) &
+		      IEEE80211_QOS_CTL_TAG1D_MASK;
+	skb_set_queue_mapping(skb, tid_to_ac[tid]);
 	ieee80211_sta_set_buffered(sta, tid, true);
 
 	spin_lock_bh(&dev->ps_lock);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
