Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE8C982E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 23:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ubTLm44ATjRdGaaOewajLt92Nruc3KcRR6dVN/XSnfY=; b=Ge2TTMvh0CwI01SgNmO16OzXpy
	XIKp58/s0A8Rw++3U4Vxbl0ThONyGlnZSnMugJNQBkkabD6Q3YRcmTLFU9KPPuVcWssIYFS4L4JNQ
	KJyCJL+u/yPItSO4eyFYrs1H8396aZVgBMKwXGQK11OH504emLE+G+yuXGJ5El60klE06CqlBNh+y
	8mPDF03O7OXmNT257VeTJMqc/d8BUAqhVNwnFoscCYclv3xpJQe9WJOl50Q51euZsgcz2nD+UNwCB
	/hk49QTeYIFyOD83YQL9fmeBjKITTSn95pX99L2Lv85iN/zpY8B8i1om+dboV9VUJE7qOnp4Gu50m
	F86YKTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nO8-00000003evu-419c;
	Mon, 21 Sep 2026 23:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nO7-00000003ev5-1TYo;
	Mon, 21 Sep 2026 23:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA3D6600CB;
	Mon, 21 Sep 2026 23:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B941F00898;
	Mon, 21 Sep 2026 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033130;
	bh=ubTLm44ATjRdGaaOewajLt92Nruc3KcRR6dVN/XSnfY=;
	h=From:To:Cc:Subject:Date;
	b=TthKSZEupVZgXPFzhqsbG9+b0c3xFYy1kyHb0aTTY8UQh0lQOV0lu+hQKip3t119q
	 xQka+GQkFHdWFSPHjJDiRW0yrfphPyhp7nCA/GEmv5m1aLXlKxNcy3WuZD7ZtXxmc9
	 7dBsLOLdGPP+mpx/ZO7ncWcIADkpARQ07nrN3KheFp0DyHg4oo2D3NMuItdC5TnwRy
	 iS40ZhEAZ/afYcC21GGvIem+oxJ2u1r1HyLAo+tqotfpWzbsATDrDFq6hSJ2aQnV3H
	 rpZf1eoQIQ2WlahJHIifi6BNkw/p9957Yc3gGlr19Gq0MrbuP7hUz55wg9OCJkPjAJ
	 qYMY2koIn7VAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
Date: Mon, 21 Sep 2026 18:25:26 -0500
Message-ID: <20260921232527.3127894-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The MT7622 PMIC wrapper has a regulators child node. Add the child
schema reference so regulator subnodes are evaluated by the MT6380
regulator binding instead of being rejected.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..79b755858bad 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -105,6 +105,9 @@ properties:
   pmic:
     type: object
 
+  regulators:
+    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#
+
 required:
   - compatible
   - reg
-- 
2.53.0


