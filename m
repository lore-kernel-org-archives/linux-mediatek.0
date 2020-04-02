Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5AC2BA16
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00119208E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSj6qsAj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0lpHmD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00119208E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw9BsyHtGL20OAPWMz5d26r/XyIw6iIhfpu3xUdxoh4=; b=YSj6qsAjZwxOTT
	0SM4lYRrCRcFJnoQIXXP/CUV8BoiFbbGVj+6KfEnxDllwGpT/R9FwDt7EUZwYvQtDrG6QPABV4WZ5
	UPNmJ2VAvbUIVTRl2mbZDMFi9O+ZvdEeWx7iupzmDrK+pdFIpj5NuBcuJ610D1dGz5omeAvZ2Cvuk
	SCjPDDzkLAsVo9SOubhG501NSEIMeQ8htSj1+jauTkGVJU/dc2SQJYc1f/0hyvcI28uNTM6kTRdbp
	oI0TJJpGFjRydaMs/Joy+s827xHW6njP08v22sILbNTWw2YFKhtzKLkTf4e4R0qkiE+um1VDB0GJ9
	v+e+mtx43JfI3/pceMdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK4RB-0000va-Bi; Thu, 02 Apr 2020 18:19:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK4R5-0000nq-Mt
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 18:19:29 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0324020BED;
 Thu,  2 Apr 2020 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585851567;
 bh=cgadFpj6F9DWfBCLRSNBDY3c5hZQkzUcEfymNRsHvJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0lpHmD3pGbolkzx/ebfMXGZfm7fCkek1Q365PLS3UoC6i6phFWBuPzNqRKL2tiqg
 eOs40bJW+If1stxWLTXVKk4xKT9FB9NMqzDep0yiBhU2MnXHeiieG4+3FdUCzKQNoc
 pQ1AC2joI3maTDr+06lhDximbo5eMZvSi9mlBP+w=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 8/9] mt76: mt7615: introduce mt7615_wtbl_desc data structure
Date: Thu,  2 Apr 2020 20:18:55 +0200
Message-Id: <caec62c349f28d5aa6ce7925666c29e3be513e26.1585851049.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585851049.git.lorenzo@kernel.org>
References: <cover.1585851049.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_111927_809914_A3C4B0FA 
X-CRM114-Status: UNSURE (   9.67  )
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

Generalize mt7615_rate_desc introducing mt7615_wtbl_desc and
mt7615_key_desc data structures in order to configure the hw wtbl
in a non-atomic context for usb devices

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  1 -
 .../wireless/mediatek/mt76/mt7615/mt7615.h    | 29 ++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 86e7c1c1b61e..7b8873002441 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -893,7 +893,6 @@ mt7615_mac_update_rate_desc(struct mt7615_phy *phy, struct mt7615_sta *sta,
 		rd->bw_idx = 7;
 
 	rd->rateset = rateset;
-	rd->sta = sta;
 	rd->bw = bw;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 588cc38bfac0..bd5967f5b4b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -92,10 +92,6 @@ struct mt7615_rate_set {
 };
 
 struct mt7615_rate_desc {
-	struct list_head node;
-
-	struct mt7615_sta *sta;
-
 	bool rateset;
 	u16 probe_val;
 	u16 val[4];
@@ -103,6 +99,31 @@ struct mt7615_rate_desc {
 	u8 bw;
 };
 
+enum mt7615_wtbl_desc_type {
+	MT7615_WTBL_RATE_DESC,
+	MT7615_WTBL_KEY_DESC
+};
+
+struct mt7615_key_desc {
+	enum set_key_cmd cmd;
+	u32 cipher;
+	s8 keyidx;
+	u8 keylen;
+	u8 *key;
+};
+
+struct mt7615_wtbl_desc {
+	struct list_head node;
+
+	enum mt7615_wtbl_desc_type type;
+	struct mt7615_sta *sta;
+
+	union {
+		struct mt7615_rate_desc rate;
+		struct mt7615_key_desc key;
+	};
+};
+
 struct mt7615_sta {
 	struct mt76_wcid wcid; /* must be first */
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
