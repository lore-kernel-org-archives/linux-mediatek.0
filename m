Return-Path: <SRS0=vJjU=2W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACDCC2D0DE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jan 2020 06:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B663206DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jan 2020 06:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9TxADpP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bAiToZYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B663206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=71+KRvwgsYReQ7I+xpeWm62wzDjU1zQu/26kR9j9D6Q=; b=K9TxADpP1Z12wM
	E/Szo9mcV5xgah/+1rv6z2CBE2YeknbBpRBaGnywyy0LJstaSXiyZPIFwBZHA3BYBitKGNV4s8Hd1
	TEcGFQksBRSPFuKo/Zw/rzGxrISZfJ7Mx+FWJ0fEUZDOU2xh/NBk1yDoxf+WM9K55dHPEB9tgZ3Ek
	mqhoyh7+3diTWQSvHPZsyAUskbVtpYkGx0zkAjCCuyoT8nBpsUTWQGmj5kpV4l+UphgITexiariiA
	fTpccxHn/eWspZwMX7mXSYBsIRmubX5fvk5NxSB4G/ejS6756jpabIBB0EEZvONKA8JwlfEbwddCJ
	RFggOWQCH/plSz2r1j1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imX9m-0006IW-Dq; Wed, 01 Jan 2020 06:06:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imX9h-0006I2-C6
 for linux-mediatek@lists.infradead.org; Wed, 01 Jan 2020 06:06:55 +0000
X-UUID: b6f3825d4fcc4ce09d31ee02e4261aef-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hKgJzwzefE+FPfSamusgqvNTI7peHIm1WvPCMjSXGwY=; 
 b=bAiToZYs4Tl0vsvVJPJ/EDIBfXf7fk0GcUluU4KH+m2ULQgqQ4ujMp2blWqx3XciOSm961YnFbCT8We2TrefPMYRGxZibIQr50xkWRbKtH3sS96XgJ4zOL4oNAaG6vvFyskSJCfIZoCYV8iPS8sxOStM3RwrqgTC7STijf6rcBU=;
X-UUID: b6f3825d4fcc4ce09d31ee02e4261aef-20191231
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1926856037; Tue, 31 Dec 2019 22:06:43 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:56:45 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 13:55:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 1 Jan 2020 13:56:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: fix endianness in mt7615_mcu_set_eeprom
Date: Wed, 1 Jan 2020 13:56:25 +0800
Message-ID: <4f6dfa450f2bf3ca5be7c7b417d62b2eb339918d.1577856956.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 858B261DFA2EE7E5F64E35FECBE3FABDF3C6DA8D88590AABFE143C117432EDE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_220653_420233_1C05DE6B 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The field 'u16 len' should be __le16.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c8d6a36f5d0a..1a60016d8534 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -598,10 +598,10 @@ int mt7615_mcu_set_eeprom(struct mt7615_dev *dev)
 	struct {
 		u8 buffer_mode;
 		u8 pad;
-		u16 len;
+		__le16 len;
 	} __packed req_hdr = {
 		.buffer_mode = 1,
-		.len = __MT_EE_MAX - MT_EE_NIC_CONF_0,
+		.len = cpu_to_le16(__MT_EE_MAX - MT_EE_NIC_CONF_0),
 	};
 	int ret, len = sizeof(req_hdr) + __MT_EE_MAX - MT_EE_NIC_CONF_0;
 	u8 *req, *eep = (u8 *)dev->mt76.eeprom.data;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
