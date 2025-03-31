Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4812C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU9dCdvniaInZWAWopxv6JyrctlvMLX0CSO5NmK++Io=; b=J8QQSDJ/5WkH1+b11Qh6VxCIU8
	47SgaS2VrisTA7KyB/Y+MK8OmIWRhLaZt9Pj9M7w6qi2itdn6lv2X5w++KyB/mNMW42fiVIXDSw4S
	32xbkPrM7fzjWzx+D7ojjCSbxRmJbGwP1qjmxNXg0WpV1VildQgAy48ZyYQw7hlSWCxAoX1uj6AGR
	3DETyqMBMUtiPuCWhJKkgX6R8iVCV5fYIY2vQO927P78U7+LkAGg6OD3HmR3zsJAU840apdK9xHTG
	fla3arecKWtSVqt2iAlk3moprzcaAXcTgHHtXOQKOrKzSHRnMM4yflTks31b3psUfzIOI5PBrs/cs
	NUq0PAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmy-0000000AWy1-20xB;
	Wed, 23 Apr 2025 13:05:20 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBTR-0000000HWNG-2Kgt;
	Mon, 31 Mar 2025 09:30:30 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5TD2Vcvz51SYB;
	Mon, 31 Mar 2025 17:30:24 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 52V9UFYJ012636;
	Mon, 31 Mar 2025 17:30:15 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:30:18 +0800 (CST)
Date: Mon, 31 Mar 2025 17:30:18 +0800 (CST)
X-Zmail-TransId: 2afa67ea60aaffffffffe28-414f0
X-Mailer: Zmail v1.0
Message-ID: <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIDIvNF0gZHJtOiBhcm06IGhkbGNkOiBSZXBsYWNlIGN1c3RvbSBjb21wYXJlX2RldiB3aXRowqBjb21wb25lbnRfY29tcGFyZV9vZg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52V9UFYJ012636
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA60B0.001/4ZR5TD2Vcvz51SYB
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_023029_772676_8392B51D 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index c3179d74f3f5..45b1dc5613bf 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -346,11 +346,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };

-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int hdlcd_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -361,7 +356,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;

-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
+	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
 	of_node_put(port);

 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-- 
2.25.1

