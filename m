Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A3C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXoHX0rruIcIzstzDAfy4nONDyIyMhoQ3ILdiO+rdOQ=; b=npYAr4j52EA0R4WBEcwKxx1FoW
	tQd3Ojb1tCLbQO4zCY4oJchxQIWDtysCY2po8jHDIwwVvfoFpaU/4x81TtXRkC7Q8OXjtaQzzYMn/
	MuK2/E2MY1wFBoNQCRxvPBJyqALpbY0C4++WRg7Pf98SBczH6HSdlZTW+2g2Y/xAokenR1Xidv/c1
	bNragN6gCBW0V5SbSjuycRRFZt6gYd5ig3iqAtk4U+eGC3azvaTRAd5/gsgCt2o0Le6FyiiZXqp5g
	RbwrMfoSXRg/8gYoYghdRTeyqYw3mJkdGNktxPBuC4sqpMXR1CYuiHqM6VlnwC+rzxaJYXf22ZpNC
	9MReg//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60dI-00000002Uw5-1z5a;
	Mon, 14 Sep 2026 06:57:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60dG-00000002UvG-3nDv
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 06:57:40 +0000
X-UUID: 7ab56f04b00911f1afed4741b24580c9-20260913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lXoHX0rruIcIzstzDAfy4nONDyIyMhoQ3ILdiO+rdOQ=;
	b=cwJJ7eylPKLDajoAPd4w+frC4A452T6tE4vX4tFXWiRYLmoVzxifBl3G+M16h3Uk9khLMftk75wZyMlZNEzwHJqEySwUu7jh+bRXwDPC4VVww+D+ZvzMhr/iXI9uYr81I/KgZwlkbXMBVynVJ86hox+LDl+BlqW2R7jE+aUtFDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4e4647f2-c42f-4a92-b56d-fb8d076430f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:4b63cee2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7ab56f04b00911f1afed4741b24580c9-20260913
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 888154451; Sun, 13 Sep 2026 23:56:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 14:56:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 14:56:55 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 0/3] Bluetooth: btmtk: firmware debug event routing and WMT FUNC_CTRL status fixes
Date: Mon, 14 Sep 2026 14:56:51 +0800
Message-ID: <20260914065654.102916-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_235738_954411_C9C4E354 
X-CRM114-Status: GOOD (  13.38  )
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

This series bundles three independent MediaTek Bluetooth driver fixes:

Patch 1 is a resend of a fix submitted on 25 Aug 2026
("Bluetooth: btmtk: Route firmware debug event to the diag channel")
that received no review feedback at the time.

Patches 2-3 fix how btmtk_usb_hci_wmt_sync() (and its btmtksdio.c /
btmtkuart.c counterparts) interpret a WMT FUNC_CTRL event that carries
only the WMT header and no trailing 2-byte status word. Such an event
is a normal firmware ack for a plain enable/disable request, with the
result carried in the header's own flag byte, not a failure as the
current code assumes:

  - Patch 2 fixes this for btmtk.c, where a bounds check already
    existed (added by e3ac0d9f1a20) but defaulted to the wrong
    result.
  - Patch 3 applies the same fix to btmtksdio.c and btmtkuart.c, which
    never had a bounds check for this event at all and read 2 bytes
    past the end of the received SKB whenever firmware sent the short
    form. While there, it also adds the missing base WMT header length
    check that btmtk.c already has (skb_pull_data() before touching
    wmt_evt->whdr.op), since these two files were unconditionally
    dereferencing that field with no length validation at all.

Changes since v1:
 - Patch 1: review asked whether the exact match on the ACL handle
   (0x2efd) could miss a continuation fragment (0x1efd) if the
   firmware debug event ever spans multiple ACL packets. Confirmed
   with MTK internally that this event's wire format is fixed at a
   single ACL_START packet, so a comment was added above the switch
   in both btmtk.c and btmtksdio.c explaining that HCI fragmentation
   does not apply to this handle (and the other vendor-reserved ones
   already handled there).
 - Patches 2, 3: no changes.

Chris Lu (3):
  Bluetooth: btmtk: Route firmware debug event to the diag channel
  Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
  Bluetooth: btmtksdio, btmtkuart: validate WMT event length before
    struct access

 drivers/bluetooth/btmtk.c     | 15 ++++++++++++++-
 drivers/bluetooth/btmtksdio.c | 28 +++++++++++++++++++++++++++-
 drivers/bluetooth/btmtkuart.c | 20 +++++++++++++++++++-
 3 files changed, 60 insertions(+), 3 deletions(-)

--
2.45.2

