Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014A9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:31:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69825611BF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69825611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXStG3TBWRAC87ENO6nHxWIGB2KBQxDkW9AIkhznC4k=; b=hfLcdU4NVHKTW4jjgri88WNi+
	W/X+JUpzTlMkL6LntSuC8oIUSKLBeNoqza1mRBO0WG5vi50TQOPucvXtJCeNG/vK5cIzAY/9PxodF
	RPIB7QXP8TSEv/cCcDx3Nc08Cqm6hPOUK5q05eEdrhUNNy/lXv+YQ1Aigpj+k+yMOqINY5QCYNA5I
	QENFfZIAGAS+kyDrMRK3bdEDzJtAlbdWpuVzhTaT17fXgDMnlJSc6kA5XWgayp317vjXjCXKF6sEG
	29BjtLP1MouEGEYlEze0aMuw7brkDo1Hsk6ZFoEp/z5yx0Fw3h2/LSqee500kdL/28+q66srPjPq3
	RtH9Iq2hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQR2-002dEL-UD; Fri, 16 Apr 2021 15:31:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQR0-002dDy-Sl
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 15:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=0HJrxsbqr7ZDYsTyME3UW9VYqVfKnupiWRzpiffnbKU=; b=cLV+h45t+fpLM1p4HrDiJdpvsk
 fzLQ840UXDovCFaVIEeBoy29a7Dbhu0IbKR6O/RoDVDnLTzGMoR0ddnRi8piG76eUUS476HozvaNK
 UJN5Mfs+R1Q9ajJm/+7xkXA4qIpBGoumhPxxPaxmHSAtFJGlLZE6UdoSiD2zzxRt4dV/XOcYBXvtJ
 dkLlLET7WAaDCRq9TjBmX+Piv5MSDLOiDzuC0gPWV3KhtIkUZpSQW3nNQQzB2ToNKFDzvgwuBWalC
 oB191S5cSAbMT7/bPMUFM93UAde/YsvAbQPhz0M96cUfIosS0LutrhvPh49Lb6iVSyZ0TuCxtM/id
 vuyPdGvg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQQx-009VSs-GV
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 15:31:04 +0000
X-UUID: a22dc84ce59144e5ab72631399229b94-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0HJrxsbqr7ZDYsTyME3UW9VYqVfKnupiWRzpiffnbKU=; 
 b=BE34pWxPfOgTbaFqiK7konHxZUdDbT2ai0N/5vq7IHj7sKN7NEAruuyzl+nrj/5BNbfwmESlliAfx2tIOTeMb/U3P+J0WexadWNGQt6CLOg1IcUdMwOyGDdaa9y4R9N5i8fp52QQgIvNH82K+8uHC7LMSjoukMSJiCMhRpjhcSo=;
X-UUID: a22dc84ce59144e5ab72631399229b94-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210306587; Fri, 16 Apr 2021 08:30:52 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 08:30:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:30:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 23:30:37 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/2] mt76: mt7921: abort uncompleted scan by wifi reset
Date: Fri, 16 Apr 2021 23:30:36 +0800
Message-ID: <1618587036-17143-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618587036-17143-1-git-send-email-sean.wang@mediatek.com>
References: <1618587036-17143-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_083103_584220_FBA90D0E 
X-CRM114-Status: GOOD (  10.92  )
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

From: Sean Wang <sean.wang@mediatek.com>

Scan abort should be required for the uncompleted hardware scan
interrupted by wifi reset. Otherwise, it is possible that the scan
request after wifi reset gets error code -EBUSY from mac80211 and
then blocks the reconnectting to the access point.

Fixes: 215bb6737bef ("mt76: mt7921: add wifi reset support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: no change
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 572bab82315a..3145880df6e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1413,6 +1413,14 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip reset failed\n");
 
+	if (test_and_clear_bit(MT76_HW_SCANNING, &dev->mphy.state)) {
+		struct cfg80211_scan_info info = {
+			.aborted = true,
+		};
+
+		ieee80211_scan_completed(dev->mphy.hw, &info);
+	}
+
 	ieee80211_wake_queues(hw);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
