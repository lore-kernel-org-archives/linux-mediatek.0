Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F0CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B656860ED7
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B656860ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tS+PlLxwwTIURSUkJRgze1RaDcJrcWJiYfLO+6qzvlU=; b=SodXp6Z9jsuQxZ
	UUnXziAHI7PZP/ZXQXW4jRZLSgJr6C4P+fJc8KykR2A7wSJSwMU9IqHa5Q0Cm5oJr5GxZqKAahY1t
	PHJ7p8mf305PnD8/eHZcdZdAOXbCsLCrk5pTFvtzP/AupSGMNiipfs0yAplxfqVpgDwqnFLnyyeI8
	2/otZjQuVS5Z94wVZ/x7j+171ucGtyJJLw06u3NbD15MgqTkSr9v6AvKz+YJ82ANd3QflODq+FoO1
	jjk6JA5qeOgLSuhGViPOynh0ehgdMf0L9K6G2sLJ40UWEwLi283aZjgZnQBx2fZKwnQK6LhlQD4gj
	DDYAInj8ubghYQ30EMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6pIE-003e5V-Oy; Fri, 23 Jul 2021 07:08:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6pIA-003e4k-N8
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 07:08:21 +0000
X-UUID: 1cdcd838a6f941d8b039648dd9e15068-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3K5LQLnNfzvLMC9jhEwux2ly7arp4H7TgtBfN0imStw=; 
 b=g97+Ix3+KKhcxRANjFFtWPgCtn1RP3o1xLe5qRKuHaMkGN7Fdg33GzsdcXKJABnZI9Q/9uultxbco2ttABQAIGkXX/P3VzTQQfQZ3hCZzR3Vy2bzzUMe3FWkwjoZEZObLxNHUfhXaFm8JoXFDxoOv2DzcYFFjTP8+RIJ+01nNiI=;
X-UUID: 1cdcd838a6f941d8b039648dd9e15068-20210723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 191894313; Fri, 23 Jul 2021 00:08:12 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 00:01:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 15:01:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Jul 2021 15:01:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [RESEND PATCH v2] mm/sparse: clarify pgdat_to_phys
Date: Fri, 23 Jul 2021 15:01:37 +0800
Message-ID: <20210723070137.23321-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_000820_208475_BE6E1F99 
X-CRM114-Status: GOOD (  12.12  )
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

contig_page_data is only available when CONFIG_NUMA=n
so we have to use #ifndef here.

No functional change intended.

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

Comment from Mike [2]:
"
I'm not sure a macro is better than a static inline.

Maybe we'd want to warn if pgdat passed to pgtat_to_phys() is not
&contig_page_data, e.g something like

static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
{
	if (!IS_ENABLED(CONFIG_NUMA)) {
		if (pgdat == &contig_page_data)
			return __pa_symbol(&contig_page_data);
		else
			pr_warn("Unexpected pglist_data pointer!\n");
	}

	return __pa(pgdat);
}
"

[1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/
[2] https://lore.kernel.org/patchwork/patch/1452903/#1650759

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>

---

Change since v1:
Thanks for Mike's comment, check if pgdat == &contig_page_data,
so it is clearer that we only expect contig_page_data when
CONFIG_NUMA=n.
---
 mm/sparse.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 6326cdf36c4f..f73ff3c124c5 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -348,10 +348,11 @@ size_t mem_section_usage_size(void)
 static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
 {
 #ifndef CONFIG_NUMA
-	return __pa_symbol(pgdat);
-#else
+	if (pgdat == &contig_page_data)
+		return __pa_symbol(&contig_page_data);
+	pr_warn("Unexpected pglist_data pointer!\n");
+#endif /* !CONFIG_NUMA */
 	return __pa(pgdat);
-#endif
 }
 
 #ifdef CONFIG_MEMORY_HOTREMOVE
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
