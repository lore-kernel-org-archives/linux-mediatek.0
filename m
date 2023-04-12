Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CB9C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFNew25RU5jeU2j6qhAbXWhqxkVS0n9AUiqY5LFWYvg=; b=bjvJJoj/d/y96/tZDQKLUX2Szp
	pT4ij1yaZw/ZCErewVtW2TDEThGabOJ/ApGgA7lqpR6xNQMWbuCmn3kBb2AzwsIWrxOBs+6Lrmyw3
	6ydO0D+pLuGgAIeTuLTYld5aqkDQ2g/G6aU8xUHmpVFh8KLbiH8WHHD03fKGtmCR910xmzp6fpbkW
	DrcmGz7vlNExlsJgQ6n2nALNLmp1GHUbE8x2OgLmCnbLf6j8k8G2gGZJ52eNhbH7i0AMaNK96eg7I
	3wijXrCH+OMBM6eWGTDSEkEEJVDTjkXBLOknv22CSnvKufDASFeFyRf+PMZz2opIQmtWu5TrQYMJz
	kIOH9Wgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYfG-002p9i-1M;
	Wed, 12 Apr 2023 11:29:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdv-002nkK-1d;
	Wed, 12 Apr 2023 11:28:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 07D11660321E;
	Wed, 12 Apr 2023 12:28:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298882;
	bh=ihRc7NW3u9lJ+DzQXHQTvckSkaFbsH5d9ZJ2q3uZyKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3z1ACTD+TcOpq3a/byJzDApL7CEueY+nBR6mABbIrjQ5sSAPbwV6IE5eTX6mCLm2
	 lRDAJXLZNhc2e97olxSh4nsQ2KRpAvtiF37iTgyiv83PuOUyO8PgTVQd/R3dFFPfu3
	 YjtEEUPufVL5WJBQTXwu2jrQKhZeuYz9aV32/yY4IRsI2e6ytTgTb87vLu7ilXzOpZ
	 KfV8IwJPJWiy9ACGmk+qC/kkHOQZGlLiqhhzeQC1DQjodJvnHCfIhK7QXsU3qLKZzf
	 XVn4Yp9SvOmhWoY1rKeHpxvhgy7ut9Uv1z3olvpzrQncfviVdTXWWtioAGqbc3r2W0
	 Fkyc2cDQyo2NA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 12/27] dt-bindings: display: mediatek: split: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:24 +0200
Message-Id: <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042803_709907_0877E751 
X-CRM114-Status: UNSURE (   7.93  )
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

Add a compatible string for MediaTek Helio X10 MT6795's SPLIT block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 35ace1f322e8..fa6dd9b649fe 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -23,6 +23,9 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8173-disp-split
+      - items:
+          - const: mediatek,mt6795-disp-split
+          - const: mediatek,mt8173-disp-split
 
   reg:
     maxItems: 1
-- 
2.40.0


