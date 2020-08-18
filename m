Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB43C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D822078B
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItVj3Coo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lJ4bqskf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D822078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrTuB6i8me+wLWNOtT+dI1TwO5cqzC3zYB7xpkD+vyU=; b=ItVj3CoosYByKTOCB1005FCgxd
	zSQee/o5NVoO6P6fGMVu4cMp1akhldo4kaZ6BmMDShydSR4q/blelZ9hDzBJsCH4B68Qd6LbRNl9J
	6g8dAnC2d7QPHJfoYDizpsBj4HDVH/v2LJzYlD3kGP3mugUzcpSpdro7x8MY/HnO8sb6kw1c7AuzU
	xeVOJWm1xHL70BUtUrZYhsMXD2H6RbX+MOMsBVbjHRXQw2mY6fEyhRPZUvDoSR2SPd9KBLETlUdQC
	Gms/6EfXbPPK3f5vVC8LJMzgeov7nszw97tDf0Rj0f3cNKhx1N15LM34iu1icBG5nl+tlNrzR560o
	x9rHusjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7qx2-0000VW-6D; Tue, 18 Aug 2020 02:02:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7qws-0000RP-27; Tue, 18 Aug 2020 02:02:04 +0000
X-UUID: 1850f40f8eac40bd96eff198e12d4dfe-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y4xhx9IjgKvrJUycw+ZxzgJtq8e5cl3Sw5tNuSRwHcw=; 
 b=lJ4bqskfU6hyhnPUBhNiSLexama5KDLLrE69LOfoqCmPTq9Zr21XJNUrHfQlnPhnupTdPrjelcLcLFtGX/JCqsSmt9VlTBnb/aJh9dt2Hm0ytRLSQ21PubytXjSVYpdTTwyNk75yPV2Id4DnbQW0cXTZIKx5aLxBYpGKbigUlOQ=;
X-UUID: 1850f40f8eac40bd96eff198e12d4dfe-20200817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 201980066; Mon, 17 Aug 2020 17:58:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 18:58:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 09:58:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 09:58:44 +0800
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michel Lespinasse
 <walken@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Vlastimil
 Babka" <vbabka@suse.cz>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 "Davidlohr Bueso" <dbueso@suse.de>, Chinwen Chang
 <chinwen.chang@mediatek.com>, "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>, Song Liu
 <songliubraving@fb.com>, Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang
 Ying <ying.huang@intel.com>, Daniel Kiss <daniel.kiss@arm.com>, Laurent
 Dufour <ldufour@linux.ibm.com>
Subject: [PATCH v4 0/3] Try to release mmap_lock temporarily in smaps_rollup
Date: Tue, 18 Aug 2020 09:58:15 +0800
Message-ID: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D471C64083F4CDE6FA76DAD05F7A7CDB90D1CBE8CE8627B75196A7301A582C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_220202_269550_FCEE257A 
X-CRM114-Status: GOOD (  13.86  )
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
process's memory usage without the overhead of seq_* calls. Android uses it
to sample the memory usage of various processes to balance its memory pool
sizes. If no one wants to take the lock for write requests, smaps_rollup
with this patch will behave like the original one.

Although there are on-going mmap_lock optimizations like range-based locks,
the lock applied to smaps_rollup would be the coarse one, which is hard to
avoid the occurrence of aforementioned issues. So the detection and
temporary release for write attempts on mmap_lock in smaps_rollup is still
necessary.

Change since v1:
- If current VMA is freed after dropping the lock, it will return
- incomplete result. To fix this issue, refine the code flow as
- suggested by Steve. [1]

Change since v2:
- When getting back the mmap lock, the address where you stopped last
- time could now be in the middle of a vma. Add one more check to handle
- this case as suggested by Michel. [2]

Change since v3:
- last_stopped is easily confused with last_vma_end. Replace it with
- a direct call to smap_gather_stats(vma, &mss, last_vma_end) as
- suggested by Steve. [3]

[1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
[2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/
[3] https://lore.kernel.org/lkml/db0d40e2-72f3-09d5-c162-9c49218f128f@arm.com/


Chinwen Chang (3):
  mmap locking API: add mmap_lock_is_contended()
  mm: smaps*: extend smap_gather_stats to support specified beginning
  mm: proc: smaps_rollup: do not stall write attempts on mmap_lock

 fs/proc/task_mmu.c        | 96 +++++++++++++++++++++++++++++++++++----
 include/linux/mmap_lock.h |  5 ++
 2 files changed, 92 insertions(+), 9 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
