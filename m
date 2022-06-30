Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D91EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+LzNH3QfcIE7oxTDVd/PxwJu8sCyU6BPZLIBGwMYyo=; b=fUZH5u8tRJ0iOHLT2bYxzKXj5r
	eleGP1gwLM4bElnftcxj6ljPVcxa7Jxm6BEy1AfuOngTV7cXC+XsUSDq1+k3TbiqBDA1y333Hmsl6
	zUMvYhfpbfWo7F3bu1fhsPnLvu+BJ1nHwC5EMUYYWz4/aTwoyNT3j+7+SDajv0PSEaGW0aJhwSDoD
	aYsTYsVk1hG457d5LcpbnON8qcvzG8jYfKPgFVXw+8tJq17mtiTgYfRVhL69WUyR0GStEXIASGYUD
	iVoi3vaFeMAzCiuJYcfOjycomBY1hOXbQztU/M8hzVUKYr7eEolE9cwof1tNAK3JqZ86qRMkCId+k
	seRNfBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6riu-00Gelb-70; Thu, 30 Jun 2022 10:48:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rZE-00GaDn-MJ; Thu, 30 Jun 2022 10:38:38 +0000
X-UUID: e8ce9591fae14668bb752dc9d0666f7f-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:1b7c1eb8-c085-4d1d-878e-f921750ec0a8,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:706441d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e8ce9591fae14668bb752dc9d0666f7f-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 118666790; Thu, 30 Jun 2022 03:38:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 30 Jun 2022 17:47:03 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 30 Jun 2022 17:47:03 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <xiaoming.yu@mediatek.com>, Kees Cook <keescook@chromium.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Christophe
 Leroy" <christophe.leroy@csgroup.eu>, =?UTF-8?q?Andr=C3=A9=20Almeida?=
	<andrealmeid@igalia.com>, Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross
	<jgross@suse.com>, Haibo Li <haibo.li@mediatek.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Lecopzer Chen
	<lecopzer.chen@mediatek.com>
Subject: [PATCH 1/2] ANDROID: cfi: enable sanitize for cfi.c
Date: Thu, 30 Jun 2022 17:46:45 +0800
Message-ID: <20220630094646.91837-2-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094646.91837-1-haibo.li@mediatek.com>
References: <20220630094646.91837-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_033836_862510_8DC575C9 
X-CRM114-Status: GOOD (  11.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

currenly,cfi.c is excluded from cfi sanitize because of cfi handler.
The side effect is that we can not transfer function pointer to
other files which enable cfi sanitize.

Enable cfi sanitize for cfi.c and bypass cfi check for __cfi_slowpath_diag

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/Makefile | 3 ---
 kernel/cfi.c    | 8 +++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index a7e1f49ab2b3..a997bef1a200 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -40,9 +40,6 @@ KCSAN_SANITIZE_kcov.o := n
 UBSAN_SANITIZE_kcov.o := n
 CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
 
-# Don't instrument error handlers
-CFLAGS_REMOVE_cfi.o := $(CC_FLAGS_CFI)
-
 obj-y += sched/
 obj-y += locking/
 obj-y += power/
diff --git a/kernel/cfi.c b/kernel/cfi.c
index 08102d19ec15..456771c8e454 100644
--- a/kernel/cfi.c
+++ b/kernel/cfi.c
@@ -311,7 +311,7 @@ static inline cfi_check_fn find_check_fn(unsigned long ptr)
 	return fn;
 }
 
-void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
+static inline void __nocfi _run_cfi_check(u64 id, void *ptr, void *diag)
 {
 	cfi_check_fn fn = find_check_fn((unsigned long)ptr);
 
@@ -320,6 +320,12 @@ void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)
 	else /* Don't allow unchecked modules */
 		handle_cfi_failure(ptr);
 }
+
+void __cfi_slowpath_diag(u64 id, void *ptr, void *diag)
+{
+	/*run cfi check without cfi sanitize to avoid calling cfi handler recursively*/
+	_run_cfi_check(id, ptr, diag);
+}
 EXPORT_SYMBOL(__cfi_slowpath_diag);
 
 #else /* !CONFIG_MODULES */
-- 
2.25.1


