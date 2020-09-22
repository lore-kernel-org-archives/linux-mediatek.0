Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6777CC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBC2221EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJWIzuOI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VK0RV/ah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBC2221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvt3STXrkmsyr1NJYt60bJRcwGC+7FRG/+797V9KRIM=; b=WJWIzuOIv3iXb5wpU+Qs/ATOlo
	mPEMCs+7R0X91LkdwlRsgGmly88VgXswRFLfo33/NhqZPUto7Eki53htpReay6MwgkaGlyRafOZ7n
	ITgq4sPneZZbW7VDiRx5cBglKYwc1wgLRnAh5S6/1gGN5oA0HbnoYNc+ncw6Qki3s5qpTVLJmpO7U
	RMNHsA+CKhVAIDRK8ynlZflIeyYYmf4G2neO84yUcawRbcwVVNDfujmxd7MrSsuxTWZ12hf0Hp5FC
	4Q1Ab3bM/+kK2WkXYb39VUt/xY+SjTvGg+t69moKhX8Y+ZSrhWQaCoog09eGZDJs+6s9eEqMHVm8Q
	yuesg7Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgb5-0006qV-IZ; Tue, 22 Sep 2020 11:36:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgb2-0006oc-GI
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 11:36:33 +0000
X-UUID: b78c8acda58e4cbf8d400c83e1677ca0-20200922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QiRB9b6QFX/n3VwaIGIkzGNyJgGwq+YynWOJjCc5ZTM=; 
 b=VK0RV/ahrGJ1tNgRG4RfrLlodZ1iA+DSqgB/ZIlfYXnRiAJusRFX4XTukYYK/Sxqlvrp5gPw8d08jBm3y0vB/izkDpSZmJVLCeQye5L5U9VEun4DwLz9QJfcDAWYP2mDWmCd86II3/WSqLFVV1xqlwAbsnEoItgW11kF4JkmRGw=;
X-UUID: b78c8acda58e4cbf8d400c83e1677ca0-20200922
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 230395503; Tue, 22 Sep 2020 03:36:21 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 04:36:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 19:36:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Sep 2020 19:36:16 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: mt7915: add offchannel condition in switch channel
 command
Date: Tue, 22 Sep 2020 19:36:01 +0800
Message-ID: <20200922113601.5276-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_073632_721622_8073AAE8 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a missing offchannel condition for channel switch reason, which
bypasses DPD calibration to reduce scanning time.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index fa3ea46..742e085 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3212,8 +3212,10 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 		.channel_band = chandef->chan->band,
 	};
 
-	if ((chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
-	    chandef->chan->dfs_state != NL80211_DFS_AVAILABLE)
+	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
+	else if ((chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
+		 chandef->chan->dfs_state != NL80211_DFS_AVAILABLE)
 		req.switch_reason = CH_SWITCH_DFS;
 	else
 		req.switch_reason = CH_SWITCH_NORMAL;
-- 
2.17.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
