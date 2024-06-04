Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D8BC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y54vkSHN9YNTSYKHe2ryjb5rpjFXgTkM0B+MI5Yek/k=; b=Z62H9Y8C3lhig2q/zC6+PInIEV
	BtcdapGdodLEIrmBT7RWK6tu9zdlYE1gS0m/jw/JpI0RbiiAgfr7wv4ryvZKeBWxkSwDgd6HRZCNo
	gDf6qI62+WFTjuy6r9gBGPnttn64oUbIUv1728k33/htdJiAxvTpeZ52zNIh3/eSuswO6kS/2ZWje
	9+I++O6WTnqKw+bQAkGR0l/n3kpGqIseO/21Gk+g3h/92anS4hgMvBekxi2r2FUKIPU320cC84kuN
	1p3MbpN+Ae0+nLHfEsXdI57UEA4Ha6xnqbQlLGSqe0YCEpMOoYIB7fHXUpgei6TmkoIvoP8H4Zz3N
	5zDg7d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETRu-00000002JbS-0xXm;
	Tue, 04 Jun 2024 12:39:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETRp-00000002JZj-1yI6;
	Tue, 04 Jun 2024 12:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504766;
	bh=neyavww+fmoXtsq8dOJETlMstKR82zPDydDGrfHscoE=;
	h=From:To:Cc:Subject:Date:From;
	b=n6zvlhQJC6+IwBALtX7My3wR3eEKc19cyRlxukQVC0fDN8oCxD2DTC4y1HK08oO8b
	 ZISIgVpR1FxiqqPT3sjOhLtJDyOwjSLNJjLkctM+j9duvxD9Vl2V+x39qI2KFfpiaj
	 79oL6Hqy50WnIqKLg0oddv0Nxm8aS0ye6dpIp+86S3OaU6FCI09lsoCSFJq8w9Vb9K
	 OkNCnbClVMXKR89hT1wxN/4kUNorECTC57Ds/GqQTIuoyWLxMxNT0AFyS2D95VNYwJ
	 cOqTSKG7xS8aNzx0EBVlaQIBNN3n/M38k6WO7ikHZnUnAdKzWTxLto3BV9pUksop2n
	 FAhph6kGZjonw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DBEAC37821A8;
	Tue,  4 Jun 2024 12:39:24 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	steven.price@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] drm/panfrost: Add MT8188 support
Date: Tue,  4 Jun 2024 14:39:20 +0200
Message-ID: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053929_667118_C8D595E7 
X-CRM114-Status: UNSURE (   9.18  )
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

Changes in v2:
 - Fixed bindings to restrict number of power domains for MT8188's
   GPU to three like MT8183(b).

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 5 ++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c                  | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.45.1


