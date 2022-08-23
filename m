Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E773C25B08
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 05:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijokMmJKsT0+CBQ8Gdmv6lUHjb9/6ryw7rMwmSGnkVw=; b=r9D9dJ1Q6hkGyr/WDUPCwWiCDK
	Eler5uadNz34eNQdMRdBq/Jnjcq/WBymzFZEXbLyf1O05LAVA1HWk8r8qkBxRHUgwVHiKUdiw75YN
	z9RAzJBnxW3/fNQ4EV/u+8CIiXT9r86QO6qqGeHFkno4pdJxDMPj1OXoBQLTtgIrhz7j2mGnm7p/c
	5fZ7rsII5sEhrLEG5Dc6YnYTCBpSNxCvSL15FBouK/4U5dR9LZGkRlVe9BZ7BtBK1z3zA1eTQmvJA
	+MwA6pAh0gMtd6QBhCarqlPQ8QPRLlDYPBlIt1bzenWU6uDkbE7FK8XLcim7wnW1GbNv3nSPXe2g2
	6hzqOYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQMMJ-002LIN-15; Tue, 23 Aug 2022 05:21:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQMMG-002LGT-5R; Tue, 23 Aug 2022 05:21:49 +0000
X-UUID: ab327334466c4c589a3ba40d593de05f-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ijokMmJKsT0+CBQ8Gdmv6lUHjb9/6ryw7rMwmSGnkVw=;
	b=GByrc0r3KGPbaCEiHMyIryxylUl/rH/AF3p/EIBetbHVoteuc28GINy4DQQZhC3G2vtFfGpjEJ+1SbHZR1GNitPZLcOFZVjjvOA0V8hjwNaJS4C1FSSXg/ilHhI1NBN5o83jhC6g0jQfHM9dOU72A7+kJD5dJRLpoxhkAXvsodU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:844bb3b4-141a-4271-bbf2-d3440e37f657,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:18ac4fcf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ab327334466c4c589a3ba40d593de05f-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 607362142; Mon, 22 Aug 2022 22:21:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 13:11:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 23 Aug 2022 13:11:06 +0800
From: Jing-Ting Wu <Jing-Ting.Wu@mediatek.com>
To: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>, Tejun Heo
	<tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner
	<hannes@cmpxchg.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Jonathan.JMChen@mediatek.com>, <Lixiong.Liu@mediatek.com>,
	<wsd_upstream@mediatek.com>, <Wenju.Xu@mediatek.com>, Jing-Ting Wu
	<Jing-Ting.Wu@mediatek.com>, <cgroups@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] cgroup: Fix race condition at rebind_subsystems()
Date: Tue, 23 Aug 2022 13:09:41 +0800
Message-ID: <20220823050943.28619-1-Jing-Ting.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_222148_230223_3CDDA137 
X-CRM114-Status: UNSURE (   8.49  )
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

Root cause:
The rebind_subsystems() is no lock held when move css object from A
list to B list,then let B's head be treated as css node at
list_for_each_entry_rcu().

Solution:
Add grace period before invalidating the removed rstat_css_node.

Suggested-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Jing-Ting Wu <Jing-Ting.Wu@mediatek.com>
---
 kernel/cgroup/cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index ffaccd6373f1..0d0c959966ed 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1820,6 +1820,7 @@ int rebind_subsystems(struct cgroup_root *dst_root, u16 ss_mask)
 
 		if (ss->css_rstat_flush) {
 			list_del_rcu(&css->rstat_css_node);
+			synchronize_rcu();
 			list_add_rcu(&css->rstat_css_node,
 				     &dcgrp->rstat_css_list);
 		}
-- 
2.18.0


