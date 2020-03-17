Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D65C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480DD20735
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="maiQ6lmC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLkhiKbH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 480DD20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNc9CL69e/OsMVckbHlJPGFhV1NqJzfdO5ByOSdaiHE=; b=maiQ6lmCmzNXsJ
	CtDkDPUTME4+A3EpNNKkDDhlgBIRBtLiUAuF9JGqWQbGwJC+BHQsLkVwlE94IdNmOZzHl9ZIft8Tb
	3V0OROLmvFcWsR+4fUn0B/PI/4ko57YSZFoYPnsmEbIPyEdwfLCJiBvSaqqnrqirkNtatde5hs6F5
	7dNN32+CZ1VrrrJwx/MqpaTP5RBnLA+MLv4yM0KX5+Z8OWSp847F0ApEZCLcnpKoVpKvN8ZrYgwEF
	FPciZDljcbLtUQ/86zBbFWWqZ8b9jGBYpxzxvWxuQo2JYcBqrbff+XxEsnoFLcZtFvUJlMdkceJmK
	LgQqHUO7U6wlV3mAefBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIj-0007Vx-Mk; Tue, 17 Mar 2020 16:42:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIc-0007Jf-68
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:39 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 071C320663;
 Tue, 17 Mar 2020 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463357;
 bh=hTimax+oZjOzD9e1mB5+sI8iqyRbV+3ZpwnJohD8n/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLkhiKbH5cpqVOR6A2HRYCXaMbPkiFpKjDnknScy781x3/+S3mG8JSGA15GYY4jNU
 Ae/Zvf8eOPLG2qJ14eeGR52wnE8C6L6H+chPkd62iEgNL8kiZ9v6TcX6XVXtLvwABa
 YAKZAcpjqqOznRC3cWnVHB2B5pZHt9YNh3O9VlF0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 24/25] mt76: mt7615: get rid of sta_rec_wtbl data structure
Date: Tue, 17 Mar 2020 17:41:31 +0100
Message-Id: <02778e136c4b5d5bc5897ee19e8053686f3c6358.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094238_309931_CCDEFAC3 
X-CRM114-Status: UNSURE (   8.86  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sobstitute sta_rec_wtbl data structure with tlv one

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 17 +++++++----------
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.h |  7 +------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 9840933211a4..8e0225e6cc72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -486,7 +486,7 @@ static struct wtbl_req_hdr *
 mt7615_mcu_alloc_wtbl_req(struct mt7615_sta *msta, int cmd,
 			  void *sta_wtbl, struct sk_buff **skb)
 {
-	struct sta_rec_wtbl *sta_hdr = sta_wtbl;
+	struct tlv *sta_hdr = sta_wtbl;
 	struct wtbl_req_hdr hdr = {
 		.wlan_idx = msta->wcid.idx,
 		.operation = cmd,
@@ -512,7 +512,7 @@ mt7615_mcu_add_nested_tlv(struct sk_buff *skb, int tag, int len,
 			  void *sta_ntlv, void *sta_wtbl)
 {
 	struct sta_ntlv_hdr *ntlv_hdr = sta_ntlv;
-	struct sta_rec_wtbl *sta_hdr = sta_wtbl;
+	struct tlv *sta_hdr = sta_wtbl;
 	struct tlv *ptlv, tlv = {
 		.tag = cpu_to_le16(tag),
 		.len = cpu_to_le16(len),
@@ -1035,8 +1035,8 @@ mt7615_mcu_sta_ba(struct mt7615_dev *dev,
 		return PTR_ERR(skb);
 
 	mt7615_mcu_sta_ba_tlv(skb, params, enable, tx);
-	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
-				      sizeof(struct sta_rec_wtbl));
+
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_SET, sta_wtbl, &skb);
 	mt7615_mcu_wtbl_ba_tlv(skb, params, enable, tx, sta_wtbl, wtbl_hdr);
@@ -1081,8 +1081,7 @@ mt7615_mcu_add_sta_cmd(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	if (enable && sta)
 		mt7615_mcu_sta_ht_tlv(skb, sta);
 
-	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
-				      sizeof(struct sta_rec_wtbl));
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_RESET_AND_SET,
 					     sta_wtbl, &skb);
@@ -1330,8 +1329,7 @@ mt7615_mcu_uni_tx_ba(struct mt7615_dev *dev,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
-				      sizeof(struct sta_rec_wtbl));
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_SET, sta_wtbl, &skb);
 	if (IS_ERR(wtbl_hdr))
@@ -1382,8 +1380,7 @@ mt7615_mcu_uni_rx_ba(struct mt7615_dev *dev,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
-				      sizeof(struct sta_rec_wtbl));
+	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_SET, sta_wtbl, &skb);
 	if (IS_ERR(wtbl_hdr))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 62a7b86f2a3b..d1f7391472fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -577,7 +577,7 @@ struct wtbl_raw {
 					 sizeof(struct sta_rec_basic) +	\
 					 sizeof(struct sta_rec_ht) +	\
 					 sizeof(struct sta_rec_vht) +	\
-					 sizeof(struct sta_rec_wtbl) +	\
+					 sizeof(struct tlv) +	\
 					 MT7615_WTBL_UPDATE_MAX_SIZE)
 
 #define MT7615_WTBL_UPDATE_BA_SIZE	(sizeof(struct wtbl_req_hdr) +	\
@@ -666,11 +666,6 @@ struct sta_rec_ba {
 	__le16 winsize;
 } __packed;
 
-struct sta_rec_wtbl {
-	__le16 tag;
-	__le16 len;
-} __packed;
-
 enum {
 	STA_REC_BASIC,
 	STA_REC_RA,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
