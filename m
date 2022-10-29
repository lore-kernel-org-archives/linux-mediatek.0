Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4635C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ8GRq7a4mB9jHUs3YggqSdwXFnG4JioJUT0UDXyP14=; b=Ng4K7dN5k8j106
	EJaJcAk3PsvCGWryMIUYxvIw7URmcNzVguXza7/C0WLf7ObI1Y/iQxKThaii2qeaahPcNPqolnFn4
	Sc8WsaO7AnJpVRfunqONeEb0j0/F0YSljn7ffS6MVFFMxePUH+nrkZITzpxNGzfGDTycoTLdmi0ZW
	SFXcup90WRztp/suiXlR5bAaAGd3O9vr1X12QvWeJJUxNE3P2PlObwsu8aYWACD6aw1tD5LaBzOpL
	pyAimQp0FcRnlK19DSR7evNwUnMxxYywfTWDjzj/KMEQDlb4CVcXNEPI3X12pMeV2Qm+kFmHhgNt0
	A6AlX6avwmqt3EHiBY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq6Z-007mDQ-Gs; Sat, 29 Oct 2022 17:58:47 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq64-007lZo-EK; Sat, 29 Oct 2022 17:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667066289;
	bh=gbLUknNhYDzToI8QX7zIFAAM+RoOhWqq4U9N2tWYqrY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J05y90sHfOuBW1dagMH1QWKbygXKo3NM4skXufIWKzOJ50SGhdfo0k3Qvs99hOT9N
	 Ig0ftYRsTbhyrnlOI0x/6JsqTxYqbAVGdZ7XeE6pq+Cyh5fC19AgDDbevyRcyitnFg
	 aOpdgdFJzazkN3qB8tmRb0pE7zLiPVYA3WE8zdImrOn+uxMZqRRqMzEEQWLUQc+Dss
	 zaZ0tXiLE15RohZqms/Kj7p0vOVQlA4HJETmLIYrp3wE/CJyIWtWc22uuQ1V10fpD5
	 5YdTGBi9fDRX7kCCDYirdRn1eCAgb46eTW3v1wclgy0YmczgTg0rq1vq6C8XAQN70w
	 3COzWQo/bgSPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDywu-1owVan1VqO-009zKI; Sat, 29
 Oct 2022 19:58:09 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] dt-bindings: PCI: mediatek-gen3: add support for mt7986
Date: Sat, 29 Oct 2022 19:58:06 +0200
Message-Id: <20221029175806.14899-3-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221029175806.14899-1-frank-w@public-files.de>
References: <20221029175806.14899-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M/8pyPHZeBy0oSZJMA11WuM41/YmWM8SAUTdo0nAh26A+VhWuFN
 VUrLwFwRtVtMl8Lb05bPaTo6Ly7GqelfUJIRpUtyiGaeczpB914xJ1gKujlpp9R4hjAyqtz
 c66xvAbooTVN5TZQc+zo8C9BSplX8Rf0GxzI16qRaIaye2irKh7FWdHy/Oz/bzjaJAJf+Q3
 q769wPKHXM4npSkXp1F9A==
UI-OutboundReport: notjunk:1;M01:P0:sEB2PEL8bqg=;ekmgBYoYBWf9sUt1XO4Psf+cuK5
 2lyAB5EiVbpwX2rCsOIEuIY14q/9synZZ38f6UWvsLJXML4H/tjrvgZNnnDwnad5F1N1jlBum
 sW+G9WnUTgc/BtUoGuogvnH07Og0csQ10MCThKItQbD5v9sZ+oHz4WaqfXeip6L2uP/+q8bw/
 2nblADu9rtaNLkZuKOZzCJ6c7mDHmn84+BBGy79SjVImXJW20pNF0GUOy7TGVqPAWN/NWv/3A
 NYILctiWtjbHixqQSpho/XP4TNh4vSAHDQ67fuvAEal1lxrtvvCCgEOK8CS6Hq+ByKKYC8iMR
 gM4TTwEpJ/boYXmc6x+JiiewGajvO1HMT5iaQ6zOTPsARkbe9EGpeFj+RH7Mxupne32v+DGXE
 vPhpSx+WJk28T69aSzaX7WUsZ0NIdtSOYUNlocALIaR6RZwy66a35KEAvadckHtxo+y97rR1Z
 0MrKFEnHCykWPA78jKMlA4I/bPSo0TjInvq7ogGom7NuOYj/ITF/U/4tgeCMBZ124PW7lpk2P
 PptZDy1U19aLRaFg/qTz7raHccn2SaBoujH/JLtam9CPPho27gCnvclgr6j0Td0NYQcyxBuX+
 225OXpzDKElNn1w5Y1ZpQVhTgFaUPyKOKHc0lqwODdOwvu+MZ6YfVsI/16zX5714dG/AoJLT3
 YJlSMDnpw7ytqn/OyhDP8ynurM0LmPmxHbZ7xIUMv8BTQDwUWov7yAO1fhOa9ZoeKBSVIiQun
 LUcPwvFhL+jpbc5cijskbDTIBUtp+V36njUwydMdXAcKkvjOpqDAOwxXIVNSV/nZCy4tWz5Oz
 7S0lqWIWBSavjXpAxSmlzVcOg3E14e8Lcq61l4p9RXF+kimQ4knSSItoayZrCV7xj3b9t48Dm
 DV6tIHcdMYAovyj78trKZglcgWVqYTOmwz9oXoQ+PUpcc+WFd4jAuBjr5Ma0ZBtL1kG0lp83E
 ndS3I6yjgflfUOjGWeEjSnk927w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105816_785475_D75F9A07 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string and clock-definition for mt7986. It needs 4 clocks
for PCIe, define them in binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
v2:
- squashed patch 2+3 (compatible and clock definition)
=2D--
 .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml=
 b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 5d7369debff2..f7a02019daea 100644
=2D-- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,6 +48,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
@@ -78,9 +79,11 @@ properties:
       - const: mac

   clocks:
+    minItems: 4
     maxItems: 6

   clock-names:
+    minItems: 4
     maxItems: 6

   assigned-clocks:
@@ -160,6 +163,20 @@ allOf:
             - const: tl_32k
             - const: peri_26m
             - const: peri_mem
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: peri_26m
+            - const: top_133m

 unevaluatedProperties: false

=2D-
2.34.1


