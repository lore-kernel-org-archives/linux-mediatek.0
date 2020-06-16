Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858B2C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 11:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D502098B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 11:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mONKknoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICJev4x2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D502098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WSdozx9oGWQtqSsBnY+QawRjX7kqqV5QsyckGGOp368=; b=mON
	KknoVM7f5QjhLpGZM8QZL0JU5mXlY2ALbIa8CaGXbD3IeH8d4MJJOLlDhAn15EJ57cWdUCiszUJ1j
	3n/g7WUbJAx5y7OFTJxkPGwOH7atOhVweySbBeTMDs1bx2mnrm7zENaGstm9/naI029oQWp1pAOT/
	GVzTPaoZJcCO/k496XX8O8FiZv0eblAMU3WwPeWb2YgvBvnWIGf5zIwXCI1UrUKCPwslSIwb6bw/o
	qbx/CQi396SeRp3HrZei/uLlSCcNDPeWJRaCntQrIkWRDGwe/2Ky7e8yahvRYzdsbiIgmYSpFVo4j
	SdAOTTQ4/k/FQGgcZBx8yejOi33Lsqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl9lE-0002Ca-CR; Tue, 16 Jun 2020 11:28:12 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl9l5-00024m-9a; Tue, 16 Jun 2020 11:28:04 +0000
Received: by mail-pl1-x641.google.com with SMTP id k6so3300023pll.9;
 Tue, 16 Jun 2020 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C66Iy0udb87vhjoDYd71Ql6l2XA6eYACBYbwZNfMhzU=;
 b=ICJev4x2OgJ6X7xmSzWcGWWwJAyPTOuhILDrFDfIxcor78l92hde85mv/ysyicxvef
 iPNwenqBqzDbFYvb1JN0CUUfCD/bVIu8lN07+lYRk/zQ79/IhvUQXPkBOAMQHdCG5CLq
 w5Sq6/CXDDYr0RG7p6vn79pM30Dl03IYtNXE4GfkD0tlZFOzpYLWUvcRW0T2WAK+H2/S
 6dRw9Bh5DKve8/a1Nd85Gd7LTgTsOPUU1p2F6w3ozF/XkHf/bG/7J2lhs7lGUJtze0wc
 f8CojXLI6JoBPREEVLMQjgXwOSuemXoDk4DjB7x7zXK9YgYMX8a87KK7rZeLaVKjY4Xk
 I0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C66Iy0udb87vhjoDYd71Ql6l2XA6eYACBYbwZNfMhzU=;
 b=rAeJamletUxRhW6ycKlzWgszRSTbXM/Y9xDmrjq7vRxJzezpM8z/LO1kRKCygmBt6z
 nmU2D4RyxhXwyCui8vndMcdWtrE5kelbNCaPvX5seCIiW+Tul8hAMN/HzkH6wzFx7pnv
 U2dzhU9Z5YC+FbPHTuwRY/NshuXmUiXVUFhQ+5OiILercYsFmwWOPFZI6uI5gZlhlUHg
 haMgc8JMTG4EG2b1L0pb62Y7ZV/Qz75rgK4zXVvQEgkWaQvwCGg8spOijuCjejd4VLwh
 Pcv4luVDYr0fqk2xGk1Y4f3TScwK9ri2oxHIDvXUC7b+UBRr9C9pUE4X2awh0U5+6wJa
 X1Xw==
X-Gm-Message-State: AOAM533+OtMzIN7gHcobkvf0MBUn5wElEd50w52Z6ShCM2v5sIdVAgKJ
 gFtwn+2aRCkHSEthcxHDDCU=
X-Google-Smtp-Source: ABdhPJwaevj2Eg+de+5NM26vCPlyHzB6CcylDSU3H8uKvyfdS27T3gYBG5pWtcngruNnK1bLe2z5/A==
X-Received: by 2002:a17:90a:c85:: with SMTP id
 v5mr2248738pja.114.1592306882003; 
 Tue, 16 Jun 2020 04:28:02 -0700 (PDT)
Received: from localhost.localdomain ([101.12.205.96])
 by smtp.gmail.com with ESMTPSA id b19sm16617701pft.74.2020.06.16.04.27.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 04:28:01 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH] dt-bindings: mfd: Add bindings for the Mediatek MT6360 PMIC
Date: Tue, 16 Jun 2020 19:27:56 +0800
Message-Id: <1592306876-3504-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_042803_333549_26E1C1BD 
X-CRM114-Status: GOOD (  10.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add devicetree binding document support Mediatek MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/mfd/mt6360.txt | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.txt

diff --git a/Documentation/devicetree/bindings/mfd/mt6360.txt b/Documentation/devicetree/bindings/mfd/mt6360.txt
new file mode 100644
index 0000000..e25b5c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mt6360.txt
@@ -0,0 +1,53 @@
+MediaTek MT6360 Multifunction Device Driver
+
+MT6360 is a multifunction device with the following sub modules:
+- ADC
+- Battery Charger/OTG boost
+- Flash LED/RGB LED/moonlight LED
+- 2-channel Buck
+- 6-channel LDO
+- USB_PD
+
+It is interfaced to host controller using I2C interface.
+This document describes the binding for MFD device and its sub module.
+
+Required properties:
+- compatible:	Must be "mediatek,mt6360_pmu"
+- reg:			Specifies the I2C slave address of PMIC block, Must be <0x34>
+- interrupts:	I2C device IRQ line connected to the main SoC.
+
+Optional subnodes:
+- ADC
+	Required properties:
+		- compatible: "mediatek,mt6360_adc"
+- battery charger/OTG boost
+	Required properties:
+		- compatible: "mediatek,mt6360_chg"
+- Flash LED/RGB LED/moonlight LED
+	Required properties:
+		- compatible: "mediatek,mt6360_led"
+- 2-channel Buck
+	Required properties:
+		- compatible: "mediatek,mt6360_pmic"
+- 6-channel LDO
+	Required properties:
+		- compatible: "mediatek,mt6360_ldo"
+- USB_PD
+	Required properties:
+		- compatible: "mediatek,mt6360_tcpc"
+
+Example:
+
+	#include <dt-bindings/usb/pd.h>
+
+	pmu: mt6360_pmu@34 {
+		status = "ok";
+		compatible = "mediatek,mt6360_pmu";
+		reg = <0x34>;
+		wakeup-source;
+		interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "IRQB";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
