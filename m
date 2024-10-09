Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C689CEE339
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TCrrrWhv3dQaAiqQKhwPQGsc5yyQQKRtf0rbAQxCapE=; b=LBWRI4aKFA+5ZJrMqbshyjuxwe
	9T3AlfjwuRrhoR987RLQ+gugeEgu8AImkdNlF06mGqhsjk0d1KYkxyxYqRbwFzKzitgFuPOfQP6Je
	rlD19AtZMtF/p/KgxHPxBY3AH+ZRP6Lc+zDrtSuK6UzFNnzRkGMstZtZOmYBPnxPicFPQE1bKV+eE
	uihC6KfeAu9na1P+JfHAIKKOHNg2oXfF9SxeQlZVhjmer/F3imTObQZeR+E+jdgmaJk9AC3PDWwoj
	SpfWfodJs0dVAwT4DlJX/Gjt2uP1/wrEMXd4K05pa5MT09+bMnLGUvGrlGjVcocac2U2022YvjwYu
	RKa1xKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaoL-0000000AGLB-1BDc;
	Wed, 09 Oct 2024 17:49:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syaFA-0000000A84b-00DL;
	Wed, 09 Oct 2024 17:13:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43058268d91so98285e9.0;
        Wed, 09 Oct 2024 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728493977; x=1729098777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCrrrWhv3dQaAiqQKhwPQGsc5yyQQKRtf0rbAQxCapE=;
        b=e/SQ71slzxriGPl+7bKJsNyV4IruRESxjX2FHmmRgJIMVCRmipCG/is5BM8Sax7s/p
         bBxF1geoEQQZB4+ROt6gDKwArDKbdq/jg/DVoio1NWCvELrfcisn4NdFBKkZWct6VbwT
         NhlsDgvibHKaunLoVvoQn/b795tg6cQylidLnKSmsbpcVFA1gC4+6dHm24gp5onTo2PF
         BBB8A5e9ysSI8hE6gXKvXZ0TSl0OV6md83Aeq9tedI1NLwzH3Xg+5jqTGUXxWrhkMtVH
         hYrQzYOEW1Dbvr0QsHqLi61X/7c27dHo44/nhZZMOGGDJEVGM7ZYj2PQ4a0j7nV8xCMs
         twjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728493977; x=1729098777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCrrrWhv3dQaAiqQKhwPQGsc5yyQQKRtf0rbAQxCapE=;
        b=bcHGQ7WjNtIfTB4YYTadvFdJV9MpRWe5l6g7wubxgelNwcyff0kYb1SKznG9rXuvbW
         A5RQ7LamkhTXfz+PNcv1gob+QVjfWji10MxTMP3soDoo/QOeJ9UH3gIFqrHD35RpXoNf
         ZKkg6rigS1KdMXYUq6Tq+h1Fd39ABDhPkzSiuPRU1Fy/y5eXzmPOQS1fNQFwmCuYXsyN
         Ly3TBmHDaoHb6pfQQm/AAa+6np8Gko5DNTbCDtQw9ateiZK8dG3QHxB0YjrqBsqH+tAf
         2/t66K/g0AHboAThP0LAOBQIEoX5C7wpCsITiOC8TblhcQB4TYUCN44pcJPuBdXItWrl
         dJhg==
X-Forwarded-Encrypted: i=1; AJvYcCVsjy2EoHfiTYtOg0IbGZejatQZZ9jLaDXRNIvbeP8v9QnnFc1SOB+WZymOYZP2rmsACduH54HUtYNElP/iZTCi@lists.infradead.org, AJvYcCWEm58nJzB0sEE+dUY9aMQju8huDs+5D0RH/ZGVJcBbHqMaJuvcfw9xvqKa9AxMLa/7sCrnb46WEhcwVHwv88E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAmDNTrHmU/OhL6y2gDFrnNFVe68BkZRt8tTXaplzZS6Spx4cE
	LEJEcmlf5lCPo0dOiFMBqNLHR9qg91M390z9AaPjl5Tjs5cxeYe/
X-Google-Smtp-Source: AGHT+IF4I5CmGa9hcugWiBWjkOlBhbMKeUrlWDazU08v09g6kAUQr2elrd5mrvrr7e4MNY0RZYyfxA==
X-Received: by 2002:a05:600c:19ca:b0:42c:df54:1908 with SMTP id 5b1f17b1804b1-430ccf4c829mr23359995e9.18.1728493977265;
        Wed, 09 Oct 2024 10:12:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-430ccf5f5e1sm25778805e9.26.2024.10.09.10.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:12:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 1/2] dt-bindings: crypto: Add Mediatek EIP-93 crypto engine
Date: Wed,  9 Oct 2024 19:12:20 +0200
Message-ID: <20241009171223.12695-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_101300_080708_55BE8CC8 
X-CRM114-Status: GOOD (  13.61  )
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

Add bindings for the Mediatek EIP-93 crypto engine. The same IP is also
present on Airoha SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/crypto/mediatek,mtk-eip93.yaml   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml

diff --git a/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
new file mode 100644
index 000000000000..b0173b4da42d
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/mediatek,mtk-eip93.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek EIP93 crypto engine
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek, mtk-eip93
+      - airoha,mtk-eip93
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    crypto@1e004000 {
+      compatible = "airoha,mtk-eip93";
+      reg = <0x1fb70000 0x1000>;
+
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.45.2


