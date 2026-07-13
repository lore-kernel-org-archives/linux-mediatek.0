Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145DC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEKeNaf1OlsDp+JcZoLTTdIzx7O+jUp8q4C4mXP/oKs=; b=iF7VnP4mDDao0sDHCbIpeRwyhX
	FQmgpec8tfXSR6Aap9OKbsyRQTxH37P7Y7isF0dAA8Q5ts8Xa3RZeC5La8QZeNddYENnD+VJQLTa+
	fEIc1XRap/gQV2pkFj2RU0AMem05uli+Q8lW5hFCy4BGqBEn710fz/SfttwpBlUwFdw8RfOkgodxU
	CwARClyl1MLIFo0ntKXYNtKlw+378G0BAAiAX3ngPzx2PlWI8+0b0u/cQiwD+YPADG6EAwvnbyxJg
	4tIv4gb8QqSePoAmqJIfLe3hDz3yHetvMJQd5k6R+nrOrmd7qprtl6rSJkZ5cFAkOEcxoFEI60iRJ
	IXMzwuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHe5-00000009azx-0MGC;
	Mon, 13 Jul 2026 14:28:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHdf-00000009aZ6-2ZW4;
	Mon, 13 Jul 2026 14:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fEKeNaf1OlsDp+JcZoLTTdIzx7O+jUp8q4C4mXP/oKs=; b=fVk8qwOda889TeKqRYuOdtSA4/
	OxgHLPcAqUnk6ah1wbvwIcwV3o7gvvLiHfsKZ5u64Ev8T777TOcO9PX8G1jsE/pRn7q3aP1EgIplU
	5129ZPfbQyhtB2Ic0wGFWU3hxiNMn2WWH5Ai2F0SiOEPqDbmTxEZVOXhDY3/pCb9hFwuvX70ZcyKR
	NXRPPJtElwP7vmfBTni9Srs0waLNhczXoqYjp0kxqcLBFBj3uvxxta7XlU9JaIId0La+DhSFUw5s1
	Nf3toNBfMk682t4SLw0vPtcfK/5c6VW0t+Jg4Y8fJjiRukBr4RCCyyjCSvGRVDAI5YXjllx7cBKiU
	IPecM7GQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHdc-0000000BiEE-0dDf;
	Mon, 13 Jul 2026 14:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952882;
	bh=tL6TyKHmRqiOdYNp5OoOuzXNWh3Gfm4maiiOQlsWErI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iH+K1zN7qE8DKbgNEoG9bFma87EyjUY8Gt2+MZGPZr8dS0e0Y3gMdIC3l5rcjkvl/
	 zy5LrMeb7rSSWHVllxu3alg7mUC7TY7LS2Dfa/cLdaGn+hzP+9BqY+Z8WdPHKqS/qC
	 mGDhw72RDwFywNA501Oa6+wwGyAUQh9On+7uySf3pPcDs/kTw4LZ5lFWpxvfJhVN4L
	 XD7zDXxuxyXKNHAzVb2Al210ABFbvf6AoQZnB50CnlBqMEyGFp1HlBqD8K6pFXNxfU
	 gQAijlJitE4kkmNZSc3UnBf3u2irC2A2xtrth+uS6fMSjp+RYPrzLKjh4phK4Gi42A
	 BoAs2BlZDwbWw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D27C917E0720;
	Mon, 13 Jul 2026 16:28:01 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v4 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Mon, 13 Jul 2026 16:27:44 +0200
Message-ID: <20260713142746.40259-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_152804_339664_20BBB2D9 
X-CRM114-Status: GOOD (  11.41  )
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

Enable PM Runtime at the end of mtk_dsi_probe() so that the
mediatek-drm mtk_ddp_comp_power_on() function is able to do
pm_runtime_resume_and_get() and, analogously, the function
mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
device.

This makes sure that the power domains for the DSI IP are
turned on and off when necessary.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 93bc507d77e2..1726f5a2683c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1731,6 +1731,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
-- 
2.54.0


