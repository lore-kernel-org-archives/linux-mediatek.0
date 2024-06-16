Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E13C27C53
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=; b=F0CnpTNhy4IjxlwI016tZMdRBq
	lcCgK5LkY2faRCMqiSIAt4oAlO88va9kKsaRAktByCX1mlQxY+/6ZbtQEouDY2VOJKDA1JNCAWABi
	7K9rpNREJyJ2jam1+5YM8MTVHu0NHGs1c58kfgjdWji1rDIL9OBqbwefgBnNsKeq8c1RQaO9BqqST
	nBZaliy5BFIUKtnYLfr31W9SIRmkyaxuYbmzBBuaFGe10UuFBxSFAK5cnxaQLRLaZt1dobW76xn6Y
	UPN1JdIkBIpHBMe6+jKog1+3fzbGKBXq+MN/2tqOTY9JU/f1vRHkq+Kr2FFgVK5l5ndttpbCfSf/1
	0vnVMQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnR-00000007aEo-2gIC;
	Sun, 16 Jun 2024 13:19:49 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnF-00000007a7N-39BN
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:39 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so4176211a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543976; x=1719148776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=;
        b=M9ACs/fkVmEm2MU4ABP5vhQ4G0I300PslizZo+qrEm/1Paa7saEX3gfbzjTCFXoYpR
         +TYsX5vGqWD5OgTIpggqCRgaA31/IzVk0Uvzgcw8OxSoTRJqYXwEAfbZD+KBdXpdftij
         9dz1MRCiTmZSJ32IrFkAYDESJ1Wus2r0eWJAlukptUf7jYEcfJ+evtLqYC/FeTdmWkTI
         CWUCTV5iPQ43iFk0ByI9u8C71gzzmWUKn58uZulEq+04ZPge7TJBsBcBRT7PF/FdD2XT
         yChy/xHmNxhQDVw/oNmjBapjbI2Y9AxMrathGti2rR9X/b120MQf0hDz9bb6jhQtFFKn
         M9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543976; x=1719148776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrRDhDMAfJony6yFg7+6ijdc+Hn8JcmRpBDuBtH438I=;
        b=UGKBusTFSi2B4bMS1LtRAKgn65pU/+z6RKk4ZXVFF8S+BDa9ZlVwIE1SfPhMO62O5A
         J+u+a5GxLrV8vctBc93jhzWAHvH7ir1ITRGGiyfHpZdToODJbqirJX9bSr5G73/J/aN+
         22tOZ5ePokRZKdwN+IR8os8+4RY4z1mos7XmXA7MkkIp4p1eQhGydz/6yhjkRWzm7HUr
         497AL3HPOg2SSngMadl+zKwVbObzpVT3DK0BanOgnBoz3u/PFnyRDpA1zlIgV1VjrTRa
         CqiCErvd5aWx+FnI33gR4SR3hKHvJYzYrZSabwNmc9nNT75+Zk97ubzdecWa0e2/e2/Y
         QRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhZVPw2MiK405v5djvCY78LG/DyUJM5gDqxris58cukrxmiRUVXfYPgbjNr+lrzIg1F4lNCWDp8Lff1tyflXdA+m9cAGqL/cGIhDFSqHjsSt3F
X-Gm-Message-State: AOJu0YyjWGrvfebBfSxIGl/JuT/oUyppWYprg4nl/vh1opsXqbYFU6g4
	jb4xJKi80IfxYnKbCz0RamqZ9KUQ1j9TSILrO5U2S6zfrAt5Y+W9rVbP6MJwD7M=
X-Google-Smtp-Source: AGHT+IH6siaBueY4AzxcLG1IzpcSvDQtv6bY686G2ckJTzEN7fRLUYneWleBFRJFNc1kFuSmXaa5PQ==
X-Received: by 2002:a50:a458:0:b0:57a:322c:b1a5 with SMTP id 4fb4d7f45d1cf-57cbd6a6d1dmr4211407a12.38.1718543975971;
        Sun, 16 Jun 2024 06:19:35 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 16 Jun 2024 15:19:21 +0200
Subject: [PATCH v2 1/7] dt-bindings: mfd: syscon: Drop hwlocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-1-571b5850174a@linaro.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HzjHV2p0YoAb7dKSJR0H5taVVRVE4HdGIeGsfEBVEbk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZewBIVJ+WYe0Pb4ZPgltt46JpHmLOfMG+rh
 /euRglLKYuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mXgAKCRDBN2bmhouD
 10YID/90jDtFwqLhPSLoCu2FLrb17eOdFhg1qKQeK6n8+HomH24FmQ5hjYNokuyZn2hbhAccGs+
 DI6K/ZLJPRF/NT8yfVHpATLovaUl2xaOIETYQeZUC0K0W8Va8xAIEN9doOPknm8T5BmMFfuh14n
 +PnKxM1pLHGcPdXIPwqu2r3hP4L1TtIyNCXk6LlHt4ivupx8MNkqauHbR3rKgI71N5GNi3zTi1C
 Ey4/YDbOSdxJiT3ji9rdWwrCwr2yNX7OGc7+qAHiw8AVmYWSMb4MkmLWXxdj0QY+dD0zlTosGEk
 y0ppGPgpijhYbEDSVoeyOK22hVninX6I4YMh5/l5ZI/upWUd4Vm1AVGsQ9LjpJ5P+9YVvIiuCOT
 2YpKC1x1/+610FmXcd4uLlCb+nIoI9EVlZeFdJ/cZdW8o1Hl3dahPEaMb6xBJz4gbwZlstUzint
 r+yGFugsBF/EgSfvP3j9wA1mo7fCntyrzK4PR4E4qIVHYvSfncbJ8DfyCSMOpD/dK1FewbIxlfH
 P4iMP6mPd40+MZ7/cNhTt1DiSM2BW/LxzuVhOrdevx5fEX9g2wkAdBQ5npewV+EtWyIdldKF20l
 DxDC5uVWSQtThZgde4SOnEb63eM9/MD0ormcq119jIwdAJhCeZ8GFoGjd6hNVMSeKC9miJ1Pw3D
 KivaVy6Ed29hnKw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061937_826507_64CC6D17 
X-CRM114-Status: UNSURE (   7.86  )
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

Apparently there is no in-tree DTS syscon node having hwlocks, so drop
the property to simplify the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 79830dd51ac3..af442767aa96 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -142,11 +142,6 @@ properties:
   resets:
     maxItems: 1
 
-  hwlocks:
-    maxItems: 1
-    description:
-      Reference to a phandle of a hardware spinlock provider node.
-
 required:
   - compatible
   - reg

-- 
2.43.0


