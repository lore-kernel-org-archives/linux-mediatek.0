Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821D8C7EE31
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itLOg8Dn6VtzA1EL6tIQuS6qxqW28wIHJ7H8YAsQTaw=; b=FzHz8twdXdV2Mly2UemSB67jpR
	2fa8pHxcRHH/AUuSOy9IOEyhj60fzlrNCwfNc/zG1wrYtvAIyDtFFy2Ww9kmLtYpymQAMZ5rY7n1I
	ygLoKj2SRnayq9unYu9FMGpHWAsLqlLaGpkd2I4iZ4D1fQqKFhT1hGsbegpTxXsGirAUL0u/NJnpI
	Z/sKxWqJjcnl02Kxg5Z/OeKW/O/nwZgBMF4AORPMzfWz7AtJ/XzpX6UDkiu011Zte5+LufSBgRraI
	A6/WYf4mXUuPXQf0XIh2QyWs5ydfCl9sGq4MXGx1euTiSVEZxSwfj8ZpfKHPQLtAYFAyRpOAPp9O0
	NvAZUztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAS-003B0H-2u;
	Thu, 01 Jun 2023 11:08:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAL-003Aq9-0C;
	Thu, 01 Jun 2023 11:08:27 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB0E06606EC5;
	Thu,  1 Jun 2023 12:08:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617699;
	bh=ScQ7kKihgBtg3AcCk3l1ETxEXGYmfLUNT184j6M9Ju0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmAGKNR1IT+lhZThpHLX0MdSf5TkGukrcV/RrUFoWp1RxYuCOmTKKL46NhrI4jots
	 9cp5/of+xDG2g3qv+VInqNBm7WSfakKs++Dbp85ma4L2D7HWvzaGrh08vB4l2RLkw8
	 fkFL5Zb0wvJFg+qjPd23JaHe5vhVMLad0Rhn7Sdcb8kTo6lFQ1IYXZFH4JVjbgUxto
	 1AfxZIOjlS8ke2/XMftDSKeP3nMTxxHQY5IZti5eIzTStrsERScobtpQ3bxu0rjLL1
	 VEZvdI1xPOR+uoiOb6Nl4T0lUHTCVDAImz0zxAYLU2Q8l05JZq47v4AnsbpNtcVpXZ
	 TIkCUj3SjKziA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 1/8] dt-bindings: leds: leds-mt6323: Document mt6331 compatible
Date: Thu,  1 Jun 2023 13:08:06 +0200
Message-Id: <20230601110813.2373764-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040825_227049_3AD5E821 
X-CRM114-Status: UNSURE (   9.22  )
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

Add mediatek,mt6331-led compatible for the LED controller found
in the MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/leds/leds-mt6323.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 73353692efa1..7dc63af41562 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -12,7 +12,9 @@ For MediaTek PMIC wrapper bindings see:
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
 
 Required properties:
-- compatible : Must be "mediatek,mt6323-led"
+- compatible : Must be one of
+  - "mediatek,mt6323-led"
+  - "mediatek,mt6331-led"
 - address-cells : Must be 1
 - size-cells : Must be 0
 
-- 
2.40.1


