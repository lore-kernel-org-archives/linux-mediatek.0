Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E5BC4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 02:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wbpioN3xNi12SHYXm+gVI9vtQJKRQ4476AIpQhNmcEM=; b=Hw3Cc4QT002Z04xSBiwznnHrIs
	vUPIa4i6FESlb7+wwZKLqgrBTX73HAP2efqd5xmyL/t+O8Eanz5/IGjtDFNPDJCDdkIlKrSO/U08U
	dkstI/8iSk0pafvfyl+NvPXWTlOkFuGACIkGLOluJdTBocgNTWThZ2oyON1r8Mjo+QMzoAyKi32/9
	Us3sQnxhKFc7gY9E4BpQBXGVGa4iHDi2k7FKOWaRDD2dlHnLVxy7Vmpas7TMavW+b3PZezqZp5daz
	o9+mnQ+p5jYDj8QEzD7CjoLv974AnADuTvmDBtoOFL6AK58GaH7nRp/mbqJPAWb9+Zmf3bq+AO5oR
	G0dxRXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NGq-00FCma-DJ; Tue, 06 Dec 2022 02:01:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NGn-00FClN-Ox
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 02:01:19 +0000
X-UUID: d02df214abd9416a9a5b8e13698edfe0-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wbpioN3xNi12SHYXm+gVI9vtQJKRQ4476AIpQhNmcEM=;
	b=PM8sKPZDRAxzxo1VPb7z/sraYWmUaI9xUZfDyiDBRz75GeKzYiRI4g4wVWw+amuhQSCe1kyabE4I2+geKsC/nZn5U7D8ca03EtYWU8nV5TcWJP2mA/gqhVgPa9biJPGBqEb5B8pfEeZA4bBD9TMcsoYVVxLqizuVPqq+UCeOYew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:1146f94c-4952-427b-bab6-2a1a00a5391b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:577da116-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d02df214abd9416a9a5b8e13698edfe0-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1297171500; Mon, 05 Dec 2022 19:01:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 09:31:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 09:31:10 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH 0/3] wifi: mt76: mt7915: rework thermal protection
Date: Tue, 6 Dec 2022 09:29:48 +0800
Message-ID: <20221206012951.10719-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_180117_833411_4D9B29A0 
X-CRM114-Status: UNSURE (   4.49  )
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

*** BLURB HERE ***

Howard Hsu (3):
  wifi: mt76: mt7915: rework mt7915_thermal_set_cur_throttle_state()
  wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only
    after init_work
  wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling()

 .../net/wireless/mediatek/mt76/mt7915/init.c  | 21 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  5 +++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 17 ++++++++-------
 3 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.18.0


