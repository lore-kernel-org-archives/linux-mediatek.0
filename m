Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD7CAC5B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4NTpqnouhxyOcWCCh2NeTRY1iVR9sE6z3F9z1uT0AU=; b=YRtmZ0VBglxh6H9GmJTfkyuzxm
	hKky+KTjZ1S/axKKxm6pwXWxMJIOpRTj2whsgtZZMlyk3/raMZjw2/Jx6MwCwcD2PoSSG9us4mrUg
	HWzwZR6NiJEo45Uomu9RsDJYZE0RrN2p0bRtOPq3R3cbD6woThuPFmHQLMgmCea+qUXES7PEisT+y
	RvajAJuTlREy08I/XKjR/8Wj1fnmrd2NL1SikkSuHlvq22YoRznK1ATp09f4P/TfO7+8kwDfJTkqw
	hwnCv3NfzrsZbID55QP7NqNhnWXvCba0l6BgKb5Bn+uG9fbQ5mzx/dAq+ZMLJ/NMPZuh7nd8063mz
	HUX6+dvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uK-0000000E2Tl-0AuQ;
	Tue, 23 Sep 2025 15:26:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uD-0000000E2Lq-2QjQ
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 15:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1755244D16;
	Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED311C19424;
	Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641173;
	bh=c0az61wbtOZUqLNGV0rJC8DczNsHSPgRUfjfrHYMoFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vpt8l3/lzn7Ssa2Vt1YoSEs93/7jzHiV360V7dvgkCxApbJjTW2GOqMdkr1EvTVIs
	 9xD3YVVCF7FDl7hjP9EqhjPFNIXWXndoKHp65Y81ZklzZN0to7BHHENOXKnOgcyGrm
	 UpJ7Dtgulcsj+ikFf1VNQEFgBqhIZaC21i2atkyT/TwGouHp+3dmyhExhEeyjOs4Gv
	 9FnRPmicXvu7OIzCcIfU+oo/I847RqUe23Ux5QvyCdJQfBUN3Ur9voYhUItzx/qF3n
	 WsGQqHH4RUkdl9Ot9PC9GqtGJGTlLUCZ9mbT52G8g57gvX/SkZ4YU7oPq5fduJOVi+
	 a3cKWgfhG/jGg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v14u7-000000004my-12OL;
	Tue, 23 Sep 2025 17:26:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	"Nancy.Lin" <nancy.lin@mediatek.com>
Subject: [PATCH 5/5] drm/mediatek: ovl_adaptor: fix probe device leaks
Date: Tue, 23 Sep 2025 17:23:40 +0200
Message-ID: <20250923152340.18234-6-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_082613_634957_6453012E 
X-CRM114-Status: GOOD (  11.01  )
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

Make sure to drop the references taken to the component devices by
of_find_device_by_node() during probe on probe failure (e.g. probe
deferral) and on driver unbind.

Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Cc: stable@vger.kernel.org	# 6.4
Cc: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index fe97bb97e004..c0af3e3b51d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -527,6 +527,13 @@ bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
 	       type == OVL_ADAPTOR_TYPE_PADDING;
 }
 
+static void ovl_adaptor_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
 {
 	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
@@ -560,6 +567,11 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		if (!comp_pdev)
 			return -EPROBE_DEFER;
 
+		ret = devm_add_action_or_reset(dev, ovl_adaptor_put_device,
+					       &comp_pdev->dev);
+		if (ret)
+			return ret;
+
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 
 		drm_of_component_match_add(dev, match, component_compare_of, node);
-- 
2.49.1


