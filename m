Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E550C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1w0JrYcHzv0TsQ7+FyHrtkd6XAvv1B8gEB7dr+eV7F8=; b=iWQ+lS8oiM8FAlRG5+PINSXVk/
	X5p8RYG8Owix4J75luIH/DFZyRaEfqft6bE7DgAZMb2O/bgZTiR60K758FLx/HRO8RndCewyECn6D
	X9vOhqE7gv+5RLoKdAjUc7qE33QFjE/Ic62kA6knBZ+xvMHTtiHvA00nWFzMEk4+EQiJbkI6a8EZT
	VpuxJtHyHa5/5ZLp7ANqKcawIMNcKPoCeyK76v9ynkP6sSNMchX8GxBVsY3+eFoVMsonajlMj/kUY
	ohmqn6M98eYuioQOvEwpG+ovXbX40cG0z+QYpJqqocHU4ERgEzTqOlNDgXKIvK/aDeuwc0lHBk5lD
	X2yFVreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2V-00D8UW-1K;
	Wed, 25 Oct 2023 21:03:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2Q-00D8Sn-3D;
	Wed, 25 Oct 2023 21:03:40 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB9C5BEB;
	Wed, 25 Oct 2023 23:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698267805;
	bh=c901VyStTudJd1nWoCUth7e6LhwpbFhTjIO8xOGrrGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEJ4dRV/h8VOc0j/TKtqyW88HV78H1Sj9QYmnAOjoLdrNoDWbOTJ5Gx8CE54TUG/f
	 n+n+6+7psi4mdhLbHKZwaK1RMr258BPbwhbSnAS2N1lvtWbYIG16gmWkS13bi7Rvn2
	 p/+TLNv6n1tukmhxfrJ/2uoZREsNAExC8Ms+Odjo=
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
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for OLogic, Inc.
Date: Thu, 26 Oct 2023 00:03:40 +0300
Message-ID: <20231025210342.30995-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
References: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_140339_179854_CCA06677 
X-CRM114-Status: UNSURE (   9.10  )
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

Add a DT vendor prefix for OLogic, Inc. OLogic is a hardware and system
design company that manufactures, among other things, development boards
with MediaTek SoCs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..247b724bc01f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -981,6 +981,8 @@ patternProperties:
     description: Oki Electric Industry Co., Ltd.
   "^olimex,.*":
     description: OLIMEX Ltd.
+  "^ologic,.*":
+    description: OLogic, Inc.
   "^olpc,.*":
     description: One Laptop Per Child
   "^oneplus,.*":
-- 
Regards,

Laurent Pinchart


