Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C069C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:20:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F6B61430
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F6B61430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QKjO4pSbCqeTyYqsrBsbj4sgOD/TDgpfDe5anOQrOpE=; b=PP1GuXDCBq4/EKGDm54rYkGcSP
	IanlJSzH2EXwTjOfGYOOaKHvQiD3CofAdqWjvaKniEkbbJdu+vYiOoEF7hw5S5lPL0+K87P55x9uD
	CH17zAwTzA8AC7mozkAaqBFD/splJzS33S3eFac/Mxyor0b4sECumoCZzasbTS/b15e62P4MYU5Tm
	ZYXCa+EuUrmQ4CDlHwodeGtH7KzV0UOhU9J504hkaXvTPO15fZhxZmSn80gCzU4FYfvsMBz3/4z3i
	m3Zl+z9lxrUJIgxx4PsNzFPa5J5B3UQf+ZDSBGjSFGKSmaL1tcTnCai4KwzPNM964b6SPKbDTyasG
	TPL8n1qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZLCt-00FHot-Fg; Wed, 21 Apr 2021 22:20:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZLCo-00FHoV-1K
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 22:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=S/DjaVaxqug7KglW1knwt8LA45tKkyZ8dzYLG30Jgkc=; b=nAwBNnzPTdefrtz/ZW5lvo4nsX
 ued17nJ0+gKmW0v7bO4OmCohcaR5eJPpha25zUgBQormN3631hcC/u2VHR9l0Wc/+jFYIK1BcXnrW
 WupocgfMQTV91Gt467HuBJTOjAqoIyphNd7bsuPwNw9AzS4EyWFW1TR0XMnttZgcOBGvbu94+rKT+
 ZuDpx2dtDSS3wE8iytOhEaNXfzLYi54ysZAXjDFV7dLTMcmWio943O9CsQrYziPeZygXE3soWK0b2
 Ce0diXKLTc19g/WHlZYvrR6+vgTdlxlvnnaJXNa3m8u94i34dnYpXlhM4Ucb6KEC9zvfRwNx+zd4W
 a/pzi13w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZLCk-00DEAZ-NM
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 22:20:20 +0000
X-UUID: 88c0e7b1169545a1b41a7e104611f3d2-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=S/DjaVaxqug7KglW1knwt8LA45tKkyZ8dzYLG30Jgkc=; 
 b=Pp01JY5NjC2iIFRkJKDrnrWGgY5dsy+UHl2OvtpEA1sHCnk1XA9e1NP9SJHMsNL7V+CVp6fdJ4YDqDxChgdrUdyCFHa9Qerl/7yaG76fLV5Q3IQO7K7zWk7gX5gLFINBAE3qgaVroqY7pxl96KGQ2K7TOSvYXNRrLfOKb2Pf5MI=;
X-UUID: 88c0e7b1169545a1b41a7e104611f3d2-20210421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1052111850; Wed, 21 Apr 2021 15:20:15 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 15:20:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 06:20:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Apr 2021 06:20:04 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7615: fix potential overflow on large shift
Date: Thu, 22 Apr 2021 06:20:03 +0800
Message-ID: <7fdbfede8bdc09d8099d1a812c2434e0511980ce.1619043422.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 59C17390707C3BCEA47A9E4F24D76A34F835DABB65E660C50F48AA7E63AF3A442000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_152018_792054_41CB473B 
X-CRM114-Status: UNSURE (   7.50  )
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

Fix the following static checker warning:
error: undefined (user controlled) shift '(((1))) << (c->omac_idx)'

Fixes: 402a695b1ae6 ("mt76: mt7615: fix CSA notification for DBDC")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 67af2e2d4779..93d938d56166 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -390,6 +390,9 @@ mt7615_mcu_rx_csa_notify(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	c = (struct mt7615_mcu_csa_notify *)skb->data;
 
+	if (c->omac_idx > EXT_BSSID_MAX)
+		return;
+
 	if (ext_phy && ext_phy->omac_mask & BIT_ULL(c->omac_idx))
 		mphy = dev->mt76.phy2;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
