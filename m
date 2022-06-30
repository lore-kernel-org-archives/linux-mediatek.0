Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4550EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYkJoa/0UJo+7yqtZrgFOU7Q2onaxfGGKww/YiP4fKM=; b=oLaz818rgo/S6QPSbbPcbGN9ye
	YCIpbF54gzzVMod579UidO3Okm6NkJTKy+dKiyziuhsi1AHiMlC/2Z4XkfhrQQYUkNVCLWMzVI6Uq
	MEKDipBKl/eXtJgDaRjkYNu5okMan+EtXjaH75Y+y8G0cbQRLiQmFnQ6cNNa9EXZvapXnT4/lWTxU
	GYXytuM9X/Qn3Jz3fM9k5Braid/2UXKO3BUnILOI3ZLarKH4hMq/YSZlpKSnGEH+BhGqx5ykduZFT
	AqxKgXD39RJxwmuj6TbPpTOoRdfQIL5a94i16rPqL9IJ3q0MCV9dSXc328lIa0vbDqxHvTtU1h9HK
	VfPnwTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rFE-00GVVf-Az; Thu, 30 Jun 2022 10:17:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rFB-00GVTh-Hp; Thu, 30 Jun 2022 10:17:54 +0000
X-UUID: 0f3ea2dce78049168a18f854e41e2e96-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:6880349b-6e07-44f6-a9ec-3c1b560981b3,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:de6b3186-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0f3ea2dce78049168a18f854e41e2e96-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 355211776; Thu, 30 Jun 2022 03:17:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 30 Jun 2022 17:47:06 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 30 Jun 2022 17:47:05 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <xiaoming.yu@mediatek.com>, Kees Cook <keescook@chromium.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, =?UTF-8?q?Andr=C3=A9=20Almeida?=
	<andrealmeid@igalia.com>, Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross
	<jgross@suse.com>, Haibo Li <haibo.li@mediatek.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Lecopzer Chen
	<lecopzer.chen@mediatek.com>
Subject: [PATCH 2/2] ANDROID: cfi: free old cfi shadow asynchronously
Date: Thu, 30 Jun 2022 17:46:46 +0800
Message-ID: <20220630094646.91837-3-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094646.91837-1-haibo.li@mediatek.com>
References: <20220630094646.91837-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_031753_622675_8624FBE9 
X-CRM114-Status: GOOD (  13.83  )
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

Currenly, it uses synchronize_rcu() to wait old rcu reader to go away
in update_shadow.In embedded platform like ARM CA7X,
load_module blocks 40~50ms in update_shadow.
When there are more than one hundred kernel modules,
it blocks several seconds.

To accelerate load_module,change synchronize_rcu to call_rcu.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/cfi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/cfi.c b/kernel/cfi.c
index 456771c8e454..a4836d59ca27 100644
--- a/kernel/cfi.c
+++ b/kernel/cfi.c
@@ -43,6 +43,8 @@ typedef u16 shadow_t;
 struct cfi_shadow {
 	/* Page index for the beginning of the shadow */
 	unsigned long base;
+	/* rcu to free old cfi_shadow asynchronously */
+	struct rcu_head rcu;
 	/* An array of __cfi_check locations (as indices to the shadow) */
 	shadow_t shadow[1];
 } __packed;
@@ -182,6 +184,13 @@ static void remove_module_from_shadow(struct cfi_shadow *s, struct module *mod,
 	}
 }
 
+static void _cfi_shadow_free_rcu(struct rcu_head *rcu)
+{
+	struct cfi_shadow *old = container_of(rcu, struct cfi_shadow, rcu);
+
+	vfree(old);
+}
+
 typedef void (*update_shadow_fn)(struct cfi_shadow *, struct module *,
 			unsigned long min_addr, unsigned long max_addr);
 
@@ -211,11 +220,10 @@ static void update_shadow(struct module *mod, unsigned long base_addr,
 
 	rcu_assign_pointer(cfi_shadow, next);
 	mutex_unlock(&shadow_update_lock);
-	synchronize_rcu();
 
 	if (prev) {
 		set_memory_rw((unsigned long)prev, SHADOW_PAGES);
-		vfree(prev);
+		call_rcu(&prev->rcu, _cfi_shadow_free_rcu);
 	}
 }
 
-- 
2.25.1


