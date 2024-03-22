Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78764C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ymopahSxCzQXBLTVC2fLzqXd1yb8pMI6HhdVMTg17Y=; b=pfPqazkXBujqxtQeajaOmgBKk3
	vVmRhSpw5wuRW6gXTM7TX7gnuEQOHLUENnU9Gbc5W+xMfmhZQ2LFnz89XvH6osERs6QhDS780PWRC
	8Z5g930mmPQJ09r2sT4jENXXOcwBSP+LF+KjLOhJWiuIXhbnXJnQDDxjLgaxfQ9IsiW04IPhjh+UN
	l7YZL2D6k/kV+hMbNQuEZAhF/XQAz31Kafm1gU3ckY7iOStUXUXdAdZE78BhWu0qgoKUCTwHKuadN
	XZ7LNCvQW7/S6tOjetB6f+N4wzXvlrEbRzZ5G1Dp6QK+dXz1FiX5KikzKeoVao3ojOhoq+6rF05b0
	JqvazqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbD6-00000006ZxZ-1YuN;
	Fri, 22 Mar 2024 09:29:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbD0-00000006ZuD-2pGD;
	Fri, 22 Mar 2024 09:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711099745;
	bh=oe9T7E/FTpZFS5y5PY5XyYk+Y6xz/0zt8q1lRZf/WPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMEzKlbrwkBOFCFdgYtbUfHHRNcOX4uDcqXfLp+o4do9c7NKsWHB9eV+bFZIWoGTB
	 wFYzVgnxAoIHLX8LhqBrVlF8vAmH9gU+GYsPJnGSPQ2QDfKI2XB6gjUIK0uP63wiSd
	 WtycvabOFvk9EoIW5ZnpH8f9dQVjYHv702g+fhj1hFVVW17tyyVit+aIlANKoHpROP
	 cPOhnqjpJV+KmN2+WUdVeEE+xiqK5CVJh5LHjqgGbTXR0RTAj7NS17xfAXwZ4Vo/gs
	 cLFjY37DyPepAxQvHcAQWR8A/GhGrb8J3tFmvJYiHyXtKm26LjPsj504ljxzy8zR0R
	 A6Zz7TV+Ey0Iw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5022D3782115;
	Fri, 22 Mar 2024 09:29:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/4] dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
Date: Fri, 22 Mar 2024 10:28:42 +0100
Message-ID: <20240322092845.381313-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_022906_876993_3249382F 
X-CRM114-Status: UNSURE (   8.15  )
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

Add compatible for MT8188 VPP mutex.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index ba2014a8725c..a10326a9683d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -33,6 +33,7 @@ properties:
       - mediatek,mt8186-disp-mutex
       - mediatek,mt8186-mdp3-mutex
       - mediatek,mt8188-disp-mutex
+      - mediatek,mt8188-vpp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
       - mediatek,mt8195-vpp-mutex
-- 
2.44.0


