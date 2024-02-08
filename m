Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1745C48260
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 00:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpgVj5cIJYfsEe4k8tOMDseJ01hUY/30ToLsNTzKrj0=; b=EsudHR0S75n0cW5N8OWiM6+nXx
	F9PinHdE6CgsV2lUWuePm8Q0sDzAOpyyQlpSYgJW932jnO+8hIkFOef1JjjZXULi2vmdCguTpTQt6
	9C7fZCzWdgpgQ9AhBMdXc5ROdzHFdnjkK642+7oIoGl+ZJiu5vy+GCstN3uHnrNNwNsqiiuc3tn+r
	uxecB3/U14ZXrz/gim9vDybAWH9dpnKX0DWyzFkuCQrdZIjx4rT4yl5DzPnX7XxfyenMrHcHDfes7
	HVGBSq3Q8Ywm47jhy19kdmDGzC27frPi78ZhXZcrsNUZNXsh/ULqNiMH7pRiNYbzI8oDu3mgo1nxe
	Ff5fmI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYEZV-0000000Ff4E-1Rgj;
	Fri, 09 Feb 2024 00:16:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQv-0000000F7im-0DXS;
	Thu, 08 Feb 2024 21:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zpgVj5cIJYfsEe4k8tOMDseJ01hUY/30ToLsNTzKrj0=; b=aOfkZyyCsOSKBYk0nR4Z+a1Lko
	diC59KCYAznOC3zS6K3GaB5fpXVdGh28YW9Xmo0G3WAyi8KzKxK4xI1YEXr7smrf6pg/gj9K3KNYw
	f1hjjmYmzQH32c0kHDZJdl+hHTSwkSkfz4/2QfVVLAB3PTtGABaPRbZ7UdAQy6MDrOu2V9dnac/1F
	8+qlG619UHPxRlxs/AQdjPl0DpY0j4vbdjC4SjTmG2/Ok4IJqhYV+nucnTT2hA62OKVKRbEvPdfyj
	D5nEWMFVOx568Bhpqzrt36VGr/19J6awRBSu9BXdYApoTdwVomjE9HDxG4LliQRXEdY+bX7ttOTkE
	FlX6ihpw==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQp-0000000Ddn6-3VST;
	Thu, 08 Feb 2024 21:59:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a388c5542e9so254686366b.1;
        Thu, 08 Feb 2024 13:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707429581; x=1708034381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpgVj5cIJYfsEe4k8tOMDseJ01hUY/30ToLsNTzKrj0=;
        b=XFfXmQQqAoA6GM0DlQtWr1Wqz2Mk2UUqAPPVQLWxQO0a1AN1MSZ/Db50keMdscj5Zm
         cTqBygv10NyLUv5Nv+w3wOw5bEocGKRlnO2z4JH6rSJwXY2LHvrEoRWxw6NA4WB1QEUG
         I8LMrWD4xu/DUntLFfgRyMlt4rUq+84PLTTdWsUxkhW4isPbfFWXLxdsUNIIoFGNf80y
         JkEbX0E6ds5oebc0lzRdza01VH4MgDpiOGCHhSeDjy3UaPdve/r9XC72/QjiQJmrb2yR
         JJ1lfvzlTJHaWks4AJNOeCV22HghMrmJXfAuXVpCGFQpS1dDVj4FBrrsPZzPJoz4s8RY
         RhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707429581; x=1708034381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpgVj5cIJYfsEe4k8tOMDseJ01hUY/30ToLsNTzKrj0=;
        b=X11EiDzwy6ABLugZeBP1IPrpC2RTjJOSu20neA/zOrcaatuDJRHMhX/66U7qWPmqJo
         VeKpWC+FZiWx8rS0mSFmmINOeNz2ieKhnYmq0Kdsvrgs1aNfiRvkNdqFpBMZxER1dPOG
         yuhqN+F6g++QPWQFoALOA0jP1pEASEKEAJalS+fSjRATtyb+PtSov/KU7LTcK8cbUzOT
         ctEKntrZwY0B4Mm/+/vEKInfNiaKPopEbCL1nioDUDz92VZ9xkP0irCDkUIztQyuzy6U
         J5QWNRD2nBL30qb2KCUM1eBAYHZuMx8XOzwuPbIPni8W57etrtc3k8JAZg1fUkwVTP/J
         QzwA==
