Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CB7C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0C661289
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0C661289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U2F5gk/UPyB77wVodpdo5pbut5VqofxcImqfhIafTM=; b=p9HrjTVZuEQBVh
	BluEBiU+X2dPxwma5E7IHSG9nDraUJ95qSJT/7EexAUbWelibBVpAeFRu4g29JaaVQAV5Zh2uDHVY
	6CJKgmXAb9QVcBqJZ0qwGvIbxbU1g0EHUxWz+5pgAQslKj4MuWBv8J37xCCVksZCGuwYUqZj7/MAO
	R9X5f/a2GhujCM0A/paWTtapKZ225I32pHxkvB/x/rCtWc/Y5VJNnVD7otrP2IHMX9DDVL1y7c3rP
	0kyLRJ0YMVl0iOaCTb2RJHK6hCtQW9lm2cWxbo6YvhRL6zHsQWXLJ1TMAlcJjl+SaYwiqqT5lEZ6A
	ZtCQ2nnfNVZsZQ7NrQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvOGd-004Pvz-GB; Mon, 21 Jun 2021 18:03:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvO7K-004KnE-V5; Mon, 21 Jun 2021 17:53:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4CBC613CC;
 Mon, 21 Jun 2021 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624298030;
 bh=+6wiNLqqnTiDXKehP3jGCjGTfB/a5ux91Dp8LbOhIfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CEGnOgVpfewmD36UYHWPYPgTNvp0hMk7zWKD8YK3BtAVomihJ4aBwvyBr83ZtuRFD
 ycI0EFnXxf2+q/+uqzTHru3YDzpbhbzzLH9+sAcAaGZgyAQe72kkLUfInCzoA4KtyB
 gvG59WOF34Vd5cNI+hvcgMTS49WE/E1TPCl0EJpSMX9Q3XKiv7dU4O6JFwh8o2BTeB
 ndpLVx/nCGEKliURz1Vpv9HdeHVP0AI7g4ihrl2SJYfBHkZuOl8aAalI8ZR/B18fQJ
 Lc9wHagDnBykEahOp4MfX40VzqoQWSRoAsTa4L+dmq/d5g9l/eUfFmHmXpgAHPgEfG
 tzRL5xFSnpERg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 32/35] recordmcount: Correct st_shndx handling
Date: Mon, 21 Jun 2021 13:52:57 -0400
Message-Id: <20210621175300.735437-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621175300.735437-1-sashal@kernel.org>
References: <20210621175300.735437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_105351_074556_78EC00A7 
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
