Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BC4C4451B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=; b=rihiR7tdjIdxxdrbm4XvRetJGD
	VWqHPoHeBTU+B2ZRkloM3wCQhRft0N+5hwbsNfiPxY7vhp3Tme82CksiZtGZBdC70bx+Nc4pQdLsq
	Xaxn/3KiLUc9QR2mU20DZQJQFjLIe1fXeQO/UHqNQy1tMVWf0YR1MI4iZEjZENg7JvYl6nLWS3Gi3
	uVUUpgQpJ9vS19ghCbLjlnRUNZfvKwUxWPZvlAdp2rgRX701NNp7yWJ/R1KACwWhQA2DeMR+1qHNe
	ImE5lbLvym3hqBZcJj7iYd2YeXTk3wSOEOHwKU1L5HFJ9hBSjbqwyM7J7ORNo0z4rm7WCPzJgPtH9
	g+GTDCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBz-00000006I9r-2KkH;
	Mon, 20 Jul 2026 09:21:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBw-00000006I8d-2fv6
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 09:21:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cca0c5799eso74651115ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539299; x=1785144099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=dcI/oyYxqNRimBCjEDeWa82vXHOMgxs7TX97uuoQDRyxFHhq6GxjpOzHISh7mFHxYT
         TBAFBGhB3Eot66G6AbvG4lutcgiI8Vmym4iKBMSsQp0R4+8jeAu9bjPIq676ZeVlNtU0
         +hydMbgqWKk/bu/C3ok2yOGUqXVhCnNHReFoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539299; x=1785144099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=f5pOAIOMFg3TQJqTu4gutZvUWrl2nqkv3YThRHa6TfCu6vZHKhCTdtECPcj43CeQmg
         Hq7eD3tVSG+73kCmX21lGx5aJoxtUak4MV8gVoBVRtzckApmUX8Hsg1S5h4TTryZ5ldt
         xQku8yH9MmIPKsr+FuC8aQk4C2uwb8e0sX6vapQeYmxkDCAeYY9qhvIXJ0XLbbpqI9Ft
         LQijMkr+WKTUGOKp0AGW515PIkf06EaKdJBYwgxwHaIcx1BONJlsfTeVJ3dWPUbfBpxJ
         9S9PgLjFN0nCMEJXtaf2++XzPV31bLX1jUuy6nIWin5K8VD5vG9HyUcLzaO0cIfbya0p
         TpRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqn2vHdUm27N9fPV6y/SJdZXerMRQgfYh7M9YrNkOnLSIy8SqmyDSezSSGRw/bFBh3UL9yEDV96Xc6I7sBXNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyegDXH1ok9ibfrm6NlgVWZruX195/K//41P7VdXvJm+95joCK/
	rOeWIw0QBy1G0QIdE7jYQOKySZ6dNNw9JF5NWOm3AOywLTpzcDraSgud0Or8oEnyNg==
X-Gm-Gg: AfdE7cn6+SE70VN89unFnmCvGFgVAcsxHtndXh/dDueMplbsshiMk26UuIjMXvt9N0y
	/lhfOADBsyuEeDI+AodboJJ53pCGIPHFCABl4uLQAYEAW9FEzejIa4gxoo7ywpCri9yawro3xeV
	GcWVrPrmqN949V4tnAPeUatjF8uOMkducd7Fq6N31C+uQNy5oK2jtG6cXRPCLrGJ4XxLbB9iwCL
	KtKs1bVEV2MzqwioYeB9nHXKG3I14awi7dsquvPAaAZNU4GgTAUcQtPsmdXvUqHG/HZwuZiCyvh
	2EQlMcu2gl0nqHoRTxrHz9lesv3Cs3gJm+P9fsoscSr09cet+kOTit8GQpyUsse0hm8wEwVY50p
	hlc5/bwA3q3Ynt/dpuHxVF7088xubyoeWziHZNje8uBiLz0cYDdiQB5gauKfg5nNzvSD9vCA2S9
	dVfJziln/NcaGghmMwsop2/kUhDVGkWtjWx1yhu5QzpljGk4yCnIi0f9qEJNH/e8A+OAxZJw==
X-Received: by 2002:a17:902:e80e:b0:2cc:8267:31b5 with SMTP id d9443c01a7336-2cf3489a830mr141008405ad.19.1784539299565;
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344be458sm53775345ad.25.2026.07.20.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RESEND] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
Date: Mon, 20 Jul 2026 17:21:15 +0800
Message-ID: <20260720092116.1823562-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022140_718136_BFE76A36 
X-CRM114-Status: GOOD (  11.79  )
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

On some SoCs without an IOMMU behind the PCIe controller, the PCIe
controller memory access could be limited to a small region by the
firmware configuring a memory protection unit. This memory region
must be assigned to the PCIe controller so that the OS knows to
use that region. Otherwise PCIe devices would not work properly.

Allow the memory-region property with one item pointing to a
restricted DMA buffer.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Can we get this merged for v7.2? A matching device tree change was
already merged in v7.2-rc1.


 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index fbc0378392d4..b88717dec1fa 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -116,6 +116,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: phandle to restricted DMA buffer
+
   mediatek,pbus-csr:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.55.0.229.g6434b31f56-goog


