Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E0C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYFr5QisH8O6Z9rmHybQUHW9IA2vLXfMYSxUMUoNbA4=; b=2uKrv53PsppsMetq/CCRQ3Dccs
	xX1R/H8aw12FX50aJTl19CwpT148ahbH5+xpXX8BU6yRn7ohCM/Ou3AdAWazSJMAQm9e60wKvmvXy
	FgTLIFsd/LwQOPHH5hxOTDUBBD7lA7Hd6/+1O3PY1f7hZgPlvDUtkINEqju26krIBq8PEUJTqyXXz
	s55yWVErHx2phi+VBraoQrGwwuCgY7v29iULqi5d9Ef/GQvSc497wxPPJq4qZ8EpJL8MJRXtwrvI2
	4GR8+PMIwePknxy3oYMsv1EchxMjy4vhES4jylLT8cpfAzMM/i861rYAM77nI/f5/d6MRGBFXsXL7
	dIjREvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LJP-00FuHj-2l;
	Tue, 21 Nov 2023 07:36:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LJM-00FuGK-1c
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 07:36:45 +0000
X-UUID: b7347f86884011ee9b7791016c24628a-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZYFr5QisH8O6Z9rmHybQUHW9IA2vLXfMYSxUMUoNbA4=;
	b=H61yQVGOBwDADB9oXYoLPS41hwRzbuGzB9WdZGJdIVObA8y0M999ya6pzwpk+7TDm5FxnXb0wJTEsrg2QcTHrOwk+BY7cg44zU+rL2VjNgfKFULpOvJLJBo9fe1txXgED4c3GpsUjN8BE6tAaiSesD0jmpmgnuNKgA5OrLpLNPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:80025ab8-6d28-4baf-875f-0de5c00a3b56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:332c4d60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b7347f86884011ee9b7791016c24628a-20231121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1021791588; Tue, 21 Nov 2023 00:36:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 Nov 2023 15:36:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 Nov 2023 15:36:18 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP to remove an unused packed library
Date: Tue, 21 Nov 2023 15:36:16 +0800
Message-ID: <20231121073617.21410-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_233644_546958_A7EDB065 
X-CRM114-Status: UNSURE (   6.92  )
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

The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d6f:

  Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042

for you to fetch changes up to dced4dd00fb148923bd205526f286ccbc811c513:

  mediatek: Remove an unused packed library (2023-11-21 15:28:00 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Remove an unused packed library

 mediatek/mt8195/scp.img | Bin 635492 -> 635532 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)



