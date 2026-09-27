Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3462EC98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfnndOSayHQt29039Mri7RjxnsiGSv3tyGNDlDem8kw=; b=Y4NYhdUf7r6vrB7CXhGjEHxGV/
	CqG1X6kblgTxS9YOQOJcwI5IFGb1PLfwRmrSIAQr7+CMSCfWmIOl397XqWfaVdr+U7JyK9ZBms+G8
	aJeCgY0PlpHqtzfQGzTiXPkFZONn44zT1i9DB45CoPzPVRTR1VdiphYOPxJ4AN+Jw//xsB3cLJ5cV
	tQLVQgFWZ6hgAamnKIE7e6geaPxN0DOSs7uZCWb6JAVOS8y4EUcZtzomqhlDDznaMdE7wfiOmfhUy
	5i9AmOlfdEGCmnHSlrfJoI0KBgqhob6jKcCBOS0IcP46Iu/cQ9BTbF3WhKIFMWp4QKXfQcOBhHEB9
	delUD/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9E-0000000GsIM-16dz;
	Sun, 27 Sep 2026 21:11:00 +0000
Received: from mail-dl2-f12.google.com ([74.125.229.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9C-0000000GsHA-0tic
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:59 +0000
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be84so2956773c88.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543457; x=1791148257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfnndOSayHQt29039Mri7RjxnsiGSv3tyGNDlDem8kw=;
        b=dtmzI/AcGuvAuvCludGpEcvq/TasAPAYh5c/JjKu/8MzqMqkQHJt2O1aQ4Cp60PrMk
         dkespLaFJDCmFB1ec66UBm/ZH5YnDyFtxx/s1XzyDS+fgC5EBDzMsseJBI4wKtpwT4IF
         zWlq7K2gz23i+Dxd8XIIq0lADWRf9w0l02X6r6xGPsew3DAi+y9Vj7Iq1VUT2H6nptey
         nqsKirUVwxnMtDfOIkrWJNf2+WnzWgCIm0kMD35QWNk/3dZQ/TnuoVrGUIwUlo+uMJUz
         8MtLWZ56GsLtbQRCc3VEqdAYW8hEpSbD5GEqkzgyw7M+5vHzr/AYTiM6sl8Xt6RTwPBy
         MC2w==
X-Forwarded-Encrypted: i=1; AKwUvBw8ct3Mb9jPqy1UAwKFeTHzy96rzy+yizF6IEuJaj9WfcCDQvMW86+G0G4H1xqULvREqkJxbKWaCciwkqnh5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++loFkL9MXmqxJWs+IYSCU+l79qiCa7OXj9W3aQM1nQIbHivF855
	FdMCzI24NOWm3kbXcOYV/uV64WSmRPd65aIvk0kDQWp9P2dSPGlRK6nFbjSj4osz
X-Gm-Gg: AYBFou0G87gses/RGLMsDO64mtgmbWtq3q3R9eRMTEiAvKQi4LmlAvUA2tHReV2pJvF
	v/Z0P5UVcXkfHXGFKJxRUbgDJ9RgzvAHFpnaWaiZfvwDUQaMDAV0rvEojJjdpyrwU0BPwH3x0j4
	yTcfFI7bq0eTYBt35kIrPScA3Nzz301MZYeEIjIcJWiOVEkRtf234WYmjLaPxXiqM0XODvbGGfu
	yyGVbWKmkN6GsfuvAL1VR4NJnHCTJGivwaal9BdBvtdeiESwA1V17GSsouFL6lEKiiRKcTB+sGs
	mr8ppXh4vFXPDS4uO5iaCYJSM7Ix7xSPpuTL+cpQyVmJe7LDOqXvy3GCKPaLeX5kQpvLUMslgnr
	TSfSJUNaH6EPKA//xPAqj3OI1KfDOLwCh5/LeWF18lYRvymiLK/RBW2jki3oe/51/shgi86UE7E
	qRJQVwFBwuKzv/YQtsGh0DgBP3xsRlxKGf/OyvPD4uwPZzUXP9GH4PxZwOzCNdBJzlgWscCvQrx
	XWc954qlWk1U3VuWQQEe9fbNSepFSMmokMQNt6DSVQCS1g2P90gQY44vQH5+X6sAJ+m1A==
X-Received: by 2002:a05:690c:6e81:b0:8a8:675b:2ba0 with SMTP id 00721157ae682-8a8675b2e7emr32483767b3.41.1790543048959;
        Sun, 27 Sep 2026 14:04:08 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:07 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 14/23] wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
Date: Sun, 27 Sep 2026 16:02:56 -0500
Message-ID: <20260927210306.737669-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141058_249225_2CD63CB7 
X-CRM114-Status: GOOD (  11.77  )
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

Host-initiated NAN action frames (NDP Request/Response/Confirm) were
sent on MT_TXQ_PSD -> MT_LMAC_ALTX0 through the interface WTBL: a
force-TX path with no relation to the NAN timeline. With a partial
availability bitmap the peer is off-channel most of the time, so the
15-retry burst (~11-51ms) regularly misses the peer entirely and NDP
setup fails probabilistically (half ~2/3, quarter ~0), and per spec
unicast NAN mgmt must be transmitted within the peer availability
windows.

Route unicast NAN mgmt through the peer STA WTBL on its AC queue
instead: the FW pauses/resumes the peer WTBL AC queues according to
the peer schedule record (the committed-window intersection computed
by the supplicant), which is the same gating the NDP data path already
relies on. Multicast NAN mgmt (and unicast without a peer STA) keeps
using the interface WTBL, which has no pause driver.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3707ee19e4ae..a3688b9fe635 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -681,6 +681,18 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		     head == &wcid->tx_offchannel))
 			qid = MT_TXQ_PSD;
 
+		/* NAN unicast mgmt (NAFs) must stay on its AC queue: the
+		 * PSD path maps to the ALTX (force-TX) hardware queue,
+		 * which escapes the per-peer STA_PAUSE availability gating
+		 * and transmits regardless of the peer's committed bitmap.
+		 */
+		if (qid == MT_TXQ_PSD && wcid->sta &&
+		    info->control.vif &&
+		    (info->control.vif->type == NL80211_IFTYPE_NAN ||
+		     info->control.vif->type == NL80211_IFTYPE_NAN_DATA) &&
+		    head != &wcid->tx_offchannel)
+			qid = skb_get_queue_mapping(skb);
+
 		q = phy->q_tx[qid];
 		if (mt76_txq_stopped(q) || test_bit(MT76_RESET, &phy->state)) {
 			ret = -1;
-- 
2.43.0


