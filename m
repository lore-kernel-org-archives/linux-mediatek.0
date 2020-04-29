Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BF7C83004
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 17:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF45208FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 17:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4ytwXXn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNbXGPbC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF45208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/cosQWYT85dj/MVW46JWOQ/u/ujXK+DpyXb4kZAIdfw=; b=B4ytwXXnuJh2xs
	lM6vlqX575ZEbBAYIiz3Y6mGET604SL7szSQYbUEgQTH3fGNH+j2iq5s+D6mTEDZ1vrXuuXXvfoUQ
	OHjTDW3+gH1RMDhTEscwqwj0X7S1zUFD7qAnrAqR8x3B2FZ6WvcGmf1A0zO8K29BIgfIqGZ6hhQHz
	AiEiTE/WYP6D/IQh4FMqQjx1jn3l3KA1LUaJXjZgOjv8GzxXlsIiwenuQqkucxkJFTn5oiTa42ztB
	WFmGD4JUzSZUGiGFX9Gcwm3q7nWwC11NsUgigacp4J0lJvDn3uTVPL9x+hlDrgD2Du879C47worjU
	Dvv06W9/6IboS62GuZcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTqpX-0002il-2J; Wed, 29 Apr 2020 17:49:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTqpU-0002hL-Pr
 for linux-mediatek@lists.infradead.org; Wed, 29 Apr 2020 17:49:06 +0000
Received: from localhost.localdomain.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2D4C208FE;
 Wed, 29 Apr 2020 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588182543;
 bh=XyaCyX6NasKY8y249zF6XaHJE8b9TcC0AsHaX8FpsQQ=;
 h=From:To:Cc:Subject:Date:From;
 b=uNbXGPbCF6os6KOlfEmBUP+AiyaK07hzyol6EouD97lYHVtZKGny5TkH01Dsx5hBs
 CJeACNg9nQBGm0MHD4CPTMpM/wtJtwOZC0B7/TivtJjsjS6HvIl+G9TYdiASDW6Bv5
 jthPrT2DQq0dgxNIYACFm9JYezUMUfDXurEesCEk=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: fix ssid configuration in mt7615_mcu_hw_scan
Date: Wed, 29 Apr 2020 19:48:53 +0200
Message-Id: <3a36f4878f8368f57b2b3f8ab396ba418e9447dd.1588182106.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_104904_861129_619E6E2A 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix SSID configuration performing hw frequency scanning

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 57794827400c..727a55abda69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2713,9 +2713,9 @@ int mt7615_mcu_hw_scan(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct cfg80211_scan_request *sreq = &scan_req->req;
+	int n_ssids = 0, err, i, duration = MT7615_SCAN_CHANNEL_TIME;
 	int ext_channels_num = max_t(int, sreq->n_channels - 32, 0);
 	struct ieee80211_channel **scan_list = sreq->channels;
-	int err, i, duration = MT7615_SCAN_CHANNEL_TIME;
 	struct mt7615_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
 	struct mt7615_mcu_scan_channel *chan;
@@ -2738,16 +2738,21 @@ int mt7615_mcu_hw_scan(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	req->seq_num = mvif->scan_seq_num | ext_phy << 7;
 	req->bss_idx = mvif->idx;
 	req->scan_type = 1;
-	req->ssid_type = 1;
 	req->probe_req_num = 2;
 	req->version = 1;
 	req->channel_type = 4;
 
 	for (i = 0; i < sreq->n_ssids; i++) {
+		if (!sreq->ssids[i].ssid_len)
+			continue;
+
 		req->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
 		memcpy(req->ssids[i].ssid, sreq->ssids[i].ssid,
 		       sreq->ssids[i].ssid_len);
+		n_ssids++;
 	}
+	req->ssid_type = n_ssids ? BIT(2) : BIT(0);
+	req->ssids_num = n_ssids;
 
 	req->timeout_value = cpu_to_le16(sreq->n_channels * duration);
 	req->channel_min_dwell_time = cpu_to_le16(duration);
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
