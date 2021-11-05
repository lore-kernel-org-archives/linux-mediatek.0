Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61351C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 09:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1137A61212
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 09:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1137A61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ql8USvEW/6CQrxcspEtv5CT2E+esfwUnX/WX1bZDQi0=; b=0G4kNTlyM3APRZ
	esrYKuVq2yR5A9DXviJT+9kcsTOk8uiBZmv6qzOBzjGLUrrCu228hOhsXShdSZkrimtILfcQRa7ub
	vDDLoihF7KEKFsCq365OcdpM2VAjYyxBR7rBGHN64IdviVHPUQFNMG0HedhwwR1v6hJfmS0Tt8tYZ
	ltxHkiuJEewV1yM3mkZWJ+1OvjtgCcqPPBSs4Twk8s6Go3YntHSHutumCOdaVSvTkcZZsDblcCOyG
	Ew0kbEmMZjjoHa60vP78dMuaKKoHtTPgRRtT9RtfavFzxw3AzrA3iG3+j6JFtPz4jN4C/Um5Z6Bnp
	H3Iqx6J2Os120HtdjNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mivsJ-00B14w-2y; Fri, 05 Nov 2021 09:51:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mivsE-00B12U-NA
 for linux-mediatek@lists.infradead.org; Fri, 05 Nov 2021 09:51:05 +0000
X-UUID: 14c85d6c07114557949268a1657d2788-20211105
X-UUID: 14c85d6c07114557949268a1657d2788-20211105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1503673034; Fri, 05 Nov 2021 02:50:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 02:50:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Nov 2021 17:50:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 5 Nov 2021 17:50:54 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix return condition in
 mt7915_tm_reg_backup_restore()
Date: Fri, 5 Nov 2021 17:50:51 +0800
Message-ID: <20211105095051.4733-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_025102_783194_702B06B7 
X-CRM114-Status: GOOD (  10.87  )
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

Fix the issue that some registers not configured properly after
restarting testmode.
(e.g. change state from idle to off, and off to idle)

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 89aae32..a541fc4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -361,14 +361,14 @@ mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 		return;
 	}
 
-	if (b)
-		return;
+	if (!b) {
+		b = devm_kzalloc(dev->mt76.dev, 4 * n_regs, GFP_KERNEL);
+		if (!b)
+			return;
 
-	b = devm_kzalloc(dev->mt76.dev, 4 * n_regs, GFP_KERNEL);
-	if (!b)
-		return;
+		phy->test.reg_backup = b;
+	}
 
-	phy->test.reg_backup = b;
 	for (i = 0; i < n_regs; i++)
 		b[i] = mt76_rr(dev, reg_backup_list[i].band[ext_phy]);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
