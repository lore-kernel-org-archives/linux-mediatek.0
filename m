Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EFDC3ABA0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SYvTqhFnkhrkpAN5WfnGyeMD06OmBjLaJgPrClWk9s=; b=BYD8JbJMvxal1iJqfLTVrBxrGw
	QehUw0l/j42HDCl188k27S4jal1A92FMR1VikKj5QAxd8E4tlwpc+/GxRpw73Xvbl8akxa/+4K6T/
	MkM4VOrrLx8/Gs6SRQwE/H6RcOamb4GDSCv04UtCs+rLfnuv0nnN3j9/v+l4S7s7gXD54BK9nqr5k
	EjsNPmcKJGj5ja6LcmHPltv7mlmcyu9cBT0kHg5vpXDZNZsEwyMTGLrZZ306ll0NesY8Y/hsL9tLv
	VDEDF3fi5fpUP9yGE78fpAiIfUreWV6gUbKYNHyRRsLmWc6vVFRu2IAbcPA9Bl7hs/NyHkdiT8kB1
	YUnMvVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmy-0000000AWyS-3S91;
	Wed, 23 Apr 2025 13:05:20 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBUq-0000000HWZK-1GZp;
	Mon, 31 Mar 2025 09:31:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5Vv1Hrfz51SXr;
	Mon, 31 Mar 2025 17:31:51 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52V9VLLh081624;
	Mon, 31 Mar 2025 17:31:21 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:31:24 +0800 (CST)
Date: Mon, 31 Mar 2025 17:31:24 +0800 (CST)
X-Zmail-TransId: 2af967ea60ecffffffffa1c-480dd
X-Mailer: Zmail v1.0
Message-ID: <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIDMvNF0gZHJtOiBtYWxpZHA6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGjCoGNvbXBvbmVudF9jb21wYXJlX29m?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V9VLLh081624
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA6107.000/4ZR5Vv1Hrfz51SXr
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_023156_503911_35C09664 
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
 drivers/gpu/drm/arm/malidp_drv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index e083021e9e99..e2e6fd1f64b0 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -910,13 +910,6 @@ static const struct component_master_ops malidp_master_ops = {
 	.unbind = malidp_unbind,
 };

-static int malidp_compare_dev(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int malidp_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -930,7 +923,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of,
 				   port);
 	of_node_put(port);
 	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
-- 
2.25.1

