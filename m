Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FFCC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 02:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0173560F3A
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 02:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0173560F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LPfrTv78kBWS2Z5i90cwjpCNB85GMhshuwokp6xmGY=; b=2yZ+1xZKTN04EA
	cQefUHEGrAryeaVagxpIYMcN9lhZuovrmk/hFRTyBZ32vOkuL337VvVM7zt71+lpXT48mfQ3kpuKQ
	PyisUQUYqoPFAoxS7N6KXaLGdl+kW32bZomlukFieGl8lma7NUTWaMF5kzbCPATrHcM6GrkIYWJl9
	IeioDTEGlnEW7ceebfEloJtrdF9WnDI7XHa0yvEx+fUe4F9iRlNI7N0lOOBXEK7lL9LRFrDuA45AL
	ri45uwULlA3xzs9qyR0HG6BY8ldyyp/KUe3lFW8/vfoG6G+o2vExmIcO4Prk+F+rHYUrJBGnCkMYN
	/Xb7ldKplBG5aY01TfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9eZP-00AkaR-2Z; Sat, 31 Jul 2021 02:17:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9eZM-00AkZg-5e
 for linux-mediatek@lists.infradead.org; Sat, 31 Jul 2021 02:17:45 +0000
X-UUID: c535c3b0f52f455990103acecfa8ef76-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jXlDqZtfWp8v8lYfRhBgiJJJbqycpywHtjhxQDmOxIE=; 
 b=saoxhy5uEGErHxtn1AtPpiQczWlFUXNjfNj7bbBULuxxCI+2OHwEH4Bkm5tOmF8xutvoBY3OBIVA2X2ZigptoY1ViISl+1/CkZsRMQasGKbntprr/kwanTf2qcAFL/hcF2IRWRTPOiIGiqQRUzRYMQN7yXo4aDWqIivWwbnGMWQ=;
X-UUID: c535c3b0f52f455990103acecfa8ef76-20210730
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1296221855; Fri, 30 Jul 2021 19:17:34 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 19:17:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 31 Jul 2021 10:17:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 31 Jul 2021 10:17:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v4 2/2] mt76: mt7615: fix hwmon temp sensor mem use-after-free
Date: Sat, 31 Jul 2021 10:17:28 +0800
Message-ID: <48d120ce3711ee50aebf4f75c959a480b2267cf4.1627696765.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
References: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_191744_260412_BA995DA9 
X-CRM114-Status: GOOD (  10.48  )
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

Without this change, garbage is seen in the hwmon name
and sensors output for mt7615 is garbled.

Fixes: 109e505ad944 (mt76: mt7615: add thermal sensor device support)
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 05235a60d413..6e8feceb1ff2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -54,7 +54,7 @@ int mt7615_thermal_init(struct mt7615_dev *dev)
 		return 0;
 
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
-						       wiphy_name(wiphy), dev,
+						       KBUILD_MODNAME, dev,
 						       mt7615_hwmon_groups);
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
