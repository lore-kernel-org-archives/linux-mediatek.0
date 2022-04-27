Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klXrS3h4CYcdeLpS97hYFRBM8vmytjfPFAoCoe4IfUQ=; b=XodATgN5dtVIaq
	cEFsPZuTyBRMTxo5/OBVW/9R1F4OXm5yZ537vxY+bfq9mCGtfSQHj41521QAPmNwD6lvrJcTiXYer
	eQqsXTlCYDAeCeoJ8bXV/WkeC7GfyyLxhwLuf7bF76rrKm+EtRTSE18t+GulAiOfeIJur/5RXcT4J
	nKUACU6sfH+EArYGDpZbm+tRJ2KCiR+cLk0c4B9GkGQtqKRqU6OPiPJ7Z3gMQjNxDDCcrXHprrBQC
	Br86Rp651mR43NqFeT5EazEaT6ZTqeV93dbSHvkxFeLp1tOHPlXVOcvnrmHvue2Kk0VQzwxFGIGKU
	PITIjE9Ipt7FSCiSo6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcDp-000KGW-Jz; Wed, 27 Apr 2022 07:36:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcDm-000KD6-5l
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 07:36:24 +0000
X-UUID: 0519c9b3746a486ba4d3fdf150b2a6bc-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:dfdda931-5045-4a79-a8f3-258e61dbcadd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3a9fde2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0519c9b3746a486ba4d3fdf150b2a6bc-20220427
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1139073686; Wed, 27 Apr 2022 00:36:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:36:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 15:36:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 15:36:10 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: Luis Chamberlain <mcgrof@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-modules@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <yj.chiang@mediatek.com>, <lecopzer.chen@mediatek.com>, <atomlin@redhat.com>
Subject: [RESEND PATCH] module: show disallowed symbol name for inherit_taint()
Date: Wed, 27 Apr 2022 15:36:06 +0800
Message-ID: <20220427073606.29752-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003622_278679_C039F61D 
X-CRM114-Status: GOOD (  12.79  )
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

The error log for inherit_taint() doesn't really help to find the
symbol which violates GPL rules.

For example,
if a module has 300 symbol and includes 50 disallowed symbols,
the log only shows the content below and we have no idea what symbol is.
    AAA: module using GPL-only symbols uses symbols from proprietary module BBB.

It's hard for user who doesn't really know how the symbol was parsing.

This patch add symbol name to tell the offending symbols explicitly.
    AAA: module using GPL-only symbols uses symbols SSS from proprietary module BBB.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 kernel/module/main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 05a42d8fcd7a..a90084c44c55 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1049,20 +1049,20 @@ static int verify_namespace_is_imported(const struct load_info *info,
 	return 0;
 }
 
-static bool inherit_taint(struct module *mod, struct module *owner)
+static bool inherit_taint(struct module *mod, struct module *owner, const char *name)
 {
 	if (!owner || !test_bit(TAINT_PROPRIETARY_MODULE, &owner->taints))
 		return true;
 
 	if (mod->using_gplonly_symbols) {
-		pr_err("%s: module using GPL-only symbols uses symbols from proprietary module %s.\n",
-			mod->name, owner->name);
+		pr_err("%s: module using GPL-only symbols uses symbols %s from proprietary module %s.\n",
+			mod->name, name, owner->name);
 		return false;
 	}
 
 	if (!test_bit(TAINT_PROPRIETARY_MODULE, &mod->taints)) {
-		pr_warn("%s: module uses symbols from proprietary module %s, inheriting taint.\n",
-			mod->name, owner->name);
+		pr_warn("%s: module uses symbols %s from proprietary module %s, inheriting taint.\n",
+			mod->name, name, owner->name);
 		set_bit(TAINT_PROPRIETARY_MODULE, &mod->taints);
 	}
 	return true;
@@ -1094,7 +1094,7 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 	if (fsa.license == GPL_ONLY)
 		mod->using_gplonly_symbols = true;
 
-	if (!inherit_taint(mod, fsa.owner)) {
+	if (!inherit_taint(mod, fsa.owner, name)) {
 		fsa.sym = NULL;
 		goto getname;
 	}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
