Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AE606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 22:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhJ+r7+g;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=frI4I1AT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ibD08606yEFUxTJGU5K0RlgFEJpEu1WZ7fdVr6ZErf8=; b=nhJ+r7+gYM8nA2/3hI+SICZqWf
	hTnvN4O+PAU+/G1LGbOCX/UY2ALt8olZmaVJ7CjNU5uvUCxZYmc6mjMlalTWWhv0nxMJ5jPBM+8q5
	GaAzgTRbmX3qeJ+lLI50UFpAUbzQgLdHgrONFpLmA4Q5oyl8R8h0OUTrL9dQWMH8RmqLn9kY+CZfJ
	NiuqIQnxJsrz91LFs+yu0Oo3WKM1t47aEWqxsU+20Te045k3Cjib2p333MALLzR26w5YP6Lj+4QNa
	+mSb3DkWQDio5gjw6t/5nhE5RIVa24qkdGGubi6ANLVBShIkVS2y8YtLzUN3qDARAETxTMCJWowlV
	0bzGsuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSnM-00000003MKx-3A8o;
	Mon, 26 Oct 2026 22:03:56 +0000
Received: from out-12.mta1.migadu.com ([95.215.58.12] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSnJ-00000003MKR-45CN
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 22:03:56 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jh+Q1NPj1U0mthfgFZ04CAfxglcvSphNXg64QZcFOik=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793052230; v=1; x=1793657030;
 b=frI4I1ATEmh1cT7dDgpYt0tW2TtZHvgZ5VjhDk/QS1ImIHUqSHPnR7kz5tK8VdVPF8CWTLnx
 Ep5Y2VMxX0tMOCP/+8zSvzoYvvNySfqmXS2NWG360chBXjjHibiq/g90YRoNMXe+EWwD3nm8phf
 MJ0+eEN0SxrWL5bNqwR3fumM5e5eofz46iVzl+3imv8pbYwXFzT85Yej5sHYepDnvV0vH8Z4h1n
 yMw8yP7Y9EYKo3ttYGIOA55GDxjc+XS9tucnYYOw9kAl4oZe997qlnXDCUl0ujAq/GyIXWypHTp
 QYIxJeLwp3Ug3CbxcxNf4WUDDxdEALAANScrw/4ShBisw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 475ee133ccb2599b;
	Mon, 26 Oct 2026 22:03:49 +0000
X-Mizu-Trace-ID: 475ee133ccb2599b
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt7921: let monitors see other stations' unicast
Date: Mon, 26 Oct 2026 15:03:46 -0700
Message-ID: <20261026220346.601314-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_150354_521162_1C8AC451 
X-CRM114-Status: GOOD (  10.32  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After an mt7921 has scanned or connected, its firmware drops unicast
frames meant for other stations even with the sniffer on. A monitor
then gets the AP's beacons but none of the unicast between the AP and
its clients, so it never catches a handshake.

Clear that filter whenever the sniffer is enabled.

Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
Link: https://github.com/WLAN-Pi/wlanpi-core/pull/364
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Tested on wireless-next with an MT7921AU and an MT7922, the monitor
on channel 6 while clients joined a WPA2 AP:

	handshakes caught, of 3      before   after
	fresh driver load               3        3
	after a scan                    0        3
	after connecting                0        3
	scan while capturing            0        3
	connected while capturing       0        3

Same on 7.2.6 and on 5 GHz. Left up for a few hours with a scan every
few minutes, the monitor didn't miss a handshake. 6.18 also needs
a7d35545c2ce for the scan while capturing.

Once the monitor is gone the radio connects as normal, and the firmware
turns the filter back on by itself.

Doing this from the filter callback instead was only enough for default
monitors. A monitor created with only the fcsfail flag never asks for
other-BSS frames, so it still went blind after a scan.

An A9000 (mt7925) doesn't need it. Its firmware clears the filter by
itself when a monitor comes up, even after a scan.

 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a0caa77339ee..7ef870b2a37b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1207,9 +1207,15 @@ int mt7921_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			.enable = enable,
 		},
 	};
+	int err;
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof(req),
-				 true);
+	err = mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof(req),
+				true);
+	if (err || !enable)
+		return err;
+
+	return mt7921_mcu_set_rxfilter(dev, 0, MT7921_FIF_BIT_CLR,
+				       MT_WF_RFCR_DROP_OTHER_UC);
 }
 
 int mt7921_mcu_config_sniffer(struct mt792x_vif *vif,
-- 
2.56.0


