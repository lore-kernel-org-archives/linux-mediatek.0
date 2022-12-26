Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56CAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbLSD0m8UcVGxdlXuSCfKFo4OXf234fq1MYeOoIQl8Q=; b=EHpMO0JZDimw0kABrLqobOLPqh
	rHphVXifPOQwiQ+p40ieqXG/KrX4ZgAod6Phzd+Qg34Rd6eB9J8JCGj765pH4vgE4lPsgT4rL2CpV
	R4uHawDgMblDdeo5B19ILlagJndz//U2OvlH2sGWiZAOT/1EahXAB3a9/rijb9DEXerxIcCTZsvrs
	g7fHK43JsHUGADg4LUclL3eNI7eFk7SVcC//MD1W0wosqfoaCfo4d1sr3a6bmhPqZlUN1wI81mjOd
	/ZTyI63Ia1Zl8UYavVODyDmZCIk5tVyr0YQ5E+5qT008fOAZDHzF4DXrUGr0xDtprMOGcmNOok36e
	qjdjuCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9kKY-0033Xr-0M; Mon, 26 Dec 2022 10:03:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9kKT-0033Ve-Gw; Mon, 26 Dec 2022 10:03:36 +0000
X-UUID: 93bedc7a36b54a8387eafad00bbfd9d5-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XbLSD0m8UcVGxdlXuSCfKFo4OXf234fq1MYeOoIQl8Q=;
	b=S0v03NkumULDXKwEq1ndz2ycvorW5SdRqAAsWHMTMzKMEVI76VXhojk+77jR0RfvXyS4NdvM/rxPsxixmnzxW9VtoTBjRgB8RBJ8W2z7Rl0zj/W4mpVenpvr8uLt/TutYIhVG+um+RRxyhG6TDE9CzBC3KbUYoVb/oYapGjQt9s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:aba55522-7b01-4238-97a0-2a6ef191a819,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:3b8ccf52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 93bedc7a36b54a8387eafad00bbfd9d5-20221226
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1620362689; Mon, 26 Dec 2022 03:03:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Dec 2022 17:42:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:49 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 03/13] soc: mediatek: mtk-svs: improve readability of platform_probe
Date: Mon, 26 Dec 2022 17:42:38 +0800
Message-ID: <20221226094248.4506-4-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_020334_276705_D23DB99D 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

If a compatible misses a match data entry, then something is wrong in
the development phase, we don't need to check for that at runtime.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 38dcee9c9c04..63ad9160a305 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2332,10 +2332,6 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 	int ret;
 
 	svsp_data = of_device_get_match_data(&pdev->dev);
-	if (!svsp_data) {
-		dev_err(&pdev->dev, "no svs platform data?\n");
-		return ERR_PTR(-EPERM);
-	}
 
 	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
 	if (!svsp)
-- 
2.18.0


