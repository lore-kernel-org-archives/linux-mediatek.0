Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E371C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vdNRJN7GN0JKxlSXeNHYOSC8mXyksWR8lV4BuMbFz+M=; b=Ga3AZ3yp2T9niF
	TNTg2hTPxvAwP+1JVFcXUxJiPgYbsSv00EFFXwhpvS82NPcMKT+UfbxRKrmMCnslzzk3EAZZChePX
	tk+qsE0LrzI3053iWJwccYs7/1bWhGd9IHw+tvr/TpUE6LX6kXwPN66zyawyF+vnIRrk4u1lUB5MV
	/o4KQXBQI1c1LFAl//718BPcGUY/M06jF203IBFMFaDQWcw5GFJr3IoRTf3oOVjFXOiIFkqkZ/XFj
	sDXXB5xB1hqwWOz47lIXCmwViefqNbZiq+UtfAldeMnc/ijvPanparHBOMBIbyEe5NvDW5MVbhlHW
	rmEnW7mUeqjk573gkuGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsob-001U9c-EL; Tue, 15 Feb 2022 08:04:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsoY-001U6T-UX
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 08:04:00 +0000
X-UUID: 9fd49b2c6dc04819b96a958cb4e0e3ae-20220215
X-UUID: 9fd49b2c6dc04819b96a958cb4e0e3ae-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 173042178; Tue, 15 Feb 2022 01:03:53 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:59:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 15:59:11 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 15 Feb 2022 15:59:10 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix warning: variable 'temp' set but not used
Date: Tue, 15 Feb 2022 15:59:08 +0800
Message-ID: <ffe6426240bbac484c31fb1489a994ca7bfda4fb.1644911758.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_000359_058114_3C181DD0 
X-CRM114-Status: GOOD (  12.10  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix warning: variable 'temp' set but not used,
please fold this into previous commit

Fixes: 91eeaef2523f ("mt76: mt7915: add support for MT7986")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 3 ---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c    | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6a4fb4c..6b3749b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -589,10 +589,10 @@ static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 
 		msleep(100);
 	} else if (is_mt7986(&dev->mt76)) {
-		mt7986_wmac_enable(dev);
+		mt7986_wmac_disable(dev);
 		msleep(20);
 
-		mt7986_wmac_disable(dev);
+		mt7986_wmac_enable(dev);
 		msleep(20);
 	} else {
 		mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3ffee35..6db0db1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -322,9 +322,6 @@ struct mt7915_dev {
 	struct reset_control *rstc;
 	void __iomem *dcm;
 	void __iomem *sku;
-
-	/* adie is inaccessible after wfsys poweron */
-	u32 adie;
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index fb72ab4..4394a51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -125,7 +125,7 @@ mt7986_wmac_adie_efuse_read(struct mt7915_dev *dev, u8 adie,
 		return ret;
 
 	ret = read_poll_timeout(mt76_wmac_spi_read, temp,
-				!FIELD_GET(MT_ADIE_EFUSE_KICK_MASK, val),
+				!temp && !FIELD_GET(MT_ADIE_EFUSE_KICK_MASK, val),
 				USEC_PER_MSEC, 50 * USEC_PER_MSEC, false,
 				dev, adie, MT_ADIE_EFUSE2_CTRL, &val);
 	if (ret)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
