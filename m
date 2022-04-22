Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA1DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vxg8JrziNcv4CgodthAcFTV2hkAmM5l5/sJ8LPnAoBQ=; b=l4YClW0oQtlLfW
	YU5e04nW9TU4eVwZ5aVcLfqBQXjw8oVVQec0vgzXO2ivMALIYc8IjmICBgsuyncjE3XXBXW+uc1zz
	yCkHefKweFYj48I1DWyjyC/mbCFXPueRcE3+z1LrY9IEfXtBVMmdCbXmYaNe7YtmDz27Smnc1UjTx
	Ka58lU4JvFWC1RXSlnt6Bg7SWAhTqEAy3G6rpne0IOuXaQ1CZGGGt1OMUlzRIDLBStRAEfxiUX4mP
	5FGf6dfDXEuC8QwvB/MY/6oxcF7F84KvhuoY7z5xRBoKk0JK7VWKB7p9xsKi6Jr3WvmamZuzEo9Ja
	x78CHuFk4puFvbjMkwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhjDE-00FkpQ-ET; Fri, 22 Apr 2022 02:40:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhjCv-00FkhT-BC; Fri, 22 Apr 2022 02:39:42 +0000
X-UUID: 788e73b8a0f84f66a2852499c918e0cd-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c4c7f2e4-fa8a-41ea-98ff-d2af31a5e609, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c5c8b5ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 788e73b8a0f84f66a2852499c918e0cd-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1395933462; Thu, 21 Apr 2022 19:39:28 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:39:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 10:39:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 10:39:25 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v1 2/2] mailbox: mediatek: support mt8186 adsp mailbox
Date: Fri, 22 Apr 2022 10:39:09 +0800
Message-ID: <20220422023909.6584-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20220422023909.6584-1-tinghan.shen@mediatek.com>
References: <20220422023909.6584-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_193941_440603_BD8B6EF2 
X-CRM114-Status: GOOD (  10.75  )
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

Add support of mt8186 adsp mailbox.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/mailbox/mtk-adsp-mailbox.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
index 5e7378090c7b..14bc0057de81 100644
--- a/drivers/mailbox/mtk-adsp-mailbox.c
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -149,6 +149,13 @@ static int mtk_adsp_mbox_probe(struct platform_device *pdev)
 	return devm_mbox_controller_register(dev, &priv->mbox);
 }
 
+static const struct mtk_adsp_mbox_cfg mt8186_adsp_mbox_cfg = {
+	.set_in		= 0x00,
+	.set_out	= 0x04,
+	.clr_in		= 0x08,
+	.clr_out	= 0x0C,
+};
+
 static const struct mtk_adsp_mbox_cfg mt8195_adsp_mbox_cfg = {
 	.set_in		= 0x00,
 	.set_out	= 0x1c,
@@ -157,6 +164,7 @@ static const struct mtk_adsp_mbox_cfg mt8195_adsp_mbox_cfg = {
 };
 
 static const struct of_device_id mtk_adsp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8186-adsp-mbox", .data = &mt8186_adsp_mbox_cfg },
 	{ .compatible = "mediatek,mt8195-adsp-mbox", .data = &mt8195_adsp_mbox_cfg },
 	{},
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
