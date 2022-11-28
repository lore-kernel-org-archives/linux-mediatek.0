Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA99DC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHwI3XSCF9Xm/ixf9DTP//TAdCfsw6W1NfmGmHA5OdQ=; b=c5eGJLdiox0Yh8Qd0x0f3yB0RD
	H+g2q4q0JIYc2wNATBiePC69jwEo1ysTJ7JpzUz4W4UbJoykO/tgryLU1a77KSc7kn3jcuo2XbWwP
	6eBTRNhtAwWd9bnsKFv60HFa6IU3n2KPblyzaP301ikEyj8JxE99xAXzjuknn+Va7KB/IvUhCrYaX
	pY4/NJ2TmdgbdAjP7/D27gYwgtObwAyyyJXNAcPDrYuBxDzt1px2FTqZR3qiZPK/yGsBQZ1rPnLkj
	UzEGdIKkXiHjb90kfMwk2biUPd5lE1oMq09VDHMHA+dOmScMdyGpnoDMiznVdoaXj1A0rxwFq84Ng
	DHqsqb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbaf-0015VZ-54; Mon, 28 Nov 2022 10:42:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbaU-0015Sl-9L
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 10:42:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id gu23so6454494ejb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHwI3XSCF9Xm/ixf9DTP//TAdCfsw6W1NfmGmHA5OdQ=;
        b=jFIMFlldtEvCwu8Q/gTU08imnzn/u59isuqigG5cB1thrAPA5enOekfgksDpNGCIjl
         RlE6WINsuSe1QttAPSF364HJKHx63RvdOxVYn2jwQnFRoLoHWYFBUP4zVSmzqEmtaOxi
         83J3x5bWzv8et/sWtfW3pJfd1RGXQyL25rqdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHwI3XSCF9Xm/ixf9DTP//TAdCfsw6W1NfmGmHA5OdQ=;
        b=RuasPQ1WhUR7x4pxEco79gqKRCzye/XOLZqiu/irHq9lAH3Ofhs5pNb0xCJROp0OLY
         x6+TttCavBTU8uukkCSf5H0lkeNtgrAEEs8hqgPZLyAGZcEWgstLl/2ATvBfOjHbtLkq
         eGmcEa6dC7edfUKcGLY7KTy3c2mIUmNxojXPuGFLoU7uJ1gpDWUus0Vv/gMuSu5DkJCU
         DH6xwAi6TTNiZzpSr8eNPG8T7jNbyr2RAhoiTRW0RWK/hsRKwaQnZvq2k80IImEd+0ul
         64pvLyoU26E6LmkDmx9knS1KzGtbIBdoR+EzvoCGeOi473Li4EOJjVHuw2oU9xz391+8
         yrXQ==
X-Gm-Message-State: ANoB5pntUSLQsuw3MbJuQmpA4sDaDmYhrgAVDPCGgq2oe5ZNZyODBuSj
	3RYfOceda8Zs4AkYn6CEblEzT67t0/9UiMu2
X-Google-Smtp-Source: AA0mqf42ArB0GBRjO9LWcoJg3tUHtZk7zSGSmz+eSpPHBPRTTeYGEtoeCsSCKZdAflmzETXsNYX5Gw==
X-Received: by 2002:a17:906:4dc7:b0:76c:42b4:dea4 with SMTP id f7-20020a1709064dc700b0076c42b4dea4mr41621528ejw.515.1669632127028;
        Mon, 28 Nov 2022 02:42:07 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s5-20020aa7c545000000b00458dc7e8ecasm5016597edr.72.2022.11.28.02.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:42:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 11:41:47 +0100
Subject: [PATCH] drm/mediatek: Implement shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221128-mtk-drm-v1-0-409e7f2352e4@chromium.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=D8I9JOrNxoD2noU7pEX1LXJY3rKJrpr+ZszgfEs/ju0=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhJBv4JRMG5RtbNGH7d2EK8qRddHPwpyqgEl8dB0w
 qgvWDvSJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4SQbwAKCRDRN9E+zzrEiKhUD/
 46D0NWufCT7WFLGRhWIEGihB2is5rM/hVfj14gKOm5QldGwqzlGHGgSfucN2P5UgNl4BgG0FoSMCec
 z9DA8sFbd5OM82xnz6X1Br6XrdeLQuYdH/3HP5zKC6Sbv6qb56m+i9BYOIEw6Ii6YwYrsvoVe19Bs8
 uTtwv/j4m7uSivKnlf7bh4vSldbnbOgsaVfvwArKpRH3few1WPMpCxsfHT8jOML94ppHCuF2yH70SC
 ykkb+4lSJAfo18CEgBCPBkcEds2g3IlF8DIrmd/ZaYLe6/hfNHbbWuZCMJ7q2Pd8QLlvlpJb3TP4m5
 9VZRHwE3YZUk/az8KVfHziDjHCWOoJO2XyxqLVkHeQ+w83Msd19ZjIR6VckY7f8clKJcmmJrw/qWm1
 kwdl15//jHM1FD1JdFDyQZ2d03EXIzOf/Nk1HYkTb2oGWZD8JM1cYe6xttf/5fdPySaW5uSb0OeIBO
 nxdu1lMWPl4uwoHPOp7q2yDHw0uqYhnLmaQOLQHnOuQ1VA8+2DnB7hDwnv98SvVZipsjLzyc7iOEzn
 b9OluLsSYeM48PPTdM5B3LyqhKRxX/KFoxR5vBrJDGq3mUOGTLTQIZO/ZWefjFDwBN4uhc+b7E6jzB
 p1hnRnV3eIfB2eTmRVABxxMSabLlV0bX4rDoSS+bgU94gqvUhDEBSSpJYzUQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_024210_332196_DA6845CD 
X-CRM114-Status: GOOD (  12.01  )
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

Poweroff the device properly, otherwise the device will not come back
from kexec().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..51dbd85796e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -829,6 +829,12 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &mtk_drm_ops);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -856,6 +862,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove	= mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221128-mtk-drm-ca6c5ac6b389

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

