Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8549DC369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHD8DA6ZrLWR8PbV2r9S2+5wUGj/im7wSlQy0Cdw/NM=; b=VOHEDlhFgQ8ACgwTbapoDUBRbq
	3cj8OIkQtLGo5t/Das4X1CSwPrmCZWszY7LDfbfId+P4EmFJyYGvmt0S/QE2L28Ka+hRnzC8SRJ5Y
	0lz8UhMCfcLC0p9PE0dbCfjr/Xk6mK0qxUuL/5NbtFSP3sikharnFV/g1gp1auVEb+VDfnsGaZlQx
	kc99KPGcTi5VLOLm47q5NDLUHsPbuZYI+dfvGRZ1nvk6ZSEcbyVrKBgSY24DfvGC+QYswZiBo1nby
	sH6bP1B81fi0TSJA0TT95pr18cgV1ED2anux65MwJJBURputOnBLXmx9wyC7tRHk5JSDI2EYME2Bm
	MrJSB80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmz-0000000AWyt-0vTF;
	Wed, 23 Apr 2025 13:05:21 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBVR-0000000HWhr-3a63;
	Mon, 31 Mar 2025 09:32:35 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR5Wd0yMcz5B1J4;
	Mon, 31 Mar 2025 17:32:29 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52V9WGgO015083;
	Mon, 31 Mar 2025 17:32:16 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:32:19 +0800 (CST)
Date: Mon, 31 Mar 2025 17:32:19 +0800 (CST)
X-Zmail-TransId: 2afc67ea61234f6-46bb8
X-Mailer: Zmail v1.0
Message-ID: <20250331173219124r-M-68bU1iEuljZXmBeS8@zte.com.cn>
In-Reply-To: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
References: 20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDQvNF0gZHJtOiBtZWRpYXRlazogUmVwbGFjZSBjdXN0b20gY29tcGFyZV9kZXYgd2l0aMKgY29tcG9uZW50X2NvbXBhcmVfb2Y=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52V9WGgO015083
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA612D.001/4ZR5Wd0yMcz5B1J4
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_023234_035641_C85ADC57 
X-CRM114-Status: GOOD (  10.94  )
X-Mailman-Approved-At: Wed, 23 Apr 2025 04:25:00 -0700
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

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74158b9d6503..e1fbb0fe0597 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -627,11 +627,6 @@ static const struct drm_driver mtk_drm_driver = {
 	.minor = DRIVER_MINOR,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev == (struct device *)data;
-}
-
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -1119,7 +1114,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
 		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
 				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
-		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+		component_match_add(dev, &match, component_compare_of, &ovl_adaptor->dev);
 	}

 	/* Iterate over sibling DISP function blocks */
-- 
2.25.1

