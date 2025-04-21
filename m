Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA875C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bxJ9xVr+bWsUPq5pZ49UQFeAPTX6wfXQHs3mOpxc1y0=; b=olrf1YWsjO2DcGPSAOy9Sq5lDF
	JhmRlWtLIYDJDw3WkmHpORGHMfPz+qF+zUfTBxL/A0DZ2Ievv1MDnC+XOdMusTy720ZP4bxqtD8rN
	tQyedlRAy7ZDMncxKQOcqkHKGYrSwLFZHyL8qOOQ6g5dD4bTOgtYMcugHAwDSoisJEocox+cBIaqX
	N+SCjmgHYvWgAQIz7C795MhJ1Q7aYo9cFUfUF0j6IGOTOoRxoTplfJes5XgtUb+xdNtcqa2T9IOa0
	lIOZwBiw+7jivRnz2PcP7aKECOGEGmfsyajmvZvjEmbJ2bFqi4NM89p5iFHxZTI5zPzV/GxSPLGBP
	B1lz8cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lcb-00000003nba-0gp6;
	Mon, 21 Apr 2025 07:31:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lao-00000003nJA-2Yvi
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 07:29:27 +0000
X-UUID: 56c3a2601e8211f0a2405d5ef59ce188-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bxJ9xVr+bWsUPq5pZ49UQFeAPTX6wfXQHs3mOpxc1y0=;
	b=b6fWAwLOV+GsHGqjL165kFyc9OCbiK+RNIsDwWoQh1Pddc1B6Kq1B2idzYUotxBCVXSeQ9AjNppjuDMPiKTiOo9oo9+8/3r8dAYkCuse3cw29aLx/yCWkCaIAHN2Cefpw0d6ZHGizjt7e9vnbCeCLO5/Nc4pe/m57mHcxGLp5c8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f270666f-428c-4b18-a3d7-404683f23e41,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4105d98d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 56c3a2601e8211f0a2405d5ef59ce188-20250421
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 575999851; Mon, 21 Apr 2025 00:29:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 15:29:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 15:29:17 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Will Lee <will-cy.lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, Steve Lee
	<steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 0/2] Bluetooth: btmtksdio: ensure btmtksdio_close is executed before btmtksdio_remove
Date: Mon, 21 Apr 2025 15:29:12 +0800
Message-ID: <20250421072914.466092-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002926_647112_1784C312 
X-CRM114-Status: UNSURE (   6.64  )
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

If Bluetooth SDIO card is unexpectedly removed due to hardware removal
or SDIO issue, it is possible for remove to be called before close.
If an interrupt occurs during this process, it may cause kernel panic.
Therefore, it is necessary to ensure that close is executed before
remove to stop interrupts and cancel txrx workqueue.

Chris Lu (2):
  Bluetooth: btmtksdio: Check function enabled before doing close
  Bluetooth: btmtksdio: Do close if SDIO card removed without close

 drivers/bluetooth/btmtksdio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.45.2


