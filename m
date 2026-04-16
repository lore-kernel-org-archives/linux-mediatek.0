Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7626CF433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B68aimr3MW+DGfkU890XtByEsPIhj3U3IP740Hbae8M=; b=NhCzP+iPTsekKJ1F49LXMFa5w0
	Iy0RBpHbm/4ZKu+QwM5Y48oTFYg4PmzCJ4TtWFmCtjSb4xMb9K5gIvtgesAcJmZxtCWEQ06yCREs3
	2GgVlD6FHntLQVoE+M4LrNonR8/tyA3aT6b5U6FpZeFRgPgGQylKXZhk1/cxuU0nSdOhC2J5g1+39
	/9aVuwC//NLyHR+ifZHpEk7cqFgntp4wDR2pZBvJqLxT8R1tPeVwPnsEUwuyNLAsHXqt9AEHK772g
	YuuCya8n7vL/JOrnXxdXVK/rCAIo48brQhYSl4pmeF/XM6xriZ5IejattOn2mAUp/p56TQOUQADA1
	PEcpPzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDAL-00000001uPd-2Mnv;
	Thu, 16 Apr 2026 03:13:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDAD-00000001uIT-2h9H;
	Thu, 16 Apr 2026 03:13:10 +0000
X-UUID: 2f874842394211f1a6de359d7043e138-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B68aimr3MW+DGfkU890XtByEsPIhj3U3IP740Hbae8M=;
	b=p3Pmn51dGRUQJQuYYTRyO6g1BaNMvG1VJbqKGD4oivDga+vr/TNePNHN0alQuIXKoarYmFV9ZGr0sx8Xhr5+OSMnzQNFrauSS5l4USCVmcj0c0zjrzPHcdC3XAD9EbGaGj51EjnDnIVoRZQ263O7iQPZNYG8TYCiIe+HE2py5Zw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7df6cc48-4c58-48d5-a977-bfba16477035,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:a1b2ead5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2f874842394211f1a6de359d7043e138-20260415
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 34914838; Wed, 15 Apr 2026 20:13:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:13:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:13:02 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 5/6] soc: mediatek: mtk-devapc: Add support for MT8196 DEVAPC
Date: Thu, 16 Apr 2026 11:12:08 +0800
Message-ID: <20260416031231.2932493-6-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_201309_683454_A1255AA0 
X-CRM114-Status: GOOD (  10.68  )
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

Add support for MT8196 DEVAPC, MT8196 DEVAPC debug registers are
version 3 and add compatible for MT8196

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 824b49613c5a..0f828028bdb4 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -324,6 +324,11 @@ static const struct mtk_devapc_data devapc_mt8189 = {
 	.regs_ofs = &devapc_regs_ofs_ver3,
 };
 
+static const struct mtk_devapc_data devapc_mt8196 = {
+	.version = 3,
+	.regs_ofs = &devapc_regs_ofs_ver3,
+};
+
 static const struct of_device_id mtk_devapc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt6779-devapc",
@@ -334,6 +339,9 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
 	}, {
 		.compatible = "mediatek,mt8189-devapc",
 		.data = &devapc_mt8189,
+	}, {
+		.compatible = "mediatek,mt8196-devapc",
+		.data = &devapc_mt8196,
 	}, {
 	},
 };
-- 
2.45.2