X-Gm-Message-State: AOJu0YyBPXOc1E+qyQTpI/iBVs8MU4hi6QHObtoCgG33ct4gHsuP/A4+
	/pfK4hC7lIfeiC34UFex5NmytjoEeMPSi+Y9PmK+EOw8aEOvvLxL
X-Google-Smtp-Source: AGHT+IFNxvM9cY+GaiQyQtPUyUX5PIfavKE10/ptk4BXmXj9FVhWmxsdHmeT4N0bGqDsEKu83NTBLw==
X-Received: by 2002:a17:906:f753:b0:a36:5c45:1e09 with SMTP id jp19-20020a170906f75300b00a365c451e09mr628743ejb.31.1707429581490;
        Thu, 08 Feb 2024 13:59:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXltFUHHXN3QJVpFmKZaCHkdH8PMvNfBhL99ytOY454pqiQKr2FFutKWFoWShjCCMTwLN2sgcRcefp+CfhhFBcdRzvld0rnW/jtVj30JvFzNrZ3Q6qrvYpCsRAd/VBSDViKWcNHWQQz1xJtKoCPjrLo1aPy1TwbAVwebS/VqbfRtXPeu8QgMP3xIB3/V/dIzyQhb03FnQuAzbLpOplvi8/ltLffe89S1oaeq3zP6Wz9ekzVfJwPKM2Pr9S98EH/55v5/L9tk4KlbT6RkBpRMgkY2LLeHf6B/9CnOUzA1IRb3RMX0KwILY1g6Z9qYqSEJSj1Wm7jnNhTXJfCZKE6rNNl8qYGpGSdG8/wWehReYwAzFl2jvDwx3msi9Uvp/fC2WBTMwc0X8r0Zc5c0K1gN/uGzHHloLc+WFb63Ht1JFtsFL4Z8UXj7PSB48Kk13tBQ2rkrcakd5XMDmESB6J85Uc8ypzzM1DVJspwHDloamzfdBbU8q1WRr31fxRikE3HCrJycO0=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a3743142429sm108255ejc.39.2024.02.08.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 13:59:41 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 3/3] dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema clock
Date: Thu,  8 Feb 2024 22:59:26 +0100
Message-Id: <20240208215926.10085-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208215926.10085-1-zajec5@gmail.com>
References: <20240208215926.10085-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_215945_091042_25F4A6AB 
X-CRM114-Status: GOOD (  16.95  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. Introduced changes:
1. Documented "reg" property
2. Dropped "syscon" as it was incorrectly used
3. Adjusted nodename, "compatible" and "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 -----------
 .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
deleted file mode 100644
index 7cb02c930613..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek SSUSBSYS controller
-============================
-
-The MediaTek SSUSBSYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-ssusbsys", "syscon"
-	- "mediatek,mt7629-ssusbsys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The SSUSBSYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-ssusbsys: ssusbsys@1a000000 {
-	compatible = "mediatek,mt7622-ssusbsys", "syscon";
-	reg = <0 0x1a000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml
new file mode 100644
index 000000000000..5e48c2d3ff11
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7622-ssusbsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SSUSBSYS controller
+
+description:
+  The MediaTek SSUSBSYS controller provides various clocks to the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-ssusbsys
+      - mediatek,mt7629-ssusbsys
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description: The available clocks are defined in dt-bindings/clock/mt*-clk.h
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1a000000 {
+        compatible = "mediatek,mt7622-ssusbsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


