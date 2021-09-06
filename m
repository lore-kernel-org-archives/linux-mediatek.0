Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE83C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 11:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494AC6056B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 11:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 494AC6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6XtTaN11hrZiNNwnYmIJrMeEObnrz/XVWrRERHyuMU=; b=BAVVIsx+arDjC2
	Mnpc7E/IKu4X/FQze63ut6xRHepOJsuzbbYnc8DT6SF5pJXc6RnbrK+S2NwXIYtnFJVPg9p8s5e39
	bAU7DSiGKW0CGpvmB58bzwrPOY4UDgN15G4veS9QIP4KJxXS78XkkM9b7fPF2lLQTMhM/ItuEK5GS
	5btHRCtRuYuvumLWomYPw9DlyZoDN4zAl9cS7FVUpNgN5cOZG2O5nuvLHPyod+mjpSqf6vBMVppC9
	oPZJGDuYWkEw+VNl6q8vmfxdKbRcm99/qBxkaj2kN81VxIwLgemM1L0XoLYdCcuFjkt55dc1h3TcX
	Jg5NaeoODb+Afg+VpWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mND3z-000e39-P3; Mon, 06 Sep 2021 11:45:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mND3u-000dxe-5S
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 11:45:19 +0000
X-UUID: fdd0b8376340462aa1054eb44fa1e3f9-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FrnIIlGrUGLqHk6wbfmCgpJfkAFDtQedDVxj2zOS+rY=; 
 b=gHZsRBL0tswF5SdTzXcFDzPVos8rdTSYGh6dJIe80dUpAP0UaJ81PxyLSlpWkC5EsjCkXs5RLvqxAdgB1IHVW6ECPBdF9TAPEPr0ljFqEjxce5DnCqr6shd+I9u1f1LKKs82fyoTOT5kZWk0kJ/qafxkCv5omscnPdn6WkKEmbU=;
X-UUID: fdd0b8376340462aa1054eb44fa1e3f9-20210906
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860210973; Mon, 06 Sep 2021 04:45:08 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 04:45:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 19:45:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Sep 2021 19:45:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 8/8] mt76: mt7915: set muru platform type
Date: Mon, 6 Sep 2021 19:44:23 +0800
Message-ID: <20210906114423.13646-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210906114423.13646-1-shayne.chen@mediatek.com>
References: <20210906114423.13646-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_044518_261194_D9B13DC9 
X-CRM114-Status: GOOD (  11.28  )
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

Notify fw to init corresponding muru algorithm.

Suggested-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 16 ++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h  |  5 +++++
 .../net/wireless/mediatek/mt76/mt7915/testmode.h |  4 ----
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 229ba3c469d1..6242d5e11107 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2949,6 +2949,21 @@ static int mt7915_mcu_set_mwds(struct mt7915_dev *dev, bool enabled)
 				 sizeof(req), false);
 }
 
+static int mt7915_mcu_set_muru_ptype(struct mt7915_dev *dev)
+{
+	struct {
+		__le32 cmd;
+		u8 ptype;
+		u8 _rsv[3];
+	} __packed req = {
+		.cmd = MURU_SET_PLATFORM_TYPE,
+		.ptype = 2,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL), &req,
+				 sizeof(req), false);
+}
+
 int mt7915_mcu_init(struct mt7915_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7915_mcu_ops = {
@@ -2973,6 +2988,7 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	mt7915_mcu_fw_log_2_host(dev, 0);
 	mt7915_mcu_set_mwds(dev, 1);
 	mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_RED, 0, 0);
+	mt7915_mcu_set_muru_ptype(dev);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 6344faf3f394..57be9262ec2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1086,6 +1086,11 @@ enum {
 	MT_BF_MODULE_UPDATE = 25
 };
 
+enum {
+	MURU_SET_ARB_OP_MODE = 14,
+	MURU_SET_PLATFORM_TYPE = 25,
+};
+
 #define MT7915_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
 					 sizeof(struct wtbl_generic) +	\
 					 sizeof(struct wtbl_rx) +	\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 107f0cf2505e..5573ac309363 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -102,8 +102,4 @@ enum {
 	TAM_ARB_OP_MODE_FORCE_SU = 5,
 };
 
-enum {
-	MURU_SET_ARB_OP_MODE = 14,
-};
-
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
