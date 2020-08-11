Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB96C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 04:55:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D2D20678
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 04:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWk+Zk6l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I76ieWx6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D2D20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gOuOa/0LTjMU0TMxOWD/klLfVO6vgwZMaE+f7o50DW4=; b=WWk+Zk6lZlz/TsSqIm3ViHhhlQ
	i7ll3W4IsnoVtM4RSJ7yBEfLzoF/0RVIcjJft9bk+z8qJ1e/mFn9aMKJ+pGOhW5YYORNfeO/vZlgz
	lfM/VZOKAN7+S8Jnj3yNNpKSlhAh3EXcTFMgsbvmWjb78ufNZZYEdSp8co1/PxDNvJAscKmwI/sXx
	uG2IjgwFx20zxAkrWmY8+lKspVztkeEIKh+0NTW79jlzY6EtcSGFWr36zmYBEmgKViqNwVFbl48UV
	fEV2aB8kK9DTPh2MaxGuVvIE9hWKV/A9lkHUmxZAuWl1ATPS2WNbaC+7DGk80d4HLpA63Ty0uKC8n
	Vge4yvsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5MJP-0005dT-Ho; Tue, 11 Aug 2020 04:54:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5MJL-0005bk-Fj; Tue, 11 Aug 2020 04:54:56 +0000
X-UUID: ef66c164d1b04027a30969e4caca12f3-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xMfOcxXPIjQ8x1RL6vb8f9fzkRGTsMOc4csNnJ7zcjY=; 
 b=I76ieWx6laYaOA8MsuwRm8ryFF0Qz8WGpcK6//7BCpCrbutQCBNHggGwThUrZwqR+Y8m7+TDspo/QBtoImAZK8IU6Z+XW0Z5l8nxLGSjgG4NxNKj65w3cwSEzG9iG1uNKRh1W5Jo9Lgm6HvRBrNMblPTYUWRHsg5jXfBeGWJPqU=;
X-UUID: ef66c164d1b04027a30969e4caca12f3-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 346402844; Mon, 10 Aug 2020 20:54:50 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 21:44:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 12:44:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Aug 2020 12:44:46 +0800
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michel Lespinasse
 <walken@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Vlastimil
 Babka" <vbabka@suse.cz>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 "Davidlohr Bueso" <dbueso@suse.de>, Chinwen Chang
 <chinwen.chang@mediatek.com>, "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>, Song Liu
 <songliubraving@fb.com>, Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang
 Ying <ying.huang@intel.com>
Subject: [PATCH 0/2] Try to release mmap_lock temporarily in smaps_rollup
Date: Tue, 11 Aug 2020 12:42:33 +0800
Message-ID: <1597120955-16495-1-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: FECB1C8FBBC3155D664B844BB8EA23BAF81A4309A9540D60EDA9FF345C03F1222000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_005455_764618_C1BF35AA 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Recently, we have observed some janky issues caused by unpleasantly long
contention on mmap_lock which is held by smaps_rollup when probing large
processes. To address the problem, we let smaps_rollup detect if anyone
wants to acquire mmap_lock for write attempts. If yes, just release the
lock temporarily to ease the contention.

smaps_rollup is a procfs interface which allows users to summarize the
process's memory usage without the overhead of seq_* calls. Android uses
it to sample the memory usage of various processes to balance its memory
pool sizes. If no one wants to take the lock for write requests, smaps_rollup
with this patch will behave like the original one.

Although there are on-going mmap_lock optimizations like range-based locks,
the lock applied to smaps_rollup would be the coarse one, which is hard to
avoid the occurrence of aforementioned issues. So the detection and temporary
release for write attempts on mmap_lock in smaps_rollup is still necessary.


Chinwen Chang (2):
  mmap locking API: add mmap_lock_is_contended()
  mm: proc: smaps_rollup: do not stall write attempts on mmap_lock

 fs/proc/task_mmu.c        | 21 +++++++++++++++++++++
 include/linux/mmap_lock.h |  5 +++++
 2 files changed, 26 insertions(+)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
