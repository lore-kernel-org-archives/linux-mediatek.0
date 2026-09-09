Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCB6C79FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9QctYEqiTsdwLGcp7AZwfH3/JIDtpuPyDKHZOFDwwk=; b=rZpdbJe2QZHv3+mH7N3KGEgMvV
	LZ8uvRaQepCxEhyYx1yRPWCKgnraZsM+YD60OhWv0O8lXQuim9QbbpD4qnYTpGXI0mxGOWYr3oKCd
	GFlf5rXnzcII6+ax7jQLJEbIhiwA36huDDJjZj2/XDG3RMln6diiZnU7EO8KlB8RQoAWCgWnu8epD
	J0z26Zz1TBgfJFbr0DaUR4IB8SXimYm08+12uY46IeJ49aUz5RnnkNayvVKmbLaPpv/w1QTnoJ1hH
	b0pi1rz8bduYOuQ/gHmlgiFwwAe0/xBsG1aJ0cuMRWT4IPPQYBfkEk/xV8iXLCnqKPAsyduzKadFk
	eD8ZbrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gyr-0000000BdMk-2ZN0;
	Wed, 09 Sep 2026 12:00:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gyp-0000000BdLb-2IjD
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 12:00:44 +0000
X-UUID: 0c0dcdf6ac4611f1acbe4559397dec65-20260909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C9QctYEqiTsdwLGcp7AZwfH3/JIDtpuPyDKHZOFDwwk=;
	b=VpxHxoLAM9Ez62LPhx/C49JI9EtFnWvQwIpxt+YDCZWGj5cC4Yk+qZU/APU0zeFp0uG1rk25f00OG2/IG8yXD88ZWqkNZhFxfRPPvh7ZtZeFx8f6X5pmJmX99l+maiKRAfmsJdMvauBsU5YqluXwwZ5o6p0QIQmn3A+kWAmIicY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:dd87073f-b158-41b7-bf51-1f0b7b97a041,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:5acb1728-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c0dcdf6ac4611f1acbe4559397dec65-20260909
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1790801515; Wed, 09 Sep 2026 05:00:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 20:00:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 20:00:14 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/3] Bluetooth: btmtk: Harden firmware parsing and improve logging
Date: Wed, 9 Sep 2026 20:00:08 +0800
Message-ID: <20260909120011.1198001-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_050043_623946_DC065349 
X-CRM114-Status: GOOD (  15.91  )
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

Three changes to the shared btmtk firmware download path, all in
preparation for MT7928 support but useful on their own.

Patch 1 bounds-checks the firmware image before the section map walk in
btmtk_setup_firmware_79xx(). Today the section count, the section map
array and each section's offset/length come straight out of the file and
are never compared against fw->size, so a truncated or corrupted file
makes the driver read past the end of request_firmware()'s buffer. The
section count is a __le32 from the file, so on 32-bit builds multiplying
it by the 64-byte map size wraps a size_t and a bound computed without an
overflow check would come out small enough to accept the file; both
helpers order their arithmetic so nothing can wrap. A section count of
zero is rejected too, since it passes every size check but would leave
the download loop with nothing to do and still report success.

The checks live in two helpers rather than inline because the MT7928
CBMCU download path added later needs exactly the same arithmetic and
should not carry a second copy of it. Bounding dlsize by fw->size also
removes an existing hazard in the download loop: dlen is computed as
min_t(int, 250, dl_size) from an otherwise unbounded __le32, so a large
enough value turned dlen negative and "dl_size -= dlen" then grew
dl_size instead of shrinking it.

Patch 2 makes the log line more useful: it never said which file was
requested, it reported the firmware's own hwver field as the HW version
rather than the device id the driver read from the chip, and it printed
the 16-byte datetime array with %s even though the array need not be
NUL-terminated. Both callers pass a real device id - btmtksdio reads it
from register 0x70010200 and btusb switches on it before getting here.

Patch 3 replaces the bare 1/2/3 sequence flags on BTMTK_WMT_PATCH_DWNLD
packets with a named enum. No functional change. The other bare flag
values in the driver belong to other WMT opcodes, where the field means
something different, and are left alone. Paul Menzel reviewed this change
in an earlier MT7928 series; the enum values are unchanged here, the only
difference being a comment added above it.

Testing
=======

Compile-tested with CONFIG_BT_MTK, CONFIG_BT_HCIBTUSB and
CONFIG_BT_MTKSDIO as modules, each patch applied individually, no new
warnings.

Runtime-tested on MT7922 (USB 0e8d:223c) over repeated unplug/replug and
Bluetooth on/off cycles; it comes up every time and the firmware download
is unchanged:

  [  365.233785] usb 1-2: New USB device found, idVendor=0e8d, idProduct=223c
  [  365.245951] Bluetooth: hci0: Loading BT firmware: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
  [  365.245956] Bluetooth: hci0: BT HW ver: 0x7922, SW ver: 0x008a, Build Time: 20260605203811
  [  367.542038] Bluetooth: hci0: Device setup in 2244536 usecs
  [  367.601570] Bluetooth: hci0: AOSP extensions version v1.00
  [  367.601581] Bluetooth: hci0: AOSP quality report is supported

Chris Lu (3):
  Bluetooth: btmtk: Validate the firmware layout before parsing it
  Bluetooth: btmtk: Improve BT firmware logging
  Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum

 drivers/bluetooth/btmtk.c | 92 +++++++++++++++++++++++++++++++++++-----
 drivers/bluetooth/btmtk.h |  9 ++++
 2 files changed, 90 insertions(+), 11 deletions(-)


base-commit: 701ca71884b3d101fd25b7adbf972355056ef352
--
2.45.2


