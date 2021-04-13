Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8C4C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CEF613B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CEF613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ifLoSHC5G4p6sZM6RSLKhKlhwM3fxCeGfuWSij9F1o=; b=pJ7UaVj0D4vw804z5YUNVylsM
	dG99hCCjmJUtPjOmQeiU0vAwNYBRN7a7TlCulRzR0Cn6yjMipo1CD5p5gwCNAo3CV2OCXwF7otSH/
	TJX3WMa1tWS6GRz8XKASEbv7Aw9UHVCTehvGSo4u85I7ZduCK4wI+kuEahmKFYQ8r7q/7St/xKNn4
	WKkm9XjCCcwTXbBWkc2tMEnWM7GJMwLC/U1UXhTxkk317KKS3g0LfyvJbEbq685FgRRI2SyfFwxUO
	iCBMjMs1T1bkNAaaUpFjhdIdPF5a7VO8ZqKyltYd819XvOmPM2ofWBKY1URy+kMyCQwpuTw4kWhZj
	mrYyBgjIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWE11-008YcH-2t; Tue, 13 Apr 2021 08:03:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDy7-008YV2-Ii
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 08:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QGTCRUQtmTRqnH3S5J49kbM2Xlnq4pi2QsHkSTYtWdw=; b=i2Ra5010h6UANQJeO8FvTXxHX/
 Dq+I5hpOIcOkW4aIoJwew2bxnW6UjeGATRRqPYKo/5VGDMdMx0cn+K8yV/jVIQVGgXYhmdDhNtPuj
 RyqqSaoftdE6buPUaZr40dUkDsKWBzGY+AclUwQC9L40ZBxnE77mHFfHQdGaj6zP9DA0m0fGHTAZ1
 DY0x2dL38qgOtSaHwAuYu/jseNaTtEvK3ZfEMrGtMU5GEctMOSn3lSxbS352n/l4yWx1mq8JRmfik
 IEazvHDifaZa6N1FDakuWLs4egKsVMxIWqMpXbNr5EYAzbbiofnM8dtBak79QwSkexfPF1FsxKTos
 6fgVYbvw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDy4-006oqc-F7
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 08:00:18 +0000
X-UUID: d81e314141d74e75a985a1b1563574a3-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QGTCRUQtmTRqnH3S5J49kbM2Xlnq4pi2QsHkSTYtWdw=; 
 b=RNUbhgHslumACD+irh1PwrHJow9EmyGAspE/2qm+YZeXrHHAqad0EoH3dGGIIdE9l+6U4Qsq7eOp6bEITzsskvPid3gSc2HiLc6fyVGjLyECZ9PpGEfVK5FnejSLpW+XJ/9xMYx/gmLL1oUks5hWyWtKm99c2PlhCtwZj6gv6/w=;
X-UUID: d81e314141d74e75a985a1b1563574a3-20210413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 748559731; Tue, 13 Apr 2021 01:00:13 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 01:00:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 16:00:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 16:00:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/2] mt76: mt7615: use ieee80211_free_txskb() in
 mt7615_tx_token_put()
Date: Tue, 13 Apr 2021 16:00:07 +0800
Message-ID: <8fb069c7b6ceb980eb3507db65e4c29fd0aa502a.1618300405.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f5e1b4bf7a66f4e3705bfd673e82b9dd21d41e9a.1618300405.git.ryder.lee@mediatek.com>
References: <f5e1b4bf7a66f4e3705bfd673e82b9dd21d41e9a.1618300405.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6DCE9685DFB0582C41650AD57142A7B045E2BC8EA23BAA34EC97A8422B0FFDA72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_010016_537205_D2B6F332 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

We should use ieee80211_free_txskb() to report skb status avoid wrong
aql accounting after reset.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 60aadf8a09cc..ce71e2c5a8d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2037,8 +2037,12 @@ void mt7615_tx_token_put(struct mt7615_dev *dev)
 	spin_lock_bh(&dev->token_lock);
 	idr_for_each_entry(&dev->token, txwi, id) {
 		mt7615_txp_skb_unmap(&dev->mt76, txwi);
-		if (txwi->skb)
-			dev_kfree_skb_any(txwi->skb);
+		if (txwi->skb) {
+			struct ieee80211_hw *hw;
+
+			hw = mt76_tx_status_get_hw(&dev->mt76, txwi->skb);
+			ieee80211_free_txskb(hw, txwi->skb);
+		}
 		mt76_put_txwi(&dev->mt76, txwi);
 	}
 	spin_unlock_bh(&dev->token_lock);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
