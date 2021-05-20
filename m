Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AD6C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:47:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A4160E0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A4160E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4NUlNRgf4d3EwyIVEpzak5/j9+S2o8KuHd66cl3mUYk=; b=pXBAL9wjSzXm7BGfkwkqjwWPY
	bgIB5+joO5fRMBquF2WSYWKaPGFBM4OaI5DXNPpGfqjh3YfOUz4j38smpk0LP44Vlfp0OJiTZC6la
	BGs4chztEI3LS9EQAK6mFnC1qq1vQZp7Z2pxrUYyN9ALpxCSrp407L+3goaJ2zVE3tIbxrfy0UBVJ
	zl5CC/zy44FUJVl3f8xO6Mgi6WjlGEhqndT4Tl5D9RNJoy8x9xfxgog+MvLCHQM3+vsvXGA5/qpWi
	+Csi4lpO+6W/XAnibqBY6f5ejCYvVms4K0XnhLzLLZcsI8mmEDq0Nm8m2gAvrarq4wTRFPajYMLJy
	MpaL6jajA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZeM-005nBU-I4; Thu, 20 May 2021 03:47:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZeK-005nBC-3r
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=HLmFA/SY8ijom5D8jZ1LEydYc5jzzCak/nupSEdcmDo=; b=HbzmhYBKVj45hkStSeOaBHj0W6
 LVvJu3S0NE/8nFLSmx99N8RMczyjZnuA0yglcN/2UhEvcZOTWppX6bfqbv4R31F9rTv7gDkGVgk/s
 5eXzWohYGxBXn9YbNrF2LQPVD0uQOm2mv2RSIeG9+nN7EUv96PqqhSsfOSvBTGCmBtbso4nDfTrbp
 ZCLE7aD+vRzojmc02Rx4V6p9JeEFdBhNBIkX6M4AsPkgla1TD6r8TU161z4/FCEMTFqOGXEc3bFGr
 2yHU+33li8e1CSpPFvoEIiizYAWY7LaXrLLS76ERR8vyUflK13ChYguan7CtVQgl7YqgJ95mSUveq
 yRYOdj1w==;
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZeD-00FukM-Ay
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:47:02 +0000
X-UUID: c6a8c581e6154914889299144501b68d-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HLmFA/SY8ijom5D8jZ1LEydYc5jzzCak/nupSEdcmDo=; 
 b=ptCHmxIwRmKDzzvNv5nQOf0rI/K1qtGVz1iNlGIMO4otooMHeWpgG5tpGbo04AO3qX7qe6VBR3e9AmTobZuhHHsRw8fhVTpxhRb8os1vGlB+LY+64d9PhGAIOugdfIMqWMI2vOgpo+CNqxmlF2UbdDHXpVi3H/5sJWmcXYATIXs=;
X-UUID: c6a8c581e6154914889299144501b68d-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1459627097; Wed, 19 May 2021 20:46:49 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 20:46:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 11:46:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 11:46:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "Leon
 Yen" <leon.yen@mediatek.com>, YN Chen <yn.chen@mediatek.com>
Subject: [PATCH 2/7] mt76: connac: update BA win size in Rx direction
Date: Thu, 20 May 2021 11:46:36 +0800
Message-ID: <1621482401-29025-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
References: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_204657_404983_D0EEE34E 
X-CRM114-Status: GOOD (  11.19  )
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

From: Deren Wu <deren.wu@mediatek.com>

Update BA size used data transimission in the Rx direction to improve Rx
throughput.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index e0d6bdadf5b1..73359defa176 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -931,8 +931,10 @@ void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		ba->rst_ba_sb = 1;
 	}
 
-	if (is_mt7921(dev))
+	if (is_mt7921(dev)) {
+		ba->ba_winsize = enable ? cpu_to_le16(params->buf_size) : 0;
 		return;
+	}
 
 	if (enable && tx) {
 		u8 ba_range[] = { 4, 8, 12, 24, 36, 48, 54, 64 };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
