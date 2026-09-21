Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B9AC982E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=; b=Ed7nGvGxZaz2SSVIQXJLRNjyLZ
	Yh3jEcLaq9Lp0rRYRsrrXq7TgDtQlPOEhBm2TYIkBOj4FhkPivowoTFspwPbdP5GMOwkFNJTIA2/T
	3XWsQuM5CfAmDWG+BwSuH7eq4qjT8abA8PSg35jdnGWgU51r+HVupuSBtQfRknZCqKhB2wAx1ZoIb
	c0CuUxZiNCE9W+AdbJK2Giq7lYdQNLqY1RdqpMkp9mGIvxmDmr27Zbi5JjDtHy94XGMA/txlY7T/F
	4dNUvZFzM5ClkJ78eIRJfIrghxY0dOGL5RhsAsNFMbfgpGOthjESQZSbuO5Y3l1wyA4lcVMCeShLz
	naXqDMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a0e-00000001SXg-0usE;
	Mon, 21 Sep 2026 09:08:24 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a0b-00000001SWS-33Tw
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 09:08:22 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1604101a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981701; x=1790586501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=Dhv3CYwcalfU04oqxQkTLB07ROKWWrtIN2Ze8BqDo2BE9n+543/4dB6dkQuwaE6bp5
         UIaxxXZyHIl/6Pg1TlbQGF7MN/FCFzceXH1pYuo3amqbiZZWZyuR4EwwjJ17xaMKa5SD
         0dXFsP2cwS0kLd5NnzCj4WnAgZBtMRIVYSOIZchofjRGnmvbpipsOuZBSxdxEraAx58P
         mDm1YQ1/XEtm7D25AFzVYeCZBryXd8Whpp61RkSwC8JPPGm5pQ29I6luFl3lH3oddEdz
         FOJfg9xJjZrLCQGGpmK8KzMyjaft400a67Wp5i7Fd6B5BDu4k8JCdZ8Cbo0ir5t5VbvK
         IMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981701; x=1790586501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=jJMFKuTQlz5X0CUBFivKZSf5vmnBK18B7aXEYKjX5IM1Cji1/pkw8IbPXaPVXBL7Ik
         B431BkjWvMJHcBWhUvQ3r0QSKc88gHM2YYWuDCEuFXk/AOym1aTRxj85huOr53eMFcBX
         A+vjdnPt/bvv7+0gpEkIVNGWiJM00LNN+GwHFw58t7g1KOOMie7UCIzbyOHimN8Q2zLe
         rlKLzNbRJIQNsIu/Hj4XJhKKFv/Oj5rL4C7hMZz5PczXs3Pbm21rznj/JOz/RIKu77Ry
         gAxFJJZWgm35OG+hSTRvXEryOjyzRUtAlP6IrwKh0r/ZVk6SAafvzSS5OAKALbeHvy49
         yftA==
X-Forwarded-Encrypted: i=1; AKwUvBxztA1dKaJjD4DrJUEnNrT2HSpDwpHmqBuSQ4ZULVKruXCPNowa65bR5vvAly8ATGsuWOuA3cLvMty/koKZHg==@lists.infradead.org
X-Gm-Message-State: AFuF++kC3HpDcVRTT3fH8oyoTNXiTw92v3iM2eYOIk0wspSy/hkFW6Hr
	uxxEN3hPk0MjL48vhbZZwimn6Rf1SiLJMuRv9oKN3edxirvqXF5E15y9
X-Gm-Gg: AYBFou354XjpolrUjm+FX/v3MxCREcUGKL1fe4UwZMj6PSlnsyGmYGgWCl4L8WIQ6ea
	plITDKSUL4ESvb9r+/0rF2+h77AL6l4q2TKsYyKWafJC87hjbKhLF8wLYMq7oZuDhkRidyBy5Wl
	p3Y2YbnIhB+qX6LtBo/tc4GqVWVNPMZ1XjcbOV7uCF/CBlS2Frr1eOqy7N9OYf/GHKrRf24ivAR
	CHDpj2M/SXpx01Nbf8jX+hIlsXqPXMnsU+28VeeS9DB0VBnglzR8BOX2rX4YVjLzHyiO/I+4tp7
	s7P5Uqnlv9F++tWtEZhZPTmPFpdDX9yxZSLm/1sMVZEDf9gKXtIF9yD0bUWBR5z9Fb+/ESJIFND
	h5kpwB7/M/Kn1uurc0ySccSlr00qoFFQRMWNYFeGUcGij5eiQEH+Mh+NYfBn2AWBx885e61nTpc
	PvP3sbT+2BtqyAYKEfHVTtON9fvV0pc1yWDFGLw1N4o6QdR87VMx+Axw==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr7862823a91.54.1789981700866;
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm13203772a91.6.2026.09.21.02.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix decoder child device leaks
Date: Mon, 21 Sep 2026 17:08:08 +0800
Message-ID: <20260921090808.336112-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020821_766864_19290219 
X-CRM114-Status: GOOD (  13.21  )
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

mtk_vcodec_probe() populates decoder hardware child platform devices on
platforms that support decoder subdevices. These children must be
removed with of_platform_depopulate() when they are no longer needed.

If initialization fails after the children have been populated, the
probe error path releases the parent decoder resources without
depopulating the child devices. This leaves the child platform devices
registered.

The remove path has the same issue and leaves the child devices
registered when the parent decoder driver is unbound.

Depopulate the child devices in the probe error path and in the remove
path before tearing down the remaining parent resources.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..592685ad522c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -517,6 +517,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_mem_init:
 	video_unregister_device(vfd_dec);
 err_reg_cont:
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
@@ -569,6 +571,9 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
+
 	destroy_workqueue(dev->decode_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
-- 
2.43.0


