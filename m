Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40C8C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDY6eRVwnK+me8rcDMz7ZCd5OLvkVoQDZj1SrUCMdNI=; b=Pi0wRSMwRnz6T8ptbPwMhSYd5h
	A5qk8XMSnfVApmKvBT0tFMNTrF8d/QWrS6oLvJwJ03iy536VDJ0Aimr4UWxs8bDpxwcpcga3GHzki
	pKsd2VIxuiQwoL4KCLvs+1RE9c+PNaW+auoR8mlvu6dsXkY5H11uOZ/Fg/o+U6Kr3LSvi83IQnq2F
	xIVsUQFrS8y9leRXnODw2/ht4bKnNnc/f4i8EYUa7Gz1kE/mWuQC+x82LtA2NZSROuBBPU7jjMNok
	oBuV7v52wkorG42lQtp71VNovtgTJnfMFuJTBJy0Jln6W8R6CCXBFibEAfua6GL7RU1bXSv1/clyT
	BhJOfNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYex-002osh-0R;
	Wed, 12 Apr 2023 11:29:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYds-002niO-29;
	Wed, 12 Apr 2023 11:28:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CEBB660320E;
	Wed, 12 Apr 2023 12:27:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298879;
	bh=7rZitvRQVOG3LtVlh2pg7pj+YeXMzPdPvImLoCRUT80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZqchzHTr1PZSfCK9PeJ3tYn2tZ1fzdRS2ib535aG+RDtPJF9zAqcDKd9ABv8VifGc
	 SKbF/PbuwGGzLCCrn7XZZeWelHPfneR2Q175nUandaTe6WicOxf7VIPFfK4aUlPKgK
	 uJ78UxmiRfEmRhhQwnHRcQCOZ118Cg8MKv9NGh0IzEq6JkqcUfT45m4XX4hizAoFRB
	 dE0aYkqTyFY0QqTag7fCayslQEdDnznygbcW4tj6kgS7c6xaOPrzHxRKBQAIRXcLhy
	 RhighPeA/dqQ76ZfwzwFOkE7QFlcgQ8bGiXTFi5HyUizvw4nTwNbKe5AoLFQrXldBn
	 d8hcGXviMB/7w==
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
Subject: [PATCH 10/27] dt-bindings: display: mediatek: gamma: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:22 +0200
Message-Id: <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042800_851491_A8CC1D11 
X-CRM114-Status: UNSURE (   7.82  )
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

Add a compatible string for MediaTek Helio X10 MT6795's GAMMA block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a5c6a91fac71..e07bce01ebdc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -25,6 +25,10 @@ properties:
           - const: mediatek,mt8173-disp-gamma
       - items:
           - const: mediatek,mt8183-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-gamma
+          - const: mediatek,mt8173-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
-- 
2.40.0


