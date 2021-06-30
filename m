Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A7BC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A778B61D12
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A778B61D12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zFQXF7/roJ42kdoK2NdgJFFn1BqHxye328QB80J8+5k=; b=byUQR4yDlzvUqE
	ejO19wn8ipivyBUyBrB0ixdPlgW/vcN+EJFDRgl5fbX4pQrQZZwqOrXrTa4efZmKgBh8+AzGy9OL3
	11qMfw1kVUeCnewoazvsmOq+6MtL+2MJ5zCKK2FUl3Fn4DllAT4CwcYJfurIwPIAYJwAQOK9sJPHk
	ARXxxYqTMckCVTU3WGKL0x5LBps+b4yU7Peo3SnW3PSknq6lQRQJjK19aHgt9yPe2tKMZd2bGkMi/
	Jo9r9x/CylKCFim8nCcT2uTqhWktLb/Vju5vGxIxoOhMiFSV+3dmZZtLOh6g/PzmGBSx6yVtrCgtu
	4O+RQUvtDtU7ZLLpUocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyWRG-00DTD7-ON; Wed, 30 Jun 2021 09:23:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyWRC-00DTBX-Ep
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 09:23:21 +0000
X-UUID: 09eb3241be964aa39b97f6a0efc765be-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ha8f97gGfFsZf2l13/TujaX9KkaMGWtb3W/6+5+Ynwk=; 
 b=RaZv7rnKOewU0qq2FDEk9F14iT9BDO74YIY6+x3a+AApvolZHe2UdEJlkgU12r7GXiDGpLblC8097+K/lPA3CHLK7nUjwVB8G1tgXhX53YjES/8tyJ/Tf4Ux8GVMgUt+UHXOV81lqxVEhv8l4aPUSv6B5Qyl+TSuZHX5YnEl54o=;
X-UUID: 09eb3241be964aa39b97f6a0efc765be-20210630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 70564175; Wed, 30 Jun 2021 02:23:14 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 02:23:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 17:23:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Jun 2021 17:23:11 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [PATCH] mm/sparse: clarify pgdat_to_phys
Date: Wed, 30 Jun 2021 17:23:09 +0800
Message-ID: <20210630092309.17654-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_022319_975646_29C4B2AD 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

clarify pgdat_to_phys() by wrapping pgdat_to_phys
with CONFIG_NUMA. (the same config as contig_page_data)

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

[1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/sparse.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 7272f7a1449d..62c21ec28e33 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -344,14 +344,15 @@ size_t mem_section_usage_size(void)
 	return sizeof(struct mem_section_usage) + usemap_size();
 }
 
-static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
-{
-#ifndef CONFIG_NUMA
-	return __pa_symbol(pgdat);
-#else
-	return __pa(pgdat);
-#endif
-}
+#ifdef CONFIG_NUMA
+#define pgdat_to_phys(pgdat) __pa(pgdat)
+#else /* CONFIG_NUMA */
+/*
+ * When !CONFIG_NUMA, we only expect pgdat == &contig_page_data,
+ * and use __pa_symbol().
+ */
+#define pgdat_to_phys(pgdat) __pa_symbol(pgdat)
+#endif /* CONFIG_NUMA */
 
 #ifdef CONFIG_MEMORY_HOTREMOVE
 static struct mem_section_usage * __init
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
