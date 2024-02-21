Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6026C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VAjuyQPuC4u/dVsjetWF7ojJZoKHJ84Ly25W6f53+4E=; b=h7dp8ae7s21MOIc8lO6xWehmfP
	aUokd0a4WMC5Uk4K2damRYT409+01MCbwvDIcps4xDMDWKS1av8gmFDBuEo7ktvebAjht4L4wCXhc
	MdEYPlzgIEwwxSbC2Cfxd8S3PzPoFJwvODYT1Ubz7r4oTzJhQR+CGGR/xEmKnwuKUgO6IvOJ7Gc24
	JSm90LLTBxEG0I2kweUaVkjiJfaYePEb58t2lPOLq/mOP2YXYo0Xm4JB0wZFSN9Q/FaEMevtH2aaI
	WhLEWoG+eJ7Dx544Hqi1fmFezVg/A3YWX95kr8qJ7C9yghP7VfVXXXa9lhfJurQfk/gUvrekxsCaS
	KrEpJGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcp0J-00000001bp2-27Xy;
	Wed, 21 Feb 2024 15:59:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcp0F-00000001bmD-0CiT;
	Wed, 21 Feb 2024 15:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9999ECE187D;
	Wed, 21 Feb 2024 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9230FC433C7;
	Wed, 21 Feb 2024 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708531159;
	bh=wzMn7N6GEbr+AfMO+gRxUUuRVYZP5iP83MZxHmQMiEA=;
	h=From:To:Cc:Subject:Date:From;
	b=p2+IrjthXJUqyxlAB8oa2fPoOALqBc/eMw1FjuvbQqAlhQWy/R7rECLc6dP35JxPL
	 o3W8x1pK+HyIdN3m+/6D76x2ZeUYN9fH3OLLs9E2OQXf0oMhiS1b3Hnw94bmlE5RlN
	 TuMRNEkxRQC+301wy4ArUm8dGTt3FHLRH0wJN3tlGne7TxOthraBoZLnZPAo9EhXfY
	 54TPXv50b5vbrJF82tSj1i5E8NS8MjH2DBZAz+9382IigZvTJzbS0ZKHDaXUKS1by3
	 GEu0XbTxkf6S9O8TvJk5cGUkFWCbITe37O32vwjyoDQPK6Ci/fQSPlLCQDHVf03DZY
	 akoaB7bHJ4cBA==
From: Michael Walle <mwalle@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
Date: Wed, 21 Feb 2024 16:59:04 +0100
Message-Id: <20240221155905.1217340-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_075923_381631_D3EDAD85 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
computer.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v3:
 - drop description and add to mt8395 existing entry

v2:
 - convert enum to const as there is only one specific board
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..29ebe1f9c1d2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -353,6 +353,7 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - kontron,3-5-sbc-i1200
               - mediatek,mt8395-evk
               - radxa,nio-12l
           - const: mediatek,mt8395
-- 
2.39.2


