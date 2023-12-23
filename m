Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4313FC47074
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Dec 2023 18:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enku7WLxNyoiQmtEW8rdeh9ClXh758cvt9RXNM2nDG8=; b=ixo8LC2vYKQeoifaXF8pBF2JXf
	ufdLXLzojrFt68wJPMv22/y+VOwd7GUPDxickBvpduzElQwhk0Znd/bPDseQn1Fx8BFby26Ka0JiU
	ShHpwF3oH/pyMCWsr3BapC5yffImhP7Rry3GSxTivussrd50clhPAyMM1OYJP+zL0m/reX5zB2RrV
	M+KhKosagwxQ60tTewn2B2BlCnFcgRMWnwVUL98HOGwVGU9W5QXcl0REVMQ6h/w6zh4jwERyzu4Hu
	LNmcLfy5O7KCSjOf3zi64pYU09t/Yoe/4tMfQnq33471/9DNazTc1NEyxvRC5SOox4TVeh5EIODBG
	Q3H3QbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6ky-008IKP-0H;
	Sat, 23 Dec 2023 18:29:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6ks-008IGJ-25;
	Sat, 23 Dec 2023 18:29:49 +0000
X-UUID: 3a503e2aa1c111ee958cff29c719f35b-20231223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Enku7WLxNyoiQmtEW8rdeh9ClXh758cvt9RXNM2nDG8=;
	b=mqWBZwEzRhUfVJg+ZquADwv0sVcaCYzvzEYCwqOropIt0S8IL8YH5SbbEhPIy/8fqhzP5m3c4SEIa5jV5agDTO8+ZNl6ZBqN7WueQII2jp1kYaN3bpwODg4Bq0HtqV4hHVyDlmi5nv/L5cJn80295H+DOtznKAfzlpagMO2iuZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:11d40eb5-760a-4855-bb15-989cae66c9f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:6457987e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3a503e2aa1c111ee958cff29c719f35b-20231223
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1410230260; Sat, 23 Dec 2023 11:29:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 24 Dec 2023 02:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 24 Dec 2023 02:29:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH v3 06/11] drm/mediatek: Add get_sec_port interface to mtk_ddp_comp
Date: Sun, 24 Dec 2023 02:29:27 +0800
Message-ID: <20231223182932.27683-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
References: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_102946_688418_1D1043CD 
X-CRM114-Status: GOOD (  10.80  )
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

Add get_sec_port interface to ddp_comp to get the secure port settings
from ovl and ovl_adaptor.
Then mediatek-drm will use secure cmdq driver to configure DRAM access
permission in secure world by their secure port settings.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index b5a05ca3a385..1e6a120a103d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -84,6 +84,7 @@ struct mtk_ddp_comp_funcs {
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
 	unsigned int (*encoder_index)(struct device *dev);
+	u64 (*get_sec_port)(struct mtk_ddp_comp *comp, unsigned int idx);
 };
 
 struct mtk_ddp_comp {
@@ -199,6 +200,14 @@ static inline unsigned int mtk_ddp_gamma_get_lut_size(struct mtk_ddp_comp *comp)
 	return 0;
 }
 
+static inline u64 mtk_ddp_comp_layer_get_sec_port(struct mtk_ddp_comp *comp,
+						  unsigned int idx)
+{
+	if (comp->funcs && comp->funcs->get_sec_port)
+		return comp->funcs->get_sec_port(comp, idx);
+	return 0;
+}
+
 static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 				     struct drm_crtc_state *state)
 {
-- 
2.18.0


