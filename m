Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B000606A32F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KMpY7/ra;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5cJw6kp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nzumizWeRahFF6SbXg6af2NSKWXv+aezI70WP4j1Pos=; b=KMpY7/ra83UOH6tjLUPHDIiCn1
	Vs43Jk0bFWU8N5fHYWDG/m+9RgGbz4xKRTK/8r1k/DGj6LjcQPE7KUBeujvNZybe9yu8NDWxdmdKe
	psSECLbmh9tQrrp4JmsVMuRyOObGUVHJ593hcMsV13nSDL+LCDkAuNOt/W41SB4L+3RyBhVovCxJe
	anKlnuoStiNBRb6EEsFV4kMDWIsYcfQRProJdKjWUHwqqRjrwseyU0gncWH2nZgU6ysR3aem40UCA
	3NDTjMIGJCYcWK+bU4JrztGGq0I1DTM32dzrpx6chapbrzXC3Rdr0koOd5izUSNh7u5I/XVr4Blnv
	ItnkO9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsf4-0000000Akyw-2snR;
	Thu, 19 Nov 2026 03:18:10 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsf1-0000000AkyU-1vlJ;
	Thu, 19 Nov 2026 03:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nz
	umizWeRahFF6SbXg6af2NSKWXv+aezI70WP4j1Pos=; b=J5cJw6kpHgyFz+DwZC
	iGQDN9hqkKtTWX8TsphzxnVIoMeY6X0zoOt6h+8xj8GP75rd4Vqr3h79yrd3D7kj
	Z2WaYZrWL6VERXYtU9fSPsDFf/L1WZZNqPGCyx3qN2czhs6bJE/HhqyJNXy2FqI+
	CHaSggwD3+I3pVzBVNbTeRu9E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBX7xNQav5q3MyXGQ--.21624S2;
	Thu, 19 Nov 2026 11:17:38 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	junzhi.zhao@mediatek.com,
	jie.qiu@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/mediatek: mtk_hdmi_common: Fix clock reference leaks
Date: Thu, 19 Nov 2026 11:17:34 +0800
Message-Id: <20261119031734.2797802-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgBX7xNQav5q3MyXGQ--.21624S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW8Kry7JrykXrWftF47urg_yoW8Zr4fpF
	47G34YyFy7Ar4jgr1qyr1xXFnYkw17uFW3GrW3Wwn3Crn8XFyrtF13ta45ZFWSkr97Z39I
	yrZ0ka4fXa4UuFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hIJd2r+alIOmgAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_191807_901613_064AEF7E 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_hdmi_get_all_clk() acquires clock references using
of_clk_get_by_name(), but these references are never released.
They leak when a later clock lookup or subsequent probe step
fails, as well as on driver unbind.

Use devm_clk_get() to automatically release each successfully acquired
clock reference on probe failure or driver unbind. Remove the now
unused device-node parameter from mtk_hdmi_get_all_clk() and update
its caller.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index a36d8dd6b761..8e8ea4111351 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -199,13 +199,13 @@ void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb
 }
 EXPORT_SYMBOL_NS_GPL(mtk_hdmi_audio_set_plugged_cb, "DRM_MTK_HDMI");
 
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
 				const char * const *clock_names, size_t num_clocks)
 {
 	int i;
 
 	for (i = 0; i < num_clocks; i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
+		hdmi->clk[i] = devm_clk_get(hdmi->dev, clock_names[i]);
 
 		if (IS_ERR(hdmi->clk[i]))
 			return PTR_ERR(hdmi->clk[i]);
@@ -305,7 +305,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 	struct device_node *remote, *i2c_np;
 	int ret;
 
-	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	ret = mtk_hdmi_get_all_clk(hdmi, clk_names, num_clocks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
-- 
2.25.1


