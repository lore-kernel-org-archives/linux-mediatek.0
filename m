Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B08AE83057
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 06:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OP2N/nleBhBlAyv2V95uSRI6uJfND7JrtKouTkzXdkw=; b=zQyY1t/PY7GM/AZpJuSqLosMr0
	PK2D/OQjv1r1EDr36NhwucN0z1MpqoJC19ceINd4DNU2NC0V9/acCGFPn26NlAgmpP8NKQzTH5Qew
	zOZ7lE1bjMQ23rfdsrjmuW2NPTDx5ZgZRT+pr4xzYfhhuHGTy2cx6jYT7vcCx7zNM9+94Tdau2g/6
	mCuTxa1e+LXhboggaSbErwffhxM8SzT/djZPDrtxr9GKu+ic1wMjUfmSWXz0BSirb+Y6DuKLBAaY8
	70JE1VD+S2M07Fkw/48Du7hGG15nSnVCeFGDZEDgGWDxYXliGtTStUsLuztzNOS1Bst5eA2bgkjXE
	61Df0hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qo-00000006BNg-1tsa;
	Tue, 03 Feb 2026 06:25:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9ql-00000006BKl-2OWe
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 06:25:24 +0000
X-UUID: 19df9afa00c911f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OP2N/nleBhBlAyv2V95uSRI6uJfND7JrtKouTkzXdkw=;
	b=PofFxX+wQ+EAk82PxtmR351gWXOg2lLxwO2pg9ASnLn561SV5uyUWfDriNfKqgFHGkFClQTERXKL9NlNFF+Fe9BPhl8eZKCe5xpAVM3xxxyvZiyU0U/8gtwVHPq93y/UQvu1cKVj5PL2ioSo3u9mpdUuseEgD0jTBkwP5tINA3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5ea09873-2a9c-413a-acf0-7fdae48a53c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:af1544f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19df9afa00c911f1ad39f32c34db0b1c-20260202
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 604401682; Mon, 02 Feb 2026 23:25:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 14:25:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 14:25:12 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 0/3] Trigger reset if firmware status is abnormal when
Date: Tue, 3 Feb 2026 14:25:07 +0800
Message-ID: <20260203062510.848761-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222523_622734_DD23D803 
X-CRM114-Status: UNSURE (   8.43  )
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

When the device unexpectedly restarts during previous firmware
download process, it can cause mt79xx firmware status to be
abnormal in the next attempt. In this case, a reset should be
performed to ensure everything starts afresh.

These changes include:
1. Optimizing the handling after the download function retry
   is exhausted, a reset should be performed.
2. Another download firmware command also needs to check status
   , and if an unexpected status occurs, trigger a reset.
3. Adding a flag "BTMTK_FIRMWARE_DL_RETRY": if download firmware
   process enters the reset mechanism, this flag will be set.
   After a successful setup, the flag will be cleared.
   If the flag is already set, no further reset attempts will be
   made to avoid endless reset retries.

Chris Lu (3):
  Bluetooth: btmtk: improve mt79xx firmware setup retry flow
  Bluetooth: btmtk: add status check in  mt79xx firmware setup
  Bluetooth: btmtk: Add reset mechanism if downloading firmware failed

 drivers/bluetooth/btmtk.c | 21 +++++++++++++++++++--
 drivers/bluetooth/btmtk.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.45.2


