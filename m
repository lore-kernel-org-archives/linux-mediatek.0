Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA1C369D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RcZIjIwx1s6Wcv16nJayJJUai7Sa7nACbdnFD1drq0=; b=Fw2SAe3pf8JDwD
	JHGVNAvkVLfz3OjhKaZOfp1x20XeLevyW+JimXntPSbf9fxPWdBAA4SkA7yavP1yzYKxvUgg//RiD
	lZt7JldIw0hXHAoQd9mfjzPC5wm3PPt+tRJGISAWUJIm2GFLqDhDSxupbX1hSX7cBax8Q/kKk2QVl
	OY3THdl5g86B+kW1/9rveg+pkksuM4ruQUl2eYMqeDU+Gw9FeTh1pFG0qohKhzk0PSsdvu8gDl9g8
	HelYHQE3xaOVssIO/e17qOPa+9TgKb3YbEC6xkURLdm/IcUCHrFItGqqUvTMYQ5YoI2M1dHcvf7u5
	3c4QZYNajKpxqcXL1h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EuK-00000007Z4d-18TU;
	Tue, 22 Apr 2025 14:47:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DcQ-00000007Hpa-3JXG;
	Tue, 22 Apr 2025 13:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5RcZIjIwx1s6Wcv16nJayJJUai7Sa7nACbdnFD1drq0=; b=Cojnn//QjJ532OGzQMiOwXENoR
	W3k3/0A4sbZvqCWC/o6pwBznNNkAdgUC/YNj5dTAhlmH+bbvDJRADNZMxDl+wnTgzx85U6hGVTOAr
	PnlE8oHzGRu2Comg4Ye00n4Iy3PvzCjzZhmsc7a0xzve52fMzdGANk2NXjIafrr+GSEysjMtjCBAf
	9mrFEp9DZZ8ZhD3pliB2c20zbTuWpDuKexZ7XP5XDtZf3VFl7rE/uIOcunXxEzEI0TS7ACAtRFbG2
	LbEX1/07+FSVX03xS1FmNrpJzauRipUZaW9s9uG6TfgaZGwOB/l4rErUo/Dfg5QftGPKt+jMp7Jzr
	a7Tfm4iA==;
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DcO-0000000BEPC-00GM;
	Tue, 22 Apr 2025 13:24:57 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id BB7981005F7;
	Tue, 22 Apr 2025 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RcZIjIwx1s6Wcv16nJayJJUai7Sa7nACbdnFD1drq0=;
	b=t+33jZHAliVR9d3XvK+repuuoaox4NEdkjDkAw8/cmKob5ZBzZ6R2zsFgJDhq1ZKLaOUAf
	5HjfW0FrfQ9BqLBXEFKl2ZqIziRN/NuzCoBodkWoMYscXdN2k/tTP5NGMxGh2XaSCjlr0Y
	oVoZxw3DzF6R5Vu2Vg4L3/Rz/uNJD+c=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id D86A980318;
	Tue, 22 Apr 2025 13:24:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 4/8] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
Date: Tue, 22 Apr 2025 15:24:27 +0200
Message-ID: <20250422132438.15735-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e0e4b4d5-9fca-452c-b776-a545c7a43a4d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_142456_171366_0D0E2582 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add support for type switch by pericfg register between USB3/PCIe.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
- changes based on comments from Krzysztof
- change to phy type configuration controller/register
---
 .../devicetree/bindings/phy/mediatek,xsphy.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index 3b5253659e6f..0bed847bb4ad 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -151,6 +151,21 @@ patternProperties:
         minimum: 1
         maximum: 31
 
+      mediatek,syscon-type:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          A phandle to syscon used to access the register of type switch,
+          the field should always be 3 cells long.
+        items:
+          - items:
+              - description:
+                  Phandle to phy type configuration system controller
+              - description:
+                  Phy type configuration register offset
+              - description:
+                  Index of config segment
+                enum: [0, 1, 2, 3]
+
     required:
       - reg
       - clocks
-- 
2.43.0


