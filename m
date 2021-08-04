Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C12C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B9660F38
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B9660F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49M/Zo0/HOViOB7UzxOjbtTwbcaoQtBqSIR2Gejz758=; b=u3/bv1gcXp7IkV
	EjH+WdmzC6Dja9Ldrv19NebNjzsYMgVkQPWLB7NaqWR9Hwoxr3lhhmRGiz0Tg+ul3HGhDqY1TYhNe
	ZlbhKc+v3SmhU82gW7vEX8jovuqUAb2rWi4ZSReQ9XFmKvLqU1/dMPA2+ocBzluUheGbi2FgvPf/H
	7d8dyWzVslliiXEVXfnwxIh4IVuqmfSqsmJVPHY3FIonoRzx0u0EXqu5c88eFJ3WsgqOcf2jxk2Vf
	X4EEeW9iIvVuhxe3fPv6HvOgc/y5cUQ2WhmhITwseet1GEnCT4ClHrnUTPWhRLT7utqhxi3Wj2cbm
	UksxMCPiIoCmUfNDtHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBD7j-005PGp-KJ; Wed, 04 Aug 2021 09:23:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCuu-005KVe-5p; Wed, 04 Aug 2021 09:10:25 +0000
X-UUID: 2b751f22f78a4446a4aeacb167e69142-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9LDpHozNn7dKIzhq2mSS8+9jqY4udNOKQJbJu5wzkcw=; 
 b=u2U5oeYBiJDk9EpG7p6UJHczFdwhffrJqKAOzlG5TgdUigQkLd2sxGy/yEw/LQrD6C+45bKUSB9oG1uNUescaiJjHvhDqKSQ/We98Bkb4iD3hQxvqr7/HVVwDNXenDZO7hxb4xb6lJAyT9s9JvJsCQGXa2dWLbUR9FlKcq0721w=;
X-UUID: 2b751f22f78a4446a4aeacb167e69142-20210804
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2028046496; Wed, 04 Aug 2021 02:10:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 02:10:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 17:10:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 4 Aug 2021 17:10:18 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v3 2/2] kasan, slub: reset tag when printing address
Date: Wed, 4 Aug 2021 17:09:57 +0800
Message-ID: <20210804090957.12393-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210804090957.12393-1-Kuan-Ying.Lee@mediatek.com>
References: <20210804090957.12393-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_021024_277571_08574C83 
X-CRM114-Status: GOOD (  12.54  )
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

The address still includes the tags when it is printed.
With hardware tag-based kasan enabled, we will get a
false positive KASAN issue when we access metadata.

Reset the tag before we access the metadata.

Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing metadata")
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Reviewed-by: Marco Elver <elver@google.com>
---
 mm/slub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index b6c5205252eb..f77d8cd79ef7 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -576,8 +576,8 @@ static void print_section(char *level, char *text, u8 *addr,
 			  unsigned int length)
 {
 	metadata_access_enable();
-	print_hex_dump(level, kasan_reset_tag(text), DUMP_PREFIX_ADDRESS,
-			16, 1, addr, length, 1);
+	print_hex_dump(level, text, DUMP_PREFIX_ADDRESS,
+			16, 1, kasan_reset_tag((void *)addr), length, 1);
 	metadata_access_disable();
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
