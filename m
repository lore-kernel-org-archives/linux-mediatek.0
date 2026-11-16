Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30252606A333
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmMhiJO1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aqPXottFYOutXOMQvzlLK+26GjfsJhTTj7QpTc22c+E=; b=XmMhiJO1BdXclZ
	nYZ+9pcnxboyEsTQf+xKBU8brlJG/OzTFAqTYKEiunNmmOaL8nUjvGerDIDqq4OUJeD0YgbjnqQC8
	FTaIfbiY76qLeEZU1RYkr2HQqpOgqDUPMHovSFBt684NbLY3LoD1+LdGg4CEFPKrJvF6Ep+YMjoPX
	b1hTiGI413y082NSNP8aP6Kwz8SSu8y5EQE0JEhptRTM5Bvpn3akxqXR4AGdJpxEkhTKyBuWIfLZ4
	LCtvOJqn03ZkoE+CsbtpaIhloUKq4lEhPdYCZnD8znasCc+zcc+kdI638V2699uGzk26dMnl/VDzn
	7XPtTCp3HxU9bUE8I1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yi-000000049WR-3uDu;
	Mon, 16 Nov 2026 23:19:12 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yg-000000049Vi-44Sn
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:12 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53dbe9b8d6eso276597b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871150; x=1795475950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqPXottFYOutXOMQvzlLK+26GjfsJhTTj7QpTc22c+E=;
        b=2P55BhlszbD7CKxqui3p6MknqPd5wBDKntxwvjPHEvruOZeY4Q4WLOwNsFdJMEu6ME
         MoEQAEslmouMWpyeEWJVxioV0GnSeMyE+Pcr9oxjnXDkctsQOT2BIfwplJKiFik6ygN9
         vqftmbyaU9J6Wn2pk94fk1OuWRBQUI6gZVWzren+9rGn9u/4fddWP0Y3zXAuKlL6JQa/
         pVqjs2zT6ikTYGg8DT/31uB1aueoM2TUu7MmC7nPBYWK01f1RmU0NaFwOm/bqZHNYuB7
         PPJ/YvZeYAxPXAAo4GUz0+WqY3EwRxW5b37GfTUZfNm2mIi/aeZhWSpu/swd2EqCVAQU
         V7hg==
X-Forwarded-Encrypted: i=1; AL+hErG3U6MGZoJ7K28YEStV71aH9ZxtcPHU9gOzFI/srmnPx4z5g0mnnn/CHZTsdaLATXtZM4q2w17hiPjKERxGqQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9OdakLCkRt3cmyznE7L6a5vxVeSNF/mrOuvegnKfWNBgiSrLO9
	LcqG7GG+6OgrzPEfOJyWOz38oTztOumo/4wiPwAeSeLDHtMLPtv7rE6P
X-Gm-Gg: AYBFou1hU9SAihCbAlyBRax/2aOPLMsbQafIWIbJDxlDEmemyopUrKbCA8c2GENacjg
	aKjqh8ACxqMyibV32xSrMouTbFWcAJWZWfiu/56sWifPGOWluv4fjAVEOHakD3kq4zbh0qlRW8U
	X0B7Hll1/njwkTuCJ51Yl2nNO201YtI2sntz0gcEsnoRvtiG3euRiNKceAv7EGJR0WRBj5+gjIR
	PGqYb63vYr+uBrAqmBfTY+FFc6IP/TflVVzipWIQlNPFvg4eeLuXcJSt5GpVpG6Bc4u14p66nnY
	kva1Cf7jsKVF6hatL8KZ2lXMt3RWuxh6VZkJBsfzr+lpfqDxpN+HbILXYfSG04iHFoz0ecYmEWv
	wDBHfWGAEjjEffPZZ9E+hNXa8AG4nxmLwzP1KUG+8u1RAp/A6SuPzWgxKZnuPeZxe6ZGtG4HRif
	PjWhr7S1/7Z7K+5RLllYFKxi+eEJyQW9G1Trqi4Jc0H8R3Vgxnipd35w6Gyzab88oQkLEf0x8cQ
	I8D3I0ZymruKQjqxTkw2SRA4Jtj6fPcpu4McNz4ShUEKHHOeYvLYdUoMIrwRSdM+WGlssYQEipr
	f/zqo4Y00oiyO9Z9G1gK1sNhYGJ2GP6WQCzDkMBZneNSXq7pb53gQhy/xclESyVVR5BpkRAclyF
	Hc4/y57lD
X-Received: by 2002:a05:6808:2207:b0:564:3fe1:2f9a with SMTP id 5614622812f47-575dbb40c30mr615685b6e.17.1794871149690;
        Mon, 16 Nov 2026 15:19:09 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:07 -0800 (PST)
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
Subject: [PATCH v2 08/19] wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA removal
Date: Mon, 16 Nov 2026 17:16:19 -0600
Message-ID: <20261116231630.1733906-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151911_018103_C0DD24B3 
X-CRM114-Status: GOOD (  11.86  )
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

mt7925_mac_sta_remove_links() sent BSS_INFO(active=0) for every vif type
except AP when a peer STA was removed. NAN (nan0) and NAN_DATA (ndi0)
BSSes host multiple peer STAs like an AP does: removing the NMI peer on
NDP teardown deactivated the shared NAN sync BSS in FW, after which FW
dropped every host-initiated NAN mgmt frame (TXM: An MMPDU for an
inactive BSS_INFO) until the next NAN_START. With partial availability
bitmaps this made every NDP re-establishment after a teardown fail
(unicast NAF TXCNT 15/15 no-ack); full bitmaps masked the bug. It also
tears down the shared data BSS while other NDPs on the same NDI live.

Exclude NAN and NAN_DATA vifs like AP.

Verified on 187/235: teardown no longer emits the BSS disable cmd, the
FW drop flood is gone, and half-bitmap re-establishment after
nan_ndp_terminate succeeds repeatedly (was 100% fail).

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2ff58b0742b1..109ad137c8f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1524,7 +1524,16 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		struct mt792x_bss_conf *mconf;
 		struct mt792x_link_sta *mlink;
 
-		if (vif->type == NL80211_IFTYPE_AP)
+		/* AP, NAN, and NAN_DATA BSSes host multiple peer STAs; removing
+		 * one peer must not deactivate the shared BSS. For NAN, doing
+		 * so would kill the sync BSS and the firmware would drop all
+		 * subsequent host-originated NAN management frames. For
+		 * NAN_DATA, it would tear down all other NDPs sharing the same
+		 * NDI.
+		 */
+		if (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_NAN ||
+		    vif->type == NL80211_IFTYPE_NAN_DATA)
 			break;
 
 		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
-- 
2.43.0


