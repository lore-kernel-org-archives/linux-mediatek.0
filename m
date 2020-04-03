Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F31BC43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319AB20737
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:09:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3EGYXpc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tx4nBRZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319AB20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTmaLuDhRQT3uxSMgFVrCcFB/TCWJPc2vzM2aB+oIjA=; b=U3EGYXpc26hPFu
	XwPyB4+1Kem2C6zGxV1V4teV9QcaYTKhz4cUe7nA5bOSRa63rCpJ4loqaErVZtuyPZQSnACOh8nd2
	iustI3YWRTlgom8I+dZF2pG72xONJciIkoU2BY5OT2pWPxqsuAQaoaNh6WSX8qVitz52f/R6paqvD
	4Pgld8f4kMY2TGGDR6Tg6Nm+Z1nwFDy4sd1J9Ato0Go6gvRtmRk21e0lGazoYJjZsQ+6ixCK3bFBB
	Hh93xvGE+2BXGe+1VDjAosWkEL/7RggE6XPVlgnxeNwD13bSlPC6izpCghKS31bqViPCumyj0hbJJ
	T9mN4kepfEDogAiqvZTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKIKT-0001dl-LD; Fri, 03 Apr 2020 09:09:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKIKR-0001dA-7t
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 09:09:32 +0000
X-UUID: 40ce0e547d9a4ac5a4c158ab609cbc52-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=noTg9XcjB6G862HLpOk/NARelLKgQV8r1Sj1NFb+P00=; 
 b=Tx4nBRZ2ZnWr94w5Tu+7/nC3nrvwPGBJTqIgjE3NsOpJtE4TC9qe2mrFk//rEqUFY2mxCAOd6wU8yYlESJZtSv+PLDmwHreMEpwlbEc7qMLVjrXNnzb2V3JAlNbaqntwVojTqKkzkPvvCqOIwGYDV4LtstanBHgRMhBUl0aItNM=;
X-UUID: 40ce0e547d9a4ac5a4c158ab609cbc52-20200403
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1193544254; Fri, 03 Apr 2020 01:09:16 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Apr 2020 02:09:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:09:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Apr 2020 17:09:15 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7663: correct the name of the rom patch
Date: Fri, 3 Apr 2020 17:09:16 +0800
Message-ID: <e290681bc341a60575ee087d0bbd9a91ad1b1de0.1585904519.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_020931_290070_C0A3ADA2 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Rom patch is shared between Bluetooth and Wifi devices, so correct the
naming to allow two drivers to share the same file.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 52d2d1a41fe0..23fc12648582 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -41,7 +41,7 @@
 #define MT7615_FIRMWARE_V2		2
 #define MT7615_FIRMWARE_V3		3
 
-#define MT7663_ROM_PATCH		"mediatek/mt7663pr2h_v3.bin"
+#define MT7663_ROM_PATCH		"mediatek/mt7663pr2h.bin"
 #define MT7663_FIRMWARE_N9              "mediatek/mt7663_n9_v3.bin"
 
 #define MT7615_EEPROM_SIZE		1024
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
