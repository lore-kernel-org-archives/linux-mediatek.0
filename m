Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68300C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 372E660698
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 372E660698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U2F5gk/UPyB77wVodpdo5pbut5VqofxcImqfhIafTM=; b=Vt/TFzhBl9Vazh
	gvqceCJIgUDzWPQCmclrGoiOpRMzdlX+H9oaZQP47+kODcW3to6SShP+uYGDjEf3lZ2O0hIjjVFZk
	gK483q5BCM3ofmzrY/oIRHWILa3Gi+B8dU2sNPncTZHtVVZr4Nzx1CuoajJghmsJbGgQciolw5ek3
	o2ddQCCASeB2+qzUYsbIBLIfnnhkIbMncpFiG44/jDaher1wYazQUfz01RZnnQkdKf5E3jZOCMz00
	Xya7IgWBD0UX960UvDhPtkql7E24gOCag5izaIwUnziesWBw0LtE90n+JaHerMMxJbyI7S82dZTZm
	qqwPfytrtCi2lctVjdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvOLp-004Sir-JE; Mon, 21 Jun 2021 18:08:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvO89-004LJO-Of; Mon, 21 Jun 2021 17:54:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EDAF60C41;
 Mon, 21 Jun 2021 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624298081;
 bh=+6wiNLqqnTiDXKehP3jGCjGTfB/a5ux91Dp8LbOhIfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCeeC9xTJkhNKj47Mr+zBc1JDoEOVQuSx3Zzo0WNvTBF/vBKrgL86UE4R9HzxKU/e
 qR+1TLR/KNiyZD4FlyyGmiMAj578xhQc35PhbwLU+YsCNkMHPVei9Q0cZX3fuBjRrt
 iwRn9fnY6BBJoRiAM1W/VNRo4mwyRmgjWS/VbgZLJS8Oxr0cGSN8cqc1xZbluloI4G
 j1PfEuQK6YjrefWCbohBV75+PziPdX6ARMhQBXUrm71D0rLdyCB4XwmKTcXW1MSlOr
 Xr18UBAeX6wfHGC5eAd91vitA0Wc0oGGc0ZxOo0Dmlu46fB5cAJLxbe+qqtznYKOH7
 tv9zWFt9UkHQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 23/26] recordmcount: Correct st_shndx handling
Date: Mon, 21 Jun 2021 13:53:56 -0400
Message-Id: <20210621175400.735800-23-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621175400.735800-1-sashal@kernel.org>
References: <20210621175400.735800-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_105441_868323_A787EEA8 
X-CRM114-Status: GOOD (  11.13  )
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

From: Peter Zijlstra <peterz@infradead.org>

[ Upstream commit fb780761e7bd9f2e94f5b9a296ead6b35b944206 ]

One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.

This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.

Link: https://lore.kernel.org/lkml/20210607023839.26387-1-mark-pk.tsai@mediatek.com/
Link: https://lkml.kernel.org/r/20210616154126.2794-1-mark-pk.tsai@mediatek.com

Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
[handle endianness of sym->st_shndx]
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/recordmcount.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index f9b19524da11..1e9baa5c4fc6 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -192,15 +192,20 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
 				 Elf32_Word const *symtab_shndx)
 {
 	unsigned long offset;
+	unsigned short shndx = w2(sym->st_shndx);
 	int index;
 
-	if (sym->st_shndx != SHN_XINDEX)
-		return w2(sym->st_shndx);
+	if (shndx > SHN_UNDEF && shndx < SHN_LORESERVE)
+		return shndx;
 
-	offset = (unsigned long)sym - (unsigned long)symtab;
-	index = offset / sizeof(*sym);
+	if (shndx == SHN_XINDEX) {
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
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
