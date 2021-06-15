Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A43DC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 17:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 301CE61009
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 301CE61009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8YJIdMmD7Fba4t91tuGlqkmBilneiZ9wcJg8JtRFnQ=; b=X1w/l5/w3DEjnZ
	hJtDRFcIs6cI4xoktdgNiV0ZMlraUl6l7s7dcd4wOq2k9X7oYlyn7ydB52TqtSxrCw4zaAV9n0wRq
	9OT+EtqTCliIslaO9DIKtCJuSjKyb2bLDVzS7NcCEZNjSaqP1jHFapp0u+sO0wLMSIFfovU/0l9Rt
	yB0XOTamoGUrAihPtiwT3J9FC9GHNlT99mdKvNz4PN5d8XUNrXQycUPJbwaFB+nJYRagOfJv8Dv00
	opgPXdwEnVTdakBt2wV+vdTRsM1uPprEeqrtS4C39EeWlUqc2KR2ueFNbWQUeIWpSCaCd9AOEuj3v
	f1QL5B67sUFsoD7nRDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltD7m-001qLa-CQ; Tue, 15 Jun 2021 17:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9LP-000DwX-S5; Tue, 15 Jun 2021 13:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xKS/7HXvz+d2gfv9Y2LU79ho8W4WaRcuU7f/RN/6hCs=; b=ZpZV0/MI/NAxcjf2dqUN6GGibh
 Zk1pH1z3UEDOVlDVH/lXPYmzIYVShF9WtJszLT0xY8VVOaEYgVDbSLSv144H/GJXNTup8x7CyzCaU
 +aAYCVwbGRj5gg1cVp9QvEKDLQwEr3J2TQk2qWVI+p5kY0fGzOpbLoNPSnCZPaFX8UH3Qt7Q0HtOd
 J8Ln+GL01XRZnt2m4NZlV8+uQqtTlCZOW/JMXpHX0YNozWYBz1cMVntqXT3lmg7+1rMoX5AHG0jWy
 oF6yEOMisI1V5E9qJ4O4Tx3fy1+Lh0b+pWhmE38wDzNxqlOiZ45xfrW+j8mi4TPEbDOEhfcYx5irL
 +gmekfhw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt2rQ-007QeS-6P; Tue, 15 Jun 2021 06:47:54 +0000
X-UUID: b6b68c1635154d80983d60be5ac49c2d-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xKS/7HXvz+d2gfv9Y2LU79ho8W4WaRcuU7f/RN/6hCs=; 
 b=tf0yVF2lAdf2HDkRkdkdP/jjo2LsXM0PPWx75B3To+LNlVNTA5KAkCaV37Q3641aKIluVdRypM5t7fa43J6SWI0SCwes7XEi8/iO5pZvPIqynTkCwaqOocgBFYDd/9QSAklLIw2G0f10HLqRYAOuQYOukw8XCIcocTGaAuLu1OI=;
X-UUID: b6b68c1635154d80983d60be5ac49c2d-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1932303871; Mon, 14 Jun 2021 23:47:39 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 23:47:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 14:47:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Jun 2021 14:47:23 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Matt Helsley
 <mhelsley@vmware.com>, Sami Tolvanen <samitolvanen@google.com>, Mark-PK Tsai
 <mark-pk.tsai@mediatek.com>, <peterz@infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v2] recordmcount: Correct st_shndx handling
Date: Tue, 15 Jun 2021 14:47:20 +0800
Message-ID: <20210615064720.21950-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_074751_745909_39FB86C6 
X-CRM114-Status: GOOD (  11.03  )
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

One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.

This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.

Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 scripts/recordmcount.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index f9b19524da11..ef9c3425f86b 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
 	unsigned long offset;
 	int index;
 
-	if (sym->st_shndx != SHN_XINDEX)
+	if (w2(sym->st_shndx) > SHN_UNDEF &&
+	    w2(sym->st_shndx) < SHN_LORESERVE)
 		return w2(sym->st_shndx);
 
-	offset = (unsigned long)sym - (unsigned long)symtab;
-	index = offset / sizeof(*sym);
+	if (w2(sym->st_shndx) == SHN_XINDEX) {
+		offset = (unsigned long)sym - (unsigned long)symtab;
+		index = offset / sizeof(*sym);
 
-	return w(symtab_shndx[index]);
+		return w(symtab_shndx[index]);
+	}
+
+	return 0;
 }
 
 static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
