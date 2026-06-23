Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE5CDB466
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 03:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CRcMvd4k5Agc5WGNOplqEUE6B7dDRP1ZZ158/UcAHKE=; b=Z+HBWhoeeBotk0xt6y3USY7k9i
	bsaYGCUiDyN8faz5PUgglZhb8C9mQSwRK+2n6JO9Auel3Vn1cPSJG457Q3VnggOtO7uhDy8UN8SjJ
	lgAoypclSFIQU4qmheoC5dZ49d1YJJAVRAlkamQKHoTZgdghdJoQjx/nPqalLCfv10Xi0WVvMvBc0
	1jEW0avHtFvZ2GsVVqeMoNrfckAYAREN1rbgbyvTrJxGIrWzPmrF/YZQvtWeV/eCiPuRFgwuKfWDG
	gG7ePIWhgegDebkKqAJbLvKbxmh7Z6kUAGVt5m+E352F2O97I3zuNEZykGtcarpnZdWB3vUWA+uv9
	Y1iQa9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbs12-00000005exN-1buT;
	Tue, 23 Jun 2026 03:41:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbs10-00000005ew5-1Mkd
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 03:41:35 +0000
X-UUID: 697f07126eb511f1afed4741b24580c9-20260622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CRcMvd4k5Agc5WGNOplqEUE6B7dDRP1ZZ158/UcAHKE=;
	b=JkvHRIMy4CH+GBpcdMQR6Z+A2/p0CCPcqdSA0Bydk/A7nPzmi+TAhipddVk1TCZo1mwzjJgw7HxcS07LuAenurgD1Zu1TRFcCTGZWrzePBxMov3bF9e8QhmRmCGptMRpMH9zC9HkiMiOLE6AR1D5fAnLd1vbDOK+JvEmlcaX7r0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c5ecdf10-59d4-4b51-815c-eb3533e86ff3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:f96b9f18-d5b7-462e-837e-c68890e2b47e,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 697f07126eb511f1afed4741b24580c9-20260622
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2081559365; Mon, 22 Jun 2026 20:41:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Jun 2026 11:41:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 23 Jun 2026 11:41:23 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v4 0/2] Bluetooth: btmtk: Add MT7928 support
Date: Tue, 23 Jun 2026 11:41:19 +0800
Message-ID: <20260623034121.691031-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_204134_374988_E19DC21B 
X-CRM114-Status: UNSURE (   8.29  )
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

Patch 1 refactors existing firmware download code by replacing magic
numbers with a descriptive BTMTK_WMT_PKT_* enum, making the packet
sequencing logic clearer.

Patch 2 implements MT7928 firmware download flow, which requires loading
CBMCU firmware before Bluetooth firmware. The CBMCU firmware uses a
two-phase download sequence: Phase 1 downloads the section containing
global descriptor and signature data, Phase 2 downloads the remaining
firmware sections. After CBMCU firmware completes, the driver continues
to load the Bluetooth firmware following the standard flow.

Tested on MT7928 hardware with successful firmware loading and
Bluetooth functionality verification.

Changes in v4:
- Split into two patches: refactoring and new feature
- Add BTMTK_WMT_PKT_* enum to improve code readability
- Replace magic numbers (0xF0, 0xF1) with descriptive macros
- Define MTK_SEC_CBMCU_DESC macro for section type
- Add MT7928 marketing name comment
- Include firmware filename in error messages
- Add detailed size information in firmware validation errors
- Use BTMTK_WMT_PKT_* enum in CBMCU download function

Changes in v3:
- Add firmware size validation with bounds checking
- Improve error messages with context information
- Add section offset validation for both phases

Changes in v2:
- Simplified enum usage by consolidating status definitions
- Improved code maintainability

Chris Lu (2):
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
  Bluetooth: btmtk: Add MT7928 support

 drivers/bluetooth/btmtk.c | 358 +++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h |   9 +
 2 files changed, 363 insertions(+), 4 deletions(-)

-- 
2.45.2


