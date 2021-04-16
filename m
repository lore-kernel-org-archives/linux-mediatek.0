Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FBDC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:41:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C5C611C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C5C611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fu4TtevA0zSApMzXS9df+k1OSd/lv4JFtGYzsF9Wg3w=; b=n7ty4l9aZ0jNXGW6OfuUwZPjPf
	2gZ+HFjHrCM4nR6nkoPlLmiKOX2i0dOitySUAZzZZcPCvY+zJAqM/4qPTbvAA6iRdm8ofCj05gvY0
	V5dMeQ97zj7VmPlLh8cIt/j9GYjQuYD/AubekNZdTkoyU0sFek3Isl3gZjIvWoPAT1F4leATQP+h2
	1Dgh9tADnuZ8wq/uFjzxTD1WF1SVyLXlMGkKtpgy/Xczg2TpGXprPsA46GKfqsTO/ff/58A4rMXjB
	neSt37L3bhSLuG3+zuaSS0CKQuQekYgdsZYdoIU1gxagZV7KKcM79YmqXL8gyHiU4nXacS8ScEdlF
	K25TWCTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQac-002eo6-5Q; Fri, 16 Apr 2021 15:41:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQaa-002enf-QF
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 15:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GKMQ0omkAaWiKYfRI3blQrQKGj5ZSxNYbxDuEEPTYuM=; b=Bak2t+7JHU9OUaIOBH2Hw/u2fl
 HXj7SqwmQViRwLX4mH+hGhyNfDSPZ69dlkfl2yMI3Tenex6WFgR0gihsN6GvtsD0gD2Daow+5C6WW
 v6HtsdXoz7RaC/lNGYuXqKGVBhY1uWtp0Q4+aAeDIv1XS43siP2JQs401KCUWloWlZ+GkP80KoY35
 Sy9+l06DF+FYgaun5+Lq5t3OR8X49dCsPC+9bqD/+/CIvP754BSBUm/Wkye5jLRWaj4eOZ6Y7pgy3
 eXlabgO45fUHSTFRVxEVXiLsrdCpA2XSWnSq+Tdl58Bm3fUeq7XyJqJc+Oa8Sv/rP62b4mpNgcbDu
 4zNYY0hg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQaY-009VpD-92
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 15:40:59 +0000
X-UUID: 660e9784816c404da989ce5e278dae15-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GKMQ0omkAaWiKYfRI3blQrQKGj5ZSxNYbxDuEEPTYuM=; 
 b=ckMciMT6jYgC7qLlGgXZkty38R83NH07Fb9TOqjflEbjXeTxtW2JzLjzm//q8+/B3jJWfwhReB66B3AJMaN3rU8s1vrGqCo8NKOYRKKrPqEDWPnxllDQMDAa+mRIoYz55dJeuwqyPQZ+vMQaYDeGayh1WqhwiLCZGj4RbrFr86A=;
X-UUID: 660e9784816c404da989ce5e278dae15-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 147410637; Fri, 16 Apr 2021 08:40:55 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 08:30:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:30:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 23:30:37 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/2] mt76: mt7921: add wifisys reset support in debugfs
Date: Fri, 16 Apr 2021 23:30:35 +0800
Message-ID: <1618587036-17143-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84D286E04426F2F02A4F9A502085D6E3F0D8BF0ABEFDFD84E245B3A78CAD577F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_084058_345082_849F89E8 
X-CRM114-Status: GOOD (  11.52  )
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

Introduce chip_reset knob in mt7921 debugfs to export a way to users
able to trigger wifi reset, and group the similar operations
previously defined in chip_config in the same knob.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: reuse the same knob previously defined in chip_config
---
 .../wireless/mediatek/mt76/mt7921/debugfs.c   | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 024524173115..7ced843b30b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -288,19 +288,28 @@ mt7921_pm_idle_timeout_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_pm_idle_timeout, mt7921_pm_idle_timeout_get,
 			 mt7921_pm_idle_timeout_set, "%lld\n");
 
-static int mt7921_config(void *data, u64 val)
+static int mt7921_chip_reset(void *data, u64 val)
 {
 	struct mt7921_dev *dev = data;
-	int ret;
-
-	mt7921_mutex_acquire(dev);
-	ret = mt76_connac_mcu_chip_config(&dev->mt76);
-	mt7921_mutex_release(dev);
+	int ret = 0;
+
+	switch (val) {
+	case 1:
+		/* Reset wifisys directly. */
+		mt7921_reset(&dev->mt76);
+		break;
+	default:
+		/* Collect the core dump before reset wifisys. */
+		mt7921_mutex_acquire(dev);
+		ret = mt76_connac_mcu_chip_config(&dev->mt76);
+		mt7921_mutex_release(dev);
+		break;
+	}
 
 	return ret;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7921_config, "%lld\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7921_chip_reset, "%lld\n");
 
 int mt7921_init_debugfs(struct mt7921_dev *dev)
 {
@@ -321,7 +330,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
 	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
 	debugfs_create_file("idle-timeout", 0600, dir, dev,
 			    &fops_pm_idle_timeout);
-	debugfs_create_file("chip_config", 0600, dir, dev, &fops_config);
+	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
 
 	return 0;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
