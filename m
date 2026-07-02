Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DA5C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2r+opIPiZDVid6SD99FpJALwExcU62X0RllDnLmIzXc=; b=a5kOK+y8yKViEioCElxUeXcqL9
	k9ETvjkYsbT7hVPJ3EbLSlyrBENX4SnkiOiDfS+sV8QZBphaOClknx7TIyVXaFDgT12p1IWt0u5cQ
	3aXJ4cu3ZBtWsZ1syjkQVEs/I5oLRVLmrlyRaeV2Vy4Pef7aaxTLtLp/mbkzclrqd3ttYoovPIZv6
	OAgKvDHRUrlaxBqF0FNRtkiYRY7frFWEOY9W3S6Zqd/zuX3n/drWSbsaBmHw4l0bc8juaoXpNr9nv
	2+/xoJP1K09Oea+SOZQZmCVzMH9eRXkbZCgL+huCvbYDrye3MXSrEd/Mel93Wuef18Y+KHlh+lqco
	jmRB5U7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERg-000000049JW-0p1e;
	Thu, 02 Jul 2026 10:15:00 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERe-000000049Hc-1W2j
	for linux-mediatek@bombadil.infradead.org;
	Thu, 02 Jul 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2r+opIPiZDVid6SD99FpJALwExcU62X0RllDnLmIzXc=; b=H7DDqMCI/bVeo5Yi672e9mdSXI
	tGfXxJTJWzWjRCKFC9Cr11qvIdP/rDjt2wg0+W8b7ASf2L9uo5e27VVYEYRPCRba/YQ9vZGHazCof
	dub6WKo1N/EsoBq19kfgw/2xO29lqaa8wHiw0aw6i/5OjsbseNOzVMhBs67XLXMA4aF0RgjaMap/R
	AIzNPQDVjr0Ckn8LeJXXeGTcg1XI2TpTzAcLkUjpe5lEyt7MrXgR0jRmrohjvs7ecYhijg7n/gmG1
	+5VsRhF7eLbSkCFCPiJoD81odClJbzPoBffRPgoSMvWL3l1cGetswZzqkRdifR7UsfaTJbGAxKUcB
	PSoZ7jwQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfERW-00000003f6x-3NOk
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 10:14:55 +0000
X-UUID: d6b724cc75fe11f1acbe4559397dec65-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2r+opIPiZDVid6SD99FpJALwExcU62X0RllDnLmIzXc=;
	b=a11haF1Z/Z1k2JNsc5/+ADzxHvxMoDvKC4Pp9visxmy6wSoos6WALlaDPVKLL82+gSn4FkDQAhXV8mRa+mCoJskmJ0iuIjhMjLBgpR28prnHj9Gy1tKTUC+KkYEW9Mmp+g5f3hTqkN4TXfCUZ9+ahAxhu8X3pR+sewcK0qUcif4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:2233ce06-13db-4698-a7cd-00e83d7317fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:3087e6ee-6085-4bd7-b32c-8f3a894d1f02,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99|100|102|156|200|213,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6b724cc75fe11f1acbe4559397dec65-20260702
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861783256; Thu, 02 Jul 2026 03:14:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 18:14:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 18:14:38 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v9 0/6] Bluetooth: btmtk: Add MT7928 support
Date: Thu, 2 Jul 2026 18:14:30 +0800
Message-ID: <20260702101437.1787800-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111452_233630_68FF0FC7 
X-CRM114-Status: GOOD (  13.97  )
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
quality, and finally add new functionality:

Patch 1 fixes a pre-existing security issue in btmtk_setup_firmware_79xx()
by adding comprehensive firmware size validation to prevent out-of-bounds
memory access with truncated or malicious firmware files.

Patch 2 fixes a pre-existing bug in btmtksdio_setup() where
btmtk_fw_get_filename() generates the correct firmware path but is
immediately overwritten by snprintf() with a generic legacy format,
causing newer chips to request incorrect filenames.

Patch 3 fixes a regression introduced in commit 28b7c5a6db74
("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support") where
SDIO devices would incorrectly log "BT HW ver: 0x0000" due to
hardcoded dev_id=0.

Patch 4 refactors existing firmware download code by replacing magic
numbers with a descriptive BTMTK_WMT_PKT_* enum, making the packet
sequencing logic clearer.

Patch 5 improves BT firmware logging to provide more useful information
for debugging: adds firmware filename before loading and displays chip ID
as HW version instead of firmware's hwver field.

Patch 6 implements MT7928 firmware download flow, which requires loading
CBMCU firmware before Bluetooth firmware. The CBMCU firmware uses a
two-phase download sequence: Phase 1 downloads the section containing
global descriptor and signature data, Phase 2 downloads the remaining
firmware sections.

Tested on MT7928 hardware with successful firmware loading and
Bluetooth functionality verification.

Changes in v9:
- Reorder patches to group SDIO fixes together (Patch 2-3)
- Patch 1 (was Patch 2): Fix firmware size validation in
  btmtk_setup_firmware_79xx()
- Patch 2 (was Patch 1): Fix firmware filename override in
  btmtksdio_setup()
  btmtk_fw_get_filename() result was incorrectly overwritten by
  snprintf()

Changes in v8:
- Add Patch 1 (now Patch 2) to fix firmware size validation in
  btmtk_setup_firmware_79xx()
- Add Patch 2 (now Patch 3) to fix SDIO device logging regression
  SDIO devices were passing hardcoded 0, causing "BT HW ver: 0x0000" log

Changes in v7:
- Patch 4 (was Patch 1): Extend magic number refactoring to
  btmtk_setup_firmware() in addition to btmtk_setup_firmware_79xx() for
  consistency
- Patch 5 (was Patch 2): Fix potential buffer over-read by
  using %.16s format specifier for hdr->datetime which is a 16-byte
  array that may not be null-terminated
- Patch 6 (was Patch 3): Apply same %.16s fix to CBMCU firmware logging

Changes in v6:
- Fix timeout handling in btmtk_cbmcu_patch_status() to return -ETIMEDOUT
  instead of success when polling exhausts retry count
- Add integer overflow protection in btmtk_load_cbmcu_firmware() using
  check_mul_overflow() and check_add_overflow()

Changes in v5:
- Split into three patches: refactoring, logging improvement, and
  new feature
- Add Patch 5 (was Patch 2) to improve BT firmware logging
  independently
- Apply same logging improvements to CBMCU firmware in Patch 6
  (was Patch 3)

Changes in v4:
- Split into two patches: refactoring and new feature
- Add BTMTK_WMT_PKT_* enum to improve code readability
- Replace magic numbers (0xF0, 0xF1) with descriptive macros

Changes in v3:
- Add firmware size validation with bounds checking
- Improve error messages with context information

Changes in v2:
- Simplified enum usage by consolidating status definitions

Chris Lu (6):
  Bluetooth: btmtk: Add firmware size validation in
    btmtk_setup_firmware_79xx()
  Bluetooth: btmtksdio: Remove redundant firmware filename override
  Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
  Bluetooth: btmtk: Improve BT firmware logging
  Bluetooth: btmtk: Add MT7928 support

 drivers/bluetooth/btmtk.c     | 427 +++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h     |   9 +
 drivers/bluetooth/btmtksdio.c |   9 +-
 3 files changed, 430 insertions(+), 15 deletions(-)

-- 
2.45.2


