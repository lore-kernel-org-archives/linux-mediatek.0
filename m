Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EFEC4167E
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHjSItOnhZX6qwWh4aO2DjUK+VMoMnF8FBhbiRd+8rM=; b=GlsIqxgspjDxa0
	ol8Dr5EaDsDWD5dZJd6gtZQyDCCQjKbFo85j5lfJ1AMcepBY+FOy0vX0S1PGHqrSmPsCy/c2k1YmT
	KwgIC/VsFIlb3lmxs2aKzqq2EqRc9JLPd7JSIgeTjC/VZkl0+frfzb/h/a2ByBi0HZgIyPNFnuIk5
	3v0LW1rWykBHKQ3RviZpsde5+oaxib4x6askDTh1XeOU4d/iJytyQgD9w19pXKY+86NPh2P3y7WMH
	nJp/3+ukALTgh0ApzolpjLJzNyWAewSBJUGMzrPYhwsro3a0HuGl9EopikHH1i7o826QKUiKH2SEX
	fWvs/gmEFI5munY9zrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBYG-006j45-St; Sun, 30 Jan 2022 14:51:36 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYA-006izM-Ot; Sun, 30 Jan 2022 14:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/rahaqoBl10mLxjiHHBjaDkLrGMaoWWzxNZlctbd1uQ=; b=PX3110lEoSQ9dsykbvPfcmHvnh
 x/+XKcyBbGeu/2xbB4PJ3AZd6Jhpm/GfNLjHXUhuMqcDv4JXv1tVNrI0bTTqxPFSRSGBK8lS7BNEN
 ZcitLNcfpKngdVB+ebfFA4Lg5+m8U0GB76ICNSLfkJJe4sgNSC+E/FqcdnF26gpoeOcE=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBY6-0002if-1F; Sun, 30 Jan 2022 15:51:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>,
	John Crispin <john@phrozen.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 02/13] dt-bindings: arm: airoha: Add binding for EN7523 SoC
 and EVB
Date: Sun, 30 Jan 2022 15:51:05 +0100
Message-Id: <20220130145116.88406-3-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065131_015211_FA961D44 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: John Crispin <john@phrozen.org>

Add devicetree binding for Airoha EN7523 SoC and evaluation board.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../devicetree/bindings/arm/airoha.yaml       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
new file mode 100644
index 000000000000..fc19b1a6f37b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/airoha.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SoC based Platforms Device Tree Bindings
+
+maintainers:
+  - Felix Fietkau <nbd@nbd.name>
+  - John Crispin <john@phrozen.org>
+
+description:
+  Boards with an Airoha SoC shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - airoha,en7523-evb
+          - const: airoha,en7523
+
+additionalProperties: true
+
+...
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
