Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE986C35247
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 18:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2CEF21741
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 18:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPv8SWIF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nsBIq7LD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2CEF21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2G5lb9Pv1h8Oit+R5uY8iVdMVoO4R+EG5WkuqFuFfdw=; b=YPv8SWIFnF+v3J
	X59d8ESM35M6u5Fa6HMVy4za0b+YyCmebdzBoYZQpi6VMphQ9SRlodox6XpMs9/UhlhN3MN5CA6n7
	2/OivQ3E6XYYsKTw7yAh5VAY/IHG+Ph9zqORYvMPFMB8UMoo5t3oX1sEpTuA0HL5Zk52rI3ybo6I5
	PscbTWNoNuU0RnpMv/nOchg1t6tHYshxLMOu0h3ydwpa+3gle0SuB97j75RGLuuEgVG4quzI20ZyL
	QEws1cpUFw2awEm6sxspPHo2m/e6UNODB/hc21cJe4Jg1QlELM+CFKuzP4OQWcypqIgrF/gAJOA58
	TG3SVA3y7eQX5BIqbBuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izPT8-0001LV-Te; Wed, 05 Feb 2020 18:32:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izPT6-0001K1-Pk
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 18:32:10 +0000
X-UUID: e665b3d0b6db4a48a230b2aed078473d-20200205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xxlgbnU5pSZKUH3JfH939pFWVo6iRlJ+wxus9Y1Vfak=; 
 b=nsBIq7LD8b7kjrYnS+7eDIzcHMq6G0UC33AvGH8QwTyIcVwib9pIBFBdzpCi/DyjIH8M7wEFKbZEV3cCEe2t2M/H6x0QMNrs/nlQIStabAMeWezFGgbVdeVKWPvZB5n31rH7LPqBGyDsLRIRNOvOsDowXAwRh1jivVxEttEIWbU=;
X-UUID: e665b3d0b6db4a48a230b2aed078473d-20200205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1194970084; Wed, 05 Feb 2020 10:32:01 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Feb 2020 10:31:59 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Feb 2020 02:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 6 Feb 2020 02:31:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2] mt76: mt7615: set proper length in strncmp
Date: Thu, 6 Feb 2020 02:31:19 +0800
Message-ID: <06da8143b6baa77295abaf70907fb8e345e15e0e.1580927122.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_103208_846702_A8CF26F6 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Chih-Min
 Chen <chih-min.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use sizeof(hdr->fw_ver) as max len.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2 - use sizeof() instead.
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 6639f9291721..c3c01e095926 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -491,7 +491,7 @@ static int mt7615_load_ram(struct mt7615_dev *dev)
 		goto out;
 	}
 
-	if (!strncmp(hdr->fw_ver, "2.0", 6))
+	if (!strncmp(hdr->fw_ver, "2.0", sizeof(hdr->fw_ver)))
 		dev->fw_ver = MT7615_FIRMWARE_V2;
 	else
 		dev->fw_ver = MT7615_FIRMWARE_V1;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
