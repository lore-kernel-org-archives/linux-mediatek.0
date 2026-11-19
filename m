Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4802B606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S74fKlkR;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JO+1wNpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MDGr/CGcb/0yjx18NczlFkS1nfAX9xBsnpRe/oCD73g=; b=S74fKlkRnIo3WzeIh8yz4XVrDI
	vvpfkzslA9ZHL51dqHixpVqkKUqqwrsaXc+hjKTHQm2iavyp+e2A51uDOCzh4cXfS2iYXnSLzYpsT
	e5SH5dV11C3gX3PjpoY8ikn4EXV7F7KlnxpYjIewRJU+rX/7rjx4YrGYOGkYkP5DaaxKgOOk3wXbd
	Xo9RlgJEm7t+OxoSkj5BQFv9iUwBB/3eELFXRNemFQ/Br/QPFxHAbkeFL8LI4zAkFDA+qJc0WheIv
	Dg5355d2nfT+Buw/19HV5eL+YNi1qX5FYpRu/h7Civ+fosSugLK9oWGtYYKwnqLUbx62MCTxixwUM
	ZtO2iV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrqq-0000000AgSe-4BPX;
	Thu, 19 Nov 2026 02:26:17 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrqn-0000000AgRb-3zFJ;
	Thu, 19 Nov 2026 02:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MD
	Gr/CGcb/0yjx18NczlFkS1nfAX9xBsnpRe/oCD73g=; b=JO+1wNpfViKbAiBhtp
	LIbk93GcQPCuZ+R4ewSTargKgG4I0cKURbvPWHzA452VWCzg0fp9hSVFy38ybeJN
	PWWbUfZpQ12BqbL6sInDPwdwFNpy9i/LG6+gn61QNTBY0xPvvirpXHpMVZsCqg61
	+NcMCAcwgIIVIJRZY/XIaevQo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3P54UXv5qU0tCGw--.12514S2;
	Thu, 19 Nov 2026 10:25:26 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	dmitry.osipenko@collabora.com,
	rex-bc.chen@mediatek.com,
	amergnat@baylibre.com,
	ck.hu@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/mediatek: dp: Unregister child devices on probe failure
Date: Thu, 19 Nov 2026 10:25:23 +0800
Message-Id: <20261119022523.2767735-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgD3P54UXv5qU0tCGw--.12514S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1kGF45CrWUur15XFWkZwb_yoW8Kr1DpF
	4Fga15Cry09r4jqrZ7AF4DAF98C3Wxt3yfurW3Xw1Iv3s8XryUJ3yDAa4jvF1IyFyvkF12
	yrsrJryxuayjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRFD7sUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hb2ZWr+XhatgQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_182614_442386_286ACC24 
X-CRM114-Status: GOOD (  12.32  )
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

If PHY initialization fails after the audio codec device has been
registered, mtk_dp_probe() returns without unregistering the audio
device. Later failures during eDP AUX bus setup, panel linking or
bridge registration also leave the PHY device registered.

Add error labels to unregister successfully registered child devices
in reverse order before returning the probe error.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Fixes: 214a0944e664 ("drm/mediatek: dp: Use devm variant of drm_bridge_add()")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 974c4fff6fd3..5be69622242f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2804,7 +2804,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	ret = mtk_dp_register_phy(mtk_dp);
 	if (ret)
-		return ret;
+		goto err_unregister_audio;
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
@@ -2838,27 +2838,37 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			if (ret == -ENODEV) {
 				ret = mtk_dp_edp_link_panel(&mtk_dp->aux);
 				if (ret)
-					return ret;
+					goto err_unregister_phy;
 			} else {
 				mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 						   DP_PWR_STATE_BANDGAP_TPLL,
 						   DP_PWR_STATE_MASK);
 				mtk_dp_power_disable(mtk_dp);
-				return ret;
+				goto err_unregister_phy;
 			}
 		}
 	} else {
 		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
 				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to add bridge\n");
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to add bridge\n");
+			goto err_unregister_phy;
+		}
 	}
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
 	return 0;
+
+err_unregister_phy:
+	platform_device_unregister(mtk_dp->phy_dev);
+
+err_unregister_audio:
+	if (mtk_dp->audio_pdev)
+		platform_device_unregister(mtk_dp->audio_pdev);
+	return ret;
 }
 
 static void mtk_dp_remove(struct platform_device *pdev)
-- 
2.25.1


