Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7C9C6FA86
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lGdHgBDZ1zzn0pii7JJeVx/yeyEN3AsCvLFo305J2p8=; b=esr1gbjDIYQl06i4Ld3CusMs38
	76rkUVYzipU7kjb5EMrxM5efWspQdmbetP+TokHeC5GVSjEA4zCkoxnEDLJMWchWOp1EZz5aj7j5E
	taQ8UzHxUZQgD/EXRCBdLvYCHluNuReWsOo0WoinyuEpY4nfdjFXssHBoc+Ne7fXbSkHc2zX1frUR
	wp+TbuTARpEQ4MJBtcsD6yEZD+zCEvkBverp7mN9o0DxBw0AjVaF8Y4jpX4ZzOstKH6Sh+xQbSV7w
	5ZvFLDltdFwJWjV9+cg6L/zA7t/ZT+mwl8Br2llQwh+L5S5rpC/GtBZBIrhaHvrigmLys8L+YjaaJ
	+SU+Yy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFIN-0075mr-37; Mon, 05 Sep 2022 16:49:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCmx-004BG2-No; Mon, 05 Sep 2022 14:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lGdHgBDZ1zzn0pii7JJeVx/yeyEN3AsCvLFo305J2p8=; b=ooR7NEHJE9l4mExlMCLPI24c7C
	IaiYYIKvkCm352Uxk3RCvqHpyvwf5S9t/lwNKC2AYiQF7o3w7k/86+yl+S18V8dO9zVwaK3dCiFxZ
	yi1JxLvzyYw7ZJmNKE8u6qYGdeg8Lpi6oMxdyBrn+Z0r1lriKM5Hq8FQo8WqUEXYxN9F4hEH0Y2rV
	c4tzDrJw/EgAcNueaTShD6IJBJLmsr6ZO9E2f6UcbqfaB78h5remXTtwec3TNnOrYF+CWCjJ8wL/r
	8KDF9utR0H4KGlBQrftkHvSlcsreIv9kbp+oNBJnbO1G6DPcWDDsPN4BPUJpHvSevYAMJZDx6k5uo
	3tQZm6hw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCYo-009g0x-CX; Mon, 05 Sep 2022 13:54:49 +0000
X-UUID: fe112860b32e4b1587a9619fc626b1c8-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lGdHgBDZ1zzn0pii7JJeVx/yeyEN3AsCvLFo305J2p8=;
	b=sHkyjHZE4TIF9KKX4NMkJOHanodcfvAzU1J0chujkGiBv8CvhJZvhddjyajk1OsONn3ZU1f9fvTJJvcC//gYFYb9nB9J7xljTnJvcURodIk+UNjmbfLr3pWR9U+zRtE2yZzN0QVaL/Hnx9FQU+4vU5tO0Zsv7MSIkhDztIJ8+EY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ce9a3074-9e54-4439-965c-55497219835a,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:7727bdd0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fe112860b32e4b1587a9619fc626b1c8-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1287111780; Mon, 05 Sep 2022 06:54:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 5 Sep 2022 21:53:57 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 5 Sep 2022 21:53:56 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH] drm: mediatek: Modify dpi power on/off sequence.
Date: Mon, 5 Sep 2022 21:53:53 +0800
Message-ID: <1662386033-4463-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_145446_824011_63D2D296 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Modify dpi power on/off sequence so that the first gpio operation will take effect.

Fixes: 6bd4763fd532 ("drm/mediatek: set dpi pin mode to gpio low to avoid leakage
current")

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

---
Base on the branch of Linux-next/master.
Because dpi power_on/off is protected by dpi->refcount, the first time
it cannot be powered on and off successfully, it will cause leakage.
---
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..2ce1a39ce3bf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -462,9 +462,6 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	if (--dpi->refcount != 0)
 		return;
 
-	if (dpi->pinctrl && dpi->pins_gpio)
-		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
-
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
@@ -489,9 +486,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
-	if (dpi->pinctrl && dpi->pins_dpi)
-		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
-
 	return 0;
 
 err_pixel:
@@ -721,6 +715,9 @@ static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
+	if (dpi->pinctrl && dpi->pins_gpio)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
 	mtk_dpi_power_off(dpi);
 }
 
@@ -728,6 +725,9 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
+	if (dpi->pinctrl && dpi->pins_dpi)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
+
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 	mtk_dpi_enable(dpi);
-- 
2.18.0


