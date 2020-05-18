Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E0C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27A7206D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3ZZt1Az";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3a2r826"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27A7206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OW5E2iguEKsK6FsaewfPpT3W+HsbHyA4FnoHfLhQh8A=; b=V3ZZt1AzWJWkSv
	AeGLgx3YnKbFZqN+eK6gDs3bO3K21aVF5P/5t4nmS5Gpya800ZGA1FJyNIV1DfErj0n+ip0GCgifP
	M6hft45PtO2/mxDsFPQpzU7b+5wNXcRICflOz5j3P+uHTgXVrZxT17VemgIvA2Pd+luK76snmST+d
	rAIkFIVFQ4u6A28XDgHQVy7/oqVjzSqNSll0g2FeR7EXOizC+tK+BuadscVl9NZKwuF+CfypP6ZYW
	7Mz6Y5RS9lr4yp8L1WYB+uZAb1IPqMzrTinBrZMjgT58IbgWUFSL9ENxmbuiojwzHEchbpOkx4Mz+
	p2v1NeNUw5BxSyzAEsoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jadrj-0001Nz-Ls; Mon, 18 May 2020 11:23:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jadra-0001FQ-Bj; Mon, 18 May 2020 11:23:19 +0000
Received: from ziggy.de (unknown [213.195.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E34C7206D4;
 Mon, 18 May 2020 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589800997;
 bh=UX5hVzE4RlHU3iDBRST21Nt0Qg+SmpVsaSQorMHrC0s=;
 h=From:To:Cc:Subject:Date:From;
 b=l3a2r826A4ELNWXZVsYarsVjGOrBdK2avwXVLH5up1ebMFSSDndfmDI6oGGUjXct5
 DoGsL3Smh437oCwNPBt09u56feV9t6UK/Nx+r+MlMDnPPZG6r9C/eSupiHhLyZnctK
 RirMJT1/iWD+liNMDCkscrRG5h6d6zE+FK+UMZHs=
From: matthias.bgg@kernel.org
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
Date: Mon, 18 May 2020 13:22:54 +0200
Message-Id: <20200518112254.23692-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_042318_420333_0902E266 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 matthias.bgg@kernel.org, enric.balletbo@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

The driver will be loaded by via a platform device. So we
will need to get the device_node from the parent device.
Depending on this we will set the driver data.
As all this is done later already, just delete the call to
of_device_get_match_data.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e2bb0d19ef99..63ec92ba0e92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -447,7 +447,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private)
 		return -ENOMEM;
 
-	private->data = of_device_get_match_data(dev);
 	private->mmsys_dev = dev->parent;
 	if (!private->mmsys_dev) {
 		dev_err(dev, "Failed to get MMSYS device\n");
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
