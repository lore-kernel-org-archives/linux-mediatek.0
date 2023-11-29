Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E857DC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=na6Um5bZE/lrzzyPLjzBP7E/V75yxzke3oahh4HsVvM=; b=4KtgrVxRlj9u+IcGhszm1zTpsT
	qBt1Q8RN5w3XkXj1IrcS65I8mCOMkLbX//wprKfnYr1F6K+z6TZl2H1tuBktzKnNiuVRerYS6uMrc
	uT7Qi8XK0eZibcAu8ieD72+LzVaUZBypSrWj5GBLxbVsKY4i78wEkbshMeLPVTFPiqgtAsnBiq4TF
	sWBsZaxZl5bI3f60JkpvPqHwxKoqNpzz42yQk4z/YZHJm5doa7ejWX6nuBNNd8A07ypqI4oXoFAO2
	H1frxHxGXrkHQYslos+tn3JH3t5z5PEAMgpImfiX+nQXVsZWdpTAUw6O4vODiPKymAn7/PLmTUtiL
	ZRAUsz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQv-007H3E-1I;
	Wed, 29 Nov 2023 06:52:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQt-007H2C-08;
	Wed, 29 Nov 2023 06:52:28 +0000
X-UUID: d6ccb7668e8311ee86758d4a7c00f3a0-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=na6Um5bZE/lrzzyPLjzBP7E/V75yxzke3oahh4HsVvM=;
	b=ehmBPH6bcijIl4lJVtyGEm0Y8rxbngAzJUUvW00bdUx0WO06cFSmvDDQvtEQ0wMg+h5+3775wE3gYHMPBNriIbY/jr/mjAwgQ6wKXGyRzpue4WL3O2KDqQsPSyIUiyKMVKrfOs5kKqdRFWZ3wRS4jW9emluZSJQGP81I6iRcpo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:72971d10-a4d5-4b7e-b3f3-8534039acb1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:7b669b60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d6ccb7668e8311ee86758d4a7c00f3a0-20231128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1295638928; Tue, 28 Nov 2023 23:52:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 14:51:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 14:51:44 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/3] Fix GDB commands error
Date: Wed, 29 Nov 2023 14:51:37 +0800
Message-ID: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.712100-8.000000
X-TMASE-MatchedRID: Xtk5aVnIUKpBEeXXYJxA3huZoNKc6pl+MVx/3ZYby7/jud2x7TPVt0pf
	KXQfMT86VUTnw0FQboc7/+RrYRAMW+g9HcxTn+DoP0HVIeixJdCuiRuR9mCaukYvSDWdWaRhbCp
	JOk5WRE/jCeE5v4lH5IAy6p60ZV62JW+71yEen6Zq8/xv2Um1avoLR4+zsDTtuVfc976pNypM1p
	XMu+IS/QAcUADeXmG7puWh80OThW5LFvCB7sGQg6YT3rx3c0p4nWgPrCj7FiKrfaTjXvF3NsapL
	HI0FIIU2WlY2vGr17l2a1GxGYqQBIlk9PZkM+7M8PZB/MwMuOGjrlS58dwO+A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.712100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 80D5F2A9B89B0C5D38680BD326EF260A91A1AF04B08E5F621849C72AC8F48DC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_225227_092296_8DFAC573 
X-CRM114-Status: UNSURE (   8.01  )
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

This patchset fix some issues of gdb command.

Patch 1:
 - Fix lx-ps command error
Patch 2:
 - Fix stackdepot usage error
Patch 3:
 - Remove exception handling
 - Refine the printing format

---
V1->V2:
 - Remove unnecessary variable. (Thanks Oleg)
 - Refine commit message.

Kuan-Ying Lee (3):
  scripts/gdb/tasks: Fix lx-ps command error
  scripts/gdb/stackdepot: Rename pool_index to pools_num
  scripts/gdb: Remove exception handling and refine print format

 scripts/gdb/linux/page_owner.py | 58 ++++++++++++++-------------------
 scripts/gdb/linux/slab.py       |  3 +-
 scripts/gdb/linux/stackdepot.py |  6 ++--
 scripts/gdb/linux/tasks.py      | 18 ++++------
 4 files changed, 36 insertions(+), 49 deletions(-)

-- 
2.18.0


