Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2291C77B76
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zXkqT18Eg4b/vXABxEL1/DyL23gksXOzvi2vBSU+ZY=; b=NdgKr+is9zo3zKv/fHoCNGG8YW
	U6SnFBnfgC/1bvv6h2Xz9rBg7InsEKbTtunUiBiEHsdFm5Cdo0HOPp7BhCRhhxaj7onmmHeQozRZ0
	y/wjVtUdT2rrmjI8ejX4rlxAbg1LqqLUVn1BI859byOPSOzxq1lBuTGoTZ+c7dJEal5QOTykldc8k
	BqgqsZZbLX9mmVuI8loykYRHUgYXrai856sWJBqjtIXXDmUCB81ziuCUSSItLf2IlMnPpQW54ye1a
	2FkKSXV7/6xqmCvy4AriXtOWe5RVPFGXpznyM6GQAowrRWHEgkNY+k0xCU76JZXlFVeMl9TcqMrrI
	NMvFylyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdp-002nfe-1r;
	Wed, 12 Apr 2023 11:27:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdj-002nc7-1S;
	Wed, 12 Apr 2023 11:27:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 608366603201;
	Wed, 12 Apr 2023 12:27:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298866;
	bh=YDQxHn4LMGevVfKU87Wwqa+i9ANnJ1wpzX3mspDDOrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZODHobO8ZVk/h3S1ggRA+uwI4dbmv2vb89bvbQ+WbellxMWsbILYmGigTUdDwkHbN
	 7OY8QOUDa4mARCVa2U9MdT9QzW8eOslKE26gYmmCj9NJZ4/hN8k6xHb+ivU3oOFoXp
	 RPiV8ROFdOdUCcWq6BTqsJZV/bP4mOaQOKb7QOl1HOoyRPGDp1fmydKM/4QzoeBiqB
	 iOae4a55AZ3NcZZQA+brruli98t1bc9OhE4aqcRhTyamaHOoDyWWRpN2R9KR8rKYHJ
	 2H7S/+BPsis44nTeSGB/0n0r4WdBCEbG1fgzBXQOaAjpP/mvvTrgiCGaSEx79acUEN
	 2AnXTAN3eGfaA==
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
Subject: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:13 +0200
Message-Id: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042751_665334_A0CBD893 
X-CRM114-Status: UNSURE (   9.46  )
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

Add a compatible string for MediaTek Helio X10 MT6795's display PWM
block: this is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 0088bc8e7c54..153e146df7d4 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -22,7 +22,9 @@ properties:
           - mediatek,mt8173-disp-pwm
           - mediatek,mt8183-disp-pwm
       - items:
-          - const: mediatek,mt8167-disp-pwm
+          - enum:
+              - mediatek,mt6795-disp-pwm
+              - mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
       - items:
           - enum:
-- 
2.40.0


