Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C9DC04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hs0vmjiWdUAVN02f1eUsb3bLc9ywK9PfF0+tuNBc1KA=; b=k/ySy5fZEREtQJ
	KOFoAfRF8heAyud6TsSTSIx5u0ITMLhtOcA3JJUQL2xuD069qh/MVMaWoEKXIUYC8LfF8HQf9569m
	7MbY2yVFzKdIe0rbngi3w5CDOkvpw8z2EojyM9KQbt74fUvg1HsCSBYmnKYw6fb8YjRvNSx4xjFlm
	5TugpnT/RceCxfIkg15uvp3UMFrDYStAkaRb3Lu5vpnW32t/F81r9lWTsIEdyKnUrcjMtQO2MR80A
	iz8ZwKcvbkZ4jiYFxIp2RizHDvdzgx6aB6x5JVUFTZiPbDqT4lAGoFTn04Seym+/5rkU7rhkveeHN
	kAQOiZFP3VusbDA7bC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVU36-00GdW0-19;
	Mon, 14 Aug 2023 09:39:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVU33-00GdUd-1v;
	Mon, 14 Aug 2023 09:39:42 +0000
Received: from eugen-station.. (unknown [86.127.70.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C34966071A3;
	Mon, 14 Aug 2023 10:39:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692005979;
	bh=ReQu8PlNQ3B+RBTqaF0mmwCVGrAXcC7wZ1rVXE/sQWg=;
	h=From:To:Cc:Subject:Date:From;
	b=M8Ca4aLb3WE+Q4DJJJQ067zA0ycljgRWSx763eFg5TmROuoK9lASVtpzn5vnV1MJ6
	 rJurNQBtBBAz+RnSBs9tVLUNP15VWi5RoR4++7wTkZ+L9rdgNmjmBG8yo1lhGsAZV5
	 iWPU1pRwpvnBPFpNTEV+UQY1BNxGjC/6DarevfEqEXuBboIg4Z8syGF9jMb/VMkigj
	 FAfBuV1Iq63HpHktATW1U0t2KT7GkNdnia9/8uHgHw8PI4VEvbQu/pZVzAqATpfsrR
	 yx7UQ5F9u9pZe3egS2YZEylFdiOd+t+fDCe/k+qazHnNPRCq4Vin1X1oNWkFz19lkU
	 dVHxDJCX3vvlQ==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: phy: mediatek,tphy: allow simple nodename pattern
Date: Mon, 14 Aug 2023 12:39:30 +0300
Message-Id: <20230814093931.9298-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_023941_788634_BBC48C2D 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@collabora.com, sam.shih@mediatek.com, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, Eugen Hristev <eugen.hristev@collabora.com>, krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chris.obbard@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pattern for the nodename only allows t-phy@... , however, for the case
when the t-phy has no `reg` and only `ranges` (basically when the t-phy
is just a parent node), dtc will throw this warning:

Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property

For a node like this:

	sata_phy: t-phy@1a243000 {
		ranges;

		sata_port: sata-phy@1a243000 {
			reg = <0 0x1a243000 0 0x0100>;
		};
	};

it is normal that the parent node 't-phy' would be without any address, as in:

	sata_phy: t-phy {
		ranges;

		sata_port: sata-phy@1a243000 {
			reg = <0 0x1a243000 0 0x0100>;
		};
	};

because being just a holder it does not have its own reg.

However the binding does not allow such a name for the t-phy, so with this
patch, making the `@[0-9a-f]+` part optional, such node is possible.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- none
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 230a17f24966..2bb91542e984 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -64,7 +64,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^t-phy@[0-9a-f]+$"
+    pattern: "^t-phy(@[0-9a-f]+)?$"
 
   compatible:
     oneOf:
-- 
2.34.1


