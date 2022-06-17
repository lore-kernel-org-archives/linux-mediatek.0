Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC90C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uklWM9IaLcaNqUTKHRn0pghw1KPLMP2s/huJtr0APeU=; b=oR5esNZGt422TpTzzzxsi4ufeU
	sA365yhlPwn9q0udIMbQG71n20dt16Xp0SaWRzurqo6tptFAlLEE9sA9G+9S6u3FFuRv2PUFeLFgL
	CStu/IRisiACoOTa+VrGBsH4UfcQUMQugp5h8lxMs9cJZo967VbZ81YJMtWO2EGfEcvUuiCV8Tnn1
	cHJwwWs0hBNIwJq/6YqdrJltjfyu7EWPpx/wMZ2bCr+CG81XA/mUZj86E454OD+cZUEazY/L+hKa+
	bdYcPwg5xIUuHKZM9hL23Lxz/Gkf9FS4AMGh5Fo/d+MSPEypPUiu4Tg2MnfMR/LCQEmwFqSiQaNoD
	aGhTglVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28ku-006rqA-Od; Fri, 17 Jun 2022 09:59:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28kc-006re9-5Y; Fri, 17 Jun 2022 09:58:51 +0000
X-UUID: 3b8bae22a7514dd6940a0109f4ccb280-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0e6f30ed-76ce-4a67-8ea2-bcf78ad683b5,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:0816e748-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3b8bae22a7514dd6940a0109f4ccb280-20220617
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 227716657; Fri, 17 Jun 2022 02:58:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 02:58:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 17:58:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 17:58:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Min Guo
	<min.guo@mediatek.com>, MandyJH Liu <mandyjh.liu@mediatek.com>, Eddie Hung
	<eddie.hung@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4] soc: mediatek: Add support always on flag
Date: Fri, 17 Jun 2022 17:58:41 +0800
Message-ID: <20220617095841.23031-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_025850_250702_6A955661 
X-CRM114-Status: GOOD (  14.68  )
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

There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
used by PCIe, when power off its mtcmos, need software reset it
(workaround way, usually hardware do it, but has an issue on mt8195),
but it has side effect to USB2 phy(works with USB3 phy to support
USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make its
power always on;
Another reason is that USB3.2 Gen1/2 need keep power always on when
support runtime-pm due to hardware limitation until now;

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: add reviewed-by AngeloGioacchino

v3: make always-on flag exclusive with defualt-off flag

v2: keep active_wakeup flag for mt8195
---
 drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
 drivers/soc/mediatek/mtk-pm-domains.c    | 3 +++
 drivers/soc/mediatek/mtk-pm-domains.h    | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
index 938f4d51f5ae..0529d130b675 100644
--- a/drivers/soc/mediatek/mt8195-pm-domains.h
+++ b/drivers/soc/mediatek/mt8195-pm-domains.h
@@ -67,7 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 		.ctl_offs = 0x334,
 		.pwr_sta_offs = 0x174,
 		.pwr_sta2nd_offs = 0x178,
-		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_ALWAYS_ON,
 	},
 	[MT8195_POWER_DOMAIN_CSI_RX_TOP] = {
 		.name = "csi_rx_top",
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 5ced254b082b..a3dae391a38a 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -428,6 +428,9 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
 			goto err_put_subsys_clocks;
 		}
+
+		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
+			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	if (scpsys->domains[id]) {
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index daa24e890dd4..7d3c0c36316c 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -8,6 +8,8 @@
 #define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
+/* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
+#define MTK_SCPD_ALWAYS_ON		BIT(5)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.18.0


