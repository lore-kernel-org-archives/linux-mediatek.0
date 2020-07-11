Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B89C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEF020725
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/AtBRb9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F4Qr2XmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BEF020725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dfNt5iRkHdnHN/sIz8pRAkGdldPTHyagDqAw+bybJ38=; b=h/AtBRb9TQmT7obTtCPh2sCu4
	7wBizLXQpYMUT+Rzzr9KBGjVr3ybNlNnUvoloLxwwTcVOYkIv2sQ38tun8oPAtpkvLq4T6j/1Be7D
	XmVbCZ2hO03BFUTsX46ovEaavRgVGAo0SbS7CTOowfmy2rMt4Vu78bcFysO8tHDW/ZZb6V6bY/rbp
	9Gh50vKV/bgHo/ee6b8rw/y+D5QpMSSycwAtAGofqHoPKS2Ib57MuiW1a9CQlvM4PaoLJt117Jp24
	mTF0dxFogYS+OjmfZMQMng5u3Eh5IkqD7alcKbftZr2ea31NbndvtJLlgp7KKgGg/wEGolGQ4/Xs1
	s4RxwfX1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9YN-0004xD-PH; Sat, 11 Jul 2020 07:04:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9VB-0002m0-9t; Sat, 11 Jul 2020 07:00:50 +0000
X-UUID: a494ea241ef44eb6b92e38bc891cc6f5-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XFYjQD+5gyhYkftQ2TMlioSGdoG7pjkq+qUmw2l1IQM=; 
 b=F4Qr2XmYcfcbzeQap0YlYXsdduLIraTbaS1iazgn1QABfxe9596THcNCQLXx063Ap/6/NKIR/jbbOQsxT/L9B/+StJwSCI4BLAtnke2Sd9XQyI1yoCewMlpzBInVlygixDQ+Na+YQubH2MYjYbKxKiHBepPrFajfrCsYAULBLZI=;
X-UUID: a494ea241ef44eb6b92e38bc891cc6f5-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1454991313; Fri, 10 Jul 2020 23:00:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 23:52:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:52:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:52:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 21/21] memory: mtk-smi: Add mt8192 support
Date: Sat, 11 Jul 2020 14:48:46 +0800
Message-ID: <20200711064846.16007-22-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_030049_673286_1EA03C16 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt8192 smi support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index f2f6100c74ef..5d0268630e70 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -252,6 +252,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 				      /* IPU0 | IPU1 | CCU */
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+};
+
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{
 		.compatible = "mediatek,mt8173-smi-larb",
@@ -269,6 +273,10 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 		.compatible = "mediatek,mt8183-smi-larb",
 		.data = &mtk_smi_larb_mt8183
 	},
+	{
+		.compatible = "mediatek,mt8192-smi-larb",
+		.data = &mtk_smi_larb_mt8192
+	},
 	{}
 };
 
@@ -401,6 +409,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 		    F_MMU1_LARB(7),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
+	.gen      = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(6),
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{
 		.compatible = "mediatek,mt8173-smi-common",
@@ -418,6 +433,10 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 		.compatible = "mediatek,mt8183-smi-common",
 		.data = &mtk_smi_common_mt8183,
 	},
+	{
+		.compatible = "mediatek,mt8192-smi-common",
+		.data = &mtk_smi_common_mt8192,
+	},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
