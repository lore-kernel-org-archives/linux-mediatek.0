Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB95C43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=; b=zNBszxeOAyopAE8y04AR5azBnt
	T/Geb5so4ZBVqStueF5kzzveXQieqz/Vi6VIy7sY9VoL5YG7QNhlGrv4rkjEwYZqsl8hxjytsDRg8
	K1PmwvLySijJiUe+no+gAIW2zPC9F0Mcs9nUvmP5kJ2zvFhl//4mQn6P7GtNjJNgs8UcHvIOYYNac
	wGYlDufeh+a6II75UNJlrfJYLKWGjDcd5LPJu3dEH1aQyG1RDOeGQCiUcX2GbgF53SwI22x+QwaLu
	rn1ihp93hgX0PAI9/AP7ow6RMeqaW4CtphXVGwNPPMQH7QNLekKC6cJ0ta/bibG2SoF0XjUZkwus8
	2bqsmsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODx-0000000GhYD-4AuR;
	Wed, 08 Jul 2026 09:05:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODu-0000000GhVx-0o73
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 09:05:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so214792f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501539; x=1784106339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=;
        b=GVMlAsTDVach5HuZrpL47PGMK2a62sE7QQ69M0LmG4rpZCKsLesQAENjvaOwysfjXY
         Uk7ViaOkJhpQaWI6Pdbk06+sLvIm0Q/1mpdAY58rLN71kFCLTInXCTJNyNokps5MWZmf
         GQqNqBKZ9InqzyWoI/LlaaJvIr8vY2t+M9WnO4wQQjqk3Kl2vdVEsMRU1vV9kQE6NL8T
         1WKwn2Yo4sPPM5fPML4bASEhHjNEW8UuaqGw6VoeH8pPERia3zTk0fGYVv+aMMo9EdN7
         sVD1M1PlfY36Li1zSwR7rlCsNQcXsBH/GDoYOv2XVv5lvsLsWXi+Dx7G+4ZgTgSZT+xU
         /dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501539; x=1784106339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=;
        b=crdpDxWLoI3rFqgL5DFihVWCW2lYL+pXh+1vg6kGyR2M1xnHZNR1cPZhOoo26wfinI
         ldEk0i1ObgmsJa77Xqwg3KuWjxEarFR/bu9qHlse66W/NddGMPuKIv22WvjpT6eLS7Lq
         SyMyLjTUpNW9D6qHzcQCtUbhhFg7CQq40VFTT4FpFpm47P0c8v/KM+qzdT5cxYMlgwfT
         zwRrzRRCuKRUfi84JaO2zc+Sb/HQqg9SKZ0WmcxXE0u4Zt+1i52GpOwAEhXXc+OTiXRa
         E9FWComn8mOSUkn+sMXJnwiUNvWhZxIR07E6UrvCRGT5KulmpU90htAT8cvBPc4dmKuV
         fpHA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5wUVvr/N+2kM8R4jrBr5RzcIwHkvo2HMVKc2pIYo6jvfRMPG4qzWywa/SaL80SA3S5TLX1dhEgLMvQav8Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7dXBed0CdyEBGYDN+sEdqVerb1j+/VMt6L95VXi6Mmgv2+/M7
	Gy4s6zchE045kXJDcYs602zZdQwpEkg4/iO99kj6paTG+6RiOghJK6UQloaCGmq2
X-Gm-Gg: AfdE7clSfUxe9OSFnMDTx8Paz57crF4ZSdMYwWaSILJFJdABON95AisHpiRvv7U2XOv
	4vswrUy4X1dwjYv60KGmVyQtPUenHoXMSjM52i+9DDdfhE6MKo718JKe3HkUzoaQ81I4lrPQ59p
	mqeVb5vgfDvrDYyiP84/mw4+unr3Jw/Nlef0ro4RHBaQPzXTp21ubBjBrSfhVIM8jh2/Jbbd+J0
	AF+aJJogfhkCTo/W3HTfwBAhbyBdpekPea8Lq78qPhvsj+5P7fP9EfGI5arFoVSVkANax1CV3pY
	RID0/KT6qckIgp2BfUFt+A8SX5CfGZlzWBNh/CuDiMRzJbw/36DDVsaEbSnuDHJsII26RwGynyj
	HKNOQzzIsYUnkHcaeO0OFW+GZ58dJJYAvozoSx8stXFL8NUyvqnnY4ag525zzmhF6SeRf22iUlM
	yYukSbuaajKR6a7GuTMqxnwnnqOg814CikiSnmDMJVFK35tTKhFEPGZpsN0wSdZJD8LUt13qQMx
	vnAJ465
X-Received: by 2002:a5d:5f82:0:b0:475:f0f0:9ec6 with SMTP id ffacd0b85a97d-47df080ff21mr1502469f8f.49.1783501538590;
        Wed, 08 Jul 2026 02:05:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm40674208f8f.8.2026.07.08.02.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:05:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: PCI: mediatek: Add support for optional perstout reset
Date: Wed,  8 Jul 2026 11:05:28 +0200
Message-ID: <20260708090533.19734-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_020542_246750_E59B025F 
X-CRM114-Status: GOOD (  10.37  )
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

Airoha AN7583 have a dedicated reset for PCIe PERSTOUT. Add optional
support for it in schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/pci/mediatek-pcie.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index c009a7a52bc6..cc5400c26185 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -43,10 +43,12 @@ properties:
       - enum: [ pipe_ck0, pipe_ck1 ]
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   reset-names:
-    const: pcie-rst1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
@@ -127,6 +129,12 @@ allOf:
         phy-names:
           const: pcie-phy1
 
+        resets-names:
+          minItems: 1
+          items:
+            - const: pcie-rst1
+            - const: pcie-perstout1
+
         power-domain: false
 
       required:
-- 
2.53.0


