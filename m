Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B350FCD3426
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2026 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eap8RnFDVR20sEEA+o+PI5j6JhdG1y2nOoY00DgIrcI=; b=24FAkMb/p9O6f5IvIgzobOZtCp
	3hMX9jedhTtMrCqjkcgM15Nwv/cCit7VYDZICr0WB9hDIUrH341TKsvliPe8a6dVB8R6IwVdI9Kjm
	hxaaWaJ8W7DqP4gb3M6LxwXavQCxmPw/uf8h70DBvpOhuNxytbxHQjogpp2DLgHv1lhgOlNWyeoyO
	2oWXb1+lPp5jv0pwIOcWDB2sx8eYpp2MV2FuGCz0JwJi4gpDL1FLxdYNGR9NwBWgvrgqE6qjQ6cNb
	rle38kx/qI3XYVXSaV8RJSjXJMvTaEJbxSn/L5f2rC85LchMc1NqTQkobSJzAyCVde0ta/kfhWAAg
	hsWXJlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJKyo-0000000A0IC-1R4I;
	Sun, 03 May 2026 00:46:42 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJKyk-0000000A0Hh-2zt1
	for linux-mediatek@lists.infradead.org;
	Sun, 03 May 2026 00:46:40 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7de4ebe10cbso2483153a34.3
        for <linux-mediatek@lists.infradead.org>; Sat, 02 May 2026 17:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777769196; x=1778373996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eap8RnFDVR20sEEA+o+PI5j6JhdG1y2nOoY00DgIrcI=;
        b=nFVPSKNU8M+2FbLx6LrlHPb8MzbmHcBk9A9/Z757qzH8VF+hcBwvRLlU9ixP0Na2rS
         a1l4ttlchAkQDqB2w+G8mL3k9nxsCVl08d2Qm6yGRXycCNWolIw0j7KElKzXLwGnj3oR
         OMZ8M7PxQQe0kZMefNKLFCY1/B/VAFcm7VkjhEnEpJXjPjw80eqM9itGxmreqen4Cmcb
         /8o4ZDAtgvbrwuI/VekFqdr4UcdUN/8Vbfo6WelWYkK6sUZjB3A2Af2TKSy0zrqoqWOj
         l7o5K+y1aT4MoBNtb3lf+fyOqHbWsOFVchGSDZXzuW5deS2CjynC4ntkkeXn/GSseHAX
         HeKw==
X-Forwarded-Encrypted: i=1; AFNElJ8tyAfdhJFRopg31W5dDiNePuDUzsMmS6UprSga870xLC9z0dwpVo8XYZjXK22CryA2PyeFvMBRP4oRfHz++Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZL61NjclsxgQgklvDMgGTwzSONap2WW1F8wazSaVYLzhh7PF7
	Inv3mj8Yjwn+VCf9SFFu7PPV9tnTOIZmVtYRMj2HMLJE2zaj+m6d0kzN
X-Gm-Gg: AeBDieta4TjcSaQLf6Yla2WaiE1HwYPCglN1nu/r/4ZTnhZFHmjTcOcHr0s0YjFpnf1
	X+slvYI84T2iyyD55EJzwQYG1S2+d8ghOk3+04s/GmNe0HgNwSp2TRawEwfQA6/BKFAsXjrq45Z
	HE1OFXxmRRnHA1UiW6IBgwR+Gj4AW6cCaI9ZNBcbyjv8TftiYoFexfVvCoXRC7Xft7kswDYVS9s
	/vIwdvkACvUp+PQbhGYmKbeoWIOnV/AxBOvUu253wYMzkcSnUEFeRshAaDkhiQFIiYz23U6fj8P
	0AuaW/NN0UZP3Ca4knM1O4WdBiKBum0gy4SMuo+159/+7JowG+WgKKjEd+6KPuLQcPPsrwErvMW
	r8kuz00XLJU7OcT/veBSGKmkr3OlzkZ5XEdg6/e/4Ytzvh2ynSWbVIH2pERAOevLBDFIIvZ1PLi
	KbpxjCm7Id2wt/55wxiyLGY8rY3inkO3cYE1G+Dc6nCVdCS2gGmt09IKLmxVTS+lNrkqevUNIhN
	5SQd3bQEJzqCldab3u1E28EmCt2ERENVEgP0VnM+ZZE6smEMhhTYg==
