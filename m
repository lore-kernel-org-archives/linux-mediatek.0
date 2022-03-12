Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Mar 2022 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NMdMzJrfZLjKFIjTWMR5gJO0NqAFC9VvKcp4HF6PGz8=; b=GoqOn/jX60Cbo3
	TIpCyWDLiA/0mD1cEC723iiKgAL0x6xJAtp4qLUIxF4SwyLLXPClbSCZFpHhRrmovg21EZNJXxuYY
	/AxLRyAT83VcyX0KM8+hrzsGww78105Rx3zPKihj4Vn4Tn8NHmPUgO0iofAwJgMoVSU72BqaOL9Xv
	rnqNPD8n6/wGySJsIu6DA0/DEXLv4HemQpRr48khv3EKzTDlq1bBK5DVkYUovynkyXmX2q/wsLmxP
	3Pj+9yeT1Zq4o/uWNinsPwhwD94pbQiWhaiDZcY4FE+7WM+Pqt0klIgi63I4YlVP2OAD8f+bAL81V
	/2UgLfkwX9mfc/tlQXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSxl6-000zfQ-3T; Sat, 12 Mar 2022 09:09:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSxkz-000zf0-VQ
 for linux-mediatek@lists.infradead.org; Sat, 12 Mar 2022 09:09:51 +0000
X-UUID: 464c6c1c6ae54659abecfb3aaac549cb-20220312
X-UUID: 464c6c1c6ae54659abecfb3aaac549cb-20220312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 41647626; Sat, 12 Mar 2022 02:09:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 01:09:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 17:09:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Mar 2022 17:09:42 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] iw: support 160MHz frequency command for 6GHz band
Date: Sat, 12 Mar 2022 17:09:04 +0800
Message-ID: <4366b069d41f469c36554c8dcfc857b5aedf3e1d.1647075278.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_010950_060456_3A9DA4F4 
X-CRM114-Status: GOOD (  10.69  )
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

From: Deren Wu <deren.wu@mediatek.com>

Add support to configure 160MHz in 6G band by direct
channel/frequency command.

Example:
iw dev <interface> set freq 6195 160MHz

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 util.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/util.c b/util.c
index ceb0dc0..1bddf0f 100644
--- a/util.c
+++ b/util.c
@@ -1305,7 +1305,8 @@ int get_cf1(const struct chanmode *chanmode, unsigned long freq)
 				5955, 6035, 6115, 6195, 6275, 6355,
 				6435, 6515, 6595, 6675, 6755, 6835,
 				6195, 6995 };
-	unsigned int vht160[] = { 5180, 5500 };
+	unsigned int bw160[] = { 5180, 5500, 5955, 6115, 6275, 6435,
+				  6595, 6755, 6915 };
 
 	switch (chanmode->width) {
 	case NL80211_CHAN_WIDTH_80:
@@ -1322,15 +1323,15 @@ int get_cf1(const struct chanmode *chanmode, unsigned long freq)
 		break;
 	case NL80211_CHAN_WIDTH_160:
 		/* setup center_freq1 */
-		for (j = 0; j < ARRAY_SIZE(vht160); j++) {
-			if (freq >= vht160[j] && freq < vht160[j] + 160)
+		for (j = 0; j < ARRAY_SIZE(bw160); j++) {
+			if (freq >= bw160[j] && freq < bw160[j] + 160)
 				break;
 		}
 
-		if (j == ARRAY_SIZE(vht160))
+		if (j == ARRAY_SIZE(bw160))
 			break;
 
-		cf1 = vht160[j] + 70;
+		cf1 = bw160[j] + 70;
 		break;
 	default:
 		cf1 = freq + chanmode->freq1_diff;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
