Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D69C44507
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 01:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XV1f9FyRzapems0edisKyFe5gWpthT1izQxY78xuKSk=; b=D8ptLeAZ20Sq8Zs2X+9WtVfP0M
	2hXcdOYD/Hurn9TXY52NEeKUI7JgTaK4R4bVsbnQfxRLTUN+YrZTtTsMzmhvsFQWkFrXvCixWrA2f
	Mh/5MYTjb2g+fugC5gOWFUf+rsTmf+86J8UOVbHk4OOWiL8ShlgKgaG/nj04+PPARcxLMIhr6yJSW
	kaALhar5lQcgVt0ibX6+WTlUQIGyOzynENoP4QWP8wFJkWEC0IQx4t34EMzqhSy2/XFs/tRTNU2vy
	KfTosUbXhuCKCA5OcYh37YzTbvOq9/chJ/Q4QPT/3App4R8GF0YKCE7mnYTeoUnIhFEbHsKxpCf7U
	JRxHAWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBNw-0000000GEdT-04QV;
	Thu, 16 Jul 2026 01:59:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBNr-0000000GEZP-1zIc
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 01:59:32 +0000
X-UUID: f7c86c5a80b911f1acbe4559397dec65-20260715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XV1f9FyRzapems0edisKyFe5gWpthT1izQxY78xuKSk=;
	b=J3g1KKZqeHKFjN2zne1nArU0jG6pqBpbHX+Okp/IKfzx49pLgL52TIX82hW1VyDBrHi3lCTEs6aqCGrythU3rGhFAhdmBGK0pi3O9o2Cgn6V21eNuwj7o0y/nZaMGjMCiV7cFGtbqAwOxrIcz6hV4BnPBo1XnfXBQLp6rZmgx9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:7c39354e-c844-483a-b540-bf74dde9ed6a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:601d885f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99|100|102|156|200|213,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7c86c5a80b911f1acbe4559397dec65-20260715
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 164989479; Wed, 15 Jul 2026 18:59:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Jul 2026 09:59:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Jul 2026 09:59:21 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v12 0/7] Bluetooth: btmtk: Add MT7928 support
Date: Thu, 16 Jul 2026 09:59:12 +0800
Message-ID: <20260716015920.1886719-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_185931_522563_04071887 
X-CRM114-Status: GOOD (  15.76  )
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

The series is organized to fix existing issues first, then improve code
quality, and finally add new functionality. Patches have been reordered
in v12 to ensure dependencies are satisfied in the correct order.

Patch 1 fixes a DMA out-of-bounds access in btmtksdio_tx_packet() where
round_up() alignment causes DMA to read beyond the skb buffer, potentially
leaking kernel memory or triggering IOMMU faults. Also fixes a use-after-free
bug where sdio_hdr pointer becomes invalid after pskb_expand_head() reallocation.

Patch 2 fixes a pre-existing security issue in btmtk_setup_firmware_79xx()
by adding comprehensive firmware size validation to prevent out-of-bounds
memory access with truncated or malicious firmware files.

Patch 3 fixes a regression introduced in commit 28b7c5a6db74
("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support") where
SDIO devices would incorrectly pass dev_id=0 to btmtk_setup_firmware_79xx().
This prevents potential MT6639 hardware hangs and ensures correct hardware
identification in logs.

Patch 4 improves BT firmware logging to provide more useful information
for debugging: adds firmware filename before loading, displays chip ID
as HW version instead of firmware's hwver field, and uses %.16s format
specifier to prevent buffer over-read of the 16-byte datetime field.
This patch depends on Patch 3's dev_id fix to display correct hardware version.

Patch 5 fixes a pre-existing bug in btmtksdio_setup() where
btmtk_fw_get_filename() generates the correct firmware path but is
immediately overwritten by snprintf() with a generic legacy format,
causing newer chips to request incorrect filenames. This patch depends
on Patch 3's dev_id fix.

Patch 6 refactors existing firmware download code by replacing magic
numbers with a descriptive BTMTK_WMT_PKT_* enum, making the packet
sequencing logic clearer.

Patch 7 implements MT7928 firmware download flow, which requires loading
CBMCU firmware before Bluetooth firmware. The CBMCU firmware uses a
two-phase download sequence: Phase 1 downloads the section containing
global descriptor and signature data, Phase 2 downloads the remaining
firmware sections.

