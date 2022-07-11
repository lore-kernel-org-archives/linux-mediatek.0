Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC74CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfq5GqyKIQ3G93hsVopsicEN4+Ex9z8gUV5bPzeHduI=; b=bi4Y0H01Pr8g0Lo0op0QPKwTgm
	v4FcudpbsL8rSiECzOotoEHIeNpHHG272+dOk1DG8MTU5XKqANQkg1NJcUusD2QDSxwQJkUHVuXLZ
	a+Y6urid6xa+e93jNWB1bSISqjjdpXAuKF7B9gKQ17HIXyPBoYbGILgOFuruYCrqoZH8Pmn0mHPPI
	o2tv/xxcqpCZN49bvJnyuz0I+Z+60iEnvextQmo6al3QTlFxPkXzDC0Aw/MDbp3sW1FrMKFHYUnpd
	EaGBcH1Q8c0z0Q2liFPxvag9UrpJt4JYLLYeMNa0a0/E87JeUDL1sYvpuYOuTJxK2rgxTsm5s9wjY
	9BPTVmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsU5-001OPE-Pb; Mon, 11 Jul 2022 12:25:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTQ-001O30-H1; Mon, 11 Jul 2022 12:25:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5AE366019FD;
	Mon, 11 Jul 2022 13:25:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657542308;
	bh=ubXAnOjRMe3Pb/tsTo7f8wxsG7B1OS2/1BE23DQJYdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VYX3Z6lPDzkT6PllDgjFsxECGU8NYPw3L64OVYrYZQaG9AW8r13syjK00gbuL+9dG
	 TZhKggimY+DoNIThs2H7+m5pnWDAtN2q35kJ69TCqzIrlmsAgU1Y0CIqXLZBbFX8Gk
	 NrzHDPwd3a7ic6m8Vq2LZ92G2oj3oqVru+iFn0OqCmLUYOQ4NnBrvFTXf7acTxwJRw
	 EaNBpdqsj9U5lccdQ9rrjSSZox++vhD6FTfc6WvJyIarKb5lSOqA0c7W2UMw0yszOx
	 VBGvJsmXqNAoQrZQAWkEA/Z/HUJ+D0qsfgRsL8/B2ApiYRhstf5Eapu7V2mJFM5EnA
	 M82cFU/4tT8yA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH 1/3] dt-bindings: power: mediatek: Document phandle to SCPSYS syscon node
Date: Mon, 11 Jul 2022 14:25:01 +0200
Message-Id: <20220711122503.286743-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_052512_720089_E6E2B053 
X-CRM114-Status: UNSURE (   8.80  )
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

Add a phandle to the syscon block providing access to SCPSYS registers:
this allows us to avoid using simple-mfd for the SCPSYS node and
nesting the System Power Manager node inside.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/power/mediatek,power-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 135c6f722091..848fdff7c9d8 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -39,6 +39,11 @@ properties:
   '#size-cells':
     const: 0
 
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon block providing access to SCPSYS registers
+
 patternProperties:
   "^power-domain@[0-9a-f]+$":
     type: object
-- 
2.35.1


