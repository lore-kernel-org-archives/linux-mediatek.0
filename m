Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BEAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA7A61008
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA7A61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YFaULs3djX5RUSRjNrdS05w45wr1RTsOW/+ayHCj7g8=; b=SsGx6jXfvODrrb3odDetHl67aB
	K+tJw03sqh4slaj3TuV8bcE0lR9u8u5K3ILcUzmAoVEKj7OumhKqNWivtPWsSqpD45Ai/ctz1jZDG
	+wRKB+/Jg6EhzaElKCgdBCa4heQGBvuwZqlufe+u9PMl3pT5dojG27WVoTaenCuMhcj/58S9KL1Fk
	Zy2qa37zki9n2RhmcCZksYsJlJ+tYiqnNyj7EbbIKPZro/9cYaiVezyyfz0H5J2y1+MNCXd/n413F
	05KTTdRGk4MCSwBewNzxAQL3wLpwyV8dKHHFLnzt5WmQwrJ0UGjhFa+73NS9/z0BAGJrk0+ldgZQm
	4AGXTVsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2Fx-00GIGD-4A; Thu, 15 Apr 2021 13:42:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2Fu-00GIFf-83
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 13:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=QZ8KArdAmCrjVQ7HjOPX8JBRvGMWwOoP8v9eN3vEfCk=; b=W4qNjqG/vbKomC/SFvJcfE2h0E
 nJ3uX6pkWJDV6685dlR78/ZkaQDagMYz7JduHAza3Woez8VvqrSljk8+yZ7ICsyAAytpRrROnwT18
 DeXlmMtGEMa2ceg5Atwf6KkSFbObM8QYW2I4KfDXAatn/9+ciLUS4UNW2Wu4zPjYqYTz9LKJ7+fUs
 HJWhyVIkfndn0rfdkU+C2ZiykIT+r6DApaI/bhuPRiJVNTdOk584qhPTs62SHpCMpwGmnAbUn6+LZ
 7YMQVxu5IwdLAwJnQKyf3ac+6kp8Cu9VbzZO7AdZPDQkSeiMK3mcyVilDG37MMUH354oa1sMBJ+aD
 tvq3eQ9A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2Fr-008c9m-AB
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 13:42:01 +0000
X-UUID: 44fa7af711824106ae372f6dcab4e76f-20210415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QZ8KArdAmCrjVQ7HjOPX8JBRvGMWwOoP8v9eN3vEfCk=; 
 b=BExOK16yO29Q7xJ3wDkbkk+VGM48fZUf8zfXRZKFuR4qU68maBWK0oghV59saWWy8eZh/2ftyf0Z7BrSKDxC3rR+Q3vmziL7iWvY2BsYXVHAJRN/lCmTMs0cTJnc+hPL1Oor81h6wAo9IrRBpwh5tL4mLoRNcAuayCLK+rCow60=;
X-UUID: 44fa7af711824106ae372f6dcab4e76f-20210415
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1766889694; Thu, 15 Apr 2021 06:41:56 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 06:41:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 21:41:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 21:41:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921: add debugfs knob for performing wifi reset
Date: Thu, 15 Apr 2021 21:41:44 +0800
Message-ID: <1618494105-5462-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_064159_378071_D6FB0ACC 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Sean Wang <sean.wang@mediatek.com>

Introduce chip_reset knob in mt7921 debugfs to export a way to users
able to trigger wifi reset.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 024524173115..1342a0b645e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -302,6 +302,16 @@ static int mt7921_config(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7921_config, "%lld\n");
 
+static int mt7921_chip_reset(void *data, u64 val)
+{
+	struct mt7921_dev *dev = data;
+
+	mt7921_reset(&dev->mt76);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7921_chip_reset, "%lld\n");
+
 int mt7921_init_debugfs(struct mt7921_dev *dev)
 {
 	struct dentry *dir;
@@ -322,6 +332,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
 	debugfs_create_file("idle-timeout", 0600, dir, dev,
 			    &fops_pm_idle_timeout);
 	debugfs_create_file("chip_config", 0600, dir, dev, &fops_config);
+	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
 
 	return 0;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
