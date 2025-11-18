Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A3BCEBF9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 02:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9dbBtldMrix2vmwLqkoYfOaGzIlugE4vywk09nOwwE=; b=YO7OW0de41DyUzZ0Tnu+Pc2RID
	hNYqdKErusrOKQjKOvRAdi5lbeKnEYKDI67ZEj0u8rkwjLEC1WPSTDbxmYU39R/Vn2FRl9kpNtSbQ
	D7tVsWt4PM45wDZ0Y112Q+OMcZ7GkCbBIA51bTQn3iLN1DP1730GGVBTqwQa/Omu9FZh9vjAx6g8t
	XnyrZyVHZI5tcGPXt6z/66daFk+PWRL2nVmeMUfx8rtdgA8XW+kHfDfU/a/AW2DXFdt/GHQ0J2FVX
	bThKlBzuR3Kt2FZO6Vbw3t4r1ay4Civ83ruToD42prTABEwEyx/Hs02f+Kjm+UxD8O+xz8zpSjyMk
	xs4X79kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBOo-0000000HDgQ-14QR;
	Tue, 18 Nov 2025 02:24:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBOl-0000000HDeU-3tWm;
	Tue, 18 Nov 2025 02:24:53 +0000
X-UUID: bf2816dac42511f0a52f393f94899d25-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h9dbBtldMrix2vmwLqkoYfOaGzIlugE4vywk09nOwwE=;
	b=FOpXtLMam94oszILgbhkxm3zWDEO0JMe/Cdhlq/DGwbl03nKpD8sBIhDUKvWMWQYNCWNbpmeqaeLpXbY9AFkY5Z5ZObR0HRGRveWUEWWKQP3o02pMsfgtrVljdTyuTUJudW5u0qu12BzjKfMQCiGqvLlVuxP8rjGfik/Yl9slZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a456122f-f117-426f-a7a9-5b695c1b8397,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f14d8c92-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf2816dac42511f0a52f393f94899d25-20251117
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 236216807; Mon, 17 Nov 2025 19:24:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 18 Nov 2025 10:24:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 18 Nov 2025 10:24:41 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH 1/1] drm/mediatek: Add check framebuffer width and height size before config ovl
Date: Tue, 18 Nov 2025 10:22:49 +0800
Message-ID: <20251118022437.1284-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251118022437.1284-1-xiandong.wang@mediatek.com>
References: <20251118022437.1284-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_182451_970986_ECC27D9D 
X-CRM114-Status: GOOD (  14.97  )
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

During the execution of the IGT test kms_cursor_edge_walk,
the screen experiences glitches and the hardware hangs.
It was discovered that the framebuffer dimensions (width and height)
provided by IGT to the display driver are zero, leading to
abnormal parameters that cause the hardware to freeze.
Therefore, it is necessary to verify the buffer dimensions
before successfully passing the IGT test.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f1fa1f1c3ff0..bb207aee91f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -611,7 +611,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 
-	if (!pending->enable) {
+	if (!pending->enable || !pending->height || !pending->width) {
 		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
 		return;
 	}
-- 
2.46.0


