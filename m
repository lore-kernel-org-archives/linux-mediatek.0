Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED2CC77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WNlNiEWD6ncoYGLw+NNM+cpAH2qY+X20yMdDUBpzxU=; b=gledOBKAZSSZzCq/aE9yGG4kbX
	Cv+OgHGTqHo/7Zdaap0Gt43fUw30E3A1iO3YRLfxydH73Vw/p0ZpnI88/BiikTSfaFWoepaE0CiW9
	vQChbpjRja1WTtH2OxGcR0XTzaswNDkAYQuE0mNGrPKbDWFLPhHD/SacKoWDgt8YHIQJRYz3uSHHV
	1YslzifQisPkQicW6sPziEYeVcWwF70nFa7B8Ah0y5tllmKZCUsOJqy6uQ/LKMXtRNjFvF1l99k64
	Av5jTl6xOflZoMjen6joD49H7RXW6zBBs4l8Vew253dOp/6FEY3lGeQR4z8vi9yKpF8KbQCayeB6u
	FQPHQulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4d6g-002R4x-28;
	Thu, 01 Jun 2023 07:52:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4d6a-002R1M-0s
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 07:52:24 +0000
X-UUID: 39f276e4005111ee912e1518a6540028-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7WNlNiEWD6ncoYGLw+NNM+cpAH2qY+X20yMdDUBpzxU=;
	b=MfxV/Ql1TcQpF6JEIHSJrxW514+BDt9NGx9Bgyj0OGeCrsMD9Q/zFNI4y5VdfVvsTATHTq/RE1pINU3kAP9EJXKvr7QCCCLW1xL1ehiFHEKZW522tjh60VFZKGqt9kgV2hkS4YxqBV8hvk2V3bXtgIzz2fqX1Ruhmx5Te02vZsU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:27ed876e-a1c0-4978-af72-f58e2013fb28,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:79133d3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 39f276e4005111ee912e1518a6540028-20230601
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1275369483; Thu, 01 Jun 2023 00:52:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 15:31:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 15:31:40 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
	Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu
	<robin.chiu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-firmware
	<linux-firmware@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Chris.Lu
	<chris.lu@mediatek.com>
Subject: [PATCH 1/1] linux-firmware: update firmware for mediatek bluetooth chip (MT7922)
Date: Thu, 1 Jun 2023 15:31:37 +0800
Message-ID: <20230601073138.22227-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_005220_314850_3DA295BE 
X-CRM114-Status: UNSURE (   6.88  )
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

From: "Chris.Lu" <chris.lu@mediatek.com>

Update binary firmware for MT7922 BT devices.

File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
Version: 20230530123531

Signed-off-by: Chris.Lu <chris.lu@mediatek.com>

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7922)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 511830 -> 509974 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0


