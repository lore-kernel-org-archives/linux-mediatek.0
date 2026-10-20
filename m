Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6060A261E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tzmSwyLv;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dzEnfoVg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVKQ7US5Q7o3zuAmWEtLYwco4w3ej7rQWppkYb72eK4=; b=tzmSwyLvngdY/zXtXBPJQvexv0
	reXIt0CDWKRsZW0nLGdBLfBqTn6hWwFGz6LQxs1wGLlgwRpLMYajyJtZ/TrSQU3msxT/0CzvKt5S0
	+sovsjRgP3UbLRWDkzRixHN9BsyiFRzM7t9gpxnt8sZXrTLJKnZhqmfZCzl2Pu+3I0E59VEf5QFzS
	9IRSrFPq1uC+s9COHpxrTEWFrsmnGL2259p1LR6DYskHtUvhrCFxgjpqIdZkLub6Wu6gmSFNt+PqH
	NgTRdDNOhkH3fCTGMMEsglX4GXDqq9yoZBDGuhDPTTGS1Ar9rp4h0ozKnsVN/h5fjviS+c37q9uos
	tmRvEN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvU-00000008jRf-0Myr;
	Tue, 20 Oct 2026 02:50:08 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvJ-00000008jG2-2yT4;
	Tue, 20 Oct 2026 02:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UV
	KQ7US5Q7o3zuAmWEtLYwco4w3ej7rQWppkYb72eK4=; b=dzEnfoVgaQJ4jbNdGk
	0zoXGowT+i8lA0vEzI68KsvHKEu/q4oDswpdcepSzpsbrp4RKnsBLtGFfRMItCNs
	eOz0d+npciqMDCKnvl0yt/SDzp4i7VR06BzWc/FijmRYgn1kxD0eF6OXZBjcft43
	xWtEFSnwiM53Cc/f2Qvhkcl+8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S9;
	Tue, 20 Oct 2026 10:49:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/7] wifi: mt76: mt7996: validate RF register response length
Date: Tue, 20 Oct 2026 10:49:33 +0800
Message-Id: <20261020024933.3205681-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7KFWkKFyfJF45CFW5GFg_yoWDtFc_uw
	1vvFnxJr18Kw4UKr42kws3urWFyay8Zas7u39xt3yFgay7JFW7urZ3Zr15Gr9293Z7ZFyU
	Grn8Ja13Aa4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wk4cmrW1smTwgAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194958_145720_9241A8CD 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RF register query reads a fixed firmware response without checking
its length. A truncated response can cause an out-of-bounds read.

Require the complete register response before accessing its value.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d87851c5fc1d..c248055a2c94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -5379,6 +5379,10 @@ int mt7996_mcu_rf_regval(struct mt7996_dev *dev, u32 regidx, u32 *val, bool set)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (void *)skb->data;
 	*val = le32_to_cpu(res->data);
-- 
2.34.1


