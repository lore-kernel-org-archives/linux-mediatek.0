Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07214C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Kk+4ccaigRSqLMLy3uDs3B3e9ohN0+aD87eOWCOx5o=; b=n0laYoaxWy/irJqcmc4ml9jYMm
	JNq4s8k/E6M941MCK+lVEkwfWmXGvrFWDdLlS7Lw3YU+o5ov/syt2P1Sx23cf2M/Ddh0XXdkrdAOI
	RepNQalC8ysrHeFgQCvDPA8Mo1lCMkNP7ewFUXGscGdVMxeQyOmMnw0gfKYvLJTCWUt30FcWN6Dft
	kfTO6eCSR5tdGFrPG+0f+mTp9B1+vEP6gMTBnTqQAHk9YmkCCOW0O/yXfnQsR7b2l2d3D84ANGB4z
	HXeVL+R/GKNaRn/liowv6zcICtG4T0IqJUkYuGZY9pIkZ8rPSCWl8TH4x/iG4slgkjami5UAzAlpy
	7oy4+MfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79CX-00000000nZ3-0Rgm;
	Wed, 15 May 2024 07:37:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79CU-00000000nYP-2CO5;
	Wed, 15 May 2024 07:37:23 +0000
X-UUID: f3d3a53e128d11ef9a78ddf43a9225dc-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+Kk+4ccaigRSqLMLy3uDs3B3e9ohN0+aD87eOWCOx5o=;
	b=SmgL9IFq2Ru43vBV3kmX/sDe/qXSzHH8X6hknfXWr0a1+8WLEs0BRbGCCE1GP32Yvs/HlDboT5q4IJy79/NTU/oxe3J54EE3LBn/YMS6SQW/DqnmCGHIf8YE1K1MHpoa7n1EQvRglaRq7MdXAKcxgeS9ZQG95zihT50AGG9LM+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:a5b124d0-f004-4b3e-ab07-a577e2d65067,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e4ea6087-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3d3a53e128d11ef9a78ddf43a9225dc-20240515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1538569314; Wed, 15 May 2024 00:37:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 15:37:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 15:37:13 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <stable@vger.kernel.org>
CC: yenchia.chen <yenchia.chen@mediatek.com>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Eric Dumazet <edumazet@google.com>, Sasha Levin
	<sashal@kernel.org>, Simon Horman <horms@kernel.org>, Pedro Tammela
	<pctammela@mojatatu.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Ryosuke
 Yasuoka <ryasuoka@redhat.com>, Thomas Graf <tgraf@suug.ch>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.15 0/2] netlink, fix issues caught by syzbot
Date: Wed, 15 May 2024 15:36:36 +0800
Message-ID: <20240515073644.32503-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_003722_667842_2C99AA4B 
X-CRM114-Status: UNSURE (   6.41  )
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

From: "yenchia.chen" <yenchia.chen@mediatek.com>

Hi,

We think 5.15.y could pick these commits.

Below is the mainline commit:

netlink: annotate lockless accesses to nlk->max_recvmsg_len
[ Upstream commit a1865f2e7d10dde00d35a2122b38d2e469ae67ed ]

netlink: annotate data-races around sk->sk_err
[ Upstream commit d0f95894fda7d4f895b29c1097f92d7fee278cb2 ]

Eric Dumazet (2):
  netlink: annotate lockless accesses to nlk->max_recvmsg_len
  netlink: annotate data-races around sk->sk_err

 net/netlink/af_netlink.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

-- 
2.18.0


