Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4306BC3ABA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeyD6iACjvlQnXFQOpjCLjo/wn+JVJd4OrROUx2tpAQ=; b=n5tdgLyAdx1vOeKhsQODoHWJWa
	Y3T34c4GsErLQTjRpTyC88vegqvvxFXV78mXi1QiIh5dFMBy5BwwuNo1DJDdutN3BwiDu+JoInNJ/
	oSJR8lksZGhEcZkljU1AsfSwCpiyKfL+BALvG74FWwi7d1ruJM5Z3uHHXu51jdh4Gbb7Bub7kgwVx
	zC/SCdFoyWJjvUi3RgXICv0+Cvnys5xa3K4+DTzalPlIzXSLlJhHgf57L+tGH3ZGhTHbuDxK1GjnC
	kP4wHccggUDNwk2h4ilnkdkl/rhw5tweX1JmqzcaSOeUaUqQTFVhBmiL911Q+u8rJ7E3UO8fXSOya
	99OsejwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmy-0000000AWxT-0abx;
	Wed, 23 Apr 2025 13:05:20 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBRv-0000000HW9r-2RaD;
	Mon, 31 Mar 2025 09:28:56 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR5RM6VpRz8RV7S;
	Mon, 31 Mar 2025 17:28:47 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 52V9SgnN078747;
	Mon, 31 Mar 2025 17:28:42 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:28:45 +0800 (CST)
Date: Mon, 31 Mar 2025 17:28:45 +0800 (CST)
X-Zmail-TransId: 2af967ea604d2f7-429bd
X-Mailer: Zmail v1.0
Message-ID: <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
In-Reply-To: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
References: 20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>, <tzimmermann@suse.de>
Subject: =?UTF-8?B?W1BBVENIIDEvNF0gZHJtOiBhZHA6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGjCoGNvbXBvbmVudF9jb21wYXJlX29m?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V9SgnN078747
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA604F.002/4ZR5RM6VpRz8RV7S
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_022855_771051_FE49CBA5 
X-CRM114-Status: GOOD (  10.82  )
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
 drivers/gpu/drm/adp/adp_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c98c647f981d..32350c1a5c1f 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -551,11 +551,6 @@ static const struct component_master_ops adp_master_ops = {
 	.unbind = adp_drm_unbind,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int adp_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -579,7 +574,7 @@ static int adp_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
 	of_node_put(port);

 	return component_master_add_with_match(&pdev->dev, &adp_master_ops, match);
-- 
2.25.1

