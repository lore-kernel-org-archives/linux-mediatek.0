Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5919FC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BCD1610C8
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BCD1610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olfbyZcCqGEylja8qI2Hqv0N1dl4evAeh0tMJBW3zO8=; b=RfN0oU+M4hEVY0
	LW4AFB0JPjRJfpV/zYxW6/abkazCBxL8TVrtzRYuZYDekc2b2z1X82q7KhzEdyMm1L4n8TpkI0JJ9
	Bv4iywdhfLvsxDRTN8DQA76GBxut+CbX1Fa3KEQOuQDBAXM3Pyl7oL5W8hVECatSGL3IIIi/sUGwm
	eaVEZvMdeW5XDYCFqGmsgnmySTOH14ZrQF07NxZ3vsUJNBXOaM39pSSHmQTO3xLwR3mYeKQqsEkK4
	n6foxLHLVdqNHc0DExdPBu3y7jU1DG98wDI2Lzi1aCBP7oz3vTExNsJNKXY8HHcY+CnppGEH3VyJr
	A9RlzsVJC0eg2w1Kjmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfoP-008dgD-Ua; Thu, 02 Sep 2021 06:02:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfoL-008dfD-AR
 for linux-mediatek@lists.infradead.org; Thu, 02 Sep 2021 06:02:57 +0000
X-UUID: c1c4fe808762460786559dcd29dd200d-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w3iwElTcN4PPRgFsilPfvs/hj0VeCanycZWAlK/DDFo=; 
 b=JI4KA8W3RI4EsBCs3JH5Ixcf29UYnfcWBxnynjKCEscQ02ACmm/H79qNWeNB/25AEOhYqkDfkwctEUd0JPQukJtawD8q15tJ8Go3HzcLVlF/4tCa5qhEPLty2k4lHbiY0ljlTg3LTztOO6FFi8N+Wlo2tFkdxcI7Nu1m2wf2wQI=;
X-UUID: c1c4fe808762460786559dcd29dd200d-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 981331131; Wed, 01 Sep 2021 23:02:49 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 22:52:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 13:52:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 13:52:47 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v6 2/2] mt76: mt7615: fix hwmon temp sensor mem use-after-free
Date: Thu, 2 Sep 2021 13:52:04 +0800
Message-ID: <9b5e38c8ac84ded6af5969e7780a7c23ec154857.1630561595.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <101c24cfc81ed5819d93c60cf2e96bdd6ce97c47.1630561595.git.ryder.lee@mediatek.com>
References: <101c24cfc81ed5819d93c60cf2e96bdd6ce97c47.1630561595.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_230253_415153_CAC34201 
X-CRM114-Status: GOOD (  10.75  )
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
v6:  Use devm_kasprintf to add a generic prefix "mt7615-" on wiphy name.
v5:  Use devm_kstrdup on the wiphy name as suggested.
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 05235a60d413..e053548cafd2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -49,12 +49,14 @@ int mt7615_thermal_init(struct mt7615_dev *dev)
 {
 	struct wiphy *wiphy = mt76_hw(dev)->wiphy;
 	struct device *hwmon;
+	const char *name;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
-	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev,
-						       wiphy_name(wiphy), dev,
+	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7615-%s",
+			      wiphy_name(wiphy));
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
