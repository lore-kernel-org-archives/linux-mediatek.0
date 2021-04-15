Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2515C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE82611F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE82611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tgiBQJE+EfVBhn9GdfVndQ0cAvxDI9HoTqaZ1lTtKnI=; b=fEd5+HA8aUIvxf8A6fFig+C6L
	00FoalHZ1Yvf5VuaiapZExYcRFBuSLMBooilZtaksffczZYqR0QWcxosriTk/bCWbeZOD40bsB0aj
	zISEGf1Lobd0Ojfa22fs6EqqldZbgOw8MzDhaFqbjEdt2+FeKUZFhyFb57PzaMWeP0Q81CW6HA53b
	j6/F5ip88Tu23OZfXADhI/5MhDwFA1GwrJf/vjMbTZPUczsK+3F1FZHwkcXF4iz8j60dfj6Jsknmq
	CVdRXrmCF4G5k8thSWdxd5sHpw4XAiniAss18C2BsCSzCPEOS9r18Ohh+CAi0vZBz3Ut5cC01IOrJ
	mzeEEPeGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2Fu-00GIFi-ES; Thu, 15 Apr 2021 13:42:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2Fs-00GIFO-9Y
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 13:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=l/2k6zCiuMh/TBuTxX/pwuLR1URNTbaTmaXLYlqCySA=; b=pRL7ZyrJjs6bU0HaBUd0bYLgVz
 UnBsHmL/3QpohZI7kCm4eCpZTPN8w9u/16V3R8VDMEwFHP1Cpfkw9ABKreCoGnJNP0XiQNHCeAV3a
 mjwpFvX1xtNqLsH6uZ1xV/edEw9aD5qgh6dTOgSJfHg4Khg9ww9DgWjT5Xo2WpubHJiE13jgMOtNo
 CALuqwmfkrKAI3XTMY+Qmpx6fi/uocXKTtRIlHfsVIgZlW5ksbHsY2oXKyMkhvcRtdY/kOibvKACG
 zGXLtGCdUVbMaNyBOaUeiZ3AGKmHZhmu/DXz3D5APVEVjHcrnXn24gJeL/DxT8EFJ7ZSGtJJK7bYZ
 f8vaueSg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2Fp-008c7n-1i
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 13:41:58 +0000
X-UUID: 8b15cfe5c49a4c029096a87d39a5680e-20210415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=l/2k6zCiuMh/TBuTxX/pwuLR1URNTbaTmaXLYlqCySA=; 
 b=mB/nYNjAJw1xk/B6+Fpwxei6sprNl70K3jnxIHl2KqOgf6j4/HIvvwhR+vFjBs5X9QeBKk2HW9/FzyV7kqbTg5PT5ZOZ96T0j1nJEFFnIDqXLkf6vAbnx4jy7W7pRQBfXTUBoG/GblFQJ9lul+lnSi3CdA5UjEMKDSvhRysKPUg=;
X-UUID: 8b15cfe5c49a4c029096a87d39a5680e-20210415
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1811036652; Thu, 15 Apr 2021 06:41:51 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 06:41:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 21:41:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 21:41:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] mt76: mt7921: abort uncompleted scan by wifi reset
Date: Thu, 15 Apr 2021 21:41:45 +0800
Message-ID: <1618494105-5462-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618494105-5462-1-git-send-email-sean.wang@mediatek.com>
References: <1618494105-5462-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1BE1986FC84855AB1F926A97F52A7D3E2F4FF6FC6031C2B8B5F8008F5C18C4212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_064157_127748_759B4D44 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Sean Wang <sean.wang@mediatek.com>

Scan abort should be required for the uncompleted hardware scan
interrupted by wifi reset. Otherwise, it is possible that the scan
request after wifi reset gets error code -EBUSY from mac80211 and
then blocks the reconnectting to the access point.

Fixes: 215bb6737bef ("mt76: mt7921: add wifi reset support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
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
