Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A276CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpEvfrOsnzxI0Usk6ogp8zsWy48ijEzIpAKQBgY7nB8=; b=cEyHdWEyb5eVT3L0gEtZZ2Vtb2
	Ya0S2zzJH7R2agNTGAoQJz8FfDBxlbECsiHxtYJKo0xW6TGZ7S0ffrazsLA/oJ/BZPLjO8EqZ+qCU
	z1uzjMqnH5DUMWV3fLxZLLBD0uG98fspXKSywM7GZjyxoYGCi7+ikxfUW5+30sVOcXCqkM7fWls7y
	p0scSXwCaX0/owTda6YpTRJxie4V8TISLEwCwxsbI2u8XK6C2rkwjX8XPBPzvBYgpXjIzHMOsyf/4
	cK1Pk+fk69YPitiZ9i2xzBN3oNtHNd/wDSWU6OIcaNL/+xVoweVPyNCNrAeIBff9zty6zAxWgu+Gn
	IhQ7Os3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe6y-0000000FtVw-2lhI;
	Mon, 05 Oct 2026 08:31:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe6w-0000000FtVG-13Ba
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 08:31:51 +0000
X-UUID: 327a61c4c09711f1acbe4559397dec65-20261005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZpEvfrOsnzxI0Usk6ogp8zsWy48ijEzIpAKQBgY7nB8=;
	b=gw4qfBL59EbyaB5Ntx9htrNZMQEjymHihFj/l9otIRJGep48No7VopN8zy6eq0VpmeDe7Q7/1afMg+4ZsmXhxoxHBvnaCy1aFj3X1vCIluPFnYK1j5HpYlppFg5k2WOOOyJh6AqjthvFh+AG9JqbT0sQcxPK3dtudArfMUEYNt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:ae18bbe5-0a0a-44bb-a943-c8c209b11e11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:e8895c56-66df-4ed9-ba9a-e32623d07625,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 327a61c4c09711f1acbe4559397dec65-20261005
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 219934976; Mon, 05 Oct 2026 01:31:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Oct 2026 16:31:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 5 Oct 2026 16:31:42 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH v4 0/5] mt76: optimize mt7922/mt7928 T-put per Tx/Rx stats
Date: Mon, 5 Oct 2026 16:31:40 +0800
Message-ID: <20261005083140.104609-1-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_013150_296678_AB6D4DE1 
X-CRM114-Status: UNSURE (   8.27  )
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

This series adds:
1. Read the HW charactistics flag from ACPI BIOS.
2. If the HW needs, collect and update Tx/Rx statistics to FW.
3. FW can then decide how to adjust PCIe link to improve T-put.

Anthony Liu (5):
  [PATCH 01/05] wifi: mt76: refactor chip_config to accept generic
    commands
  [PATCH 02/05] wifi: mt76: refactor chip_cfg commands to be a generic
    API
  [PATCH 03/05] wifi: mt76: add ACPI MTFG option for bus configuration
  [PATCH 04/05] wifi: mt76: add PCIe speed tuning for mt7922/mt7928
  [PATCH 05/05] wifi: mt76: mt7922/mt7928: send Tx/Rx statistics to FW
    for link tuning

 .../wireless/mediatek/mt76/mt7615/debugfs.c   |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  54 ++++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  60 ++++-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  38 +++-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   8 +
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   8 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  47 +++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   1 -
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  14 ++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |   8 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  57 +++++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  |   1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 211 ++++++++++++++++++
 20 files changed, 526 insertions(+), 10 deletions(-)


base-commit: 86b8d5b18d9712ae0001f078d1893c2dceac0bdb
-- 
2.45.2
---
V3 -> V4: Add cover letter, fix crash (misuse of deflink) in mt792x_perf_account_rx().
V2 -> V3: Remove Gerrit-only: Change-Id.
V1 -> V2: Remove not needed lines copied from internal commits.


