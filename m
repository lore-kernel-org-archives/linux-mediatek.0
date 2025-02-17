Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF112C021A9
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2025 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIBHtgdm3TrAPmQJouN0w2NuZU9q7JEQtWInWJN9QHw=; b=huQUoL4XzWmWPkJ7P+xLMwlui7
	OlNn5Ve/J3IyaNm0tDKSUnQkp04vzfBttlHVdE9WmCd0X4GSEU+mPIIR+oQC+aGE84FRodKxiVApS
	XPRzhq2S8yqpIO02TtWv95JnVa/Um90Cr1NNMKiNazp6niVUOwqjVqGlyCWB6RbcV2YmLjIoAvRM5
	wm5Q1diW6H1Kn5Otp8esVSW0H91j3KUJxdV8cqv5QzOS3xRiEEGBmewDXY7s2QB7jHS86FX3D8kb5
	X7KKVtcPRIfmo56zAzoWGHkzw90phfhrnYmntEwhSqVZKkU2IeFTDPl/rghppCfZMuvHjYvYV77K0
	SaxHHJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk42b-00000005H6G-3hrR;
	Mon, 17 Feb 2025 16:32:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3NM-000000058CA-2Yzw;
	Mon, 17 Feb 2025 15:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807379;
	bh=l0AV432P8d+dCzYhkMCk1YC9aNPOF+z+9PSOaAxAlic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gu8/YZY12B99yQqKjtVGFj3kwoafUSwnKr6fRcYRpQrF6zM2sGpg7yM3UAduyZv9Q
	 wj0Kj+AI8j7aUJpKoFUo66Vwhk6V6ufyQd9Dhs13J1PGDA9xOvra23kLR0M6vkEQaj
	 K2HANdvX12TksSDtIG7UohIXI0e1crCfs6qyVciXY4R+jIjfgSy22TQh0913VmlebO
	 NAdwb6rlrYGv2szRJsj0h4rOAz/gcTMFlAdU2BjgZmpYYE+XfoXc5RFeZsiRaeqiEm
	 DjDaP9Rbl0pGGGYT4xS4kMyHFRXehqi7gysKRHmV396BAMbbgQDKOHuGE3l7PwPnSp
	 jVGam75dhG/Lg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F398817E154C;
	Mon, 17 Feb 2025 16:49:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 15/43] drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
Date: Mon, 17 Feb 2025 16:48:08 +0100
Message-ID: <20250217154836.108895-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074940_796861_6D94A49B 
X-CRM114-Status: GOOD (  11.36  )
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

Now that all of the mtk_hdmi subdrivers are a platform driver on
their own it is possible to remove the custom init/exit functions
in this driver and just use the module_platform_driver() macro.

While at it, also compress struct of_device_id entries and remove
stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e648fb5714e7..1e50b3918069 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1801,25 +1801,7 @@ static struct platform_driver mtk_hdmi_driver = {
 		.pm = &mtk_hdmi_pm_ops,
 	},
 };
-
-static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_driver,
-};
-
-static int __init mtk_hdmitx_init(void)
-{
-	return platform_register_drivers(mtk_hdmi_drivers,
-					 ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-static void __exit mtk_hdmitx_exit(void)
-{
-	platform_unregister_drivers(mtk_hdmi_drivers,
-				    ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-module_init(mtk_hdmitx_init);
-module_exit(mtk_hdmitx_exit);
+module_platform_driver(mtk_hdmi_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
-- 
2.48.1


