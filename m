Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67C1C77B6C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCg5ICz9XbPYs8GpKnZD2kdwz9IxKkREMg8mLvGBySg=; b=ZkUSBx/8MQ7B6kXsPcvhvFdBqr
	01sxpklpjH7uJVARShDX+KyxUHwugE7vIUiQ6jnE/iXmiI+ZrdYA4eccWSMwp5FbJSw2P8SiVEfB2
	tdNTlxteX/d3/4HqcQAQB2gNlEu19c5qH83wuEniKvA5XZq6U+WJNPUQwwyL9W3OSIlZvQOL3J5Ya
	rur9caNMGV4bxZwTmtcT5xgViKgeUGINbOb727X9nuU89UlqSOfwR6qsqB9XTNLg+w9USCBGfcDSL
	Db1QkcO+JLObzGy6ByZ4xZQuSqqJFo/oeQ1BcSLh7oKUVhYs32hHn8Ipm+93TXkacuT+h8v8f80nf
	/C8RqiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeDA-000wPT-25;
	Tue, 04 Apr 2023 10:48:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeCx-000wE1-2T;
	Tue, 04 Apr 2023 10:48:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C48066031D7;
	Tue,  4 Apr 2023 11:48:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680605289;
	bh=3ZbLGCMsG/gn15JDSWm25FtN0N4B/ueru9VCCfJiapw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U65vJLbkHVn4r+uuF2YhhtYmHp5qXs0ftuN5Y3CT7UAOt2OGGxXN0WM5jRjfbEgww
	 5BJ1jT0UkjrFvLGc926p/2n7q5bo5rLnRt3V1rf0D+3Z+khqr9VRKnYKt1iiHJqRsR
	 Vv5dlPn5vZtHViLjpUgzq9ifxSp03hJIpMfByRpCEgBnsnQ0jrmd7uGqWu1DW1/anm
	 Pf9i6QYSJ5d0VU0TxLpf35Uatxykno4XcqJrICuDAyjHDxyky/wHIo1zXr26AsanPj
	 e19ilkNCkvwuxYybQVX9Q9eTAh+zfnvp69owPDTJSiQXZZwACMdp57HBmFCpnbbSOl
	 upSnirqsOj9Mw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 4/9] drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
Date: Tue,  4 Apr 2023 12:47:55 +0200
Message-Id: <20230404104800.301150-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_034811_972154_21A3B55D 
X-CRM114-Status: UNSURE (   9.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

eDP panels are not removable: at PM resume, the cable will obviously
still be plugged in.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index c82dd1f0675d..ac21eca0e20e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2607,6 +2607,9 @@ static int mtk_dp_resume(struct device *dev)
 	mtk_dp_hwirq_enable(mtk_dp, true);
 	mtk_dp_power_enable(mtk_dp);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		mtk_dp->train_info.cable_plugged_in = true;
+
 	return 0;
 }
 #endif
-- 
2.40.0


