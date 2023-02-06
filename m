Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0176C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++g2z7tifs/5c9BeQPSRBI6nmsPXCVDUS/zMv8p8pnQ=; b=KCJ9da9jH+4vIMofmgszGWJwIQ
	pptSddcmRXG8QdOOdqEJH+kplleJhXYUUvG5sOAupM+qdOx3ggt/5bUh+SvXwu5Qu3znlCh2AlH9F
	HtR4ZzMq4peujYQo4jDGR84pCc8w4n0gsTm2PGuHOxZERQEIN8AA3m/jw9l3BQnLp15xVB0PmT+Hz
	31EJIy+OToB4KXwY3GAWhludaVrNsOr8btG3nq4b4UwTW78JO0FvEWq+yrZtqZBPmZRNQj1E4zqJw
	bOUpMg6SI6M3TrVoXo+/WPkjLoGlqQNypcsptyA9KTIpW2qV9wR53mDrXeTh4favFUEalTrrCgrpW
	JcHH8k3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyKl-00800E-Dj; Mon, 06 Feb 2023 10:02:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyJN-007zCX-BX; Mon, 06 Feb 2023 10:01:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6ABA6602FA0;
	Mon,  6 Feb 2023 10:01:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675677678;
	bh=u7Y8n/T80FWNXiD40Mx6s06d8MGoJpyrDLmIqXuDbtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HbO+scaczhc4zrIb+JeSoZxSJKgzEGwFlMZVTp5fkRD8QgTGlHdx6c75PhiooPdcN
	 5NZXcb5/yQawZjTfupEUvKMlflUiYTvC+aV7zXs441xF7s+OSQVGqaPpn+6PYXyRdF
	 dei+PIFgU1UkGnU0YAKrVr38VzhnkaVcuyapDP/yMYhxEueH2q5QAPJneE+gXXjj6y
	 X03gAD61BZup9byr8GUJJcnz8dLep2xSHjpHOUrv701ff+H3NWECBDroEG4Uw+Ip6X
	 5XPLMeHA8wlNZIt9HS64jF/BIgvXQM0Bz2pq0VCTePA4FQUSMtCHpdNnrLETUN/UxY
	 l2wn26x2rZJLg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 3/7] dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795, MT8173/92/95
Date: Mon,  6 Feb 2023 11:01:01 +0100
Message-Id: <20230206100105.861720-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_020121_568763_34144A69 
X-CRM114-Status: UNSURE (   7.47  )
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

MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
compatibles for them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml   | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
index cfd042ac1e14..d00327d12e1e 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: mediatek,mt8186-fhctl
+    enum:
+      - mediatek,mt6795-fhctl
+      - mediatek,mt8173-fhctl
+      - mediatek,mt8186-fhctl
+      - mediatek,mt8192-fhctl
+      - mediatek,mt8195-fhctl
 
   reg:
     maxItems: 1
-- 
2.39.1


