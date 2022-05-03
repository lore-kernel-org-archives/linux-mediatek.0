Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE1AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lW6lu7afQc0i/AESfxqesfz5cx+1qENGYVq4O10Im0c=; b=TUx53RM4InCxTI
	mBBHzdR3Mc98mB1YkFOh7Js5IJVPBQoFb5TljNO/aD6Uj5Y96s4nTMtcUwbMNP2w0smXD9j0QXehi
	X3dvFk/PaA6YKtlmEwdSb844EcECQelhjmaeBpbgcWDopb9wqvFuP9F9aR+Wn37QGvD+NJxy1m7B/
	MF8SvJ1bn/5E097bMk7zJI/QcGDWpxyzYjxeCklAQ5Se9f+AihGjD97jz0NcpAm5MfpDpmw7IZYZN
	wGMXEfdjHl0t/HyGGdduxryqZJFf3Pj5a3tHKb1pPb6rotfse/XjtmYQeDUcoLZMLn1V2T9Rb5OP7
	bgD6rnfyOGYXozd/hn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqGC-005SWm-LS; Tue, 03 May 2022 11:00:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqB2-005PCR-Hf; Tue, 03 May 2022 10:54:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 93C6F1F43E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575283;
 bh=QL7sXkZwTx0DxEfhh1OMvj81EaDnQLFFNnnmk9jh5s8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oRe4gvCF/yTxtL4FUeAcdBLhgY0bxHFnGH0k0ohBAZeY1QdNvyNx8vzJTxEDB57+7
 hHv1B8gqGxjI/X+HEKemL4yHsiqFHFuabvVZIOMqUV0IEA18VRxPyF1QD+g69Hkw//
 KFuTFsqp6Vy7UP51tmM5YrkdCyZd46hH1aEHCEykW/46ceTH7vl9fytTj+SWuRYGhp
 rK/MYHXKPAevNOSJvheaRU2UlzbjQ5OSO2VaItb8RD6brVvpLSIc7BdQ+7+/bWi36L
 T5zPRqX6Ce8KFuqKiFm951XDR89liFAzDBXwIvONEq/8Irrj1pUvy24UsoCE57orIQ
 d5v/nHGrJa0dA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 weiyi.lu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: [PATCH 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795 power
 domains
Date: Tue,  3 May 2022 12:54:35 +0200
Message-Id: <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
References: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035444_786901_5A31202F 
X-CRM114-Status: GOOD (  11.76  )
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

Add power domains dt-bindings for MediaTek Helio X10 (MT6795).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml         |  2 ++
 include/dt-bindings/power/mt6795-power.h         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/power/mt6795-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 135c6f722091..b448101fac43 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -23,6 +23,7 @@ properties:
 
   compatible:
     enum:
+      - mediatek,mt6795-power-controller
       - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
@@ -62,6 +63,7 @@ patternProperties:
       reg:
         description: |
           Power domain index. Valid values are defined in:
+              "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
diff --git a/include/dt-bindings/power/mt6795-power.h b/include/dt-bindings/power/mt6795-power.h
new file mode 100644
index 000000000000..0e27bc7fa748
--- /dev/null
+++ b/include/dt-bindings/power/mt6795-power.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_POWER_MT6795_POWER_H
+#define _DT_BINDINGS_POWER_MT6795_POWER_H
+
+#define MT6795_POWER_DOMAIN_MM		0
+#define MT6795_POWER_DOMAIN_VDEC	1
+#define MT6795_POWER_DOMAIN_VENC	2
+#define MT6795_POWER_DOMAIN_ISP		3
+#define MT6795_POWER_DOMAIN_MJC		4
+#define MT6795_POWER_DOMAIN_AUDIO	5
+#define MT6795_POWER_DOMAIN_MFG_ASYNC	6
+#define MT6795_POWER_DOMAIN_MFG_2D	7
+#define MT6795_POWER_DOMAIN_MFG		8
+#define MT6795_POWER_DOMAIN_MODEM	9
+
+#endif /* _DT_BINDINGS_POWER_MT6795_POWER_H */
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
