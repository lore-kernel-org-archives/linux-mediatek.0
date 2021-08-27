Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15B7C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 17:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69BA60E93
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 17:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A69BA60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monroe.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGb+W2g36XI7g7wFlOpMCCVxVVV4LkM+Wym2klcmRiY=; b=u2hq+gpNdUF7wf
	TvIOEE2dq4VkuC08GILo9LOKSZySgEW4SRrovFR6E2gjtFBUxeOfgluNyur01r+UCfZuyz+bYYYSK
	m5ZJ3mkxkt8Ss7B8FsrNYaCDyEcN3i9s18mMfP2z23qUBl+JhD4BohU2fE3UNgvRitEUO2hop6Kuf
	WGkJZg6FN3S/iaroXess7s6rAIoVM/4uotx7awklaKWZrhZfL85n8LIXyDTBBLtqzbzAzF0+F1vZ5
	p9IY5x9cjHuF77mgSv0pypnzgWTvyRP8TMFBZx+inA9vX7ZlEz+NghpqGo0rOIgGGQr/I8wrAr4t3
	Ug2Y9AAo26LHDxyZ5d8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJfJT-00CouJ-KQ; Fri, 27 Aug 2021 17:06:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJfJQ-00Cotj-Uv
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 17:06:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id fz10so5001499pjb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Aug 2021 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monroe-io.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z2xInlpgauFs+d4JpWFzn49odZkDB3KSlUmEhIVZRpU=;
 b=A95cUdyHn5ZUFX6x/pqrt4Sg2wHekCVgIx+z2DE8MLI65FVcg4mzgdUrhcP38NLuwM
 w6Bm+oYOXe7OFOyxXzwFqBaWDCxfez+GVop6dh57KsPvDN7w4a9B55crA3Qq2VrucXzn
 aWYO8n4ignq6Wk7v4o6KXLuDNo9DVG5MoLq/v3VyUzhvxLGwkPbbsr2Bj3C6T8ZU9p9N
 h4xPhMeWDMXXTnmePA+Itd6PSQ16ivwUrEVd5/mNUO1HkvXtfNZxG6OLTB9jBINXx3pl
 qsad4ZyljzXVZ0TxdU+sjIphhgMkDnqqAIuYP57NJ8vrlxzHYtrUhuhfjYiFKdj/wqRo
 PFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z2xInlpgauFs+d4JpWFzn49odZkDB3KSlUmEhIVZRpU=;
 b=HgVjQpDEklG0Xhl9mNHGHlGDS10TvxYuNZNrWCX9QounH/7XWaAqUnAKj3TTheOyD7
 oA9LTKHBWwuQLYhmbI4+koanq5fCSIFT2eIcGsa7Z9qWimxoXYjob+4F0rm1W2qbVFlR
 5zXf06wIYD/IqfJc+fwelroFLr4xKkOYrlfO9PChg0Hi0/bt1M+M5SQFfdax8otnTcRO
 zs2+7OgOusKfZzyKacL2Q/qbYL8hwg/qysOa+ljEnfF8xJmmXzul9DsUVB5UZjUetRoB
 f6mZ3qrn+veqpst3aKrOYzFBtjD1h3q/VXnda+LYXSsm31+QVvjHL8WSTQoJCqlRubHF
 3nlA==
X-Gm-Message-State: AOAM5315FOtNj0IVG5vvPZ61tPFPhu28gvW6PA0Y2hpXn5ia8fo7fAiK
 ZPgCQov93OektNHWAJcjNSpzOg==
X-Google-Smtp-Source: ABdhPJya8N9a+GPYY1Sg9FJRCDrQ2AEw4gh5y5L6TNo/w4uO5D4kOrlEJcoc8FMgnOUtrODvW3KRgg==
X-Received: by 2002:a17:90b:1c8c:: with SMTP id
 oo12mr24050886pjb.170.1630083999234; 
 Fri, 27 Aug 2021 10:06:39 -0700 (PDT)
Received: from bfg9000.smartrg.link (wsip-98-173-202-84.sb.sd.cox.net.
 [98.173.202.84])
 by smtp.googlemail.com with ESMTPSA id s32sm6546670pfw.84.2021.08.27.10.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:06:38 -0700 (PDT)
From: Chad Monroe <chad@monroe.io>
To: Felix Fietkau <nbd@nbd.name>,
	Johannes Berg <johannes.berg@intel.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chad Monroe <chad@monroe.io>, Rubio Lu <Rubio-DW.Lu@mediatek.com>,
 Ben Greear <greearb@candelatech.com>
Subject: [PATCH 1/2] mt76: mt7615: fix STA mode connection on DFS channels
Date: Fri, 27 Aug 2021 10:06:31 -0700
Message-Id: <54c9a89210608d2a9b9adf37a8c2a743275e5723.1630081048.git.chad@monroe.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_100641_088214_163B6C9D 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Only AP, adhoc and mesh mode needs to check CAC.
Stations, in particular, do not need this check.

Signed-off-by: Rubio Lu <Rubio-DW.Lu@mediatek.com>
Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Chad Monroe <chad@monroe.io>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index ed1bba42a322..78b55e872da0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2153,6 +2153,32 @@ static int mt7615_dfs_start_radar_detector(struct mt7615_phy *phy)
 	return 0;
 }
 
+struct mt7615_vif_counts {
+	u32 mesh;
+	u32 adhoc;
+	u32 ap;
+};
+
+static void
+mt7615_vif_counts(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7615_vif_counts *counts = priv;
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_ADHOC:
+		counts->adhoc++;
+		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		counts->mesh++;
+		break;
+	case NL80211_IFTYPE_AP:
+		counts->ap++;
+		break;
+	default:
+		break;
+	}
+}
+
 static int
 mt7615_dfs_init_radar_specs(struct mt7615_phy *phy)
 {
@@ -2196,6 +2222,7 @@ int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy)
 	struct mt7615_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
 	int err;
+	struct mt7615_vif_counts counts = {0};
 
 	if (is_mt7663(&dev->mt76))
 		return 0;
@@ -2223,9 +2250,14 @@ int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy)
 	phy->dfs_state = chandef->chan->dfs_state;
 
 	if (chandef->chan->flags & IEEE80211_CHAN_RADAR) {
-		if (chandef->chan->dfs_state != NL80211_DFS_AVAILABLE)
-			return mt7615_dfs_start_radar_detector(phy);
-
+		if (chandef->chan->dfs_state != NL80211_DFS_AVAILABLE) {
+			ieee80211_iterate_active_interfaces(phy->mt76->hw,
+				IEEE80211_IFACE_ITER_RESUME_ALL,
+				mt7615_vif_counts, &counts);
+			if (counts.ap + counts.adhoc + counts.mesh)
+				mt7615_dfs_start_radar_detector(phy);
+			return 0;
+		}
 		return mt7615_mcu_rdd_cmd(dev, RDD_CAC_END, ext_phy,
 					  MT_RX_SEL0, 0);
 	}
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
