Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C7EC43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nxJ0Gyts4W7JmufeEQvwSvIdNSPwYTu5dQ6pJc1k+ks=; b=KcTEqZnG8gPJaNWDCz6AR4OaHF
	oPjSiaketakYZn63tJsWi3c7ayaQCaRnhh8qHBkCBeugA12X2eGYBfhhbKNQf0MqFZYKqRARQQHFY
	bhlUc3oT+z/8qnAAoVXOLLqcYcn71cD9i4DXAB97vV15qF+X8Gi/XVhcWA37RqLWbhBiXMkz+x7qN
	cSykgm6ypFoBgeUFHFpdEi12wCtiukGhe7zom9aizszeCEp2IgBrxyDgr7b2ZavrTUGap2MSKmUW+
	8ZdVNd38jin/8jaOkt1Rw8iMG4hxC7egt30GavhldEk4f6jlJEXEruDquHdyhbCs2zCq12xxCHj8X
	CJG8cBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXh0-0000000H09b-2dRB;
	Tue, 30 Jun 2026 12:35:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgt-0000000H05E-0ZBF
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 12:35:53 +0000
X-UUID: 36ba5df6748011f1acbe4559397dec65-20260630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nxJ0Gyts4W7JmufeEQvwSvIdNSPwYTu5dQ6pJc1k+ks=;
	b=XcISBpgE/1S90ejQJHziklfA5l9T3vFEpYlZcTt0sA9R/h3lVeQjYXsIFTKhuU+eXDDwVL8q5iyeKCCImqhCNltqfHzYRVzU4ZujEjG80KCKg10Y9XSUpZo7VLcBD4+1wLmwKfmj0PHqqewD/my6gwWs0Z0cpdaYgTM4S2N7ObI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:45cc7f0c-e152-4492-bd60-04c61110aa7a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:1420d381-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99|100|102|156|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 36ba5df6748011f1acbe4559397dec65-20260630
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 393047629; Tue, 30 Jun 2026 05:35:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Jun 2026 20:35:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 30 Jun 2026 20:35:42 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v6 0/3] Bluetooth: btmtk: Add MT7928 support
Date: Tue, 30 Jun 2026 20:35:36 +0800
Message-ID: <20260630123539.668776-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053552_343494_BAFC71E7 
X-CRM114-Status: GOOD (  12.19  )
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

This patch series adds support for MT7928 (device ID 0x7935) to the
btmtk driver, which requires a new two-stage firmware loading process
with CBMCU firmware.

Patch 1 refactors existing firmware download code by replacing magic
numbers with a descriptive BTMTK_WMT_PKT_* enum, making the packet
sequencing logic clearer.

Patch 2 improves BT firmware logging to provide more useful information
for debugging: adds firmware filename before loading and displays chip ID
as HW version instead of firmware's hwver field.

Patch 3 implements MT7928 firmware download flow, which requires loading
CBMCU firmware before Bluetooth firmware. The CBMCU firmware uses a
two-phase download sequence: Phase 1 downloads the section containing
global descriptor and signature data, Phase 2 downloads the remaining
firmware sections. After CBMCU firmware completes, the driver continues
to load the Bluetooth firmware following the standard flow.

Tested on MT7928 hardware with successful firmware loading and
Bluetooth functionality verification.

Changes in v6:
- Fix timeout handling in btmtk_cbmcu_patch_status() to return -ETIMEDOUT
  instead of success when polling exhausts retry count, preventing silent
  timeout that could bypass concurrent download protection
- Add integer overflow protection in btmtk_load_cbmcu_firmware() using
  check_mul_overflow() and check_add_overflow() to prevent malicious
  firmware with large section_num from bypassing size validation through
  32-bit arithmetic wraparound on 32-bit architectures

Changes in v5:
- Split into three patches: refactoring, logging improvement, and
  new feature
- Add Patch 2 to improve BT firmware logging independently
  * Add firmware filename before loading
  * Display chip ID (dev_id) as HW version
  * Use clearer log format with separate HW/SW version fields
- Apply same logging improvements to CBMCU firmware in Patch 3
- Better separation of concerns for easier review

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

Chris Lu (3):
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
  Bluetooth: btmtk: Improve BT firmware logging
  Bluetooth: btmtk: Add MT7928 support

 drivers/bluetooth/btmtk.c | 382 +++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h |   9 +
 2 files changed, 385 insertions(+), 6 deletions(-)

-- 
2.45.2


