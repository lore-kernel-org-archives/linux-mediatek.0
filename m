Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41897C61D90
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d3xFHwEXm15Y6Khl36WCr93o41d4aY0DOB63bZVjGEU=; b=cyXDgg9uBPggv2LFlzrPganmEX
	eEwzuH1jmaIL99cJW9Wo9T55c65WuL4CNLzqoSQI2iP6pxBu/TmyNEUeeysSCH3ZYF8rsLkU119Jf
	fILGPSRK/fHff6VAyH6Td4UjrmCCvs33AkaNr1TD0aiJs2zqZOAGLCBgNwW7V5cTLCrl6YXMm4CAb
	ZIQU/PHKG1LXNX1TYI4TJx2tbLgXLuaqvNs9GqYbpWWi6gXg8mYpJmZZekCY19EmJtYhtUJbTpEGl
	FLaZmsl2u0uaYFsDWHyLxLk9Xv1NYN4Qh5N/dsouxuC3mov6dlPaIN9UI3kZ4nuZNGC2PaIiKR6vQ
	HLig6bLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Lx6-00FyW9-1I;
	Tue, 21 Nov 2023 08:17:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Lx3-00FyTq-1c
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 08:17:47 +0000
X-UUID: 70f22860884611ee86758d4a7c00f3a0-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d3xFHwEXm15Y6Khl36WCr93o41d4aY0DOB63bZVjGEU=;
	b=g93AvjjgQckPzTiDqF3k3BVRFqI1DrlAwzzuMVddbh8NR5h10Aj7OEdtNPnks09EJJdiQVe9/y7bquFSYQG/qBbFGopbqo0uyMet/8xd83BU5x5tN07VlqEX1v+uhOYA/eSU/ZublCNu66aP7QVRvHcFJRwOvJXHqsO3MFJCgIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9e2916d4-be5f-43d9-8161-4a48c37c9a72,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:8032c6fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 70f22860884611ee86758d4a7c00f3a0-20231121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 22312923; Tue, 21 Nov 2023 01:17:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 Nov 2023 16:17:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 Nov 2023 16:17:37 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP to remove an unused packed library 
Date: Tue, 21 Nov 2023 16:17:34 +0800
Message-ID: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.325100-8.000000
X-TMASE-MatchedRID: CuNqLv8MpA1necAFxyDbb6b8GfRpncAzUXlp1FHYSPWYvYlYOb0cVDpZ
	dqvergj0LQB4O+D+n6OZNELIyCEhgEUC1IloJffrngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AHCttcwYNipX6mrAiastWSfbm4z9EtL/eaxYRJxsm0iVN5mguw6o1rn2axFov2Dgs3zJ1
	GLsOuFfUDPq1xfP/eydePhRU3qGQGHZhwAAZRYA7Iji40FrQMIdmtRsRmKkASJZPT2ZDPuzPD2Q
	fzMDLjhIh26TkmSN3fud1QdQyZe7n7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.325100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CEE92A6A58DF3E371E738FC763D2AB593B3769FCDC0C3C3D687EB4F04517FF842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_001745_564159_DA6222E4 
X-CRM114-Status: UNSURE (   6.38  )
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

The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb855ab0:

  Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09:23 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042

for you to fetch changes up to ebebd79cb34038b0dcc964fbb4a07525b2b790aa:

  mediatek: Remove an unused packed library (2023-11-21 16:14:00 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Remove an unused packed library

 mediatek/mt8195/scp.img | Bin 635448 -> 635532 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)



