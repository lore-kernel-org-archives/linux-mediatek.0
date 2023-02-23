Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D97C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE1nmL/pK+99rwUcEZBSlqoNXqs5jByJDekHuPe79dk=; b=NaopXesmQS9c0SadJHM2PuUU6D
	SmdEn2jUAva3epHJHQQuyscu63mjcWyku59WPt8ua2ghyJBTGWQ1JhURL+lxu51gQ1lU/9F2g1ms5
	o+cmhtwU/Vpas5hOyGlq6Nj5ErxcH2sOK99K4R2qXWccOybAjxOXtV/OUTRQLrHXks4Zo22m1SMEd
	yAFI4tQsj6OyWy4WNlc6LBY1EVOJNLNHraosPiGxowtCDJ1jX4jenBMYwieZ1NiuytOtNRFTGKBHY
	+R28ujiUDrwTiJPNnUw/wEvbWYVyCx7ymA21s5UNmaPQBYlj0GvKUy81eeLmfBW2vyFFu2H1XYi5u
	9yWcTKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBll-00GTrx-Sh; Thu, 23 Feb 2023 13:36:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkQ-00GSyI-7v; Thu, 23 Feb 2023 13:35:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5502D660220A;
	Thu, 23 Feb 2023 13:34:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159297;
	bh=jFlvEa9umviwW9HdtIpX7rwDDrEbdIW1Lu37fWHY6Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kntM5AwgKX26gYdEGJ3RvpEOmIRLr4Ms4C4mKuT+bG3cAcqlAt3c1T3uAwjkYhfbL
	 daYeus0x3tKaahnQkyiZLSSVmS0roW4+Wd95DYEjVJQDmFG0oVhKOblEx1H08SjO8Y
	 SldPs9Ov6jVmj10004fTmDDHRF7euDMO0pQAek7wUbECOYcpOGftGN+O6aMEDhiM1c
	 IH20vtcSEmZe5q2zuiVuN6/kJXj+dj9nHRv0FsPOuMLOogsBYtxhdd3zDOmAa6BbXg
	 IBPSR6xM7FkfXHv2raMEntf5Dfsgt8Cps9BMRFtlo134gGRkFW3qzFsWVI5Gsx8YNw
	 Tuskcltn3d0Nw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 04/11] dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
Date: Thu, 23 Feb 2023 14:34:33 +0100
Message-Id: <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053458_432657_D9E59D57 
X-CRM114-Status: UNSURE (   7.86  )
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

The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
same number of power domains and requirements as MT8192 in terms of
bindings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 65fe139ceb83..4d9ab4702582 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,11 @@ properties:
               - rockchip,px30-mali
               - rockchip,rk3568-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8195-mali
+          - const: mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
               - mediatek,mt8192-mali
-- 
2.39.2


