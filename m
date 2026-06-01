Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1762ECD6E56
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MHZjnI02OfF6YizpdL3PN+VzTcT2/Mb5aOfBNWzWv0U=; b=wGFDAQ/J9N8yGd9L/p8Isoy9BZ
	GWErCoi6GFqxbhbPDJSGNyrhKKZg8bxXkMon2BaA7hhPdZGLaNRT0w4Y3DBH9SfuqdlYKABQh35Ag
	Wymlec0QLLThTioxn8iTMAQiVPC3HT+kYpnzToQAoyPrqw/jd4upCNHk+8qh1zzZ1Mzu4qmljPbE3
	AgOO9oV9vxJ52pKB+r2DJ2lAYKUQxrwWkiwJfHnFVoiyhDnx8Yr7PxNX+yID/wa8GdbPk6Un05QMP
	v8TFkX7FsFaXSSAx880/PjkP6MTSCge+e3CbAofUD3ipjOer8ABaK0aF+T4T9RxUdXJZqd8J3bco2
	YYqIaLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bm-0000000AlvD-2JqY;
	Mon, 01 Jun 2026 11:52:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bk-0000000Aluq-0rjP
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 11:52:13 +0000
X-UUID: 2fd5a3b25dae11f1acbe4559397dec65-20260601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MHZjnI02OfF6YizpdL3PN+VzTcT2/Mb5aOfBNWzWv0U=;
	b=Dm2TqH9QEzJh8ciVU0mpqBhBppvENDBp/vOMqYw1EtupfSb8TOiaQ7kgLZ9kAdBhGsrKsvFyXTAWJeYg/NTi5SbtvbsyBwdWuwObNXp3BteB4g39srL3oluBePMq+8JCcFSbFNZaPitKBHUuq7XEMWSMoFuYJG7sHlcLn7nxXOI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:2b0f5380-83d0-44d8-af0d-e8c76684f1f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:36b0fd9f-d1e2-4782-856f-c727ae10217a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|136|836|865|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2fd5a3b25dae11f1acbe4559397dec65-20260601
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianyu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587122508; Mon, 01 Jun 2026 04:36:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Jun 2026 19:36:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 1 Jun 2026 19:36:51 +0800
From: <jianyu.li@mediatek.com>
To: <kuniyu@google.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>
CC: <willemb@google.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<black-ch.chen@mediatek.com>, <ivan.tseng@mediatek.com>,
	<jianyu.li@mediatek.com>
Subject: [PATCH net v3 0/2] af_unix: Fix inq_len update issue
Date: Mon, 1 Jun 2026 19:36:38 +0800
Message-ID: <20260601113640.231897-1-jianyu.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_045212_280412_F2510613 
X-CRM114-Status: UNSURE (   6.56  )
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

From: Jianyu Li <jianyu.li@mediatek.com>

This series fix the problem that inq_len is inconsistent with
actual remaining byte count when only part of a skb is consumed.

Changes:
  v3:
    - Patch 2: Align macro definitions
  v2: https://lore.kernel.org/netdev/20260528110033.3327744-1-jianyu.li@mediatek.com/
    - Patch 1: Improve lock usage in unix_stream_read_generic()
    - Patch 2: Follow reverse xmas tree ordering in partial_read test case
  v1: https://lore.kernel.org/netdev/20260527065342.2463433-1-jianyu.li@mediatek.com/

Jianyu Li (2):
  af_unix: Fix inq_len update problem in partial read
  af_unix: Add test for SCM_INQ on partial read

 net/unix/af_unix.c                            | 11 ++--
 tools/testing/selftests/net/af_unix/scm_inq.c | 54 ++++++++++++++++++-
 2 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.45.2


