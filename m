Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865ADC369A4
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b0xWe0ofKTYajpgnthI9jgKiT8gjjJuUi7JF4fzkGDs=; b=wBH6VtcPGkmjONKgpHfrMH/5tk
	/WKj9WS0aIHDwX8J3LS04reddZmK3x9oLSHeS9caoUlNwU7AGBq4Ok6CxvR8ool/a9u5pWui4/XfP
	ZgJT7Y5g1XROX608IBhKxTN9TUNAXcLKyOrwegvkayRkeGgpFMCUFcSNxSdQFaczXgcuDTtv2cUUA
	51Tz5fumcngNvHccAgj/Ng4txCSFSnKLoBpZBOqa2ygVRG9NB54/+t7ddCnGItlOvKG+gYGaLmCZg
	WQhpBI6rv4CHsHxgyJc16aNKcpMsxf/+4eIPPgA0jK6JCmwjVNFf7qFHuJ369mE9SRSVz4vtZbEZn
	PoN8S3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u248l-00000003DVi-28uN;
	Tue, 08 Apr 2025 08:17:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2465-00000003D2g-2AXK
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 08:14:18 +0000
X-UUID: 74339a52145111f083f2a1c9db70dae0-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b0xWe0ofKTYajpgnthI9jgKiT8gjjJuUi7JF4fzkGDs=;
	b=H3Y1qXL6sLNgRFHQ0nJUGXtAFY7ICMQEKf1GThxphuZ0Wb8ydznYyNsDeDJZ3v/7r+Ci70jfsTaLCGcCA0qJa7IBki9VEcciniUnLJPCmYocBN4/SInrgi5S5uA5+LXn/l3D/TY1GhTBvToY7U0Y99rRYY4SLzev1T/gGiFoFDc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:da02edd8-196d-44c4-9caf-4db87d3edad0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:701d50c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 74339a52145111f083f2a1c9db70dae0-20250408
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <zoran.zhan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 523181602; Tue, 08 Apr 2025 01:14:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 16:14:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 16:14:09 +0800
From: Zoran Zhan <zoran.zhan@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: linux-mediatek <linux-mediatek@lists.infradead.org>, <shawnku@google.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: pull request: linux-firmware: Add MediaTek MT8188 and MT8195 SOF firmware
Date: Tue, 8 Apr 2025 16:12:34 +0800
Message-ID: <20250408081404.302196-1-zoran.zhan@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011417_566881_BA962556 
X-CRM114-Status: UNSURE (   6.94  )
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

The following changes since commit d864697fd38a94092b636c8030843343f265fe69:

  Merge branch 'rtl-bt' into 'main' (2025-04-01 11:24:40 +0000)

are available in the Git repository at:

  https://github.com/zoran055/linux_fw_sof zoran/soffw_0327

for you to fetch changes up to a7b3d211e8ef628ab84d955d1b13d2070388fd02:

  mediatek: Add new mt8195 SOF firmware (2025-04-07 16:04:56 +0800)

----------------------------------------------------------------
Zoran Zhan (2):
      mediatek: Add new mt8188 SOF firmware
      mediatek: Add new mt8195 SOF firmware

 WHENCE                            |   8 ++++++++
 mediatek/sof-tplg/sof-mt8188.tplg | Bin 0 -> 16191 bytes
 mediatek/sof-tplg/sof-mt8195.tplg | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8188.ldc       | Bin 0 -> 53900 bytes
 mediatek/sof/sof-mt8188.ri        | Bin 0 -> 112488 bytes
 5 files changed, 8 insertions(+)
 create mode 100644 mediatek/sof-tplg/sof-mt8188.tplg
 create mode 100644 mediatek/sof-tplg/sof-mt8195.tplg
 create mode 100644 mediatek/sof/sof-mt8188.ldc
 create mode 100644 mediatek/sof/sof-mt8188.ri


