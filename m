Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78191C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/rv2/xAUdG1oY3mqfLC41QXomMeexmYUY9AH2+9l9o=; b=ulIR4cYYpwdrJO
	9VM9pohndTQIpy9YWxLNmimCRQx3iZMSbxnWaVxzWHBpj4fkAMiFsutqvH8bANngIMDkixR3Xv9C8
	ALE26PDgUWA1JrVwBDNtmx5IUwdr4/drDS9iJ7zfDsQybUfYE83ErQN0wSI5AUh3JGN21nvKbi47h
	LBF4C5dQ3eO9EPTQ5ajqpEtoKhz4RzB/WUB/3UJtGU3n7UfcgjbtJqIWLHXf4FIwxJffjSQjaMm7j
	Exks5imC21MtgNomW2u0yBmaA2dJNO5iUOhjn23ZCtDvmBKBE4jY4LTx76k8IQUvWe5FelQSu3eBs
	nV0mBqmzrp/n/blfc0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZh-00ANbK-8T; Mon, 17 Oct 2022 10:42:25 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZJ-00ANAH-8W; Mon, 17 Oct 2022 10:42:02 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 88834604D6;
	Mon, 17 Oct 2022 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/rv2/xAUdG1oY3mqfLC41QXomMeexmYUY9AH2+9l9o=;
	b=i5Qo7klc8WKbTAkYWsV5t4LXXq3aY0simORcZJ/8SQgI3bLnDPvunKuaUzPWLu34Ylhcde
	fy39FCmGuChGBrwK57bJO3tDSxAEDJ41aausmiIsYPAEl/OCew99zad0jKMAEQbvdD1531
	6H7+aKqHvGWCLlJBe2kqZDAZ6SvqJpI=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id E5B934053E;
	Mon, 17 Oct 2022 10:41:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 02/12] dt-bindings: PCI: mediatek-gen3: add support for mt7986
Date: Mon, 17 Oct 2022 12:41:31 +0200
Message-Id: <20221017104141.7338-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 83c5a80d-4315-46aa-b94f-9c0f82fc4136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034201_486469_888684F9 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
mt7986a.dtsi misses clock-names which are now required since support of
MT8192/MT8188/MT8195. This change also introduces a 6th clock which is
now needed for all pcie-gen3 dts.

i do not know how to map the clocks to the names...

mediatek-pcie-gen3.yaml:

  clock-names:
    items:
      - const: pl_250m
      - const: tl_26m
      - const: tl_96m
      - const: tl_32k
      - const: peri_26m
      - enum:
          - top_133m        # for MT8192
          - peri_mem        # for MT8188/MT8195

mt7986a.dtsi:

	clocks = <&infracfg CLK_INFRA_PCIE_SEL>,
		 <&infracfg CLK_INFRA_IPCIE_CK>,
		 <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
		 <&infracfg CLK_INFRA_IPCIER_CK>,
		 <&infracfg CLK_INFRA_IPCIEB_CK>;
---
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..b372c8351d9a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -51,6 +51,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
-- 
2.34.1


