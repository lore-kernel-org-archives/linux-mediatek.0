Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47BFC3DA78
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JhlycgW5oR2VzgYLDMnvax7qMcTUSfY1PahndTkqWvk=; b=ySAjZHHxWsCZMAK+5BtFEg0beI
	fbLeR+e/RUSiHcTwJnUAOiZq8jWU39KdxEFIszWzmMsZZRL8VyBXwEZEL7QSBctrReIR+ADLetSVz
	ED8av1AdPu+E23c1iMXA+/NnZSIkl4+IwJ7IESMF/TC6/J3zs96MHx0Ko4cLq+/u6wJDse+cIkZj6
	bkXHIHKEYpxUuUBWNkN+WNu0qoyQI7522IZnPTeCCjyyOJe9sg7vKyc72wF6mXV8sHDMS38nI85/0
	g8cIwKQGnxeCX3tJQC1GP1xmKyVa7Uffbw9WUi9eH81JOKv05sP1wsxHu9dV/WfBB4znmxk/roFMv
	Uec6bWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGd2j-005ZBy-RM; Sat, 14 Jan 2023 09:41:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGd2f-005ZB9-Nh; Sat, 14 Jan 2023 09:41:39 +0000
X-UUID: 976fc98a93ef11edbbe3f76fe852e059-20230114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JhlycgW5oR2VzgYLDMnvax7qMcTUSfY1PahndTkqWvk=;
	b=G7TEpdHHS1R0uyDqTYUndYnBOjTmoEN7NP8H0kyfEr1h0lA/LMHLq1yyIbMTTIJA12EKdWTBDnxXoGsyZVnlE4ey5UavlLN2gpwugVpzCPSLY4rcXmj7J0z5b9zsAc5PC0sCbtg7fVmd9zxnwjMxULYeKF9Q2INfvKkPxN6/Bq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0296dd31-b5a8-404d-89bc-d767633c6c4d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:e0b83c8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 976fc98a93ef11edbbe3f76fe852e059-20230114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1093635342; Sat, 14 Jan 2023 02:41:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 14 Jan 2023 17:41:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 14 Jan 2023 17:41:13 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] media: mediatek: vcodec: Using pm_runtime_put instead of pm_runtime_put_sync
Date: Sat, 14 Jan 2023 17:41:12 +0800
Message-ID: <20230114094112.29068-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_014137_784048_11037DE7 
X-CRM114-Status: GOOD (  11.82  )
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

pm_runtime_put will set RPM_ASYNC flag then queue an idle-notification
request again, won't return error immediately until current request is
scheduled.

But pm_runtime_put_sync run the ->runtime_idle() callback directly, return
error immediately no matter whether current request is scheduled.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
changed with v1:
- No need to print error log when the return value is -EAGAIN
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
index 4305e4eb9900..777d445999e9 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
@@ -72,9 +72,9 @@ static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_put_sync(pm->dev);
-	if (ret)
-		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
+	ret = pm_runtime_put(pm->dev);
+	if (ret && ret != -EAGAIN)
+		mtk_v4l2_err("pm_runtime_put fail %d", ret);
 }
 
 static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
-- 
2.18.0


