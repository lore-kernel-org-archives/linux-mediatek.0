Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2D9EE49A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 03:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhXji772hLI0yuv6/flR7J8iZD7soc0SkuwbZh8VPV4=; b=jCQw7uaasUTpu56CHCkp4mf0MC
	km+FBLaEfj/rHuMQ7jpzexye3wCYN1lhHoQmIqewE2PDiSCjbdzWA7MI7srPX5NxMNYlh3+gt+oO9
	EbvKHSpiloJEP+u31uT+JVSMJcaUcCQP+Mduxujbubg31RLg4GeA3oJ+8TNuFBbB1lEQhURy/0/Fq
	nXdtfaG0v+dpHbuqY5Q3f2vqr8h3eIhMXEqipDzSDySeONNuobbI7RaZJBkFdzukAATuGRbn/llNe
	Y5GDPxNaVppbP519QVlD0lTsJsXKMWNrNAhdQYZacbNg5fIVcDOTT0rZnaBhAHNt0eNY2vK0ODoUw
	KbxVf1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQi-00H9Tx-1v;
	Mon, 11 Sep 2023 03:17:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQQ-00H9AN-0v;
	Mon, 11 Sep 2023 03:17:27 +0000
X-UUID: b5c302c0505111ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jhXji772hLI0yuv6/flR7J8iZD7soc0SkuwbZh8VPV4=;
	b=uh1ktgHAzUKMf0onDr0hujKvPkE3j9kc6pjv23OMFRo2bu/o2MdhaobLXBebHxBgN3t8VqvRkuYfhCTQKgGrykzIRoxJkOmJXhM6XnsiuF4G+uwz0msheF9yHPIufjqLFDlqnsUGQ9Rr4Gr8HVfhFkNvh6LYs5tIWgnjwCAn1bU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:337c812b-caab-4bf7-b6f8-cbcb9453934e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:80518aef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5c302c0505111ee86758d4a7c00f3a0-20230910
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1806339630; Sun, 10 Sep 2023 20:17:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 11:16:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 11:16:41 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v6 20/20] drm/mediatek: Set DPI input to 1T2P mode
Date: Mon, 11 Sep 2023 11:16:30 +0800
Message-ID: <20230911031630.12613-21-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911031630.12613-1-shawn.sung@mediatek.com>
References: <20230911031630.12613-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.788100-8.000000
X-TMASE-MatchedRID: PHWFXbsmkDRF/TNFimjSuEOZWaJBszmq3zhylsE9dsyOUV82NDH4AlO4
	BD7nLMxnThbvLLI8RvNq7k1NHAqvK5sYdIGP6PlZjtK7dC6UBnl9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4IzsAVzN+Ov/stIQSbsaENgdNt2l9xnSaYRy2fvzjG4gKnxMQcCdlcTFN1W
	7aDGzFOw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.788100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7D04BE8CC1289EA185DC848879D82B244F00FB84F227E88D924EAC7D2165EF532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_201722_360826_7EAC4A9C 
X-CRM114-Status: GOOD (  11.25  )
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

DPI input is in 1T2P mode on MT8195,
align the setting of MT8188 with it,
otherwise the screen will glitch.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2f931e4e2b60..c6ee21e275ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -963,7 +963,7 @@ static const struct mtk_dpi_conf mt8188_dpintf_conf = {
 	.output_fmts = mt8195_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
 	.pixels_per_iter = 4,
-	.input_2pixel = false,
+	.input_2pixel = true,
 	.dimension_mask = DPINTF_HPW_MASK,
 	.hvsize_mask = DPINTF_HSIZE_MASK,
 	.channel_swap_shift = DPINTF_CH_SWAP,
--
2.18.0


