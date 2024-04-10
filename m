Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BDCD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c36bNNGPywC6i1ylsiyoLBJQ0M5jzB68FzLrHh8goyc=; b=mRT/tnbXj/mGoxv8H5cxEg5Dg6
	/0jmXRWYv+Rji/E4ogJF36qiYuBmmgJE1ZF03kWCcM3uRnRYchw5jby/yanAs41V/oXyvp5w9OdeN
	PV6wYHkQ3iVjPk/EyYRqnkqKp7ik4xS1RtXiTb8vtN6gXxOPFVXs129xsH8J8f1qu2E8OEUZG5WYM
	b+2vrAMN4LZGbRaUzuLmCr+RENYj+LBS+0W7aVxhVsXnuOn2Gt+2Dfe8S53JCAhbJa/cP4nq+7DxP
	hVRpYFGUDJmGzimNP0i/WSBSc5YyYVaAPANW0o8yaFX5KHRKsu/H/7lwx6aiW5sFZIY7HDYHx0CmE
	MRsQZESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLY-00000005s2p-0uQQ;
	Wed, 10 Apr 2024 08:30:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLQ-00000005rxO-1lgs;
	Wed, 10 Apr 2024 08:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712737810;
	bh=g0inTgKrdcNpJsKqCIJbmzWiWIcGhn7etTaylPEt72k=;
	h=From:To:Cc:Subject:Date:From;
	b=0CzQTEv5Is0lS8S/YQQiHjx1OCNaRTRntcQuHvj2PqUhv0hRT+AXsBKYzNwQOAOvU
	 js3m81Vjg3RoXEW5QokN5ZcgjuIJBI1h7DRkwmy9jmpUTlw7+GD4DiSga3eK4BKVuG
	 mtn35/hYjST820f9JfrNAdoi26UssBcmEJl1eUVlXKWOGag953/+ZT0ap/XGXo14TJ
	 5iklUxWTh1CEuvSJ4tlte7BErnKVO6C4+QChJlpVTHFyJJbg23DVXLMzCfB/821pxH
	 J5IO2rwrvSqCDcHBKkogEdj9L+EtHjLKhZgM8i6R0v9HethsgAVzw3GsICG2o2gzP7
	 4Inr5VhcxnStQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 252C0378208C;
	Wed, 10 Apr 2024 08:30:09 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	bero@baylibre.com,
	amergnat@baylibre.com,
	nfraprado@collabora.com,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/3] Address thermal zone issues on MT8183/95/92
Date: Wed, 10 Apr 2024 10:29:59 +0200
Message-ID: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_013012_725577_0BAAC04E 
X-CRM114-Status: UNSURE (   7.12  )
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

Thermal zones on some MediaTek device trees either have cryptic
names or wrong ones.
Having the right names is important for both human readability and
for MediaTek SVS functionality: fix those.

AngeloGioacchino Del Regno (3):
  arm64: dts: mediatek: mt8195: Fix GPU thermal zone name for SVS
  arm64: dts: mediatek: mt8192: Fix GPU thermal zone name for SVS
  arm64: dts: mediatek: mt8183: Refactor thermal zones

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 136 +++++++++++++++++------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi |   2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi |   2 +-
 3 files changed, 104 insertions(+), 36 deletions(-)

-- 
2.44.0


