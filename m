Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C378C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j0DMb6a/wDNjFixLTkoayXRVTSXtdE6wrqP/soV5ir8=; b=V1H9r7RuNL/1LSTFadut5AFPm8
	or3oFV8FVXSYAZqQsKyLMM59deyCYLeo9MUo5zd6Wlhom1SpAOKgA+O248QhNGWv9e3Gh4GKr7wSE
	V321q7JMz0+K0OEjp9nPUHwvBz0pSl41MsohfgiwgYou4HcLlosmaCtaLr1Dv/N13rhvDXBLR//bH
	PGEaNVYbnhZVPJJymzb+Vrn9PavhAscyHvWMswTAZszDtT1No2/MtHwd10Mg5t5qRs88o2GOAEmGB
	imvCUoZtld5PXtbYJLRSkg/fF36Mzqqx/hcpg1/sD0cANNMbbbpHiwnIeRBkjE7RWNiheKitiapOG
	xT3wLPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6f5-00000006yb0-0T11;
	Tue, 11 Mar 2025 20:57:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6f2-00000006yai-2qK1
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 20:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3567E5C54B6;
	Tue, 11 Mar 2025 20:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C235C4CEE9;
	Tue, 11 Mar 2025 20:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741726631;
	bh=gBpUrcidbnHfQaEWdbVDXK2zU65oCxLuAp1amXO0y7Q=;
	h=From:Date:Subject:To:Cc:From;
	b=rUtrOvyYW+Gj1iZmchIJbovsyZT3h4CQuQMVGYsZ+VXVRQgCJ9qDsMrhwgR9bsX+g
	 lqdKH18WBX/cPusJ/Ls463IXwYO4icck+4tKO5NzTmnG9L/r2pW0g9aOqdWngKXP6g
	 PhCtB8xbH4khlrZPRxhZ7exd09hwIUvCcZOrfR6vfpIdBhnngq5qR/sCn+HRT0sPlE
	 Q3EVQoVgU7jJjG2TdNnvH3DjTX1lBmXza9xyWlGsgWfjK6BvCawprLe7+1C1xeS/Pd
	 BOG1Mo0+RQ/RXyM3NltPRLjMSk/k/P38Zfse0/yulB9a7mvedjF5vkkelZ8GWKG4N5
	 qcfJyGi2QoOoQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 21:56:48 +0100
Subject: [PATCH v2] dt-bindings: soc: airoha: Add the pbus-csr node for
 EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI+j0GcC/4WNWw6CMBBFt0Lm2zEtD6F8uQ9DjC0DTDSFTJVoS
 PduZQN+npPcczcIJEwB2mwDoZUDzz5BfsjATTc/EnKfGHKVV6pQDZKvq0bjYl/h6oKgZd+zH9H
 UJWlbqsEWJ0jrRWjg916+dIknDs9ZPvvRqn/2f3PVqNEYY3unSFFdnu8knh7HWUboYoxfFir8E
 b8AAAA=
X-Change-ID: 20250308-en7581-pbus_csr-binding-974e1b40fb36
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_135712_778261_EC3DA552 
X-CRM114-Status: UNSURE (   8.06  )
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

Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
The airoha pbus-csr block provides a configuration interface for the PBUS
controller used to detect if a given address is accessible on PCIe
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Move EN7581 pbus-csr binding in syscon.yaml
- Link to v1: https://lore.kernel.org/r/20250308-en7581-pbus_csr-binding-v1-1-999bdc0e0e74@kernel.org
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445050cab2ca2fd8b49f734a93b8766..7639350e7ede40c8934f41f854ff219354fb3e5b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -27,6 +27,7 @@ select:
     compatible:
       contains:
         enum:
+          - airoha,en7581-pbus-csr
           - al,alpine-sysfabric-service
           - allwinner,sun8i-a83t-system-controller
           - allwinner,sun8i-h3-system-controller
@@ -126,6 +127,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,en7581-pbus-csr
           - al,alpine-sysfabric-service
           - allwinner,sun8i-a83t-system-controller
           - allwinner,sun8i-h3-system-controller

---
base-commit: d71fc910c58ed85a2ad5143502030bff73fc2088
change-id: 20250308-en7581-pbus_csr-binding-974e1b40fb36

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


