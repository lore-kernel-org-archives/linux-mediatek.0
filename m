Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A0CFD35C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPy/JaEQ+74CM7BsiYWdUowzUF5iiUzU6luFBpGHCd4=; b=VI0wnNTX6McriDHVWOr1C8c+1F
	Y6hFSaX+na8ih3eoHYyO80+UVi3C2smQA/GLPwVTBSZMYK6XH8wri09Fsa/HrLHFt4FdcF+eRnsqj
	nWD+W/U2ENZSMyMosn6srzhDYAmyyY+D2x6+XeTNwH6KGDg0bW+ST6eYAjbAtramMPZPkvnSd9fLy
	bPeuklts6l5KwErQBVTLv9EnJxnKKf5R0zvzO6p0aJa13U7yqB80r93YI2XFJoI0DOTXxH+wEP/ou
	DpeBagZOji35+gnqQ5dNrXGQa+nnoT74arF0zud6jOt/MBveAvd3hI6D+x9ViFOOW6ZpRqCObo9dn
	r+AYHArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEX3-0000000GFjS-1gFX;
	Fri, 11 Oct 2024 12:14:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPU-0000000GDxv-3Yke;
	Fri, 11 Oct 2024 12:06:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c89e66012aso2759971a12.2;
        Fri, 11 Oct 2024 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648379; x=1729253179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPy/JaEQ+74CM7BsiYWdUowzUF5iiUzU6luFBpGHCd4=;
        b=YAVB1ChK9g0pqjaCVomFRkmGzH0z/mkz06f+1rErIV0cQU+ZC3OTrpntQ0FgYX7hQa
         WEw49HiJlJx0CBSSUHghBpRycZNvhxgfdGNg84pErff9sezTCQjV/pBlWmFu6a09LElL
         dOvPUSS2VKCd8M4X2sayVI5J1oj6kHD8c0hcnTr8jZX2KU5GVF5RNwpmykD4XDMTaL0s
         RJqTshlzBJ5++5c0HjMz8oyPy4Un6N/LtLKsaZzr3Yw5otRqaXF4Uhs10oUkfenE08fC
         +YSHHLJrDFqZK4lSkBQIlS6ofB/epnIWk3Juwsr7be8wpJ2aO1YgdPSQGvX3RKX0pV8p
         aUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648379; x=1729253179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPy/JaEQ+74CM7BsiYWdUowzUF5iiUzU6luFBpGHCd4=;
        b=Xp5PXNw7meSLK+sjxC+PVhg11lxn0UUlMjRHa8V5k/Cf++rP5WzDcf9dxIAGlmnk2M
         7z5ugcKQvj+xiQKVHT+BjfPbdk/uTw6VLifZwwlU+krJ9Q4Pq8JGlp9DDqSc9zYCRfjR
         7Ptbt2qnZL6UiU/SZPKL9KFvqPlJeRCuCG9rMQcwO9ytG9R2B6o9EIHcxfN58VqU4aeT
         iLNU4pDq52IszW9m4KIdV9UyIFZGEkTAe5nd9l1XL6OVDvgGRJqBnt2o6+5xfWKPIp0F
         WqEf3Qc/q607eSxMJTi1kGtGb64NnwsVUgtrzWLTIU2uxc3lm0UI05HfuXKs8ZexLN9B
         /YSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVeD8mdNezNpitV31md+QL/dlMk/knWQhvxQRW+0kw22PBiaHjifhxKhCZnqN8UdEFAJ3eI+rMSINLwYt5Kg=@lists.infradead.org, AJvYcCW/kHnrSAfYrY6z0EqLYGJ3YcgC1nqtSNySH6+FF9McLLIMfqW4Ra5vkBVqR/SYRbkKfaIQxBzFL+J/5BgW/w7M@lists.infradead.org
X-Gm-Message-State: AOJu0YyHFXuZG/obJuMhs4vgr27UWg/8A+gVB3peBES46psbUCf4og9J
	VGQS0i5OjWlJRo9Ly/Z+5c0+fByb/qUrzIXHdpUd9m2sC5TQcOUh
X-Google-Smtp-Source: AGHT+IHL7ir630nJdNiKICbi8J/5EQ5uJqoVEV3o00M0P7xZFlkxzQf9s6O78G/qMtzdw43r7wVWrw==
X-Received: by 2002:a17:907:d847:b0:a99:4b63:f810 with SMTP id a640c23a62f3a-a99b9604801mr214567666b.46.1728648379448;
        Fri, 11 Oct 2024 05:06:19 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:18 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 7/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller
Date: Fri, 11 Oct 2024 15:03:52 +0300
Message-ID: <20241011120520.140318-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050620_984076_B3E63F8B 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the pin controllers found on MediaTek MT6735 and
MT6735M SoCs. The pin controllers on those SoCs are generally
identical, with the only difference being the lack of MSDC2 pins
(198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 4bfbaebb790c3..814a534038665 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Andy Teng <andy.teng@mediatek.com>
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
+  - Yassine Oudjana <y.oudjana@protonmail.com>
 
 description:
   The MediaTek pin controller on MT6779 is used to control pin functions, pull
@@ -18,6 +19,8 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6735-pinctrl
+      - mediatek,mt6735m-pinctrl
       - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
@@ -62,6 +65,42 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
   - if:
       properties:
         compatible:
-- 
2.46.2


