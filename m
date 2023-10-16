Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C15ACDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCOsj76dgWXIufaJU8FRePH2fbO5UXsgJppFmAnbrwU=; b=w7AhXkBA68wW9dKb/I5lxUspS7
	QeYkQB5wzySjju1AyCY/1SoKqZz+A+tj8JJQtbksx+eED9txBYSk1I1BiLuHuDZgTUJYuYsbnwoxT
	/a0HtS/ZGvfqHsnAhYrHwbvMeu1NZc5vvbgANhluLvNlmUHRykqzrYG3M9Yxc+QDs0rnluJJhLgHA
	vn8m3TPyZu+R0AnAoCWn8IuWXsR7nKB4jdzft02FhCgAPVpqB6lImPP5HMQXgsndKceY2U20OSo4j
	XDU1PiZmhLpuvWksitnjuH5bE0/48xzHq7QvO8KYVlkj98/EGdCpxFkhHZPeMMA67RgdcQfGB+bHP
	Rj5rU0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL2P-009MUg-1E;
	Mon, 16 Oct 2023 10:41:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL1s-009M2b-13;
	Mon, 16 Oct 2023 10:41:01 +0000
X-UUID: 79fa0d306c1011ee86758d4a7c00f3a0-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vCOsj76dgWXIufaJU8FRePH2fbO5UXsgJppFmAnbrwU=;
	b=lrtgc/4hMSkKT44TikbWyJXXbAdOKcJr6XrESKeXwk5JN3YzXoW0Nzwzbp/FmnGtEU5igb5La33b/UrrOMh0/mImg9rvzDYG8HcvEPaa99hLKwudpUJCCtlp6s6DP24GCgDtpMPCOYAWa1XeokjZLA6oxzCBWIY5Rrk8n8iNujo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:9f85d7eb-22d7-429a-9440-97efabb7a3cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:2396fcbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 79fa0d306c1011ee86758d4a7c00f3a0-20231016
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1865563757; Mon, 16 Oct 2023 03:40:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:14 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 12/23] drm/mediatek: Refine device table of OVL adaptor
Date: Mon, 16 Oct 2023 18:39:59 +0800
Message-ID: <20231016104010.3270-13-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.148300-8.000000
X-TMASE-MatchedRID: cDLMSbYnlGoeszLHPCQb9B+WEMjoO9WWCt59Uh3p/NVcKZwALwMGs6yJ
	SPZ1MHFJ6rlI+AD5R5wSqo3ZUfrHh5Coy9iDotiwngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIx1F
	PlNAAmcBdM8mW4r2vRVtLCVao+MYbyrFihpgmG1IMkGjVAOsNqZ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.148300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 53295935A9798719FB60985F9C3DAB7AEBAB8A4E96FA3CA9D57E8F73ED130AA02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_034056_391467_88E0E06F 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

- Adjust indentation to align with other files
- Sort device table in alphabetical order
- Add sentinel to device table

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 33b0f74937a2..1b39ee6957fc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -385,17 +385,10 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
 }
 
 static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
-	{
-		.compatible = "mediatek,mt8195-vdo1-rdma",
-		.data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA,
-	}, {
-		.compatible = "mediatek,mt8195-disp-merge",
-		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
-	}, {
-		.compatible = "mediatek,mt8195-disp-ethdr",
-		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
-	},
-	{},
+	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
+	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
+	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },
+	{ /* sentinel */ }
 };
 
 static int compare_of(struct device *dev, void *data)
-- 
2.18.0


