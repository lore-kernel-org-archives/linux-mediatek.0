Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CDAC4451E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GrtQVaVX3m2ogHJ4Z12rZTSR0WAKU2oUEEn3pAm7o0=; b=0inpZOif9Vw39EAgkMbNht7Sv7
	riwQJ8gff5c9MSXqf0lAwufHMZcjK0VdZ8TQE1lMqZTDOFwy98oM7TTQGoqRSZS9viWjaFlLDmsdh
	1Pt9tNNZASw1Z6LvaAT3daHKZcdfxr5JgYS/+6dFjEWrptfwLEBTLON2I7ckYSai20IuKrIbtq+0D
	nFTTz5q5g+y08K2U5koToeYvi6edvEd9YtlR/gF8MaNiHR6SHPJM+w9jlcswcJp+Qm90kuVGI2ysA
	J73Efvl6jn9huaIkJJ/CRc8apsCFFXKsfi8WXOHRY/MeuDWFGfVDZj+/CKWKQNKjKA4tvYbx90Lx/
	aU+Axpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctJ-00000001OQd-3xjz;
	Fri, 17 Jul 2026 07:21:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkctF-00000001OKn-2s8Z
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:21:48 +0000
X-UUID: 25e7d14c81b011f1acbe4559397dec65-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4GrtQVaVX3m2ogHJ4Z12rZTSR0WAKU2oUEEn3pAm7o0=;
	b=Yhe39qOjmMgv5IsiyLSQXY3Q+O11aR8shw5Y2pW2fXqLL5Nr2WNH8M6PWjHzhG9Jk5zThSY/Y1GgsXzh/STM5CC4m2l4ZxcS3GYMFDeC0AQ+N4OErI0oxR0n0Kh7L1dy6be2rzQYOtfATQBNMmg0F1Tu4mEOo3ylDeY3jvzR70U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:d8184422-f679-4116-9019-8529beeece60,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:bc0d965f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99|100|102|156|200|213,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25e7d14c81b011f1acbe4559397dec65-20260717
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1484087585; Fri, 17 Jul 2026 00:21:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 15:21:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 15:21:34 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v14 0/7] Bluetooth: btmtk: Add MT7928 support
Date: Fri, 17 Jul 2026 15:21:26 +0800
Message-ID: <20260717072133.2858136-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002145_743966_A018624F 
X-CRM114-Status: GOOD (  10.28  )
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

Patch 1 fixes SKB handling issues: DMA out-of-bounds read and cloned
SKB corruption. Fix by calling skb_unshare() and expanding skb tailroom
with zero-padding.

Patch 2 adds firmware size validation with integer overflow protection
to prevent out-of-bounds access with malicious firmware files.

Patch 3 passes hardware dev_id to mt79xx_setup() to fix incorrect chip
ID logging (was hardcoded to 0).

Patch 4 removes redundant snprintf() that overrides btmtk_fw_get_filename()
result, causing newer chips to request incorrect firmware filenames.

Patch 5 improves firmware logging: adds filename log, uses chip ID as
HW version, and uses %.16s format specifier for datetime field.

Patch 6 replaces magic numbers with BTMTK_WMT_PKT_* enum for better
code readability.

Patch 7 implements MT7928 CBMCU firmware download with two-phase loading
sequence and cert_len overflow protection.

Tested on MT7928 hardware with successful firmware loading and
Bluetooth functionality verification.

Changes in v14:
- Rebased onto latest bluetooth-next tree
- No functional changes from v13

Changes in v13:
- Fix cloned SKB corruption (HIGH severity) by adding skb_unshare() (Patch 1)
- Fix cert_len integer overflow (CRITICAL severity) in CBMCU firmware loading (Patch 7)

Pre-existing issues fixed in subsequent patches:
- Patch 2 introduces format string issue (%s on non-null-terminated field)
  -> Fixed in Patch 5 using %.16s format specifier
- Patch 3 context has pre-existing snprintf() override (identified in v12 review)
  -> Fixed in Patch 4, resolving firmware load failures on MT6639/MT7925/MT7928
This gradual improvement approach allows independent backporting of each fix.

v12 -> v13:
- Added skb_unshare() to prevent cloned SKB corruption
- Added overflow checks for cert_len calculation
- Split SDIO firmware loading fixes into two patches

Changes in v12:
- Reordered patches to fix dependency: move "Pass dev_id" before
  "Improve logging" so dev_id is available when logging

Changes in v11:
- Fixed use-after-free: reassign sdio_hdr after pskb_expand_head()
- Reordered patches for bisectability

Changes in v10:
- Added Patch 1 to fix DMA out-of-bounds access

Changes in v9:
- Reordered patches to group SDIO fixes together

Changes in v8:
- Split firmware validation from dev_id pass-through into separate patches

Changes in v7:
- Added Fixes tag per feedback

Changes in v6:
- Added Fixes tag and restructured parameter comment

Changes in v5:
- Moved documentation to function-level comment

Changes in v4:
- Fixed commit message and expanded description

Changes in v3:
- Changed dev_id type from u16 to u32

Changes in v2:
- Combined MT7928 functionality into single patch

Chris Lu (7):
  Bluetooth: btmtksdio: Fix SKB handling issues in TX path
  Bluetooth: btmtk: Add firmware size validation in
    btmtk_setup_firmware_79xx()
  Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
  Bluetooth: btmtksdio: Remove redundant firmware filename override
  Bluetooth: btmtk: Improve BT firmware logging
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
  Bluetooth: btmtk: Add MT7928 support

 drivers/bluetooth/btmtk.c     | 427 +++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h     |   9 +
 drivers/bluetooth/btmtksdio.c |  55 ++++-
 3 files changed, 471 insertions(+), 20 deletions(-)

-- 
2.45.2