Tested on MT7928 hardware with successful firmware loading and
Bluetooth functionality verification.

Changes in v12:
- Swap Patch 3 and Patch 4 to fix dependency order issue:
  * Move "Pass hardware dev_id" before "Improve firmware logging"
  * Patch 4's logging improvement uses dev_id to display hardware version,
    but in v11 it would still display 0x0000 because Patch 3 (which fixes
    dev_id) came after it
  * This ensures every intermediate commit produces correct output
  Reported by AI review (Sashiko/Gemini).

Changes in v11:
- Patch 1: Fix use-after-free vulnerability in btmtksdio_tx_packet()
  After pskb_expand_head() reallocates the skb buffer, sdio_hdr pointer
  becomes invalid. Fix by reassigning sdio_hdr after reallocation.
  Reported by AI review (Sashiko/Gemini).
- Reorder patches for bisectability:
  * Move Patch 6->3 (firmware logging improvement) to prevent introducing
    buffer over-read risk in intermediate commits
  * Move Patch 3->5 and Patch 4->3 to ensure dev_id fix is applied before
    removing redundant filename override, preventing potential MT6639 hangs

Changes in v10:
- Add Patch 1 to fix DMA out-of-bounds access in btmtksdio_tx_packet()
  Discovered during v9 review - round_up() alignment can cause DMA to read
  beyond skb buffer, potentially leaking kernel memory or triggering IOMMU
  faults. Fix by expanding skb tailroom and zero-filling padding.

Changes in v9:
- Reorder patches to group SDIO fixes together (Patch 3-4)
- Patch 2 (was Patch 1 in v8): Fix firmware size validation in
  btmtk_setup_firmware_79xx()
- Patch 3 (was Patch 1, new in v9): Fix firmware filename override in
  btmtksdio_setup() where btmtk_fw_get_filename() result was incorrectly
  overwritten by snprintf()
- Patch 4 (was Patch 2 in v8): Fix SDIO device logging regression
  SDIO devices were passing hardcoded 0, causing "BT HW ver: 0x0000" log

Changes in v8:
- Split v7 Patch 1 into two separate patches:
  * Patch 1: btmtk firmware size validation
  * Patch 2: btmtksdio dev_id parameter pass-through
- Patch 3 (was v7 Patch 2): Keep BTMTK_WMT_PKT_* enum refactoring
- Patch 4 (was v7 Patch 3): Keep MT7928 support implementation

Changes in v7:
- Patch 1: Add commit 28b7c5a6db74 to Fixes tag per Luiz's feedback
- Patch 3: Keep BTMTK_WMT_PKT_* enum refactoring per Luiz's suggestion

Changes in v6:
- Patch 1: Per Luiz's feedback, add Fixes tag for commit 28b7c5a6db74
  which introduced the dev_id hardcoded 0 issue
- Patch 1: Restructure btmtk_setup_firmware_79xx() parameter comment

Changes in v5:
- Patch 1: Move btmtk_setup_firmware_79xx() dev_id documentation to
  function-level comment per Marcel's feedback

Changes in v4:
- Patch 1: Fix commit message title (remove redundant "to")
- Patch 1: Expand commit description per Marcel's suggestion
- Patch 1: Document btmtk_setup_firmware_79xx()'s dev_id parameter usage

Changes in v3:
- Patch 1: Use 'u32 dev_id' instead of 'u16 dev_id' per Marcel's feedback

Changes in v2:
- Combine MT7928 functionality into a single patch per Marcel's feedback
  (previous v1 split it into multiple patches)
- Use existing btmtk_fw_get_filename() for MT7928 firmware path
- Improve commit descriptions

Chris Lu (7):
  Bluetooth: btmtksdio: Fix DMA out-of-bounds access in TX path
  Bluetooth: btmtk: Add firmware size validation in
    btmtk_setup_firmware_79xx()
  Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
  Bluetooth: btmtk: Improve BT firmware logging
  Bluetooth: btmtksdio: Remove redundant firmware filename override
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
  Bluetooth: btmtk: Add MT7928 support

 drivers/bluetooth/btmtk.c     | 427 +++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h     |   9 +
 drivers/bluetooth/btmtksdio.c |  42 +++-
 3 files changed, 459 insertions(+), 19 deletions(-)

-- 
2.45.2


