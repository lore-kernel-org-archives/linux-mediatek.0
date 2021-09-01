Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C12C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 17:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0CCE61059
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 17:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0CCE61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPnu8ho81Je8HAmrJokzDDG4+oj0L61RtpJ2QNMK23E=; b=dHhqiMVHgwb5Rx
	qfVyStPbMftP3SOaT0hx+ZF49lWKT5kaYb7TXgck7O1AAN5aiDl157EwYYgGezl3rGSGgi5aPQpK+
	NxqfLXSC/tU8dCmYNhWecyMLKNDANbf8rX70wRnvYIIW9OHFPdUFDcbnkUPNFoAyL9TGo/k/wCQmz
	bXtuCnELSVyXFTvIJ8253prmNmyipSvW+EgZJl3SuH16i/RfD7ecjtvgd9Dv1HjbUGDa0q8Qd/Km7
	wyeqUpmaKlX2TzCONUmPCQ7FlSpQgoyR/9Eb5LUbH2Bei4l5QkYY6dKmb4Rr/A/3rVSgZ5Bqc7X1j
	pjSHsDWIyda3uTe8dZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUMt-006rxw-3k; Wed, 01 Sep 2021 17:49:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUMn-006rva-Qu
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 17:49:45 +0000
X-UUID: 83e2401bd96644b594c130b2bb6cd9a9-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Pi1LED52c+Y/vVEqkKWW0nNAvqahXT9CfX1gwjXpKOM=; 
 b=akJFmnS8Rdl5aIVkkNN6RwNzGeje9pXndW2HSgdKAtT+ibMMYMigJAb1a0FqngjdvV4RVbohkAueFL7OdG8+B7JFNLv7P2PvDcdANsuKTr3fYwj+iz+yFA95yCaMkFN9nTPBl5srY6RwhOWLlMTHMaM2Fif3HR5iupzXzQVCkAQ=;
X-UUID: 83e2401bd96644b594c130b2bb6cd9a9-20210901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 893830076; Wed, 01 Sep 2021 10:49:38 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 10:49:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 01:49:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 01:49:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v5 2/2] mt76: mt7615: fix hwmon temp sensor mem use-after-free
Date: Thu, 2 Sep 2021 01:49:31 +0800
Message-ID: <650546c0dee92042fc019941786cfdbce2424812.1630515790.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d72e872e7fdb5c04e890b978575f4d86bc61ad36.1630515789.git.ryder.lee@mediatek.com>
References: <d72e872e7fdb5c04e890b978575f4d86bc61ad36.1630515789.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_104942_195374_FBFA7DEC 
X-CRM114-Status: GOOD (  10.79  )
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

Without this change, garbage is seen in the hwmon name and sensors output
for mt7615 is garbled.

Fixes: 109e505ad944 ("mt76: mt7615: add thermal sensor device support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v5:  Use devm_kstrdup on the wiphy name as suggested.
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 05235a60d413..7c584ca43b2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -49,12 +49,13 @@ int mt7615_thermal_init(struct mt7615_dev *dev)
 {
 	struct wiphy *wiphy = mt76_hw(dev)->wiphy;
 	struct device *hwmon;
+	const char *name;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
-	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
-						       wiphy_name(wiphy), dev,
+	name = devm_kstrdup(&wiphy->dev, wiphy_name(wiphy), GFP_KERNEL);
+	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, dev,
 						       mt7615_hwmon_groups);
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
