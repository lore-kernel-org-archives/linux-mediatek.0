Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C6EEAA4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY/JnW2coojX5WqbirlBBvqXeFPOowhckqhblj+azyU=; b=Mu5aeGiM+nORLnhn19c3uX/8Af
	+tyJktuXzj6MJQNLF2M7wyH9dko86vkThy9q5r6c/+QEiT6FCHFmZVK70Nll1DCO1AWmHw5oI0aPk
	0i2aya19Zl0XQHkkTlv9ODTjyUkvdi9SxdED+ac5AqHMFRe6OPORBROVwFv2ICExLtROR8jf5X7iH
	HNMqQsjPSD92Aq2/wtH5DN6c/okyrWs7Bbr0vlV6HVyzb9vm/C8ezJaoKhzA3IqAgNRK8GxruKnga
	3TPj5x1Gsky+CBjpKnOp4eI8MI4LGMViIu7etkJ4pr/4GR1bvRgErXHCGQjKWaTn7+eK5U2tZ1om9
	ZxLKLlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnUy-008ebh-1q;
	Thu, 14 Sep 2023 14:39:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnUw-008eb7-2J
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DCA56CE263A;
	Thu, 14 Sep 2023 14:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970ACC433C8;
	Thu, 14 Sep 2023 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702351;
	bh=Ruv2x+AxMFAY05kafZgsuUzxSPVlmNqIubkGcvMlyRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l2mIIobFDMOV9kqkWSqIuMkSForVh87qtJy+dmi4OvVWHItJzjLVrslEw5lR6OA6+
	 vLtwuG3P+4DzjoOPSy4a8TuifLGVT6vWK+AWRG/Ze8tMSx+QsSZ/LIJOStrAzLRBJL
	 yBZ4reqmEMV+s9q9gTdNOBMUYgKw6WZKgc8SO/opE7SJxnStc4TXMnmmMqULgFKT7G
	 GqjuqTvM07lfr/QBqOwq7XkSQZLqZ723dzzt9wevmznKkPj/Q/7WRgM4wMvkfr/YYo
	 1tDw2jWsLZPLLmfPqJcDt1UcH+2E1NRsBLmoS5mpUShgWDWmMjRTNgejERYwi2CtXf
	 zLOSvB1seaB6g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 01/15] dt-bindings: soc: mediatek: mt7986-wo-ccif: add binding for MT7988 SoC
Date: Thu, 14 Sep 2023 16:38:06 +0200
Message-ID: <148f4f9ff2ec891955f9e9292aff9595f07beded.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073914_925656_B8C7F821 
X-CRM114-Status: UNSURE (   7.76  )
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

Introduce MT7988 SoC compatibility string in mt7986-wo-ccif binding.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
index f0fa92b04b32..3b212f26abc5 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - mediatek,mt7986-wo-ccif
+          - mediatek,mt7988-wo-ccif
       - const: syscon
 
   reg:
-- 
2.41.0


