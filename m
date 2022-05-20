Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F216FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JTnBTa2X9lg8l4v/mY2Ddb+KJB+7oifit8qcwR71tGc=; b=qSLH/Yi9uoRRKS
	sDx9KdIurWoDcLO2jh18VSnQj2+Ds+0j3nnElcqRi2ilSY+jvLVWTOvtC0tHIkh0+q2tD5gcDsKEj
	EfmZuRNK21kzjsnXF45tVnQCNyLdi7wYUuZrxtfuz+sP3cuUuKoDssXho6rRxlB4/j5FtQ070IQx7
	dbvhoVTwnHgzvT8P2eUDRLC8u9sAVidZms73QHlbi720g1+hj9bORWrxu4G06r3jAfXfyk0tkD2dH
	F85Tu6jDjtTtk1Y+tNeBgTC3AK0861s+3n6OoSWbqlenfV8z7bUKM4NDZ9dK+P6zHKCPvQ2w6BCbD
	kOThq+7lDUxX7xJ+lE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryYk-00BRhi-17; Fri, 20 May 2022 09:04:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryYL-00BRY0-L4
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:04:10 +0000
X-UUID: 2f9848911e8c436ca3c41c3b2186739a-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:17fc8e0a-d088-4bef-9a4f-6295a70ca866, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:3616ff79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 2f9848911e8c436ca3c41c3b2186739a-20220520
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 55978184; Fri, 20 May 2022 02:04:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:03:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 17:03:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 17:03:57 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 0/3] introduce ACPI SAR support
Date: Fri, 20 May 2022 17:03:36 +0800
Message-ID: <cover.1653032296.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_020409_764598_C5B502C9 
X-CRM114-Status: UNSURE (   8.58  )
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

From: Deren Wu <deren.wu@mediatek.com>

Introduce ACPI SAR support for mt7921 serials.

Changes since v1:
- replace BIOS with ACPI
- replace "6G" with "6 GHz" in patch subject
- remove unnecessary function export

Deren Wu (3):
  mt76: add 6 GHz band support in mt76_sar_freq_ranges
  mt76: mt7921: introduce ACPI SAR support
  mt76: mt7921: introduce ACPI SAR config in tx power

 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |   1 +
 .../wireless/mediatek/mt76/mt7921/acpi_sar.c  | 279 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/acpi_sar.h  |  93 ++++++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   5 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  31 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  22 ++
 7 files changed, 426 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
