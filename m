Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7080AC98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rS3YQYx0uEiGdEuZPQRIfKhfJr0nb88p5R+xsGmGVqE=; b=CPZVqR4GxV69IWBj7Sxr61UwDh
	fIulyuQ1+KeeS9qRiorf2gP0V1IEnbK9JrDgdQ36fiqAMkf1d7az/uS/HmOcj7cFd5wQWO07RckLt
	HjlEdpOu0pLPglPp2E5CrdCvKK2bUYd8/oq8sB/L11AcqOfb1T/nRag1Stdf50LUTafOsIFp3gnPo
	oLvwB5/mZjqFPQzImQEBq7IN7rKjYkPjLsxAEufhzdbuhMgBe+BsmCIrAcsWwZTzr/UBPBnSnoCx3
	2q8w1QgDJgwnl3rmH6xIInU0xwMhNABARXlA4ONwbsO4GfASV52PSOif157nVCbb29j0T/2Is0zLq
	wCXeRjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9f-0000000GsOI-1tks;
	Sun, 27 Sep 2026 21:11:27 +0000
Received: from mail-pj2-f43.google.com ([74.125.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9c-0000000GsNK-0sMn
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:11:25 +0000
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1682599a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543483; x=1791148283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rS3YQYx0uEiGdEuZPQRIfKhfJr0nb88p5R+xsGmGVqE=;
        b=Xkzfqh4X02LBlSqWLaijQd2IixuOGrFl3Kx/oIE9wnlCvYAX/G4w1VCifDD+pUSIex
         m/u87ZTzhdeLqQ/6Y6xYsBij5J6z1Q0QPz61rjfOFUew18j+11mcplxynauRy7o/dj/h
         Vn1Hcmax2xqjpZt5pg3fzCCnPkhdD6gOev3JFgGa0+iPldDjCmTCC0NwSo4L+jYDRIVD
         jFP4ThHzD7BQJ01mi4tbfsGxaoNtxE+Pc8rCsEnolnVT3IGf16xlJr9AZUJHWU2E8q6n
         772EI7oEAbbs8evl7N+fUt3LWXWP4d6s0o+fbR/XBYvOpZh/wGKa43OdpU0IaTglSem7
         8ScQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvry8WavF/yGSAEOnempL+I6cIhlFcP71fZql9yGtxYvu3zTfnGnoUEsBNW9tnp5SkYpz5nhGAY44atoG8ig==@lists.infradead.org
X-Gm-Message-State: AFq9FYLjmMFoY5NRRcof8gKIPjzv09uKwOQ+ILn5bSjImh9c+Gh/p0eH
	Ww39gXqrOQPGuO1TGKVOc2/OVvVnCQtomEr+uTdqj8ZWNMCUii046w+ZLx5NeQ==
X-Gm-Gg: AYBFou3HGvTjtaX0G1Vi8S5orr/2WvVBhZMt5ia9R5WaqD2oixbFdZfd09eYYjYrOxz
	g+Gmf49UdY0e7H2jg2H8KDwBuDPccoU5gikH/e0pWqfpZ2DavFgX6jSlGZfmLvv69+MRV7hmqH+
	/CpWxOLhfCvYKPJ6sMLiOnPWtj7SRcN6CNHHnIbs2htvlrAXZVcDi8sJagnSKPQC21vOyKdz3kB
	URW4jv4CIHp5jJuvMBdCCKdlHce7wrsHx3R7lAQMe/3oc+kko7FjxgoBqPImzWRVogGD69+RaGH
	aHZcEIPMnb0RAabXJWj1er/lqn1vfc6rU2GV0PCTwQwCGdOpLKSQWTFavGpXvgVEDDyplxbHHxm
	lMIby1nwzOeMpVdB5MdvKtQcdug8nMUDcJNsp0DgfQbW7RZYEBRL3h8I61anMVgdblAiIhPhb1D
	SSx9/hPH+MOMOifh6BwFPP/A29j94CzlSdWmcMSgyVeJesBUUuJZ9S/K1jzlsgN0RY/FlbSHaD1
	zMu+844z0svYy/4FU8dKzf8IYPNOb42TsfQcpJ2vCfuNpn61ofNjL0ZEzy2ofCk/Tl1EQ==
X-Received: by 2002:a05:690c:6d82:b0:8a4:c2ca:181 with SMTP id 00721157ae682-8a64e5bf298mr46142927b3.39.1790543043374;
        Sun, 27 Sep 2026 14:04:03 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:02 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 12/23] wifi: mt76: mt7925: assign the interface WTBL to the NAN management TXQ
Date: Sun, 27 Sep 2026 16:02:54 -0500
Message-ID: <20260927210306.737669-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141124_241570_775F7195 
X-CRM114-Status: GOOD (  11.93  )
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

mac80211 does not allocate vif->txq for a NAN device, so every SDF the
host sends - multicast discovery and unicast follow-up alike - is queued
on the dedicated management TXQ (vif->txq_mgmt) with txq->sta == NULL.

mt7925_mac_link_bss_add() only programs the wcid of vif->txq, so the
management TXQ keeps its initial wcid of 0. The mt76 TXQ scheduler then
resolves dev->wcid[0], i.e. the global WTBL, and every host-originated
SDF is transmitted on it. That WTBL only carries the parameters used for
beacons and has no usable unicast rate, so a unicast follow-up sent on it
is frequently not heard by the peer and the send is reported as failed.
Multicast SDFs are unaffected because they need no acknowledgment.

Program the management TXQ with the same interface WTBL that the beacon
and interface paths already use, which is fully initialised here.

Instrumenting the TX descriptor write shows every follow-up leaving on
WTBL 0 before the fix and on the interface WTBL after it; a 100-frame
unicast follow-up burst goes from 92-96 frames received to 100.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 6c603d57e89f..64853fc7f60e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -447,6 +447,17 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		mtxq->wcid = idx;
 	}
 
+	/* A NAN vif has no vif->txq; its SDFs are queued on vif->txq_mgmt,
+	 * whose wcid was never set and defaults to 0 (WTBL 0 has no unicast
+	 * rate), so unicast follow-ups go unacknowledged. Point txq_mgmt at
+	 * the same interface WTBL as the beacon path so SDFs continue to use
+	 * txq_mgmt but with a properly initialised wcid.
+	 */
+	if (vif->txq_mgmt) {
+		mtxq = (struct mt76_txq *)vif->txq_mgmt->drv_priv;
+		mtxq->wcid = idx;
+	}
+
 out:
 	return ret;
 }
-- 
2.43.0


