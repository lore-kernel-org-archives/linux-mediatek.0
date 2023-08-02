Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756E2C41513
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czILUA+gU23y0OfnsNXXiJJt0iAx966H0jubmhVIhCQ=; b=3mc5eQnkymf/rjX3zFv7m8FEIQ
	/hKRtYdk1GlfqOH2sOckdjn8KdNCDYWMARL20AM+Mcqaj1zE/GtPYDQKJa6I4MLX3uFevzxrdt9xA
	vL2Aey9uE0W34E5x/UrBNyuD8IH+QtwU4CtxX5vuDo8taQ4EZO1chRZ5cWgDlUld7TDaVesE1Q7pq
	fxnB+bw1iuQo1PCsNCpeaUFyQtxRgXm/GZoUttqZHQTKzEVPnZBHd5GIkd19c4w2YcCZHtop1WVEO
	aCFR02yEI7fwzoHTCeySeYkE7Lrh/rYkFuowwGanBygeITdY/b2jzVY8gbiEVuswf6Gres8tNoBl8
	h9m+1qcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDSS-005BNZ-2h;
	Wed, 02 Aug 2023 15:08:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDSQ-005BLu-0d;
	Wed, 02 Aug 2023 15:08:15 +0000
X-UUID: 62d0105a314611ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=czILUA+gU23y0OfnsNXXiJJt0iAx966H0jubmhVIhCQ=;
	b=MZlWRScncof2CD/OwsnbH16yA1ku7IOmJo9Ck2t4a4Atul3jDefnhgMKfXEW35yezliQ2UKMKc75HQyv6QyoxoAl3JWb4QbMEe640+MQj8kZV2uneEjjoYLfq87oFzhmbXMMliiQ9LYKfBXOGM1+zR9ufjJD73R44qbbDu8VfUU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:1662b4f3-02da-4810-8af6-9a2d41d99581,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:1fcc6f8,CLOUDID:5bc613b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 62d0105a314611ee912e1518a6540028-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 261615183; Wed, 02 Aug 2023 08:08:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 1/8] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
Date: Wed, 2 Aug 2023 22:47:55 +0800
Message-ID: <20230802144802.751-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230802144802.751-1-jason-jh.lin@mediatek.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080814_246294_EB4A7DEC 
X-CRM114-Status: GOOD (  10.62  )
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

Add missing mmsys_dev_num to mt8188 vdosys0 driver data.

Fixes: 54b48080278a ("drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6dcb4ba2466c..249c9fd6347e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -287,6 +287,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.main_path = mt8188_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.mmsys_dev_num = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
-- 
2.18.0


