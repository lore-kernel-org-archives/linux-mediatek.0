Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D0BC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7613822DD3
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLWKjojk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r3stySv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7613822DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbhtW4YeDkSA09heYnwfgFleHQHxcLj1+ctSNcFqwJc=; b=mLWKjojktTYdaWeMffx2H8tG0I
	d7O9lXfoaRR8yeZedCtbEOc5VvNsWHpr34dwWjJ128cbZ+fi//jSHGKUQr0RgrSsSwNI5lGo1Ae3L
	N7Cm+ka3ATvOMmm7ffZP+P4kBBqMX0jM5W7gpn9DOqdDv2+CT63P/VZ1WafngmBMLrOTVj3NBVLon
	YJybE9PbbxbrZa50zYsh1AmFA+H1fb8V36FQMCiT7s1Fucx7L0LKDH4hiVR+8ZMRX3Rj2joNOrdHk
	UDZleGCZe8F46UnQg1/GjsEslYXRpl4rgAy77ZC1NQNftQVI7XjCycoVfS7nIrZg1vjhYaRz+vZkN
	lCxh0Qow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6pZJ-0002Lm-Ux; Sat, 15 Aug 2020 06:21:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6pZA-0002JF-NI; Sat, 15 Aug 2020 06:21:22 +0000
X-UUID: 8fa563bcb5b74b0581717b90ba73b18a-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GFI+val4GU2tEbPQV6aLWgII/YcqB20UyChxuiD1c4Y=; 
 b=r3stySv2lrmBVVNsHYPPb3rBbR1H5WeQ8jTKhZBBiilPwb8WZm98ZT0BgSdlnvulCReE+F4lUYI9iS2BkZv57K6QSaUfOayM5sFXwqkp9irztUIi1xQruhG0VWOR5ItiOSVI+vsljO8DerIMDw9mVsWHD1EueSWtuFazyqqdQCI=;
X-UUID: 8fa563bcb5b74b0581717b90ba73b18a-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 500955223; Fri, 14 Aug 2020 22:21:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 23:21:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Aug 2020 14:20:51 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 15 Aug 2020 14:20:53 +0800
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
Subject: [PATCH v3 0/3] Try to release mmap_lock temporarily in smaps_rollup
Date: Sat, 15 Aug 2020 14:20:16 +0800
Message-ID: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6AA49C9BAEA802EB08C17F40AE22768D271BE6B44FA9A7B98C33BE7BA3C3EE2B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_022120_902876_CCA3C783 
X-CRM114-Status: GOOD (  12.76  )
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

[1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
[2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/


Chinwen Chang (3):
  mmap locking API: add mmap_lock_is_contended()
  mm: smaps*: extend smap_gather_stats to support specified beginning
  mm: proc: smaps_rollup: do not stall write attempts on mmap_lock

 fs/proc/task_mmu.c        | 101 ++++++++++++++++++++++++++++++++++----
 include/linux/mmap_lock.h |   5 ++
 2 files changed, 96 insertions(+), 10 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
