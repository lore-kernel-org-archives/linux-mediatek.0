Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C60606A327
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x9h3N5od;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NcprzwTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=; b=x9h3N5odngUxQh+y3EUtKZsMaz
	fimsydYK3u8CF+79te3cLaCMBDy3mp5CStfBUo2lrTmeolMpJjXEo76KzYNG5aa7Zbto8an/absr+
	DPJQBYn4ExfHHwe6Dh5XCQXIURWDYOX9P6MhVKHlWirXkohxCiS6JaHo+WdnhFb5eUnY9bYYzk5uS
	HavQPGlFkOdDuQSn/iBgkZTLIvuSYQrNCLQZnWOes4hqygZTODbU7tocOcLbVKg3vE0+4Od+w0xCt
	1+8cSh6RIQxjpoO4PO6qMX4Yb1bgFz2So5G/tOr82+U0sKBlk/TKBM4qQXdCg34qecxN9KHaNXQJV
	CF4Hf+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSe1F-00000000FsL-2S2x;
	Sun, 15 Nov 2026 17:27:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSe1D-00000000FqH-0DlE
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 17:27:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso270683a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2026 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763674; x=1795368474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=NcprzwTxdXDOWeFN2CUADo+WFjUp6sfVPEapCbsljfoy1AOuQd7P6wtR2A0vJJwW9p
         hHBcdFTNL3wQidiik+b8HJAtjOFNCdQKyTe14nEOvRMe76/MiLokJ1PK6yxtpub39eS4
         IMDrJZ9tri3R+DttG9lW1WW8cKwar2CDfGHDoTPeLT9fCv+uwjAUH+6DXMoJCBYeiAQw
         5u+S179Gb+7ii1WosdE0HA1J2foK1qqkPLuTGeuh8okU+dubo92ooq7pa76yY4WTKCND
         VrKafN5MLcfljKcT1QjbPIxkCP6eI7vROJ4CEyO6vH9dbIwBdbqcHaehLnwki0x1VSwp
         TNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763674; x=1795368474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZq1TtzkPhQy6QSrv4+k4em1DA/SMoMs8wNz51go2nA=;
        b=DoNf377fDT/+FRKnNo0pFG3tSe/7lk/vyA8F3CkXft9LaaqenCPXzeOIDz908zTQOc
         VY4jYOsPcY62R+oArz4VRK9oaLmV1Jno3ehsLauXuNCNWlKFYgEstBbULENjbnwxtRux
         xWT569UqgVdqBGelU/kgE2uUOuo66JfEUiMI6m2WNzI8cr+I26+9Euh3nw2/BUKNRpjQ
         FHWp7PvADJv+xgJMFtrHRNUmW0VkIBJfJ1Zuyq04/KY70dUMHVi+ocdlK/MrnriPZCRO
         w20Arb+G3MLxD4Bq2E+hXKJlKK/cVWstLE3zQTnAE/F00g8jdyF1uFEMVOjLWV0W0bqn
         fmHQ==
X-Forwarded-Encrypted: i=1; AL+hErGxMUF6RyST/ubmLjB8IF3VLyD8d4DIokHsdBPqXa+L49e4mj2KucpW6QM5qUzC7e1kV29hVWJeDq9OUYI97Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/f3b72HVecJ70SVBn4pv1HSDDUaUUz1unxdtw9vytGk4w59nl5
	2LC8AxicrpdD+SE7pqPvgJAHCHbflLpNSKgR8eBKG9VQHQxy+slb01OQ
X-Gm-Gg: AYBFou3555hUJMXt9XTnFHyfYqtLWisQ9YjzhIR9P7N3FEtANemPsgvab6QtE2CMGO9
	FAUEWNYKzh1P8akpMEcXzCO27d03OgCmbsLkTBBadLKP0kQgidhJCsyVKJNBxRPrTnNiUt2fp9u
	NWri90kLFkVcpsB4j3CyerkGJ57zXl1QVPSMflcE2DdR6AiFJysjkk8TuJdIAN1UccPpNBXRPDd
	w+2Le1jMSbARnb6wMRQ6ZkOiXzO7dln2siftfJwP2aQvyjKaYIi0jwLTak3civlenc8SRVclcSc
	AXxW/kgma36z4kamizrbyJ0jy9DF4uF7Xkg6lvP+qUQh+7kXgz46ELAx83pmG20iUlomxmXU1dJ
	RcfIVrkZdTQFS6jMBYjc/dLEX8h+t+RutOJDgxWIEPu700BDwIzAjjkeWGs4DsEutB6QKJTeUAt
	dS1wF8X/lm9q1DZCeTS6v2KpeFSH6gQ++smNRtx4vKCRWSeMvIvEQClCyIreH53yf03alYrrUiA
	DGPOjS6uNnQaQpNwOD57nl9i5qKzXLeyTi/qCfD++SOeRIzZE3vtdvMsRyajb6gwi2NRXGtltss
	sl+EOyXLjTpteFuup4k3peAPmikw/gZZHj7JP07+B5ovvV0XKaN08cI=
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr5600119a91.35.1794763673371;
        Sun, 15 Nov 2026 09:27:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm19051936a91.12.2026.11.15.09.27.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:27:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chad Monroe <chad@monroe.io>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Dylan Eskew <dylan.eskew@candelatech.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: check the RX WCID before using its station link
Date: Mon, 16 Nov 2026 01:27:22 +0800
Message-ID: <20261115172723.34964-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_092755_097048_BD57F7A1 
X-CRM114-Status: GOOD (  12.27  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7996_rx_get_wcid() returns NULL when the reported WLAN index does not
map to a station entry on a valid band. Commit a3ea1c309bf3 ("wifi:
mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO") made
mt7996_reverse_frag0_hdr_trans() load msta_link->sta while declaring its
locals, ahead of the !msta check that used to reject a NULL WCID. A
header-translated first fragment without a station WCID now
dereferences a NULL pointer in the receive path.

Check the link before loading its station pointer.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: a3ea1c309bf3 ("wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f36da545045b..186216f21d28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -191,12 +191,12 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct ethhdr *eth_hdr = (struct ethhdr *)(skb->data + hdr_gap);
 	struct mt7996_sta_link *msta_link = (void *)status->wcid;
-	struct mt7996_sta *msta = msta_link->sta;
 	struct ieee80211_bss_conf *link_conf;
 	__le32 *rxd = (__le32 *)skb->data;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct ieee80211_hdr hdr;
+	struct mt7996_sta *msta;
 	u16 frame_control;
 
 	if (le32_get_bits(rxd[3], MT_RXD3_NORMAL_ADDR_TYPE) !=
@@ -206,6 +206,10 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
 		return -EINVAL;
 
+	if (!msta_link)
+		return -EINVAL;
+
+	msta = msta_link->sta;
 	if (!msta || !msta->vif)
 		return -EINVAL;
 

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1


