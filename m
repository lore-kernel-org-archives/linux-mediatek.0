Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 03:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A0q6r84X2XKK3CAuRIml9dZUg+GB7moOddAKx6LC+0=; b=0xpn23Z3L6DteliBHkpQjrOCtN
	mtFe7Vfxl/ns1p8QzR7bala7IwO4PGxUV3BguX0KhhMCRkwRC3w8qqDmw5gR7gWx1X6ViCTttP6aB
	9LoLfdICn4f8tq0NkHFbWFnAghjYwc7/MjSk2kk65Hs4LjoSo6najpI/XIMXUvu4N7RB6f55kpvBG
	89DahWEcn6w0qn83dQjW8p7dG4oGYJvQpb6ubDpDMpdhvKejB9U65QlWJ+XvXWU+SuFhKAf1YyTJV
	9unNa4lxoIQxLw80350mlYjimRAvCVDmedw8G+t5HrYXI1Z4v9kdgJoYMg27Q2UXvvbq1tbQdfCmm
	w+f/E6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qC3-0092hh-Ih; Wed, 21 Dec 2022 03:54:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qBt-0092Zg-Gx; Wed, 21 Dec 2022 03:54:51 +0000
X-UUID: 3682af128bb2449e829550f12bba84a7-20221220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8A0q6r84X2XKK3CAuRIml9dZUg+GB7moOddAKx6LC+0=;
	b=CLUZa6/EthcMKPGjYUzE7HS7bwOzVf1daE8B4VpX8I5qKNL9oqDqWcgPN8RRwo6zXeGF5icW+cBH9VwmoZDoBYmmq/yMx/mn00Ii+qCBDovT7hTTOpaF1/YQ4JIXyicdYesqgwMEb+vNMkcGFBgL0t/1b5kyK9X4MnhYm7hpa+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:3775a1f8-8dfd-4698-bc26-479bd728497c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:637b83f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3682af128bb2449e829550f12bba84a7-20221220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 957835851; Tue, 20 Dec 2022 20:54:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 11:44:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 11:44:11 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 2/6] soc: mediatek: pm-domains: Add buck isolation setting in power domain
Date: Wed, 21 Dec 2022 11:44:03 +0800
Message-ID: <20221221034407.19605-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_195449_629133_1A5F0D55 
X-CRM114-Status: GOOD (  13.91  )
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

In MT8192, we need to disable EXT_BUCK_ISO before turning on the ADSP
power pm-domains (mtcmos).

Add the MTK_SCPD_EXT_BUCK_ISO flag to control the buck isolation
setting in the mediatek power domain driver.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 8 ++++++++
 drivers/soc/mediatek/mtk-pm-domains.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 09e3c38b8466..63f1e183f645 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -218,6 +218,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		goto err_reg;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
+		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
+				  pd->data->ext_buck_iso_mask);
+
 	/* subsys power on */
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
@@ -272,6 +276,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
+		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
+				pd->data->ext_buck_iso_mask);
+
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
 	/* subsys power off */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index a5f24c58e35a..5ec53ee073c4 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -10,6 +10,7 @@
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
 /* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
 #define MTK_SCPD_ALWAYS_ON		BIT(5)
+#define MTK_SCPD_EXT_BUCK_ISO		BIT(6)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.18.0


