Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22442C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A0422464
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1kmopby";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jehEAPOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A0422464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOgojwY1OdgAAne9s6zyXod6rdcean8WNNAtwitYvrI=; b=l1kmopbyGM0GRH
	vax13d4OGtCNv6d83YkRIoGaohd6GJO1jYsR4j/obog+UXEd3C9Jqmw/TL0+OjKfoBN77G/mpqIfh
	J73oCUWJclTlOrR9dK8JIgBbbJT1Ccy7Xb/YrFuBadZuy8qDDiqaKZC77X+9uyM4lovVq9bpQ/9Td
	svjP93SDAgHf9iQjNNLN+zogHj6R2EmQL62HeDvIx0hXkitlDAu6OtaiL+sqpgpptsRIXKZ2QI8hJ
	GcYVdDP7qeRsGftbfgpxjUkl1I4gx89nAcwBml7hKALWYBrLU8XpxSQpaAyi07Yb6r98dbPnMNrcu
	xTC1lptqNwjxzBQAcsdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izwAY-0007HM-AZ; Fri, 07 Feb 2020 05:27:10 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izwAJ-0006y8-AL
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 05:26:56 +0000
Received: by mail-pg1-x542.google.com with SMTP id j4so527538pgi.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 21:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIn5sKN4KiBio0RDhfFCPXTE80uz5ajGK0muKh5dKSI=;
 b=jehEAPOlDHxOIf658U57Pz+Lxc9WjB5npjsc5eIfdKKIgLI6wIasqGvVPkiVpdJQ0G
 Hzpf9s+Mrm6ErGv53ZanL5Ar8j551dwPz09ideYJ5ExThnUtNvN841ZIU2L4qTBXCsLw
 CUJvrrL1JkluseTv3rUysxVHovsnV10a4Qg0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIn5sKN4KiBio0RDhfFCPXTE80uz5ajGK0muKh5dKSI=;
 b=bvn3SKdVlRtZz8wnhxd7kUqnLtgfVq0GkqMZQemaj9caN9TKQvhDOFnGZsXz4FL7D5
 aib7IhJrsfMIlC9s2kBaYt4XYzr6WnpCnNBxbeDL6mX127KJmu2jpzT5bzLXsrQ9AbJ1
 pWDPxkPlAJMEcgwD6jmjjlX8jt/CKjwCZ7jLufxLjmB0VSHecy3BE9Jbvw7qUK5yKLHC
 WdoE4hXO/3dKZDLe6nz56TnD2MG3emtEJMdTfJHldL95QP/iOMT6xuDyFdoJ/Ucjurs9
 KKuQdWKOZdHGNcTaeBT6ixsmivPvZRB8IUj/kkL0BSJNMsAPhohxny4Z4cJmVd2IPtn4
 eENg==
X-Gm-Message-State: APjAAAWzNDHvRTg8EuwxabGqGYjq9vbNmHCa569cdo4BC+dUQzeUXTx8
 6GTmK5s/v78yjWm8iHuEELAHOA==
X-Google-Smtp-Source: APXvYqx5i7f7z7/eMVnpdL5X2gaY4KuXn3Lv/gF5m1NmEIhVV0KooOh59/YHin0f3dnQN5ufHFD66g==
X-Received: by 2002:a63:5558:: with SMTP id f24mr7314186pgm.92.1581053213363; 
 Thu, 06 Feb 2020 21:26:53 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:26:52 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Fri,  7 Feb 2020 13:26:21 +0800
Message-Id: <20200207052627.130118-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_212655_395023_E13CDB13 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)
v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4ea6a8789699709..0d93b3981445977 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - amlogic,meson-g12a-mali
+          - mediatek,mt8183-mali
           - realtek,rtd1619-mali
           - rockchip,px30-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -62,6 +63,30 @@ allOf:
           minItems: 2
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: 2d
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
 
 examples:
   - |
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
