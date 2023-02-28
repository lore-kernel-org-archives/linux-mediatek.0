Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B201C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRRbmSQ3Rq/4N4LJOPHJPIMC9cy1PqF0Em/E+4AfhBU=; b=Ilk73c/oJuHruGeUNzrTk7+Lp1
	pLrzzf6khUmpAOBdJoa/q4CJoO1YA1ixpQ07EvGBhubRanYlIEupI6Z1aWRn7lK1iqP3CBj2A1ZVK
	9WHbrLo10S2k/05DJjZz2rJDN034UvtWCzIHNcv+b9efO1Wtv8QmhgQgqfex+DTTLQVCZ2eZ19gDC
	cMKTn/YMBb/m6yTDTbB7zxiijHTrE9b7xXwEt34Uel5OsUslaGM/CyUZ8ajYXYvgYAcI017dcIH71
	cE+kf/qkjUMXaIs1y1H5jgNNx24PguPTo5ZO1RPttZmrTdHLXppj1DOVZ3ec7KlWpVZcVdRpkSvnX
	PJivQsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxHA-00Cexc-6c; Tue, 28 Feb 2023 10:32:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCY-00Cc9q-D1; Tue, 28 Feb 2023 10:27:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A9496602FDF;
	Tue, 28 Feb 2023 10:27:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580037;
	bh=HedQD3Ilc5pEnx8vhQO81s7TTNK+oqpJPvaglDZ6DvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3y3MIK8tlPXFTrBcJE92aYQveJmU6nA7x6I3fYH7PSDC9nygTAK9zh8T9ygeyXFE
	 TNT54P9E50hy62QWRG1IZEV3tgjZCJLW920xA3a2VNUumEJXBYpBBO3Ats+6jdDbiE
	 frdAVKNaUpJaMY1ndEblkJ41bb+GHhvSJblSU1MDlYgfSEtKjw3rWxhjkYI8BDPyJC
	 IsvuZoZbG/5HGmVpAGZI2jhUCQpqRL99hrxy7ra82MGZle+gFXaYKllkuyeKeLtm7z
	 z1tn6NckeGui7MUHSf8vw68vgI0RN1ak2/f9DzCKlNy+0GYFvv4CqfHrAG/0ZeWus9
	 6luMsCNwnJzZQ==
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
Subject: [PATCH v4 09/12] drm/panfrost: Add the MT8192 GPU ID
Date: Tue, 28 Feb 2023 11:27:01 +0100
Message-Id: <20230228102704.708150-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022718_650253_C620BD45 
X-CRM114-Status: GOOD (  11.26  )
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


