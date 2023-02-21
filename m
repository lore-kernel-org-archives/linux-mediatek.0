Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9CDC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRRbmSQ3Rq/4N4LJOPHJPIMC9cy1PqF0Em/E+4AfhBU=; b=E1CgAHjXhAUE+L25Nx7uut9dQf
	hTU0LxSarSDVrUyCp22xPTuT31Z2k3la1MU7iEQGTJO/j3cySdoNsEt+4hpdnERtgepTl/fjcnDnX
	adU3yGYA8sSR11OaFerdcv2XyvZtz/RA/Uy344R8SoBgfy9oXAkf238zqQ1P4hz9ikMaq34PGO5Yv
	VpOG5GB3KQyYjJmG56b+cAKv+jTXdMBQnVLBoW4cu/j7u4JOKUMe5zu1pN9TPWlwS8dX/THGG0s06
	gQbLzd1VksC6jaeXXvM99V/nFZIjWui61IwvxAI+dVN1WWbFSfRXmFoMUYlSv6ypUo81bkhn7soWT
	ALSgIujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW1x-0093Qh-9l; Tue, 21 Feb 2023 17:02:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW1o-0093OC-Ge; Tue, 21 Feb 2023 17:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oRRbmSQ3Rq/4N4LJOPHJPIMC9cy1PqF0Em/E+4AfhBU=; b=FkYGQR5y89lOzMeoACkA4MSBlE
	E1rtKWgt9ZuBIkYcXVjASjrizmHUUE9KOUi2DAP8vznN56E3WynDaRr1sLVCjVKA2dSUvN3ajqMys
	2mul1pa8zJ/o53pdtKL+78oi0BxMiGaVv2M6XrWVqfO9lJ43hqdnwwkCb1VtigB/soubgc3ODpMI0
	lHj+DD+6iraVL+QGE6Lo7nX6ikHIlgHsfG3l4cK8dj9/dWXL5NNhZ4KLDFOlLbHSlqVbu/+mRhss4
	Akg6Sh/dbIaTMBWNNd/xrovUwQDbLIiKHUwQHltYiiuXaE7+JBH6LsM/APZS/LAI06sKobc9UKBHG
	P8MaTXNA==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUUiJ-00CCaz-2r;
	Tue, 21 Feb 2023 15:37:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 29E9266021CF;
	Tue, 21 Feb 2023 15:37:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993871;
	bh=HedQD3Ilc5pEnx8vhQO81s7TTNK+oqpJPvaglDZ6DvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzSAB68huZi2FWdjCmbPQLcRx/D12xji2dNq7yFIsN0pLXxptw/dMPR76n0abG8lz
	 xcx+ldXx+RYzOJ0Z/EyrgyjHYxS4dTBHPe2puZUkPf/pqMKV8sRY1BqdI0UsmEnFg0
	 yzMHNEuaeXf5jQBw+Psxdkt5mOTiW3OzmMMjwCSCoDv9X+G8ZnMwlqAH994GT/GuCR
	 dmmBdZCS+Sv+N6O0da+H4/DQgL+2F7TAHQL6yqMcObaqIG7Z2q5RBfSXyZSsn9DdWZ
	 LVGdO2sQLN7DPcdiZnyMxP6vAvdeKXavJeqC495UgF84b0OOVHDvdQ88rKmu6hSnYm
	 9OL2oeVX36WjA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 08/10] drm/panfrost: Add the MT8192 GPU ID
Date: Tue, 21 Feb 2023 16:37:38 +0100
Message-Id: <20230221153740.1620529-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_153756_428260_1E6981EB 
X-CRM114-Status: GOOD (  11.42  )
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

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
but treat it as otherwise identical to a standard Mali-G57.

We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
special GPU ID, in case we find functional differences between
MediaTek's implementation and the standard Mali-G57 down the line.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 6452e4e900dd..d28b99732dde 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
 
 	GPU_MODEL(g57, 0x9001,
 		GPU_REV(g57, 0, 0)),
+
+	/* MediaTek MT8192 has a Mali-G57 with a different GPU ID from the
+	 * standard. Arm's driver does not appear to handle this model.
+	 * ChromeOS has a hack downstream for it. Treat it as equivalent to
+	 * standard Mali-G57 for now.
+	 */
+	GPU_MODEL(g57, 0x9003,
+		GPU_REV(g57, 0, 0)),
 };
 
 static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
-- 
2.39.2


