Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5648C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR8Zum4RVVdT4OzHgWXgNRcz6PpdJk/tUJE7szpEa8Y=; b=NFjg0SKRUFIVayVOwNDRuRurc+
	ym2xDDbVRXjJnf1j17P+l6grh7Y5DOqbb7r+ljaaE5RWPFYrJOUQbmTAmGH2UC8Lss3NwUfrme24F
	2H7IVi5PheA6WGUFU9gyH0KE+e4FmySesFtgiOXhS6SxmTECpankOy+1500GRGQAsbyCh1PEEMzpH
	HJ4Bpj+IQhe6sl4mVYTOsWFYrRg/1cLvkXZy6cyj4m4OPAWuITRJKWfMeRS6daZ4elko+NGEVIuPo
	Rjo2WdaaW6anXSrrFjIMIg79rrfRTALm3JixMsuWdDE7ITwLeA044SIFKKSeSxeeLA4xZhol3+CmO
	fRWlTaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYfX-002pMa-2h;
	Wed, 12 Apr 2023 11:29:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdx-002nlW-04;
	Wed, 12 Apr 2023 11:28:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72B416603D19;
	Wed, 12 Apr 2023 12:28:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298883;
	bh=fXye3dLdrd01pW9dkK8SQo3s3rXAglHlbcKU/jyx0I0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ej6OkOeOtAUWnvV/z/G7eS/S0Cw+BAmPSrNTkwFSGZFaIysb5396dfynJAghUtK/y
	 nhsRGbTG2MGS0RjjV4J0zm+UF0XkMAs4isip2S4VkgLK/4zRjYM5y02ULzC6WYQBV0
	 zpn8Sz1d2NfRLK0MHvFa5XerUCPFlebhaQi5dOt1/PJvT7GQX8d8S9KabYzOFByr45
	 EGVmZXukzKo7kVOkvSunIe+Wg6HazK4BxmfrYMeNkA6PPpo3O6iMV5IoxCY0My37d+
	 2JSysFi39qmy+GE/ECFjnA91ZtghOFibEdqHSnfQMOiRGzqolI5KvS0+6v/PBIrEGD
	 OS4NKIms3vDWA==
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
Subject: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:25 +0200
Message-Id: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042805_223050_7685B10C 
X-CRM114-Status: UNSURE (   7.83  )
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

Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index b8bb135fe96b..282925a73804 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -24,6 +24,9 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8173-disp-ufoe
+      - items:
+          - const: mediatek,mt6795-disp-ufoe
+          - const: mediatek,mt8173-disp-ufoe
 
   reg:
     maxItems: 1
-- 
2.40.0


