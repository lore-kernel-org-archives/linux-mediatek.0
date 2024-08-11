Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45866C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGFhjis3vEwUW+zmFS0SHZDoiWLXNXD1jilEiEFaOug=; b=BFdpomdUY6AEXWoHi98OO9k75P
	XnY1mNQMw4iTKASwve781Vl5D7lltsovcOf2w5G6kyY3w1sVWbz86SO8Xa0SNUJbY+wLK1Fcd/VRZ
	qfodUDsYKGKMxMvK2oCz3zhMolVzX6s4/d0lM7dSRMpDDR+AcXyYsJFjKpURZ/APjI8MfXbf22Kd+
	eeiU14spk5RHCukHrJStCBxjiEYndwNcDOO66c9LpnzL0qL/rpxk9i/mdI80LSU+tCFfujUvaozoG
	YmQ4NWwuzvkvKtO8noV0JwU22sPzeqVaOGGKgpYGHqLfnMawaWBYYw6tz/IHLXXf1DRYqeYzzSkUj
	qTM4bihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD9q-0000000Fw2N-3J47;
	Sun, 11 Aug 2024 18:19:10 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD89-0000000FvRP-3fpG
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:27 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52fc4388a64so5055767e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400244; x=1724005044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGFhjis3vEwUW+zmFS0SHZDoiWLXNXD1jilEiEFaOug=;
        b=buuce8NLcgRzys7cQBu76mSC3uMd3iVUnJpU/gx2auJh8RBGwlRJ9UgsxLJiQ8Vwdl
         5rqFOuTf2zzb+J6yp3fSOwfceyDj8kauZfknQ6ltIqLQNKE8DVnCPB9YehAXLeHFQKko
         bGr8lTB6Q9y9vn8UVG2bIuZzTEkT9MUJbOQBGNLBNLISuQjKpu5rQH29uPe8uVyjQQtP
         ORWyBqv4J8sU16oYIRjfx90ZSfvibC1Oie2rwkxPbWs+ROMhYgXn24HHt+NHeQivfh2U
         gQSLKnGX+jqwYgUDYTKBe3PkQfoVg1e7mCrUQSm38vw/STAzy4PeHhviM1MiW80U8Fcp
         ktNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400244; x=1724005044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGFhjis3vEwUW+zmFS0SHZDoiWLXNXD1jilEiEFaOug=;
        b=howycGTY/mQDzq5ow0eZjkfPSlh5inh/PHl+dikEE+14j9DhUNShWbfibbZbvpZisa
         lWXHXXj3MHYdM5+tR1HFNmeg8Sds+h7GyB3g+cLWmpQ6LUUsxqT0rQikJVq2Q6X5gfKa
         c1utbI+Zpz0qF04pt3kamnLma2rt4VMk3gMaS8FJuO9RJjN/W9Ex1Q+G8Z3jrGV1SDIx
         NouaBmVkgRy1tOvP/c2sPfoFkCMtJVINb3EbgiFqhFESnF7GtNFTNTWqHICK5pAPF4Ck
         jcRVJh2eJt4LjmgheEbNHaF7d0CZc2ei5I8tzA3hokJSViSVf4jYz4meIpgtGri1iGgl
         V8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVlj1t7tuPqdCX6ihd8ZYKzIn6iTS1fXpO1y6uVlWydHUqgAIJa2jxO0mm03CeUg7qgcQMXiw/tLGpHXD8pJ7yR8qEWcBKh6SaSeswaziDlOh9H
X-Gm-Message-State: AOJu0Yykx7j8tQlM92/YsHJFO32BSa7Pc5cvOC5n3tVqFvqwyiMRSJaD
	+nRuTbi2tadZUqymGE5YsgWhM9+gv5tJhVhQ+fhc8pldeRCfXiVL6jnpYYymBQ0=
X-Google-Smtp-Source: AGHT+IF1UTHAP/uCXS+U0LCWoWj6La4p0Jxj1fGCJBYGFjAqz1RV8j1pRFl9F80FQYyJE89hUneeuw==
X-Received: by 2002:a05:6512:3ca4:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-530ee998c1fmr5849572e87.13.1723400243767;
        Sun, 11 Aug 2024 11:17:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:06 +0200
