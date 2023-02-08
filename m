Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CACC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnqlMSYbLSfyrZv3NuxdKIzzO66HDL4mfm2zGzBYrJs=; b=BxJ+MbzeVYfWfL+TOlWVnF/j/9
	TT8yrDmbZnISrQTGqnNXtUhd3ywkcw/ONOBlmlfCldWhDhUuiCtMURcMSun9gI52Y/ZJ3ipzD7CK6
	u7oeZQxT0pRabOeiXKtr1dyRQiiuWlq3pEsrD5NMq4Nt2yfkdq/wIox0+CcqWrIrUs9X9/hHRjSFA
	SBuRgoo9n7CTZh/UeI1hjb4q9SsOKKe7jAVi7YenFEP5ZYzMuPUjuIpmZga5zVAARr5/dA3shWoHi
	QRBIY0+6LPtVqZzJegV1FZInpUlZL+HTqLkCmY8DkKRCks9bOR3NHn0WmJ+wzasJ5qQTxwtzqkY5D
	mJC+kvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhrm-00FF9t-Kd; Wed, 08 Feb 2023 10:39:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpU-00FDei-Nf; Wed, 08 Feb 2023 10:37:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAD6E6602091;
	Wed,  8 Feb 2023 10:37:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675852651;
	bh=2pa0jFRatcXMZ9SnaIXUtFWvuVZm0Clr55bqDu2qpDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpkWOXIGyP9vosdNbC4o+VzOZQgIPd0IMHDDiDb6HoXAtn48eT7pQhg7LHKJ3OYPd
	 NqLjqw1PCw14weP0jrt5K/9cwIB2nKVtoYx0+t1KlA3LVfzcnz4P53OC/Ud2b3lcEm
	 FetNWbRbu29E7KDL0YkEN4w9vbaQm2HjcKmth3zuF1oUsOt5npxcVo/cah+iPdE041
	 ZhQJ12wIQ2wGyBhAaYMfKzb6ak8V6kGaOs+HNEOUh3fh4wDZ9Lk680IVxQiXeRhk5W
	 8flOvLKXuYzyxUsXNrqbmTvAjTB2cJU6wpHqnZl2jYz1VgHYZw3lJO09Uc86ToKjUI
	 gPKGCQhsWpFoQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 7/9] drm/panfrost: Add the MT8192 GPU ID
Date: Wed,  8 Feb 2023 11:37:07 +0100
Message-Id: <20230208103709.116896-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_023732_939953_0D8A5940 
X-CRM114-Status: GOOD (  11.19  )
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
2.39.1


