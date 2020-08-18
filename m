Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3EAC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1237C2076D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0fpo8O2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kREOL9j/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1237C2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yf6IfrvjDAXycU6/d01O23gXXyjAqNuijiJkf0bfKng=; b=Y0fpo8O2ywfqHjZtyulN+9c6H
	PCpWJBu9K/06kvzBZOInCDt8kZ69J0Y8TX9VCjglO6iN7rI/ESJa6jWmyNxFwE0dU0Y3MAL/z5jH7
	4YAKUmwSEqnCT2NIreKMNvewrjSSxmojs6l3XAlRB4RsCkFYTR7DgIPxjE8tg5Let4BrNnzuKdVCH
	+d+y+4IZh+4dO7mxUxlRLHWg7RPUBUAvnioxssU6nwvgoPGIPQ4w1B+05zY+Frl7dlZkrbNDi6cF1
	RB76GKjjMyxR2HIrj2MJVOprBmODm+GWa3sKYRbmagmx5vW26/xBYIzzK3v1UDQnhz0JctrcYvm68
	cMaad3YSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7qxA-0000XU-0J; Tue, 18 Aug 2020 02:02:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7qwv-0000RP-7L; Tue, 18 Aug 2020 02:02:07 +0000
X-UUID: f3504bef7ef04b049dbbfd6e0e59d565-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Mg5uZdFFDJBYK66PxAT2X+zp5o0L419XdVPA3e+0npM=; 
 b=kREOL9j/8PQ+xF/I9jiRTXQt+v6NXFt0pD6HEIwNLTTtWPqmd6ghOYTu1JeVVuL4cmu8U/PopB8sW2NyCYghjbbwbKCx0pPXYB4Md5mo7ZMf3uX8W9rFsP37F9LGbrkC754N7ZXL/L74t39MzlXCQP9HtF4/lmKZ7VrV6gBcPmA=;
X-UUID: f3504bef7ef04b049dbbfd6e0e59d565-20200817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 780412620; Mon, 17 Aug 2020 17:58:48 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 18:58:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v4 1/3] mmap locking API: add mmap_lock_is_contended()
Date: Tue, 18 Aug 2020 09:58:16 +0800
Message-ID: <1597715898-3854-2-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_220205_437090_4C9900E1 
X-CRM114-Status: GOOD (  13.28  )
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

Add new API to query if someone wants to acquire mmap_lock
for write attempts.

Using this instead of rwsem_is_contended makes it more tolerant
of future changes to the lock type.

Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Acked-by: Michel Lespinasse <walken@google.com>
---
 include/linux/mmap_lock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 0707671..18e7eae 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -87,4 +87,9 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
 	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
 }
 
+static inline int mmap_lock_is_contended(struct mm_struct *mm)
+{
+	return rwsem_is_contended(&mm->mmap_lock);
+}
+
 #endif /* _LINUX_MMAP_LOCK_H */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
