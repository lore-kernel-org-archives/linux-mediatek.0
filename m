Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03681C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=; b=KfBT1CkF33gJDwslh4o3RvRb25
	sHRweUL2P7XORY0WT2gpJA9Z3ax/i1F7yawETVy1aSy35P18ynNKWoruhlBBR2yKNy2LsXFITHde7
	djH0r9t3MRrVeE2PAMdW5ClDwIzABZz5UbZzXOj+YSjx3TzaEBV7kWUvkkfgD6G11DRsUaivQlpef
	nyGDRi7nRFnw8XKBxvKx5MgT6zzwCtr3wocrS8SsU3u1EYh6RgpwkcHDWXbl50AeohLZGKlMesyBS
	QKBB/MgmpxM/r8XxdC37bv0ZWuPPGjK3X5MX6v9k46G57E3et8x0KqVouaCRSUrVFItYdidFVtUY+
	vDsR7Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rnj-00000006LHG-14T0;
	Tue, 15 Sep 2026 11:58:15 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rng-00000006LF8-37AM
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 11:58:13 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so2740229a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473492; x=1790078292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=LjuV5cDdC4mMuWZDfAM+3MEykNztWrJLWHBmDUn6v2o9a74FUX4N9KsppZhJtEVkA/
         ZfSOdSkFXh8KvqJhSwUxTaJPPRyhWRYua5JILRQ1sYKq/k+LcIqvavAf0ZBcn2+GoApt
         QFZrod6K3WsPt4ZbreqKS+G1I7GEW+Y+PDyXmkaL5H7qCD/URVO+71ZBVW7giqw+0SGt
         /ziv5xRa/z09aaXKX1gd+68tdpbelTMeb4+WswUxTYNzZvdSbF3EFDxVxbYyEMdUZCzw
         gz44zciawEGW2NMC1zbVluZvgL9GxrPY6VFZflf1RO9cw1D+3L/f3wWM9nNViULQtBKr
         RJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473492; x=1790078292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=F8dOna5ojK/EwvjPW3+XMSI9O7uqYOrRY5lwvNxYHS4WClPUc+M9JVyJqhgmjcgKHc
         M8+KWrEoRlH0XBx69SIlYqHbnxxxYDtpkydCISM5WkaFSK61QZGaHyym5RJwjpO5vfIP
         gflf8SFhjtSjtG/Z6Eth77pV6NeZc9c+7hR9gDbPLOthdAnbobzRuStw1P9kHq8Z1Lfr
         7r65oaMtpZRQ5dFOpWTEH/jSO1CY03yzCsomV9dTCmstC25ClQT4vk7E9Sc220gtnAP7
         ynot9Fg1XNY0/S+qgGusmUJ95lwtmXXxSDdADC7SnY5aFTL0jBoPWQd/r6G/XSlNWd6d
         uZ2w==
X-Forwarded-Encrypted: i=1; AKwUvByFbFBO9mipblpoEi0o8TGMAxg2iEKoZ+3mDN1GjRURAMOLtwWmpo71RDmvqfxH9VVVBRV3U76+3vfIMahg1w==@lists.infradead.org
X-Gm-Message-State: AFuF++lwoHF6yoqiuqOewSmyelM2o8rpXUUPhJ9ooTJ2R5BlZAzBOeTJ
	xsFMk2J4ZPtaZA5Ad7bfMU1Zkm7vcuPxhVModdb6uY1cUTtWpZutaDut
X-Gm-Gg: AYBFou1Yd3CLTwAO2Ja0PllLG9OVjTdcfuMw2RDwBVUkJopJJ9Ub/bsRoSoNEsu2fD+
	R0PZ59gsGcBWtoNh6+G1BVv5cbUpPdbM+Cr36XHv6gzkf15kVEo1yfHizEaKxKyHGNGJDvx8AYU
	03kCQuKX2CNJ/jiCBPm+EdiyiAq/NvUx7PW0GzDcd+cinKleVPQTZqiNXDTmd+xvJY7+J1E9r8G
	fwXYROGdnW7nD6oUWE3qbsY6rN7rpeqHsgIsQashQSPXk6kw8J9UppT2We9lG1adXCMOCz1eZcb
	6myFSCjlUBfk13mYiKAH4euPtVG27pzhMx1nBIrW/XxgURaZZsOddbHSFnvlI4sYuUWm/UAc4u0
	CHaB+vgYTJbfzy1NhVuwuFUSlvid3iR7uj6tslnpmMirBXv1Nub7wg9g5QbUk84iqZ92pL/WQvK
	uViXY2oJ2OEyEFJGcnq4LRpRvFLdDiNlEfiYVd0+llRNwqKiwEOmulzQ==
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr13558544a91.18.1789473491565;
        Tue, 15 Sep 2026 04:58:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdacba6bsm4953697a91.14.2026.09.15.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:58:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fei Shao <fshao@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: destroy core workqueue on remove
Date: Tue, 15 Sep 2026 19:57:53 +0800
Message-ID: <20260915115753.2411047-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045812_793049_36BF7DEB 
X-CRM114-Status: GOOD (  10.93  )
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

The decoder probe allocates core_workqueue for latency-based decoder
architectures. The probe failure paths destroy the workqueue, but the
normal remove path only destroys decode_workqueue.

As a result, removing a latency-based decoder leaves core_workqueue
allocated after the device lifetime has ended.

Destroy core_workqueue during remove for latency-based decoder
architectures, matching the cleanup performed by the probe failure
paths.

This issue was found by manual code inspection.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..426d060d937c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -570,6 +570,8 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
 	destroy_workqueue(dev->decode_workqueue);
+	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
+		destroy_workqueue(dev->core_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
 		media_device_unregister(&dev->mdev_dec);
-- 
2.43.0


