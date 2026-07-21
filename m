Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C74C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eXHmL2FrSSPACEJW/ZdN2+RZSdHtJBbjO91JeCFP0A=; b=SYDuH8EpfCqEVNvOczurc7vT3b
	YnezwWi8Yjtr9O6cqmL3jAQp/rvputhBY5loMyckHuzyq0JPVCGuyWWqGfyT4mulGxAv6nw0HSgo7
	weKSvHaU8steaLZ9fWn0iNepcIsjw65tt7ocwrzyqpTUk/njMrWcU49/ovxN66dRLUfXy5JBcMsgo
	c4AS8lkCu+53f6UVss0UvO13jnTrreKPhzO/qDEl1oHCP24f7qYUpzdWYR0p8b/5hiLO1ZEKUVxJQ
	erQBZp+LqgZqI5RauWOg/W+J0Q3F23+kvHXiATvM32n11wITmhGWaNKyZJ0/+XKrZIbpSYc+UbN6B
	Szi36FZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCJF-00000009nEF-0G4V;
	Tue, 21 Jul 2026 15:23:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCJ8-00000009nBM-29N7
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 15:23:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caf228a910so90662265ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784647372; x=1785252172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9eXHmL2FrSSPACEJW/ZdN2+RZSdHtJBbjO91JeCFP0A=;
        b=ZwE1sRgr2O/d6uPNTKtXgpcEXOAdFxv1jtQdJr9g62D8h+KonH2XJgOE9/xJJSPyUz
         dBPJhTKFjBiKZmRZsPnMImZ1ls4MigCFPRXjStKV2t1IMYw8VGWDXp1kxK2xRY5oqK2G
         BB5f7zerxFmMI0xXhPLI5GIq10JvBApS6wL/yB6FWmOgNR0ukon+VMaFD1IakBeON/3h
         s2A2N+BcRtJOkkvTyN+P3rTS35zYGDAC9xDUkF9DHeqgg03ZTqhKB9s9RlLLJTR9oO5n
         3VgsNFf+KXN+hSN3wLKRoC+fGqX2CIRIfFV3Brz5tvnPxEcfBcIbDdKnh+zBoeWFzGV5
         lcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647372; x=1785252172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9eXHmL2FrSSPACEJW/ZdN2+RZSdHtJBbjO91JeCFP0A=;
        b=GTK5Jfyhqswf6U74W+011a7Ny6WMpI/7OVLC6Gu0JaDsgp83FuwqGKbG6bBfR6MSY4
         2/9CWaOoeEm7CCIOu4rYoOtTxvBaiuJEwwDTDET7aBuasP+LKGVZU5ggnsx3VLD8zFtY
         1DQpb/BIZq47KHOugP2MVur9KfBvTND4qTj2Glg7CTeCuincIU8z7r/w5Gpq7ZiY6awg
         e0IUQvU0Bg3VO7ZrY1fUBjv4TALnJdqsxTnIm7wWGQu8gx7X9C34Du7ASAmo//CHsRBZ
         3+vfsrC/I3qKsha6r8gv/w7Y7+WARXUxNb27r/GFtQD/voMH4IQ4EOuRlLSbmaynIEH9
         Iqzw==
X-Forwarded-Encrypted: i=1; AHgh+RqVMCWZmKQgzZfnNLl3clGADqlY1LW4IXC7we8o2SFCNgP1N6eiAA8BG6dnmNgXR08Xo/zML6GnAtEy5gA08w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBvPt53otDAd5NaikxcIEFw94kUG0ZYGlKA1H6ipbUeiyhAmE0
	yZ9CzUBkA/fOJbWxRzD0zDCPpqP0Jc9e5T/c7V+rQY5xrK8TezmcBVY=
X-Gm-Gg: AR+sD134OTIUtRDFJy+mXRtm0A+WqH+Kr9JTBV3EjqfYH/F1GakeFF+HAJcR5J+tZ0e
	mD8yGjwnDP098Gjon4J730L5RGuAqIjv3rR9mpy3fNEE/BC365RwD4Q5k4J5So9enQG3jh/aHS7
	pUgEvNqqw5paXxi9fbtUx8Ku1GKXQBVFIhfBoANiTCVPibdTjWIjxzKXjlCMNMRjiLVx1CRkGED
	SRE4szRQtAyOeBvf3NVzyYjUA5rPKQ/sa/76ykT900JWXSsAWAjFI88S8yX9kRejHHr4Qt4u+2c
	M+i95hMtShX3ICx1lsTgA4AyzNSiSu58S+JVwr8qfOWB1YB1ZOw585rtIwS/hYgRTitn6mb9DPb
	+TY1ddQGnUfWK6UaEbWQw0kFayQLHLpG2dToTjZ/vjwqkJbAzVQRHt8aODZiPJIyctFcWa/LAjx
	FZeWYaDFM/NZ4dlMPkUmxhw1Whp1jioZYuE7UjseR3AbxhCBhi6Ia53hLxpisvC71q9H+8qUUSx
	aLQzYNvZdOn6jghKls8gL+lsljECJhAvHDBVdI6
X-Received: by 2002:a17:90b:1c02:b0:38e:2aa8:60d0 with SMTP id 98e67ed59e1d1-38e4b586067mr20371153a91.37.1784647371935;
        Tue, 21 Jul 2026 08:22:51 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm1402904a91.4.2026.07.21.08.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 08:22:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/mediatek: ovl_adaptor: balance component registrations
Date: Wed, 22 Jul 2026 00:22:42 +0900
Message-Id: <20260721152242.47138-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_082259_188549_3E4E9D56 
X-CRM114-Status: GOOD (  14.86  )
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

The OVL adaptor registers both an aggregate driver for its child devices
and a component for the main DRM aggregate. Probe currently ignores an
error from registering the child aggregate and leaves that aggregate
registered if registering the DRM component fails. The remove callback
also leaves the DRM component registered.

These imbalances can leave component framework entries referring to a
device whose probe failed or whose driver has been detached. The aggregate
unbind callback also fails to undo component_bind_all(), leaving its child
components marked as bound when the aggregate is removed.

Check the aggregate registration result, unwind it when the component
registration fails, and unregister the component before the aggregate on
remove. Keep runtime PM enabled until both framework registrations have
been removed, and unbind all child components from the aggregate unbind
callback.

Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Cc: stable@vger.kernel.org # 6.4+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c0af3e3b5..6a259872b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -625,6 +625,7 @@ static void mtk_disp_ovl_adaptor_master_unbind(struct device *dev)
 	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
 
 	priv->children_bound = false;
+	component_unbind_all(dev, priv->mmsys_dev);
 }
 
 static const struct component_master_ops mtk_disp_ovl_adaptor_master_ops = {
@@ -651,12 +652,15 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 
 	priv->mmsys_dev = pdev->dev.platform_data;
 
-	component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);
+	ret = component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component master\n");
 
 	pm_runtime_enable(dev);
 
 	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
 	if (ret != 0) {
+		component_master_del(dev, &mtk_disp_ovl_adaptor_master_ops);
 		pm_runtime_disable(dev);
 		return dev_err_probe(dev, ret, "Failed to add component\n");
 	}
@@ -666,6 +670,7 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 
 static void mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
 {
+	component_del(&pdev->dev, &mtk_disp_ovl_adaptor_comp_ops);
 	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.51.0

