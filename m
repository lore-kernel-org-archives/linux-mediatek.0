Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA9CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvWM1AXQ6tiOuDldq6WgdW7pY1U70GlcfGvt/a0pesM=; b=bLIVSQoU1JiGBEuVbqtEtE2PV2
	KCn3oSCCHI94I0TIAn2DsHj+EviUZtA1L9zm48DvEeBZ0Pt3+IC92098lW0t3EyVATs+3tii3q+Hq
	BbwtluMdLni2Ahldbll4rUK5S5ZFy9r5nnBMP1UhjM5ogkAlhNSZSSRfqOIRrtPVYVLqHpnLOfRdp
	zXXRERJ2DnS+MMI8Kff7q4os1JLz4udYn0ThmqfvKIQvug6zGfBLXrDiksO3MbPTR93rjJlvPHOvC
	UPO/QfJ8Uqf5og4QDDfBYxqEdmS1iepfvzv4gkxin+UFMLcLhihhpz4LYvIC/NBYsxcFAhbWfN09D
	XJz5Ftzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0TI-00000008Bjg-1gYp;
	Tue, 09 Sep 2025 15:41:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv72-00000006Bfr-2pLi
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F231441A7D;
	Tue,  9 Sep 2025 09:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED6CC4CEF7;
	Tue,  9 Sep 2025 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411887;
	bh=kDtTh6feFeUUls9s9EeYPr0volqLeNaDI/7jY9MX8bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qYEL1OZ+a5rE0c9nhkupob9mMjTtrtrOZdz3AmEmVELnfnRzrptQLwlV0Uyc1EkFH
	 xcmoEVK5Fzavzo7IohD5PBKGdMfBwPUAcGK6KlJixzyzhHM1Ka/V6AU/d7zH0dzkTU
	 VIHiOQbHujPNpgHABpRzZ+3E9Q2COAKReh5A3u+a5bcGj2eEajuK+9FK6ITuLI62Rs
	 t67t1No2B91M8nFeKnw3HY4HmjuEK9yaGqXb6bNmjLO6WNHTsoUe35dHWQQlIxuPI+
	 sZ/c14EWbCpxg2lWKOzdVustr2EyS1XCBDA5d2PIJqeKja4u5/5iXyn2ZmI3M82bc0
	 2oBmItzano5xQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvv6z-000000001Sw-3vY8;
	Tue, 09 Sep 2025 11:58:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roger Lu <roger.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] soc: mediatek: mtk-svs: fix device leaks on mt8183 probe failure
Date: Tue,  9 Sep 2025 11:56:50 +0200
Message-ID: <20250909095651.5530-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250909095651.5530-1-johan@kernel.org>
References: <20250909095651.5530-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_025808_733254_0627FDAB 
X-CRM114-Status: GOOD (  11.16  )
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

Make sure to drop the references taken by of_find_device_by_node() when
looking up the thermal sensor and opp devices during probe on probe
failure (e.g. probe deferral) and on driver unbind.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: Roger Lu <roger.lu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/mediatek/mtk-svs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 7c349a94b45c..48804e1e5a6c 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2165,6 +2165,13 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 	return dev;
 }
 
+static void svs_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
@@ -2216,11 +2223,13 @@ static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
 	u32 idx;
+	int ret;
 
 	dev = svs_add_device_link(svsp, "thermal-sensor");
 	if (IS_ERR(dev))
 		return dev_err_probe(svsp->dev, PTR_ERR(dev),
 				     "failed to get thermal device\n");
+	put_device(dev);
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		struct svs_bank *svsb = &svsp->banks[idx];
@@ -2230,6 +2239,7 @@ static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 		case SVSB_SWID_CPU_LITTLE:
 		case SVSB_SWID_CPU_BIG:
 			svsb->opp_dev = get_cpu_device(bdata->cpu_id);
+			get_device(svsb->opp_dev);
 			break;
 		case SVSB_SWID_CCI:
 			svsb->opp_dev = svs_add_device_link(svsp, "cci");
@@ -2246,6 +2256,11 @@ static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
 					     "failed to get OPP device for bank %d\n",
 					     idx);
+
+		ret = devm_add_action_or_reset(svsp->dev, svs_put_device,
+					       svsb->opp_dev);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.49.1


