Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2364FC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 02:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=; b=gPMhRACjSQBO4eIp4vG+gzyDRj
	qbDRXBuG7hukOKuj3H/lmCegY5oz9zzEce2F04Q4pf64Z0//9jRppLP/eJED03jcDnM1Lse78j0t8
	EKdoLq5z6YhrxornHF/rZ6G7+Ixw05ll4uMVaVrdrlYHVl0ciCEw3UR47sh4h1kFCJMEktdMqqOWs
	P4XaKjm77cuQKLEGS0LWD5MoXoudYBIgHvRma58RJQcBW0tv6D4TwHEc1FEjQtp93U11S004/qhj4
	eduEHiiDa4G9bZtoDX10Oqqp429HBPZP3Kusbzl+uIOqdHjVnE08IZIPsDt0xbp5yI+8GEiiEYwlk
	Bwr5hDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDckO-00HHaJ-TC; Fri, 06 Jan 2023 02:46:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDckL-00HHZH-Bl
	for linux-mediatek@bombadil.infradead.org; Fri, 06 Jan 2023 02:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=; b=XW4FunNAg7BOB5oxVf6DNQNZ0p
	1r56tDo9NNJYF2DL+o8g+e4uO/x/aK9dmq277LimYWYirR3/NlDS6HGDBgI99cbtZGhwaMKt+pPL5
	37h9j3cejLOPUWxDjTxIFudqKkQLSgEIe6J3i/wKdfvN954sf3rgenTdEXC+nuvDPrYxyNT0koY9Z
	gAG0zi2e11TwByn6lN/CrN7eW9TKBHvFHPGtW1Ip5JxsHpWaKKM1lb2cGi31QybRS4cwjsmkHqLY/
	aAC/yLnmtNxA9Xpo6h0gG3KlyZkLAFmEHufUcCJVlQ57hsPbD4a9cWji15YZmzSqwBtVotCiCcpZR
	R1sxFqEQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDck4-001g2N-1R
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Jan 2023 02:46:06 +0000
X-UUID: 552250dc5abc47e48c36719595243c23-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Dkt3HR/PhYl/HcfNR96k5NZTqAIpZGIMAMABCP3i6Es=;
	b=dl5hewIVUvMlYGGtdfVBpo4stMgK8K8V0FLHZCEaZYnXsJnPG5Tlv+XT0WYvzDlFk+ZIiZmh4n/lzLvqQ7/MjWbjJy+UA+ZNTwzgPpI5auE/fWYPLC/hqabB/8wzHBq3OCW6XXKJo6/84UCS+iv605aKiLl1XfWeL3XP3h0sYWg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:6d9b04f3-f77f-4040-8516-6bccb3076768,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:6d9b04f3-f77f-4040-8516-6bccb3076768,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:9b92f7f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:230105194716CXV149PD,BulkQuantity:9,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0
X-CID-BVR: 0
X-UUID: 552250dc5abc47e48c36719595243c23-20230105
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1598192292; Thu, 05 Jan 2023 19:44:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 6 Jan 2023 10:44:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 10:44:13 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2 1/2] wifi: mt76: mt7915: set sku initial value to zero
Date: Fri, 6 Jan 2023 10:44:11 +0800
Message-ID: <20230106024412.10064-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_024602_528133_9C614216 
X-CRM114-Status: UNSURE (   8.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set sku initial value before mcu starts to prevent mcu from getting an
invalid value.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 686c9bbd5929..2ac0a0f2859c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -883,6 +883,8 @@ static int mt7986_wmac_wm_enable(struct mt7915_dev *dev, bool enable)
 {
 	u32 cur;
 
+	mt76_wr(dev, MT_CONNINFRA_SKU_DEC_ADDR, 0);
+
 	mt76_rmw_field(dev, MT7986_TOP_WM_RESET,
 		       MT7986_TOP_WM_RESET_MASK, enable);
 	if (!enable)
-- 
2.18.0


