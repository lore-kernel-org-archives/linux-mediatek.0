Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589F0C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 12:53:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BDF61040
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 12:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BDF61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTS6S3DEZOh1hD3+uAzzm/f5n3+iw/0bqEz4nAw9kSM=; b=j7ZSgR6Q6bqW4xX3XnxjY1XEra
	fNfrUUsP8J132c7pqlHcEBn4M6U4IVULxXNJkeJ7l6yDRimCX6vl8wfWNBG1yg43xsIUYCupWFiL7
	kMgFPI9AdDva/Zap7HZoOFr0RPwJK5EfeICE7KBQiigHw2XQzQa/D9it2bSkPKBJSadKaf+uPIxXL
	JVidqa+FFfJG0YYDcYny87Mda6ou32yY5x32tR8i0DdfTuyYDjT32xwl+SyowyrcefRDjGy6SjzF9
	pzc3alb5OanSMVQQ63v8rWXxjrADOskIjvDrt2HTJQn+LwCUpwEyDOk83dYJEjfgySqcfVFLvAmIu
	AI1nLnWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lduXi-00GDvQ-UP; Tue, 04 May 2021 12:52:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lduXf-00GDtf-P0
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 12:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=khHZowES/2DfM5UNrDEc+ZQX2WF0l9WnuLCZiRBt0ig=; b=j01ntXyin5mmdc8Wp+R5K/BnU/
 XKT8cL7TJ1ot5lwCVLzEajt+9hVXqP+g16C/4fZ+z0yhi/RpKbsaNTfJ+uc4NJ8sWdmj+pbn/+LYG
 Zp4TU1SuuavOYRMGxBfr03iWpm1Jxa4t9eujE0dZI8LiMRHJgJuYWNNb/m6qWEzPTZkOF2r4pPcq0
 LojSt0/s9mJG/XyXNrCE+aMcLO5Mp08JH/RIEvke4gWNr9qGmK/kfPX4mDHlZc6jq3eMILZNw5HPw
 QPWsdqKYj6NfD54iR1RLvfolaPJ42LHa+RR+zrcDW3BVJ0Dm5siyYDha4keTbw71OF2hz0pfLdh8I
 9UB4/8Kg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lduXb-003yjI-83
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 12:52:44 +0000
X-UUID: 16516a5eeb35444581864fb6bb1bd6ec-20210504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=khHZowES/2DfM5UNrDEc+ZQX2WF0l9WnuLCZiRBt0ig=; 
 b=nbEQcKXhlZb6Y+ZsXCbHkk//9qfL1MkjnI9S5p3dLg33cFaI5K2t/U2DMK2WOc+WpC/QxLiSuBa+5UBTa2Q3RVj1QeC5e8XlG1ArNeanyWz+c1U9bRz9kFR95sridI5P+M66R82L5DkEsR3Tla/qoGnBP60jj1FCrB5t8SXmWK4=;
X-UUID: 16516a5eeb35444581864fb6bb1bd6ec-20210504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 3347381; Tue, 04 May 2021 05:52:35 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 May 2021 05:52:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 May 2021 20:52:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 May 2021 20:52:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: add debugfs knob to read efuse value from FW
Date: Tue, 4 May 2021 20:52:25 +0800
Message-ID: <20210504125225.2536-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC4AA88CC25A608AA38ABC03DA3762F8B883086173EF8A88791D8397AACCCE642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_055243_315362_F64A92AC 
X-CRM114-Status: UNSURE (   9.60  )
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

In efuse mode, mt7915 only reads efuse values from FW which driver need.
Add a debugfs knob to read addtional efuse values from a specific field,
which is useful in some cases such as checking if rf values in efuse
are properly burned.

An example of usage:
echo 0x400 > efuse_idx
hexdump -C eeprom

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 6a8ddee..0526459 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -73,6 +73,21 @@ mt7915_radar_trigger(void *data, u64 val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_radar_trigger, NULL,
 			 mt7915_radar_trigger, "%lld\n");
 
+static int
+mt7915_efuse_idx_set(void *data, u64 val)
+{
+	struct mt7915_dev *dev = data;
+	u8 *eep = dev->mt76.eeprom.data;
+
+	if (eep[val] == 0xff && !dev->flash_mode)
+		mt7915_mcu_get_eeprom(dev, val);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_efuse_idx, NULL,
+			 mt7915_efuse_idx_set, "0x%llx\n");
+
 static int
 mt7915_fw_debug_set(void *data, u64 val)
 {
@@ -390,6 +405,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	debugfs_create_file("radar_trigger", 0200, dir, dev,
 			    &fops_radar_trigger);
 	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
+	debugfs_create_file("efuse_idx", 0200, dir, dev, &fops_efuse_idx);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "temperature", dir,
 				    mt7915_read_temperature);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "txpower_sku", dir,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
