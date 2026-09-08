Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00393C79FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=; b=2doRe3i9Q/648I795PnKHwacjT
	4Y0f5DrA5tCNTij2fS7jLtd6vxXXX0cVk69vsFVQzDc3qf/J1AIrMth/ztI3rKi4Bc9HcyOW3aemU
	AIAOtEQMm3R/yxR7PIRH7u9TcuzwSGx2y/JQ45Js0V8lTtshWFBZTDddrT1TZtcU5a1NzbVMWdG1G
	LxN47YXA0EvCz0H21b4cTnJUrKp2uK7paF6cXFwZOHl9B0MgH8Tvm4mRoh9pX6H8sXiNRXnnXXO6q
	G9RMmIRkQGfPwL3WzG2GO8eyEq21swpHNOtwj1+vwWeu7a96sHNYFWPZvioPUs8PbuY0/SJEXcKtv
	mZ9cct0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlI-00000008VAw-3nA5;
	Tue, 08 Sep 2026 09:05:04 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlG-00000008V7X-0ssY
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:03 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso5866930a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858300; x=1789463100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=nDcFFDn+6u1ZA+YKoMcE7sShyJCAzGkItV07E90EUX1W2gsE5jZOuWT1XiwdDXkYZy
         8k7x8qkAC0+TkH6bYJtBtqC6BPJx5d3MeI991SeiJhxGU53EVTUh9AH323Q2eHMnUYIH
         KBrJhRrnFexRqL9YG4c6HueEYNxv0NsKU9EPS8er8AGnzZG+piCjdoxXFS4rATTfEaOE
         8HyNDSMLbCO8Pl5iC8ScuX82vQE6w7XdC0Sg7Y9ic/jA2VvPXetLFVqJKElpsyMruzPk
         9z9ZUBFGGogcrECviOMFIuomKKD+lEtznZyB+cIDFm/bNQ+3SaH6UksMvN9im54fnQ3f
         LhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858300; x=1789463100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=PAN1FTmy5KzZhoS6DlOvSEyjV494frf6QOUlHa0mfq8kZDkD7LDgyFJTqzFtloSnAb
         zEzyilJTwxg9IuXfZUG2dsa6ljds2CJUdZc0dNPDRMKtuY1ewauMrdGOS8bGRK5avTc9
         pJ4ptRhl+BtkgcWCen2ebM5oaJ15IC96xkrIsk2gT+2E+HjJE76ne7rNZ6QvgEyjTgYw
         RVeBbCBQvO36Kxq4Y+b+gaQf4xpHOpAvmqL5hg/pdnfvY7M86H3p4JLOURgqrAohEheP
         jKM4OiCXyg35dFtjprhLtp9o5wCK1I2ER963usJaigP7YFpapP+Q5/vXFKW8KxcPSfqu
         DCGA==
X-Forwarded-Encrypted: i=1; AKwUvByvsJ88skU41IKayHj1s/Y4+vTTyZEODdCD6mJuVrWUOjVGyOzOz/iTl9j4kv9rs5e97h1D3uMKokqIU6KIaw==@lists.infradead.org
X-Gm-Message-State: AFuF++k+FwDUeLdb2S0hsSJaldOpltlaYjQ/Gz/gdmioVZui5mJ08lAG
	7koNCq+OfhIJaZ25t88QE7njTBYYblXa6+mpmYx4C7ES2Nto+7PA+GY8
X-Gm-Gg: AYBFou2r8SrePqo6MAgFjz4ZZtofKGlYsniCRoz2ZBkaXh5rkGU6QGo3UH/Kvn1O1dc
	b/Wr8TbwnAmATsX2oqm4a+bmPAjELDM7R8Mui39PswnrAg/mdjxx9br6gYcVSdWLv7XCaOE3zFz
	jnmvHgu8oDuuGQB1e5sg8gqOpIta6pPoRMulkG5pLg92MSDikfAO2JWoP5MV4Ve0tPYa61eL28J
	kDiwb+axhqgN/auBp76SpI3EivA0uTqV3HnYfDMfQQ5xUZED4zlgQUhlywDSMDCZtoOerMzrfbj
	nNntAHoVZBoau/s62rRzX9s0YNTL/t6EmbEebL2gJo4DRLol6rsYugkcYjoVwFSKaOFCVhAobmw
	+CWSlRW7CfVPqm8xjTGn5Kps0G/GfSd8hH1M/fLUsZc1EFpxleYmtBME8JRnqtJdwuv+gB4cBni
	0YO7IJGPt1D+lH6qDcBECd/7OA/QdSWG5h0DVxm8Z2BKWPhrHkKdmM2Kp0/JFIYBEXwaKuODenS
	9pw72UB536scoLwVckA9zJzNYeZKS6g6G7qcbb42MIe9GSJK2Dn
X-Received: by 2002:a05:6402:3554:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6a7e8d4d131mr18523650a12.6.1788858299489;
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Tue,  8 Sep 2026 11:04:44 +0200
Message-ID: <20260908090448.3332-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020502_267966_9BEEF464 
X-CRM114-Status: GOOD (  13.36  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


