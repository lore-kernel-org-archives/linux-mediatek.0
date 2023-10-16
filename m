Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E349ECDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mx9lccHq3HkbvSbAjueQ7LtepY+D1AIjHJYd1rv7ik=; b=BgTkI3l3C5u7gp5XrK/HTBPaea
	hxt28xbNO1qRUG2On8rPVgIObHVopmse6gfad3Uz74ypNUPGQo3vgO/hSr2LMLDoIF5cRfRIDHWCC
	+s0alQpyeVgUv44dCXM3hBO+chYy2rONbvSXtXV1wdHhYalaPCyYkmktUUv+rQkhrekE9X1agvoP0
	vDOdZ2t16Enm5J/LR3pT3ZeC2ZzXzO6gSgioBOI86ard3o3P4OQOtrJ5rtiawFd8Pvl+LbvCsYfwg
	U36czSrmTJ2Y7gnVIXD4tdCwdcDBflkNCDxg6tCfTG1rrhvk8r1yp2mlW33eGqj4qLOvP6fvR6Fi2
	nWware2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUh-00AdMj-21;
	Mon, 16 Oct 2023 21:51:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUe-00AdLK-1e;
	Mon, 16 Oct 2023 21:51:21 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A289389D;
	Mon, 16 Oct 2023 23:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697493072;
	bh=4hjvHsVqzqOYZWkil1rRouOrvHTjXpzmHt0/v6juDpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vfhAjRiSLGTvVpo/2J6z2VgAuv4xIyAzbKcecBMDmxlrYOfHiJF69kMmQvhW+cMxk
	 d8dVJb9pA3IrnKGR57GCBS8OsW8JK53uYrd4Rmdqy7QQmBBHy5Iuo4lHB29B2XW5cV
	 MJAwlyU77yI18m23q+T3HdXwe/x+aL6GpgBoeAv4=
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
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for OLogic, Inc.
Date: Tue, 17 Oct 2023 00:51:21 +0300
Message-ID: <20231016215123.30343-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_145120_698038_68FC76D6 
X-CRM114-Status: UNSURE (   8.50  )
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