Subject: [PATCH 3/6] dt-bindings: bluetooth: move Bluetooth bindings to
 dedicated directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-3-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5616;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Shykp2EypMXZ/QCtrfeiM+kDiKjZCEK90ANRVRIkFao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAogwO47g5/difzXmXbrkByuY1vS2kO0De2e
 ZKPfbrsPguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAKAAKCRDBN2bmhouD
 147TD/474Iq37wLRBRyecqclhH0wNzPuifYqBgjZqQHezZmQbpXVDVK1vf0+LCfc/ZtyCR/Sv4m
 jltJ2V8uBF3IPaQHcicV8n9tMtUWybfMJjDr6tnbBhpNS+X2Aa87SO75vBBtCnrSVTfkXK0o8YX
 RSKBy6GOo67UIzbasCmS+HYdpr9ERwy7K+3TNHSmhLRCLRBfVrDMG2w9u4Y7LvIxIgCAiaNOpFP
 o1in1Juq7JrW3qkKdH3xV+H+b72v5vAb6nWM1uVVeSrA2nWNeVrAvV2ckQa6FtHqozXL3RiTV5k
 aKMfLyL0DOT23SbOPUVV7GLTy/B1lKShYkUl4EdD1n49w1IWbKVaCXtDj173oDwdXe+LxVplYGf
 kDZ7F3DsQeriuNXM3nndbXGinKgjOnJWZnp3mQtog++T8upjSSWQP7I0PRhbV1SXYqN1THYDy3G
 vTspwv7Ox5oIvZ9wQiNf1+7xnB9PlIIo4JbdIo7qSyS8XnTcMrS8KmdB0YZGhR7rHeUrx7S4q9f
 8uVqhBw7RiLUJKjSESXgCS2KLsoQ6KkMHJF0zxjO7oq0N4WyW/awYsXliZazsBLE+ofM2uoB3tq
 G9hVXGUpr8+1AFc4Hzv7DzCM93Dbm7GEJ7FxjCjUF480EyBRObg3LOB12RcecvO90dzdJeG0OhG
 kbLDwaE43Filc8w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111725_966297_792BEE5A 
X-CRM114-Status: GOOD (  13.29  )
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

Some Bluetooth devices bindings are in net/ and some are in
net/bluetooth/, so bring some consistency by putting everything in
net/bluetooth.  Rename few bindings to match preferred naming
style: "vendor,device".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.
This is the dependency for another Bluetooth patch.
---
 .../net/{broadcom-bluetooth.yaml => bluetooth/brcm,bluetooth.yaml}      | 2 +-
 .../net/{marvell-bluetooth.yaml => bluetooth/marvell,88w8897.yaml}      | 2 +-
 .../net/{mediatek-bluetooth.txt => bluetooth/mediatek,bluetooth.txt}    | 0
 .../net/{nokia-bluetooth.txt => bluetooth/nokia,h4p-bluetooth.txt}      | 0
 .../net/{realtek-bluetooth.yaml => bluetooth/realtek,bluetooth.yaml}    | 2 +-
 Documentation/devicetree/bindings/net/{ => bluetooth}/ti,bluetooth.yaml | 2 +-
 MAINTAINERS                                                             | 2 +-
 7 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
rename to Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 4a1bfc2b3584..e49e4146736f 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/broadcom-bluetooth.yaml#
+$id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Broadcom Bluetooth Chips
diff --git a/Documentation/devicetree/bindings/net/marvell-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/net/marvell-bluetooth.yaml
rename to Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
index 188a42ca6ceb..60b90cd62013 100644
--- a/Documentation/devicetree/bindings/net/marvell-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/marvell-bluetooth.yaml#
+$id: http://devicetree.org/schemas/net/bluetooth/marvell,88w8897.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Marvell Bluetooth chips
diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/bluetooth/mediatek,bluetooth.txt
similarity index 100%
rename from Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
rename to Documentation/devicetree/bindings/net/bluetooth/mediatek,bluetooth.txt
diff --git a/Documentation/devicetree/bindings/net/nokia-bluetooth.txt b/Documentation/devicetree/bindings/net/bluetooth/nokia,h4p-bluetooth.txt
similarity index 100%
rename from Documentation/devicetree/bindings/net/nokia-bluetooth.txt
rename to Documentation/devicetree/bindings/net/bluetooth/nokia,h4p-bluetooth.txt
diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
rename to Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
index 043e118c605c..993c607eaa49 100644
--- a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/realtek-bluetooth.yaml#
+$id: http://devicetree.org/schemas/net/bluetooth/realtek,bluetooth.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: RTL8723BS/RTL8723CS/RTL8821CS/RTL8822CS Bluetooth
diff --git a/Documentation/devicetree/bindings/net/ti,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/net/ti,bluetooth.yaml
rename to Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
index 81616f9fb493..1f507ddccc3c 100644
--- a/Documentation/devicetree/bindings/net/ti,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/ti,bluetooth.yaml#
+$id: http://devicetree.org/schemas/net/bluetooth/ti,bluetooth.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments Bluetooth Chips
diff --git a/MAINTAINERS b/MAINTAINERS
index 494bcb5e6f35..ae9a81df25ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14269,8 +14269,8 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-bluetooth@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,bluetooth.txt
 F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
-F:	Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
 F:	drivers/bluetooth/btmtkuart.c
 
 MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS

-- 
2.43.0


