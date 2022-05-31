Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5oaucp1YRnXeMqOIG21/QiIJeYoBfMDn+8XKSsDhVrM=; b=ZagdKmhIgF7pPc
	a5rly8ocNaPa14IBshTHQ5ncYBk+7J4zHt5UV8ZddfU4lR2sKSsTMuCGmkVNMt4hyEYpPdt/tZD90
	s61JSUfjm07aXcp2gWlY6It1e/Rozyr9X6uztB8cgegv8wzPI95c1PKW+vgC2ExBMWcik5N9tatHO
	yesq2s5/wQGwkVo89G79L//8QcSDHTqFLBaAnXKJTYMNPu+aQJWYea6CJVNvA0jVlf+3h4PYu/iVZ
	l9r3Y6IwPlPy2oP3IYF3YMuYbMm+kfZA4pPx2Stqso/RuS1qGMKTwrsoL+5iAL+aKruaI5rjKfM8/
	ApuY/hqTqx/uWf5EYJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuWk-009Mva-Ur; Tue, 31 May 2022 05:34:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvuWa-009MuP-QQ; Tue, 31 May 2022 05:34:38 +0000
X-UUID: d423a2b69822446cb491f0db76e566cd-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:a0a61382-8078-4fbd-89f2-4ab0697e14b7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:24,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:24
X-CID-META: VersionHash:2a19b09,CLOUDID:ce37ee89-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: d423a2b69822446cb491f0db76e566cd-20220530
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1511843536; Mon, 30 May 2022 22:34:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 22:34:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 31 May 2022 13:34:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 May 2022 13:34:26 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: <robh+dt@kernel.org>, <frowand.list@gmail.com>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<kuan-ying.lee@mediatek.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>
Subject: [PATCH] scripts: dtc: fix a false alarm for node_name_chars_strict
Date: Tue, 31 May 2022 13:33:58 +0800
Message-ID: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_223436_927555_F80C112D 
X-CRM114-Status: GOOD (  11.23  )
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

The function check_node_name_chars_strict issues a false alarm when
compiling an overlay dts.

/fragment@0/__overlay__: Character '_' not recommended in node name

This workaround will fix it by skip checking for node named __overlay__.

Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
---
 scripts/dtc/checks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 781ba1129a8e..6ef4f2cd67b9 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -325,6 +325,11 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 {
 	int n = strspn(node->name, c->data);
 
+	if (streq(node->name, "__overlay__")) {
+		/* HACK: Overlay fragments are a special case */
+		return;
+	}
+
 	if (n < node->basenamelen)
 		FAIL(c, dti, node, "Character '%c' not recommended in node name",
 		     node->name[n]);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
