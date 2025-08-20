Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F9CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9jXk7cjX+RvlgcuQHhD/6G1uymAMePCFr7U/9S5aV8=; b=4mOLYXy6F/hqTvb1MNzU0pkqJT
	jYoFOVUE/pdCKkRQcRgRWimFtl36CgJn4tXotkkhpio2QdaV7W+64fW44iQEnQmwBdW+3zEO1BCKZ
	J298bMZNjPa2eHtkd32jXIdI4D4CAGHYFq319a4388xQvFLOeqYl2+ZDGMV1YJ9ZYhKAMNPRUuz1i
	432+xa7FVS0yUaFKn29nIn2g8TVQimQ9Ltidg/9UQMEjdcfo/5tvh8Zqw+01hmKymKCEm2EE2ALn5
	JBOKsB74xBgIi5kXN/AM/z+ricFKKOYq7NASft/gwvpVcIKa5JoYR6nxkgO8ljcpLVp0ZsW9Wykai
	kFsyrQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohqv-0000000DY4y-459t;
	Wed, 20 Aug 2025 12:23:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoher-0000000DWRs-2teB;
	Wed, 20 Aug 2025 12:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d9jXk7cjX+RvlgcuQHhD/6G1uymAMePCFr7U/9S5aV8=; b=JNuVBvpbiTHoEKxuOpQy5VAKUb
	xZWtQtsmVsCpJyKeC/LPylDLPdckaxOUieuDEQ1UI2XXGpXr/PB68o3svFH2sY0TpnDZFvD4NwitE
	ZxdTfuvKcRVitvzMd+6Cs11rovha4PzqMucmhWDuFrbK0YnL4RrFWGNmqO/kttFQ6JX2p+h1M7ja1
	I5DjFXxY3hQGupGNnNQd7kMI4tXZjLhKsRVqalaCE+qHw7ziY/3RxdcI8LNKbdU0pm1vmL7wiqh4l
	8Vzv6+MCNmtDMdychKLSbrpN+tua+4JWDq7W6YKJNtNPSIENv+x8FKttMrGSychrjGEIyYzcgnpiR
	wvFy+kqg==;
Received: from mail.grinn-global.com ([77.55.128.204])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoheo-00000000JoL-2UHD;
	Wed, 20 Aug 2025 12:11:12 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (16)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id B99271BDE28;
	Wed, 20 Aug 2025 14:11:08 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	mateusz.koza@grinn-global.com,
	andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 4/4] dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
Date: Wed, 20 Aug 2025 14:09:05 +0200
Message-ID: <20250820120905.993189-5-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820120905.993189-1-mateusz.koza@grinn-global.com>
References: <20250820120905.993189-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.50
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_131110_856027_ED691063 
X-CRM114-Status: UNSURE (   8.66  )
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

Add device tree bindings support for the Grinn GenioSBC-510, a
single-board computer based on the MediaTek Genio 510 SoC.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-510
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 122af0bad141..468672b0296a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -425,6 +425,7 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
-- 
2.43.0


