Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E978CF45DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GN+EfxtSXpSpYh8WBBWLkneHMPPoPNLHKxsJiNifKXc=; b=LZbH6qAUpKaLmP8kMgLKWQHsg/
	hALQjyakYKZBP/5X0g+RhFty5FYrNoOMzggENFL75NR3+IXitfoPOtyXdemB7WQCrFRxThA17n9yE
	Te5o6s9qEAyPmMWgXHqYyXcH/sfBLt+Tbrly2FcYd+oYaZtJbbZFyHIz83AzZB2LyY5NQGzRoTg3k
	hoZuaqxvMUTY/7WBoJcBX7rCADX9kaaSI8uNKpmFBRR41tV2vp5umPXQDRMXOl3dXMdDycxCJUtxI
	D4W1TF4lNV/98rOyV4rSvruuGxnV1dTWLJx2b2on1PyWcgsLVYWOtu0O0IWg12nt3+qJsk1DzzMcz
	i8azKeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTrG-00000006Pfn-2Q7l;
	Tue, 13 Jan 2026 02:10:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTrE-00000006Pel-0DTh
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 02:10:09 +0000
X-UUID: f8dd9500f02411f09f706fa2197c6ceb-20260112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GN+EfxtSXpSpYh8WBBWLkneHMPPoPNLHKxsJiNifKXc=;
	b=QXQg1WX+TlgRxWKZzAllBIX7VMPHKH4sk/Y1iqIo0IKH9MZmw3lIiP25Lx2FyiXpDQN3ru4IEvDL2VZYayAj6xZ2riOjR1Q8kZXoVvbIDjcO3cjkW4IheTMltsWK1xtG/M+cQ9H7/QsCEtGbn8g72nye3I/xJV/ZHcUIrwUe32E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:99b46c34-6394-43b1-a350-2be8cf4a2d1e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:5047765,CLOUDID:802b74ef-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8dd9500f02411f09f706fa2197c6ceb-20260112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2076045758; Mon, 12 Jan 2026 19:10:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:10:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 10:10:00 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: pull request: linux-firmware: add symlink for MT8188 SCP core 0
Date: Tue, 13 Jan 2026 10:08:54 +0800
Message-ID: <20260113020959.2377348-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_181008_119532_FB6672C5 
X-CRM114-Status: UNSURE (   5.87  )
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

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.01

for you to fetch changes up to 1cdd079780792a4df3b36a78844112412c044983:

  mediatek: add symlink for MT8188 SCP dual core firmware (2026-01-13 09:50:06 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: add symlink for MT8188 SCP dual core firmware

 mediatek/mt8188/scp_c0.img | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 mediatek/mt8188/scp_c0.img


