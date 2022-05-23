Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555CBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CShttTX8DaV8C76DN7qRe0LWBFrMB0NXnTM9qRRpQ2g=; b=Ox/S16b4ipfc/r
	3o3TRW9OlEuSN8Bmnks1qVt2f4fyBPwydsovHx/7vk/T0wwFqG4ALS3/anaGvbC0GWfy21LnU09C8
	50kZdde1NRh6KRlJZzwv5JeWWtFwYBZlq8+sivhJGebE8cclSSyQy1qDKT1tgXqrJHjM3uWUEbUef
	nrGz71CPIDCYl+P5uOnfCnOdbmyAOJuO9ype81mv6xi8arMLRTwDH2sfQ7uOjLtcbPl4FJtXrHZgw
	boSXK+li/E6R4e01M2ic0kJAXjnFTDE3YmtW/dGC7zZbVr+uMoVu08Y1hnzIFjPxgLg+dY2yZlzPJ
	WOFPbRzep88AiuEENNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAfI-0059gX-6u; Mon, 23 May 2022 16:12:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAeQ-0059EG-Vj; Mon, 23 May 2022 16:11:26 +0000
X-UUID: f2da4eed2a2b401998d85c1348eaa27a-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:18e1ed5a-3675-43c7-bc4b-465e28f58bca, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:90ee40e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f2da4eed2a2b401998d85c1348eaa27a-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 343776324; Mon, 23 May 2022 09:11:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 09:01:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 24 May 2022 00:01:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 May 2022 00:01:06 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 8/8] clk: mediatek: mt8192: add mtk_clk_simple_remove
Date: Tue, 24 May 2022 00:00:50 +0800
Message-ID: <20220523160053.1922-9-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523160053.1922-1-miles.chen@mediatek.com>
References: <20220523160053.1922-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_091123_103430_D7F24686 
X-CRM114-Status: GOOD (  11.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt8192 is already using mtk_clk_simple_probe,
but not mtk_clk_simple_remove.

Let's add mtk_clk_simple_remove for mt8192.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8192-cam.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-img.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 1 +
 drivers/clk/mediatek/clk-mt8192-ipe.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-mdp.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-mfg.c          | 1 +
 drivers/clk/mediatek/clk-mt8192-msdc.c         | 1 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c     | 1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c         | 1 +
 drivers/clk/mediatek/clk-mt8192-venc.c         | 1 +
 10 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-cam.c b/drivers/clk/mediatek/clk-mt8192-cam.c
index fc74cd80b4b0..90b57d46eef7 100644
--- a/drivers/clk/mediatek/clk-mt8192-cam.c
+++ b/drivers/clk/mediatek/clk-mt8192-cam.c
@@ -98,6 +98,7 @@ static const struct of_device_id of_match_clk_mt8192_cam[] = {
 
 static struct platform_driver clk_mt8192_cam_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-cam",
 		.of_match_table = of_match_clk_mt8192_cam,
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
index 7ce3abe42577..da82d65a7650 100644
--- a/drivers/clk/mediatek/clk-mt8192-img.c
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -61,6 +61,7 @@ static const struct of_device_id of_match_clk_mt8192_img[] = {
 
 static struct platform_driver clk_mt8192_img_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-img",
 		.of_match_table = of_match_clk_mt8192_img,
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
index 700356ac6a58..ff8e20bb44bb 100644
--- a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
@@ -110,6 +110,7 @@ static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap[] = {
 
 static struct platform_driver clk_mt8192_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-imp_iic_wrap",
 		.of_match_table = of_match_clk_mt8192_imp_iic_wrap,
diff --git a/drivers/clk/mediatek/clk-mt8192-ipe.c b/drivers/clk/mediatek/clk-mt8192-ipe.c
index 730d91b64b3f..0225abe4170a 100644
--- a/drivers/clk/mediatek/clk-mt8192-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8192-ipe.c
@@ -48,6 +48,7 @@ static const struct of_device_id of_match_clk_mt8192_ipe[] = {
 
 static struct platform_driver clk_mt8192_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-ipe",
 		.of_match_table = of_match_clk_mt8192_ipe,
diff --git a/drivers/clk/mediatek/clk-mt8192-mdp.c b/drivers/clk/mediatek/clk-mt8192-mdp.c
index 93c87ae2f332..4675788d7816 100644
--- a/drivers/clk/mediatek/clk-mt8192-mdp.c
+++ b/drivers/clk/mediatek/clk-mt8192-mdp.c
@@ -73,6 +73,7 @@ static const struct of_device_id of_match_clk_mt8192_mdp[] = {
 
 static struct platform_driver clk_mt8192_mdp_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-mdp",
 		.of_match_table = of_match_clk_mt8192_mdp,
diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
index 3bbc7469f0e4..24108229793d 100644
--- a/drivers/clk/mediatek/clk-mt8192-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_clk_mt8192_mfg[] = {
 
 static struct platform_driver clk_mt8192_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-mfg",
 		.of_match_table = of_match_clk_mt8192_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
index 87c3b79b79cf..24c9c73ce5ed 100644
--- a/drivers/clk/mediatek/clk-mt8192-msdc.c
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -76,6 +76,7 @@ static const struct of_device_id of_match_clk_mt8192_msdc[] = {
 
 static struct platform_driver clk_mt8192_msdc_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-msdc",
 		.of_match_table = of_match_clk_mt8192_msdc,
diff --git a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
index 58725d79dd13..18a8679108b8 100644
--- a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
+++ b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_clk_mt8192_scp_adsp[] = {
 
 static struct platform_driver clk_mt8192_scp_adsp_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-scp_adsp",
 		.of_match_table = of_match_clk_mt8192_scp_adsp,
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
index b1d95cfbf22a..e149962dbbf9 100644
--- a/drivers/clk/mediatek/clk-mt8192-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -85,6 +85,7 @@ static const struct of_device_id of_match_clk_mt8192_vdec[] = {
 
 static struct platform_driver clk_mt8192_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-vdec",
 		.of_match_table = of_match_clk_mt8192_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8192-venc.c b/drivers/clk/mediatek/clk-mt8192-venc.c
index c0d867bff09e..80b8bb170996 100644
--- a/drivers/clk/mediatek/clk-mt8192-venc.c
+++ b/drivers/clk/mediatek/clk-mt8192-venc.c
@@ -44,6 +44,7 @@ static const struct of_device_id of_match_clk_mt8192_venc[] = {
 
 static struct platform_driver clk_mt8192_venc_drv = {
 	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-venc",
 		.of_match_table = of_match_clk_mt8192_venc,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
