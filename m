Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D920CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 07:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A247161503
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 07:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A247161503
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O84YLU1mu9hziBvNLTn/IoiQDgKoH2ws+yA6IHUVH4U=; b=MaCGDTU+LTfyuz
	dptIcWaeh7nqMAQ7Fpgq9+btUlvsec0vYIWXu7RfRUhr8IN3Q9C12axweE/gHj95YOaft5j9gmQ+1
	PbcIeHkEdrfuob+X/pvWegx+B6TH5GbQvT1uJNbWYSfo+gnQbEUx8Lt0/JHrft3EkQv6XAMqSzzUc
	iykJUVmZeG1GkpwDIz4Xh7gPFEtqI/It0kQENxR6x7Z0nBGLdd85UyDpOt0r2kZd+LpoW4PkJqVHa
	nvqipfI6iMr/ZMG1fU5OycsRNYR6pGJVGqQPciOzijWukPncfen4qkP4OyNyfX/d4r6P7vTqCzHpe
	o5gcdiP2qoQuc+Oy3Isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXeRS-009Eex-GS; Tue, 05 Oct 2021 07:00:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXeRQ-009Edy-Eb; Tue, 05 Oct 2021 07:00:45 +0000
X-UUID: d7ccb3cf6c9e4fbbbef34f95a22e9f71-20211005
X-UUID: d7ccb3cf6c9e4fbbbef34f95a22e9f71-20211005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765693782; Tue, 05 Oct 2021 00:00:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 00:00:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Oct 2021 15:00:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Oct 2021 15:00:18 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>,
 <matthias.bgg@gmail.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] clk: make clk_core_lookup faster by using clk name hash
Date: Tue, 5 Oct 2021 14:59:49 +0800
Message-ID: <20211005065948.10092-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_000044_517679_7ECAD5EF 
X-CRM114-Status: GOOD (  12.28  )
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

Compare hash value before strcmp the full name to make
clk_core_lookup faster.

It make clk driver probe 30 percent faster on the platform
have 1483 registered clks and average clock name length 20.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/clk/clk.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..d5f65fda3db8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -89,6 +89,7 @@ struct clk_core {
 	struct hlist_node	debug_node;
 #endif
 	struct kref		ref;
+	unsigned int		hash;
 };
 
 #define CREATE_TRACE_POINTS
@@ -292,16 +293,17 @@ struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw)
 EXPORT_SYMBOL_GPL(clk_hw_get_parent);
 
 static struct clk_core *__clk_lookup_subtree(const char *name,
+					     unsigned int hash,
 					     struct clk_core *core)
 {
 	struct clk_core *child;
 	struct clk_core *ret;
 
-	if (!strcmp(core->name, name))
+	if (hash == core->hash && !strcmp(core->name, name))
 		return core;
 
 	hlist_for_each_entry(child, &core->children, child_node) {
-		ret = __clk_lookup_subtree(name, child);
+		ret = __clk_lookup_subtree(name, hash, child);
 		if (ret)
 			return ret;
 	}
@@ -313,20 +315,22 @@ static struct clk_core *clk_core_lookup(const char *name)
 {
 	struct clk_core *root_clk;
 	struct clk_core *ret;
+	unsigned int hash;
 
 	if (!name)
 		return NULL;
 
+	hash = full_name_hash(NULL, name, strlen(name));
 	/* search the 'proper' clk tree first */
 	hlist_for_each_entry(root_clk, &clk_root_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
+		ret = __clk_lookup_subtree(name, hash, root_clk);
 		if (ret)
 			return ret;
 	}
 
 	/* if not found, then search the orphan tree */
 	hlist_for_each_entry(root_clk, &clk_orphan_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
+		ret = __clk_lookup_subtree(name, hash, root_clk);
 		if (ret)
 			return ret;
 	}
@@ -3827,6 +3831,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		goto fail_name;
 	}
 
+	core->hash = full_name_hash(NULL, core->name, strlen(core->name));
 	if (WARN_ON(!init->ops)) {
 		ret = -EINVAL;
 		goto fail_ops;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
