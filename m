Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sXcNxMU0XkRUEU/VSFPQ9YDdBU2AUeJjvtvf4/nko/s=; b=ML1k33v2RdZtzJI/25giHjUxSR
	sJpOLR3qlAIpsSIvOUgTWx8GyDNXzaaOXha770QwDQL2gKSOg/dO5l/OxnK7skJhr9HV3smMuJ7CS
	iCPb0KwCEVB/hQqvIVsDMtZ2stF3tHGGTUsuY4t84itHiUd4mVZ9oYnPPi/I+ct4c0bYmYNgmu7Z5
	nYQaeHEKh4loBCQjJeAHD1T6hd7Q2PY82015zbQ8wAyVJEbByniUVBkpP3S4BpIOlf32EipCXzRPG
	HqpzKT5+hFwrYQUKEgexX8NYCZFgHpuXxAy7NwZSVh8gDQTUVaKvrt8FO7GNntEI5TK2mLBy7cRGL
	GemIIuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApHX-00EDgu-Fi; Thu, 29 Dec 2022 09:32:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApG2-00ECzv-RT; Thu, 29 Dec 2022 09:31:29 +0000
X-UUID: 9eae8115ed5b44839e3fdaa09fd20f48-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sXcNxMU0XkRUEU/VSFPQ9YDdBU2AUeJjvtvf4/nko/s=;
	b=rrLMUWeXobNnkpcSIwzijCuB6eOJNFwRWUIZEDXAU5aUMoM5VLc2gUDzuzoWvoVf/xwPNR3Vb+3hHgvYqbWA2uWWg4cG4lTdSZCagkKxTkeDxZTUnV0fx1NvIqO8q+Wmr8MJftOhKDYPcJ00FHFWi+MitWBs5+c+2lhSLzLRKqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:b016d29f-6514-41e1-8e64-6da82d61b7c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:5308bc8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 9eae8115ed5b44839e3fdaa09fd20f48-20221229
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2123791731; Thu, 29 Dec 2022 02:31:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Dec 2022 17:30:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 17:30:44 +0800
From: <chris.lu@mediatek.com>
To: <jwboyer@kernel.org>, <dwmw2@infradead.org>, <ben@decadent.org.uk>,
	<marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <soul.huang@mediatek.com>,
	<yn.chen@mediatek.com>, <robin.chiu@mediatek.com>, <Deren.Wu@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jing.cai@mediatek.com>,
	<linux-firmware@kernel.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chris.Lu <chris.lu@mediatek.com>
Subject: [PATCH] linux-firmware: update firmware for mediatek bluetooth chip (MT7922)
Date: Thu, 29 Dec 2022 17:30:40 +0800
Message-ID: <20221229093041.25434-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_013127_307087_A2BBD083 
X-CRM114-Status: UNSURE (   6.21  )
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

From: "Chris.Lu" <chris.lu@mediatek.com>

*** BLURB HERE ***

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7922)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 505558 -> 506710 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin

-- 
2.18.0


