Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB580C4743E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 02:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CE2611ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 02:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CE2611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=igDiIa70b6lfZt0xy2Ov8FXUpfkI1RS7ScjkyM6ptDE=; b=WPqYuj1Q0gddQE
	gZA0F5BTm5aZtw7RczULNSHGB1SrLP9JaHR66FDbp1+sbqdgiDKUsfuFyx5qW/RHWxrEd1wxjchF1
	okiE/S1EPStew3NBFqkyen4YJyYH+TtlzP9dULBT0qfCtQaqheTGnzDJ2KKNA6t7Dvtv1Ar0HvAkt
	pDatV3OL0KRdE5NFNZzMmlaCAsveNFrbpCf7CqtXo5NvjGJSfWZfiPYb2YtX73aWtJtYm5JEYI2Bv
	Lh1zF7xuo9YjqcY+UTKdp/p84RBxRxdeewDBnOBH7shjYYTDfLngSVKv6tPbUwwtFJeVjaXpL1AOS
	BXIAVpysfxe6HsvcnmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq5AR-001Gwr-BO; Mon, 07 Jun 2021 02:39:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq5AM-001Gvz-6P; Mon, 07 Jun 2021 02:39:06 +0000
X-UUID: a6e5b89ba8a64a1db6a72b52bdf69b48-20210606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Hq1TF7sT6YLK1IHicbhyq0ApPNIyetpTQkZRsTt3g88=; 
 b=XcpHbr8ANijJYJr4rntSueWZ+bjvPZhhVx4MmkwlvexbECW1v4Knir3upxPGXLGVs6NrUpxbIE1nd9KInCnpUVckyxASG0rDQftqw9OXcKnCQLeX+lbqinwLVaNDD9EAsMVVoW72DLiO6S8+oFOr8QucB9Uq5Z7aWjP3j3i5xh4=;
X-UUID: a6e5b89ba8a64a1db6a72b52bdf69b48-20210606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1822482735; Sun, 06 Jun 2021 19:38:58 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 19:38:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 10:38:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 10:38:48 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <rostedt@goodmis.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, Matt Helsley <mhelsley@vmware.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH] recordmcount: avoid using ABS symbol as reference
Date: Mon, 7 Jun 2021 10:38:39 +0800
Message-ID: <20210607023839.26387-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_193903_072504_00C0A475 
X-CRM114-Status: GOOD (  10.62  )
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

Avoid using ABS symbol, which won't be relocate, as reference.

On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).

Section Headers:
[Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
[65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
[65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8

find_secsym_ndx, which use r_info in rela section to find the reference
symbol, may take ABS symbol as base.

Symbol table '.symtab' contains 453285 entries:
   Num:    Value          Size Type    Bind   Vis       Ndx Name
     6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count

Which cause an invalid address in __mcount_loc.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 scripts/recordmcount.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index f9b19524da11..9b69167fb7ff 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
 	for (symp = sym0, t = nsym; t; --t, ++symp) {
 		unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
 
+		/* avoid absolute symbols */
+		if (symp->st_shndx == SHN_ABS)
+			continue;
+
 		if (txtndx == get_symindex(symp, symtab, symtab_shndx)
 			/* avoid STB_WEAK */
 		    && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
