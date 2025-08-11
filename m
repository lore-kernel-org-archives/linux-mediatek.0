Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE12C87FDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 01:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+wlAxAzgomGlkcqP5XgcQLFTBuEcdY5HbrFPTqS8Es=; b=BVMtZM5DmM3fwX85UvWXXHidpY
	6ggjP/ZteP7bOfggImPNzFgm4iH9nFvc5u3XdmHYeHonlDpsRC83C4nLVvg7arjSUTX7L6KUQ5Ccj
	313m1n3vDxD4nODBROXCFWIFZkMMKlA6YjtTcPWt8FbAKTL7QsRQVlpUkboEbae9d+fTojiKGAzS+
	kYWDEv1yXvlG8O8Jr9/WNsysHq7MERZNT8tAuj5X244J0rbvY6QByBkZbrnfAT9FdMXY5yr+Fpt+J
	4a4B/dc8so1D856jLmVQDw9vIWOIVTlVZoEVFWsLDphkIqhh3Xv4Z301Sm7tkUrew7LqboKFg0IW/
	IqTiDU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulHp2-00000006JHn-1XhB;
	Mon, 11 Aug 2025 01:59:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulHoz-00000006JHP-2bpx
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 01:59:34 +0000
X-UUID: cfd9e822765611f09f706fa2197c6ceb-20250810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=x+wlAxAzgomGlkcqP5XgcQLFTBuEcdY5HbrFPTqS8Es=;
	b=qqsYLwA2mt1dLJxj8p68Jcy+B12YIoOMFynHajr/eSxn7smXUxpCWr2RuuAvAmwwKODrVYWXMfL9NG2wxVj9QW583laG5tHF+nOzV3FLccMPAO0Snvfhw7FkfCfwYrkAnk/ByOS27w43slVZ9bIhf5qD72CWJarwMlXjBGbcT4M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:fa6c5a08-877a-485b-98df-d3ac94395b98,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:d669cc9d-7ad4-4169-ab95-78e9164f00fe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cfd9e822765611f09f706fa2197c6ceb-20250810
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 182109837; Sun, 10 Aug 2025 18:59:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 09:59:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 09:59:19 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Create Mediatek MT8189 SCP firmware
Date: Mon, 11 Aug 2025 09:57:52 +0800
Message-ID: <20250811015922.32680-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_185933_667752_923E239B 
X-CRM114-Status: UNSURE (   5.97  )
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

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)

are available in the Git repository at:

  https://github.com/HuayuZong/linux-firmware-mt8189-scp mt8189-fw-upstream

for you to fetch changes up to 777171b10e2671de19fb41afb5bd0bbdd77c0e92:

  mediatek: Add MT8189 SCP firmware (2025-08-05 11:16:23 +0800)

----------------------------------------------------------------
Huayu Zong (1):
      mediatek: Add MT8189 SCP firmware

 mediatek/mt8189/scp.img | Bin 0 -> 6588300 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/mt8189/scp.img


