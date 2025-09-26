Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E73CAC5B9
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Sep 2025 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ki7EFu0Nl7B4/VDVsO/DBVKCcttxWy3Q8gg0aWtl8E4=; b=mT21iphM0vcEmaPy2Jsfy7UPYd
	ttZNYbv70LiJxNJ1XjevW4Sao8MHfkdXQGbCj9kdFTANoJxyHXRMQnvCpvQZ4rb30SOnDj6KNcgLO
	eLvebTRuY75D79iyfZYoCI10oFbqVJPmBNeAu7x/B3qGDUSBUkFkxhDkvuTc3qx/Bd5pRkDOjA/gA
	1PJ23yS4xEcwASX8xo+zlFTI/qPf554y8D7c4QQC48f2OtrNjxdW97YqZrOEQ3x8YLRHS0P2dlsHs
	J7pYEIUQ/OjJRxRs7c5w4CY5f/iHTv/io0dF9jimnUP+Tpjstg7KeopX1Z9gYTJsYR7QAwE+Zn90A
	9g1sZmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abn-00000002XGc-48aY;
	Fri, 26 Sep 2025 15:43:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abh-00000002XAe-1rk0;
	Fri, 26 Sep 2025 15:43:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C3544E95;
	Fri, 26 Sep 2025 15:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BA6C4CEF4;
	Fri, 26 Sep 2025 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758901416;
	bh=EYs89Jn2WO18lvHPSIvjiHZSODy76dkZb7stpKU2PPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q+gU9jHQA5/VjYvnTxBJ+2iIklT7sczY0csmgFIMF+W+uKVic2i27JNzxulrrfN+U
	 YqnWWBzWs6h0fy2CI42NoqYnU0ng7rUZABJfEm5Vlx2TfD41fSbXt5HszpnFU5a5UZ
	 auN2092VTMCB9HTxjRtqRC832c0dgNoHhbfsBFMHjziuAVYlF7R2DjQrEJsnGOm7hK
	 RUwuVVABDqiYyKKCT9X/I4BJNOdwpvCe7oLWPE1esVe5qz+H0fOumteDjBYAwQuP+9
	 QYufhAoebKm8/NsCZI1qdhEkBUw440mTJeroblpXRFS9yWnW0axjnwJSaBWUi7L1bH
	 7RCAjXu7fkESQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 26 Sep 2025 17:43:22 +0200
Subject: [PATCH net-next 1/2] dt-bindings: net: airoha: npu: Add AN7583
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-airoha-npu-7583-v1-1-447e5e2df08d@kernel.org>
References: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
In-Reply-To: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_084337_514150_94DC18DC 
X-CRM114-Status: UNSURE (   7.43  )
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

Introduce AN7583 NPU support to Airoha EN7581 NPU device-tree bindings.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index c7644e6586d329d8ec2f0a0d8d8e4f4490429dcc..59c57f58116b568092446e6cfb7b6bd3f4f47b82 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - airoha,en7581-npu
+      - airoha,an7583-npu
 
   reg:
     maxItems: 1

-- 
2.51.0