X-Received: by 2002:a05:6830:3913:b0:7dc:e1e6:7687 with SMTP id 46e09a7af769-7dee12af86emr2958954a34.4.1777769196312;
        Sat, 02 May 2026 17:46:36 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (65-36-108-159.dyn.grandenetworks.net. [65.36.108.159])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca80d5b7sm5048838a34.9.2026.05.02.17.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 17:46:35 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Bongani Hlope <developer@hlope.org.za>
Subject: [PATCH] wifi: mt76: mt792x: fix NULL dereference during CSA beacon handling
Date: Sat,  2 May 2026 19:46:13 -0500
Message-ID: <20260503004613.17903-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_174638_785943_83212F19 
X-CRM114-Status: GOOD (  10.21  )
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

From: Sean Wang <sean.wang@mediatek.com>

mac80211 may call channel_switch_rx_beacon() while CSA is active, but
mt76's cached dev->new_ctx is not guaranteed to be valid at that point.

Avoid dereferencing dev->new_ctx when the target channel context is not
available and leave the existing CSA timer unchanged.

kernel: Workqueue: events_unbound cfg80211_wiphy_work [cfg80211]
kernel: RIP: 0010:mt7921_channel_switch_rx_beacon+0x1f/0x100
[mt7921_common]
kernel: RAX: 0000000000000000
kernel: CR2: 0000000000000000
kernel: Call Trace:
kernel:  <TASK>
kernel:  ieee80211_sta_process_chanswitch+0x67c/0xee0 [mac80211]
kernel:  ieee80211_rx_mgmt_beacon+0x842/0x22a0 [mac80211]
kernel:  ieee80211_sta_rx_queued_mgmt+0xa7/0xbb0 [mac80211]
kernel:  ieee80211_iface_work+0x62e/0x890 [mac80211]
kernel:  cfg80211_wiphy_work+0x1ee/0x280 [cfg80211]
kernel:  process_scheduled_works+0x180/0x680
kernel:  worker_thread+0x1aa/0x450
kernel:  kthread+0x181/0x1e0
kernel:  ret_from_fork+0x405/0x600
kernel:  ret_from_fork_asm+0x11/0x20
kernel:  </TASK>
kernel: CR2: 0000000000000000
kernel: ---[ end trace 0000000000000000 ]---

mt7925 has the same unsafe dev->new_ctx dereference in its CSA beacon
handling path, so guard both drivers against the missing target channel
context and leave the existing CSA timer unchanged.

Reported-by: Bongani Hlope <developer@hlope.org.za>
Closes: https://lore.kernel.org/linux-wireless/20260502140616.7672da98@bongani-mini.home.org.za/
Fixes: 8aa2f59260eb ("wifi: mt76: mt7921: introduce CSA support")
Fixes: 7900da40e315 ("wifi: mt76: mt7925: introduce CSA support in non-MLO mode")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe7408..a326f4c95c7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1508,6 +1508,9 @@ static void mt7921_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	u16 beacon_interval = vif->bss_conf.beacon_int;
 
+	if (!dev->new_ctx)
+		return;
+
 	if (cfg80211_chandef_identical(&chsw->chandef,
 				       &dev->new_ctx->def) &&
 				       chsw->count) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..b96a8e2efcbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2402,6 +2402,9 @@ static void mt7925_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 
 	beacon_interval = vif->bss_conf.beacon_int;
 
+	if (!dev->new_ctx)
+		return;
+
 	if (cfg80211_chandef_identical(&chsw->chandef,
 				       &dev->new_ctx->def) &&
 				       chsw->count) {
-- 
2.43.0


