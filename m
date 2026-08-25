Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBAC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 03:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVXP7JyQSs8OYWK+OQgStDZmgSbIG44BJIzJ8IlkJEQ=; b=jdDP4wBnOqWLFjC5L6zmjRZ831
	fMvBLlUKPLovqvSw23d/L7KWQfsgY1U+i0YMyy1RmS+xMrrCp7GbXcBJk5CTLAuYAkdwNk+SVee3L
	uL+7gx/8ngILI3jApQf/VLUVdAjZe5ga7+nzOZyrd5b8zqEz/Sw3gXbl7dPKXauN9o/Z/gH8pbkXN
	K+Kc6+N98p4uIliLvnwMnR8Xkk7Jwhj0v7MppluLRRfjWTHnEv8lS7sXLwU0Zf9ld8PeiUdhCpZ+G
	uWMq1zWPfCKrrr69Nzj2rbOVF083UGAwIwVEqyegFnUUM+2WNBFHKawI2DtIRM3gHaAx8P/5KSdJ6
	ME0a3iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhxx-000000006IQ-3A1R;
	Tue, 25 Aug 2026 03:36:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhxv-000000006HO-2xf3
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 03:36:49 +0000
X-UUID: 2e24c9a6a03611f1afed4741b24580c9-20260824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PVXP7JyQSs8OYWK+OQgStDZmgSbIG44BJIzJ8IlkJEQ=;
	b=sM+wIYFgPf5TjVfeqJFT1VbPuFGmPSlRbtW1m2rHFH0VhhAFohpV7RnYpzMUuhynjcV4jMjGmmJZ9fzB9ztNjKsHf/RdbSRtBW1Puqdgi4MSPBI01qowhLLf+vp4NASpGweTrtUZEDVVxoSJ3KUPQb5h7mbL2AR6LTg7jOQD2ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9b6bbcdc-367a-4e81-b3b1-191042024455,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:1d9861fe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e24c9a6a03611f1afed4741b24580c9-20260824
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2112214335; Mon, 24 Aug 2026 20:36:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Aug 2026 11:36:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 25 Aug 2026 11:36:36 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/2] Bluetooth: btmtksdio: Stop discarding the hardware device id
Date: Tue, 25 Aug 2026 11:36:32 +0800
Message-ID: <20260825033634.499118-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_203647_754572_7014544E 
X-CRM114-Status: GOOD (  10.52  )
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

btmtksdio_setup() reads the device id from register 0x70010200 and then
throws it away twice: an snprintf() overwrites the filename that
btmtk_fw_get_filename() derived from it, and mt79xx_setup() passes a
hardcoded 0 on to btmtk_setup_firmware_79xx().

Neither matters on supported hardware, since the device ids that would
make a difference - 0x6639, 0x7925 and a flavored 0x7961 - all belong to
parts with no SDIO interface. So this targets bluetooth-next with no
Fixes: tags. What it buys is that the two functions stop silently ignoring
their input, which is a trap for the next chip added to this driver.

Both patches come from a larger MT7928 series [1], where they were
described as fixing firmware load failures on MT6639, MT7925 and MT7928.
That does not hold for the SDIO driver and has been dropped.

Tested on a Chromebook with MT7921S, whose chip id register reports
0x7961: before and after, the driver requests
mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin, the firmware loads, and the
controller powers on and connects to an A2DP device.

[1] https://lore.kernel.org/linux-bluetooth/20260717072133.2858136-1-chris.lu@mediatek.com/

Chris Lu (2):
  Bluetooth: btmtksdio: Remove redundant firmware filename override
  Bluetooth: btmtksdio: Pass the hardware device id to mt79xx_setup()

 drivers/bluetooth/btmtksdio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.45.2


