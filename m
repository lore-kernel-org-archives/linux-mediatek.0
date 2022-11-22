Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD4C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5lHYnQZHxeiRRl4b0PnKeYL4tG2hHBxi0AvXaaO1PGE=; b=YshpvFlty5CCwG
	5KJCzBG41s6ePTL28B6icbXjX9VTLbSms3uzYCmKinlLDsaqqyzxfUBmP7hawmdhel4Wzwg3oDsME
	g1lhzDJvUT3xTUl4uy8EO9SsD4McXmROizzYdGW4vVF/JLFzySWMnhysb4gltLRAuYIYth09wy67W
	4OE9jPt7H89DgraFplZsBKurCtKBccapCuM02ERHR+uR8rlNQQc5fg5JHa4mP3B/h/sQe/ivEixxZ
	KPYiAtL11N6+b3es9nFzVw6Ne4iwrmLB4dNiCO89qgciNCiPLjqzvB0ogozMTcLcXx6GxCDpU1SVY
	5X8gPHJ4OM0sbq41ss8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxURZ-00A1rq-Vb; Tue, 22 Nov 2022 14:40:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxURN-00A1lY-GX; Tue, 22 Nov 2022 14:40:03 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41CCD6602A9F;
	Tue, 22 Nov 2022 14:39:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669127994;
	bh=1st3ieDQkiQof93MDMgMLlXqhvQ5AE2T3/Zoqzl8ov8=;
	h=From:To:Cc:Subject:Date:From;
	b=kU5Urq/M4qqcdMaCl2c0kq/ou+3e6P7PabNaY8VO/7TPsRvQ8TCfLJGhleL2bfKE5
	 +B/3w6m44bKrYIDchckcf5fidaGJnAqzhq/LJ3dQtAZGWO5uA/UK6Z3JXLNW/Cxge9
	 KbkI9KORE/oT+bWmZtbh1CRtWLIinkqcAsc7EwL41ElnSk46NJzB46IOyXd+QArvCr
	 pyQZtQUbpxotQB7TgD97Ij7Iti1qVGIdjQnC9CdX5/8foWYA8emEBGfpleiNUSewNt
	 lM3wIzVsNLX5UxXZphC3a2HkGj4L9M55pdoMQ26KDP6LRfz3mjZ6xcuJ7aeioZfcZL
	 C7Q3E4HSeCCnw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error path
Date: Tue, 22 Nov 2022 09:39:49 -0500
Message-Id: <20221122143949.3493104-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_064001_732410_D7327772 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, kernel@collabora.com, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_drm_bind() can fail, in which case drm_dev_put() is called,
destroying the drm_device object. However a pointer to it was still
being held in the private object, and that pointer would be passed along
to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
point, resulting in a panic. Clean the pointer when destroying the
object in the error path to prevent this from happening.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 39a42dc8fb85..a21ff1b3258c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
 err_deinit:
 	mtk_drm_kms_deinit(drm);
 err_free:
+	private->drm = NULL;
 	drm_dev_put(drm);
 	return ret;
 }
-- 
2.38.1


