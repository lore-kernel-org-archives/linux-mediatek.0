Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C281AC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RoP4Vi00/8tDFrasFZxtTo4Mo0n2O6LVcCZZtdc2rI=; b=PHQilAMb/2U01NxaIXUfsv/tl8
	9IQAH4XRgqgb8HVKi0aqfZQjlyyNWzwjEj08w4hX1DRDYKoMjlVu/Z46o4Xcx+cnLJNOq2c2vewyh
	VYuho4zFEzBPbwT4vZGk0Hbd8d8b3YXeeaYpx+eZzDVERoFDv4yg7MO1UMICp2VgQ7kHPY54uZmhw
	2kVGIlDspzmEjD2ler3f4JkIdCsu44XC7V/i3jrYGxtJ9Y8hYhuDy0HkqiTYXINVxpmergS1jk5HM
	aUu9m96W9ozD+6+4KCjDVQaQ4gpHj85Hr2FCMiSAyPaLe/Ou/RwWFlPnM2CeGlm14zAPG25G9YNmm
	ZVEw8Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQE0-008l2D-0s;
	Thu, 02 Nov 2023 05:26:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQDv-008l0u-29;
	Thu, 02 Nov 2023 05:26:35 +0000
X-UUID: 5e71a338794011ee86758d4a7c00f3a0-20231101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1RoP4Vi00/8tDFrasFZxtTo4Mo0n2O6LVcCZZtdc2rI=;
	b=puTlogJUUk98bS7tpHyHOM2+5IUsrQMf/ZY7OaT3aJO58dvaL4b4SYGQXzEz/9s+ByIph61RasynTT6c2JMZ9iHWLqRXyrUM++Hu5ZNM7uxk6YnPZ+IhiAKcXfjF4+DPpc5lZX4f6fyoQL0aTReeQzw4emsfGEVdfQXbjrECVVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7f498b6a-78c5-4c37-b289-9f6b20b94c93,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:f814ec94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5e71a338794011ee86758d4a7c00f3a0-20231101
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <naomi.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 3978819; Wed, 01 Nov 2023 22:26:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Nov 2023 13:25:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Nov 2023 13:25:58 +0800
From: <naomi.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<casper.li@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>
Subject: [PATCH v3 0/1] ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1
Date: Thu, 2 Nov 2023 13:24:23 +0800
Message-ID: <20231102052426.12006-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.335900-8.000000
X-TMASE-MatchedRID: bN0Ga+Wo/7iRD9Q6y2Li+hA0LjlGWpxLd0/IMHz0evnJV4VcizYObZas
	fA8Y/RCFeIvqE1htygk76TIx5LCnC1ubwQYL9vqCKaMQ6tw7oDJ9LQinZ4QefCP/VFuTOXUTl7B
	AyKmXjyPkwjHXXC/4I66NVEWSRWybUIm6NhAOqkXAI9vyxo2Fc12CDqjVS1NgPVnDUW5HaBsKIa
	lieSFYk3NkqN00n/6LLBahYPfvRa5rNSfbLIP9qTBkQdcr43gMjofsMjQaxVwyYjbiqIQ3Csykh
	tyXcigD6rVdgBjDT2r1nXJavJVNag==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.335900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 44CC1505BBD99239C072374F13D27B55828234EE079F1568F566B5B57503815E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_222631_713514_9D699FA0 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Naomi Chu <naomi.chu@mediatek.com>

Expand the MCQ queue slots to comply with the UFSHCI 4.0 specification,
enabling host controllers to fully utilize the MCQ queue slots.

v2 -> v3
- Add patch description that why this patch is necessary

v1 -> v2
- Remove QUIRK_MCQ_EXPAND_QUEUE_SLOT quirk and make the change for all host controllers

v1
- Support quirk for host controllers not able to distinguish queue full or empty

Naomi Chu (1):
  ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1

 drivers/ufs/core/ufs-mcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0


