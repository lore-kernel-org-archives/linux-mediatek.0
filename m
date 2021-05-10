Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4628DC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7996120D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7996120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kZZz9xI6e/ECZjt5/Oll+WPu5Ov77p9ZgBFCoAodUWg=; b=angG10iec3Tv59iBrN0stsnfL
	4vs233NuMqLGnsfZ3+/ZzlgHtnbB8oieWwrYn4SPb8gZLGUzNM5UYoP5SYUBhjvzCELFKEr+e1scx
	t9av4y/mvfYREk8Rd06BV5s6rQrCY1+7monkYK9bkd+cxnsBZnHaCUDL/Ql0gyd4AgUx2IgsHGdzH
	0sO4lbRNKxuYDVYQPkpBU1bxRdZaEHKuGes7uTadO1kR2DBjm4eS2GSUlQCfBYXfv+JfcH5H9GXGl
	biVvmXtzxv14gnN9yKCb/seT/LjRn+4Yo80FhLtw85elt7scT2VUX0bX23mK0F5LIjny2OtCHzUfb
	VDk4vhPvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7cv-00ElPX-DA; Mon, 10 May 2021 15:15:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cm-00ElML-Nk
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=WL7b2gGCV44hU7tJFOIqNWD+EHk9YOJJLXizxJctCpo=; b=b8UquDM5JeLlxG/kBbpHhng7xB
 4rmFB9qMpnBsYWX4Tf1RQjQz4intsQXlg8HOVryvQVrrM2IxSTXtkze82Tcj89cp5xLOBwzKSosN3
 850Ct7Hgm4wQAnGjHAJ2+C82FBSgwlBfurCCU33q3Fy/y3/mvo1BakEOZKYqZjjZ5mdwiFk/Bg34x
 qKVQx4T1tvGU1Ue1CuBinUPgXNZlWuxRDcMuDCLfZiuJQOVN48J1liiQfY3v5YV8TdOVensxyG0V9
 OcPh6WPQKl6WTozEwv6SJn4QMyzfBHr1Pct7Ef+CXidSo7r6miFZdbMudf5egvKwDQnsyXo4wZTpq
 w52hmpzg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cj-008rIT-V6
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:11 +0000
X-UUID: 4eadc5558a2c4b77a6da64c1d7c6794c-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WL7b2gGCV44hU7tJFOIqNWD+EHk9YOJJLXizxJctCpo=; 
 b=Wkxv4MWbMiL0/gVg1qVo9SzihnALGw5ZKhLmhPy8dkvOP59cOgk5dYzgYHAcKvADq6p4YTwB23FZoqLTdTQZQFmXGiuyncKQImEiM+uu2cefKg9ibBm5lNrpMc5HZwobD6RwPirCD9cwsGRcSthq1ZxdzWgGWGXvU8uEV9yR+7M=;
X-UUID: 4eadc5558a2c4b77a6da64c1d7c6794c-20210510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1438578646; Mon, 10 May 2021 08:15:02 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:59 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 7/9] mt76: mt7921: consider the invalid value for to_rssi
Date: Mon, 10 May 2021 23:14:55 +0800
Message-ID: <1620659697-12048-7-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C9240EF2573B67657F9ED857479D90467E4CC8D7E534F832002A2DEABEF7E0B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081510_045366_1996495A 
X-CRM114-Status: GOOD (  12.08  )
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

It is possible the RCPI from the certain antenna is an invalid value,
especially packets are receiving while the system is frequently entering
deep sleep mode, so consider calculating RSSI with the reasonable upper
bound to avoid report the wrong value to the mac80211 layer.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 44b8918db95b..89a09381cfe4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -461,16 +461,19 @@ int mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 		status->chain_signal[1] = to_rssi(MT_PRXV_RCPI1, v1);
 		status->chain_signal[2] = to_rssi(MT_PRXV_RCPI2, v1);
 		status->chain_signal[3] = to_rssi(MT_PRXV_RCPI3, v1);
-		status->signal = status->chain_signal[0];
-
-		for (i = 1; i < hweight8(mphy->antenna_mask); i++) {
-			if (!(status->chains & BIT(i)))
+		status->signal = -128;
+		for (i = 0; i < hweight8(mphy->antenna_mask); i++) {
+			if (!(status->chains & BIT(i)) ||
+			    status->chain_signal[i] >= 0)
 				continue;
 
 			status->signal = max(status->signal,
 					     status->chain_signal[i]);
 		}
 
+		if (status->signal == -128)
+			status->flag |= RX_FLAG_NO_SIGNAL_VAL;
+
 		stbc = FIELD_GET(MT_PRXV_STBC, v0);
 		gi = FIELD_GET(MT_PRXV_SGI, v0);
 		cck = false;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
