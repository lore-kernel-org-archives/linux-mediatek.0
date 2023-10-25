Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44143C25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS49OViNK8EEiIPzZTLH49hG8t1doflbRXg/Z+5I3/g=; b=2AWzNXV5K+sJnXrEG0CRNyRr9q
	Zph+Xjtnn3anoXjJov+m3XjYw5qVq3A4hQcQMVNxW73lysKOog6w9luTuyUa9g0ysxuEZzDYJf96o
	ls0AtmoDO4YbvyPnGxY7M4jo45yIaBM1HV9fpGTLFIt92TrTRaj85aVjKR2OVh3KR4wpiMlQ2PK7Y
	rTXB9irlKkAUzMv7KiMvPt3AA4y4iWchIUsabSinrq1e1U4I4LQmLnP9IXhlZ+S4kKoFmeBEfPAJC
	Hwt4yYdnDWHy0mCEeDulXqA5yrE61yOaAEA7fK0DzWb064Q9uDNZPYZQWoBRZjhAdQxGSt0I8aWcY
	da706fbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2g-00D8Xk-11;
	Wed, 25 Oct 2023 21:03:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2R-00D8Sp-2y;
	Wed, 25 Oct 2023 21:03:41 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 391051010;
	Wed, 25 Oct 2023 23:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698267806;
	bh=/b8vjeg16N6sTnaDqZ5QDVr3cUbrSUJbXeISJbDnREI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDnaHf/iliqhFkq0/qGdpM19hHP+HEOjztzg0VeonUv6ClYUwAdtRwxO72HoBQBhy
	 2rujEl85xBQN8cEoO8dWH+XJMr8tk3dCrk6MU3WSi257WV+7HIkIzB17R6DbJ/yr8X
	 ePFUWlTLFJq/NpuozuGEhVP67VsAk2YDKJTPqbQs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
	Ted Larson <ted@ologicinc.com>
Subject: [PATCH v2 2/3] dt-bindings: arm64: dts: mediatek: Add ologic,pumpkin-i350 board
Date: Thu, 26 Oct 2023 00:03:41 +0300
Message-ID: <20231025210342.30995-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
References: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_140340_102470_978D09F9 
X-CRM114-Status: UNSURE (   8.52  )
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

Add a compatible string for the Pumpkin i350 board, an MT8365-based
board developed by OLogic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..dc34e62c6756 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -247,6 +247,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8365-evk
+              - ologic,pumpkin-i350
           - const: mediatek,mt8365
       - items:
           - enum:
-- 
Regards,

Laurent Pinchart


