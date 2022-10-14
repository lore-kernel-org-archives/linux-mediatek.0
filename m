Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ECAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1EVtCMCEdutuhUNCrNtPVBANOTU4/N44AAt3ryFs7N0=; b=GOQzsBcpub/DfW+iMRmIKmEGTy
	w/jpe/3yy+gFGdt9Muf6Yf7RqEoYEZELjBK0k4shXRlnMVwLJkOxpJMudCJZbFEKbcrewA5zAhkCr
	FjvcH2gYUD6ILSSgH3QQld+mALyhzA3TQy0eUKEPm9EGKJtVpgH7DyUx94XU2O6LZ0JBaV3o5p/dl
	ARalnXN9MtuAawDnCtCTfaHhAxdv55nm695SpUQPF/g1Pf00QaOGFcHBpe2gEjVSNWWYx4w2fE4/i
	GoHsG49wIBwgIBNWZvqDCPVunx3x6zyDHvnBeSZf6o/8ar2ObwOnbUEhhhwutZaadqh88HW//4Yga
	1IAjmuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojISm-00ETY6-Ij; Fri, 14 Oct 2022 11:02:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojISj-00ETUV-VN; Fri, 14 Oct 2022 11:02:47 +0000
X-UUID: ddec6815fa43400c8009f639d2e55eb3-20221014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1EVtCMCEdutuhUNCrNtPVBANOTU4/N44AAt3ryFs7N0=;
	b=crvxpsJocBUOzCEOqnQJSd01HAN9UMcKjOQri5P39mQxzI2wIqCnZE2P0noLDNGPZFsIT3hLrSJeefFnTGNtesT7NZGIG4pGRC92rpwR4f6G48gW+3Cn4tCQ4GbtkPxT6tNGyFKDFixWxBipsSChwDfP/L7R2GevDhehc9TXudY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b1c06853-fb5d-4f1a-9baf-146d25606102,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:6ec75ddb-0379-47b3-a5dd-2ef5001d380a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ddec6815fa43400c8009f639d2e55eb3-20221014
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 421658437; Fri, 14 Oct 2022 04:02:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 14 Oct 2022 18:21:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 14 Oct 2022 18:21:59 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH] soc: mediatek: pm-domains: Fix the power glitch issue
Date: Fri, 14 Oct 2022 18:20:29 +0800
Message-ID: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_040246_069258_4375648D 
X-CRM114-Status: GOOD (  10.89  )
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

From: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Power reset maybe generate unexpected signal. In order to avoid
the glitch issue, we need to enable isolation first to guarantee the
stable signal when power reset is triggered.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
  Resend a PATCH from
https://patchwork.kernel.org/project/linux-mediatek/patch/20220310011548.2487-1-chun-jie.chen@mediatek.com/

 [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
---
---
 drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 09e3c38b8466..474b272f9b02 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -275,9 +275,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
 	/* subsys power off */
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 
-- 
2.18.0


