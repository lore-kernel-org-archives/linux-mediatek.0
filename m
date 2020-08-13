Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6726C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 02:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974D420771
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 02:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gw4aE07f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iBEvIDhk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974D420771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=In5BEDYzvM+LqxrUOzEdSlHh7ldZDgSoWPdZ9PK0U34=; b=Gw4aE07fj/osksd4xEdE7kFxCm
	DjPZ0oSEJMMTbQJtup/ZWSNWB+g0X5p9pn3x6j653Xg0uSEZ9/hBNzBAZIMRTCscHe8+jBmCJeRWn
	zD/TGkVsIgGQG2vB8zq20Xbk5QGRhlync3NRu3+KXxSafMQXAbvDnVZPVWYvseHBmwbI5aqmKBNcu
	cD4uoDeD5IondjlYpdhwOfkRzmzOOQLfeIL61f8kEYl/SH51ZAVFl21Yh+0YTDK/LJZ1UciSgZadb
	nI2M1wCPiXY4dMF1wxsXnaSgLdKTryLGnqRTkvBcJjLn1c9gYZtcMP3HFLpF0MWzgGyinDDliLh+d
	qC6seJgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k62km-0003Tg-Hm; Thu, 13 Aug 2020 02:14:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k62ki-0003Rr-SA; Thu, 13 Aug 2020 02:14:02 +0000
X-UUID: 2794ca0de241451ab5f5e84cad1e9b1e-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aF1D+BCyiRCtqB/9T1GyAsWkEq1ttG2TVqo5h3JEkxo=; 
 b=iBEvIDhkcs6plnbJGYTJTybOT8PtjIeTJWVB6qEItJ5wE8T+KT5wBPVAWzbaoqOQmCDm+FEVaKHt7JEjukxum46gfzHUTT0rXnPGC/gSv+kHzXgyQ9vD3DmljqukS7O19IY74Yiow8WZbMRSbGn9x8cPgNtQ1TFsGe6uNU929WE=;
X-UUID: 2794ca0de241451ab5f5e84cad1e9b1e-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 863826039; Wed, 12 Aug 2020 18:13:53 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 19:13:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 10:13:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Aug 2020 10:13:45 +0800
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
Subject: [PATCH v2 0/2] Try to release mmap_lock temporarily in smaps_rollup
Date: Thu, 13 Aug 2020 10:13:28 +0800
Message-ID: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_221401_058236_FD1C7D3A 
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

[1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/


Chinwen Chang (2):
  mmap locking API: add mmap_lock_is_contended()
  mm: proc: smaps_rollup: do not stall write attempts on mmap_lock

 fs/proc/task_mmu.c        | 57 ++++++++++++++++++++++++++++++++++++++-
 include/linux/mmap_lock.h |  5 ++++
 2 files changed, 61 insertions(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
