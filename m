Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B581FC77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbqQHmr3BRPcIsLIxXlQjDV7hOaFj0TjdcJQT/P17do=; b=jdgU2hA7vCdNkqeVyEtev2d4g3
	uiJQYfxwmahKuWrgGMq/ZimWTw8EheYQpHd3e53RFPTrMR7aFs6SLsqchRZYF047IDd25gVekj7xx
	pw6ddwfQTIraEzIKWbi+LJDI55PQSwJlpz/B+Ee60lE+dg8XhBgwwSaaPIYJgF+2e1WXiMp4GCt3/
	xzHFgTaZlmoePj+QuOichWJYYO41VqY3AUat353mmCoYMp9IYSfZ7pZvxmtR3Rb8Bz4hzU8SOd0Zp
	NOHquG/zy7KGUxGvi6D4pPBYbeXSpf0eZOhMytnpV9NkJUBlOsYqb2JA9l1xww81iFXXe/SMPQPuN
	DIqsHtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYf1-002oxI-1F;
	Wed, 12 Apr 2023 11:29:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdu-002njJ-06;
	Wed, 12 Apr 2023 11:28:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9942C660323A;
	Wed, 12 Apr 2023 12:27:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298880;
	bh=PAEIMzwoCtkdbqGv4A8L/iPGet0PclfpZuqMQPM2HcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9Ppv5/sBFmqMx+rakSqPF3CVQOMG6s1dku5Gwthks6GTOKqI5N0oq+Kry+gZ07m6
	 S+a8w5uHwRjrz+B0rokshjSpr/KSyXkOxcPTtm5pw6bRYlYxhuAFkRLhP+/k27OVyZ
	 W0T7g4ABXRDy0biYk0Sfncyl2dYnCSG92G3wAmuHFqZjyeXHNxl9/ZVtKF0tE0gwR/
	 sW8ZocQE3Hh1VGAuJbZMi5dQfAcOJfcS27itNqI7D2z/j7Tx8NFj7NlyZB8wK5sRlG
	 d1mMeyhn/4LryWoPj+/g7kv/wExgm1rjo7PnnGFZL+c4VFb2/2LVWP12rp1Rd9mhPE
	 WQaNaDdgT7Lbw==
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
Subject: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:23 +0200
Message-Id: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042802_216945_7D46B682 
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

Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 69ba75777dac..be330be1399a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -25,6 +25,9 @@ properties:
           - const: mediatek,mt8173-disp-merge
       - items:
           - const: mediatek,mt8195-disp-merge
+      - items:
+          - const: mediatek,mt6795-disp-merge
+          - const: mediatek,mt8173-disp-merge
 
   reg:
     maxItems: 1
-- 
2.40.0


