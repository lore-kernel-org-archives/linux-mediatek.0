Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A1FF885A
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xngNxV41BEhvXFxOC/XG5a3Q7ux1yO0k1gMe7RtR7BI=; b=0OD3DTjsFE9YgSWCQWL9+oiTFJ
	uw+kplAOrjt3+hOOdW0TfDOGmFZxU89weagiL52rz2u7GS3EcgO70wMQH3YPp2ILpeKLsKK4QMlJz
	F+gA/K3w1LVVQnaKg1QJZazSKunTnk7mxGtrlMwx0SGH+87DDEh6OUMSrCgaFjavZwEabdv7wovEX
	xXqJFCA4mKls+aANanZMkWN6/2Rg7UJ1BxzRHzrf58tVG9XNY0LQuWUX9Gm/9McUXvVvali+ZZgBn
	nbQDyh4UwY9nmhaPVgOmbT+UInZ947tpQr73Ct0WTUQUlmCZ1KdQR8zDJrsj8l51hcXmDQ/qz78gq
	SVLwWn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJucV-0000000DW9v-2cv4;
	Mon, 04 May 2026 14:50:03 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJucS-0000000DW8y-3mwd
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 14:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777906201; x=1809442201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqvm43wvsR8GFjbtDI0arKFPhNLZMxt0mILMOUmpHSg=;
  b=cXjU6gRA3o7uQEEdumV9+rNqttQvTiqytiOcp6zGpLyiBQlaz2JCPVk3
   lt2gZyLcPgRno0X9mQY5bMON7lSWVQ+dil9aSi7wFaA6Dsk3eS+efGsqQ
   3MWDh5g2b4riEDvRf5lQPSoz1AsFcxnRRwZeCj4HKq/OodxMr4Cui9Xc3
   82iBV72LJ1FolA6Tk0I4Ja8Kgjn5QAs9h+j30BG0Z2wxI5han5zUYyVZg
   NDzBDWUAsj3lM8x2CxJ2UheTImGFSKrDwcFs4QGskAyAtqMVD0xw7bWkO
   yn3Kk6tPskgmEipFcses0PjvY83HGCsNOTqKagrhKLYNi7dwr8rBJKHdR
   Q==;
X-CSE-ConnectionGUID: xT7ZwQiDTvqv7KrLsdAflw==
X-CSE-MsgGUID: VEK5Wj9VS7+9t57PCwWzEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78694444"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78694444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:49:59 -0700
X-CSE-ConnectionGUID: +uDe2K0MQBSPIEWH2B6HyQ==
X-CSE-MsgGUID: vhYZaEyuS1mbc55hKie8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="259182110"
Received: from arjan-box.jf.intel.com ([10.88.27.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:49:58 -0700
From: Arjan van de Ven <arjan@linux.intel.com>
To: linux-wireless@vger.kernel.org
Cc: Arjan van de Ven <arjan@linux.intel.com>,
	Bongani Hlope <developer@hlope.org.za>,
	linux-mediatek@lists.infradead.org,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon
Date: Mon,  4 May 2026 07:51:06 -0700
Message-ID: <20260504145107.1329197-1-arjan@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502125824.425d7159@bongani-mini.home.org.za>
References: <20260502125824.425d7159@bongani-mini.home.org.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_075001_056085_DA0C825E 
X-CRM114-Status: GOOD (  11.36  )
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

This patch is based on a BUG as reported by Bongani Hlope at
https://lore.kernel.org/all/20260502125824.425d7159@bongani-mini.home.org.za/

When a channel-switch announcement (CSA) beacon is received,
cfg80211 queues a wiphy work item that eventually calls
mt7921_channel_switch_rx_beacon(). If the station disconnects
(or the channel context is otherwise torn down) between the
time the work is queued and the time it runs, the driver's
dev->new_ctx pointer can already have been cleared to NULL.
mt7921_channel_switch_rx_beacon() then dereferences new_ctx
unconditionally, triggering a NULL pointer dereference at
address 0x0:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt7921_channel_switch_rx_beacon+0x1f/0x100 [mt7921_common]

The same missing guard exists in mt7925_channel_switch_rx_beacon(),
which shares the same code pattern introduced by the same commit.

Add an early-return NULL check for dev->new_ctx in both
mt7921_channel_switch_rx_beacon() and
mt7925_channel_switch_rx_beacon(). When new_ctx is NULL there is
no pending channel switch to process, so returning immediately is
the correct and safe action.

Fixes: 8aa2f59260eb ("wifi: mt76: mt7921: introduce CSA support")
Reported-by: Bongani Hlope <developer@hlope.org.za>
Oops-Analysis: http://oops.fenrus.org/reports/lkml/20260502125824.425d7159@bongani-mini.home.org.za/report.html
Link: https://lore.kernel.org/all/20260502125824.425d7159@bongani-mini.home.org.za/
Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>

---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c |    3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |    3 +++
 2 files changed, 6 insertions(+)

--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1503,6 +1503,9 @@ static void mt7921_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	u16 beacon_interval = vif->bss_conf.beacon_int;
+
+	if (!dev->new_ctx)
+		return;
 
 	if (cfg80211_chandef_identical(&chsw->chandef,
 				       &dev->new_ctx->def) &&
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2392,6 +2392,9 @@ static void mt7925_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	u16 beacon_interval;
 
 	if (ieee80211_vif_is_mld(vif))
 		return;
+
+	if (!dev->new_ctx)
+		return;
 
 	beacon_interval = vif->bss_conf.beacon_int;
 

