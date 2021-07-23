Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213D4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 12:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F9960F02
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 12:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32F9960F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qczKsb56ep95JFeMw59vaiHznGD3KuZe6WtrY4MpcGs=; b=enoMZEpHiGQfBU
	BG5fU8t73YUiU9UKmZfH0rRf5x2MXJzzfhMYx17QaL4Kf4e/g9p7a5mFrQAs5V1aApWTMbcBFJlh5
	HQs9tOx69QW1QRRseLcWCRgYkdo2xmH9WjgYBxwq1Hh9dx7KFHw/nwRfyFJ8lBWGdfPq/Nnz6zjCT
	EB/mPnjuXnnFSJOcTrbQ2kX2HC0jWlvT9amRza0svc/3HzcVKct6s6T+HXtVUk7P2bsJHdhhdqkvn
	eXr0zsh8A81JCbEti1wGi5qKYQcLgwYRr77ioDv2ZEe7H4eQ80Jrm1UcXTnn8obd71kh1zfos+ZGu
	oGk3NfaJm8bd/GLc0zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6uNW-004e6A-HU; Fri, 23 Jul 2021 12:34:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6uNT-004e5C-Cv
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 12:34:09 +0000
X-UUID: 126ab4cdd51441348e4fe1a56bfc28db-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7k+4gCx3PtKX+KCF8SFCmpOW09BJ7u9okbHhvR14epE=; 
 b=Lpt0sHPIDcwFmzg78IZepNIpizv/IRVyQAeg/8bFN0jlHBvPiq8hQ24gcHrpS0RYhaM6RvrsIWNlSAHC0q20LusMyvggNwGjhfbPAyKGA1RTMMv4FmDjSBdx9dFOwqn8KW30SWjgZs5eR6LQA+YEAXZotFM9lVi8UCZ/o0ETIQU=;
X-UUID: 126ab4cdd51441348e4fe1a56bfc28db-20210723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1312386840; Fri, 23 Jul 2021 05:34:02 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 05:34:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 20:33:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Jul 2021 20:33:46 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Hildenbrand
 <david@redhat.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [PATCH v3] mm/sparse: clarify pgdat_to_phys
Date: Fri, 23 Jul 2021 20:33:42 +0800
Message-ID: <20210723123342.26406-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_053407_488341_57A1DD97 
X-CRM114-Status: GOOD (  11.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Clarify pgdat_to_phys() by testing if
pgdat == &contig_page_data when CONFIG_NUMA=n.

We only expect contig_page_data in such case, so we
use &contig_page_data directly instead of pgdat.

No functional change intended when CONFIG_BUG_VM=n.

Comment from Mark [1]:
"
... and I reckon it'd be clearer and more robust to define
pgdat_to_phys() in the same ifdefs as contig_page_data so
that these, stay in-sync. e.g. have:

| #ifdef CONFIG_NUMA
| #define pgdat_to_phys(x)	virt_to_phys(x)
| #else /* CONFIG_NUMA */
|
| extern struct pglist_data contig_page_data;
| ...
| #define pgdat_to_phys(x)	__pa_symbol(&contig_page_data)
|
| #endif /* CONIFIG_NUMA */
"

[1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>

--

Change since v1:
Thanks for Mike's comment, check if pgdat == &contig_page_data,
so it is clearer that we only expect contig_page_data when
CONFIG_NUMA=n.

Change since v2:
use VM_BUG_ON() to avoid runtime checking when CONFIG_BUG_VM=n
---
 mm/sparse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 6326cdf36c4f..d13d831f88a5 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -348,7 +348,8 @@ size_t mem_section_usage_size(void)
 static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
 {
 #ifndef CONFIG_NUMA
-	return __pa_symbol(pgdat);
+	VM_BUG_ON(pgdat != &contig_page_data);
+	return __pa_symbol(&contig_page_data);
 #else
 	return __pa(pgdat);
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
