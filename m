Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8894C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnE7kfT92vOKoVcnW2N3zYJMAiR9CTN4ccK+CcPCmZw=; b=GV5NiBpC4ZUWVxSMQyWsO09tyq
	oJxHdLKH2in0xB11vVQRdxGmKOkzpBtYBLXPl9qUWd9bzSJZ61W9j7NGMDHAt3CaQKXsYJPL3417w
	EhBgJBBo3FQNsOZ+Y/SC1ES/XBqW8eKnCI6gYg/2kCu0GA/pqlM0OUynrJ+eWug+gZtzoM+f2L1A1
	+1nPRepcXAbbBMgwLtDwRn1vDU1l/yiRygaqzvGXiTpwVAzQ8BGThuDkQUhRnwA/s5vfuQbbet0tN
	s+8krbDwDUg71hxR4FZ2Oo0fnvg2F+7KOVys1y/nhv7kVvDJPG9lrJqQLwMCLfg1PLcfLu5ezTpGx
	hHYeRihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaxJ-00000006Uw8-0e5q;
	Fri, 22 Mar 2024 09:12:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaxA-00000006Uo4-0lPt;
	Fri, 22 Mar 2024 09:12:45 +0000
X-UUID: 539b4206e82c11eeacdb61a41848c7d2-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BnE7kfT92vOKoVcnW2N3zYJMAiR9CTN4ccK+CcPCmZw=;
	b=V5lzrPZEoubr+B3Rr7iD3ZSs28RpckMNEctQQC9oTFFV+G4Kw4W5fBh78JPwTVoozIc9sHghJHtMC1gxQl2KC2x+jHI8RgZDWyVkJmPTmnAbQiFniS/xl58sXmc6d26B8lEX/H4q/URheZ611Ne0rPlokdzoWLuG4RznUHa+G/4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:7171646c-b90c-4f68-8d37-edc4a3ccccc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:9147b690-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 539b4206e82c11eeacdb61a41848c7d2-20240322
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1075479845; Fri, 22 Mar 2024 02:12:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:35 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v5 13/14] drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
Date: Fri, 22 Mar 2024 17:12:31 +0800
Message-ID: <20240322091232.26387-14-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_021244_264260_3E934364 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_gem.c to mtk_gem.c.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                     | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a47fbec7b9ce1..32a2ed6c0cfef 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -11,10 +11,10 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_drv.o \
-		  mtk_drm_gem.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
+		  mtk_gem.o \
 		  mtk_mdp_rdma.o \
 		  mtk_padding.o \
 		  mtk_plane.o
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_gem.c
rename to drivers/gpu/drm/mediatek/mtk_gem.c
-- 
2.18.0


