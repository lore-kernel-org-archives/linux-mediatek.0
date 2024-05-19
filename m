Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E16AC25B79
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpZwSG8AUDPUPcQ/cg7yOTW8I5h5fbBcK+XT13gbyOc=; b=K+akZxdVbvkIxaLAJ9+0LI0n1y
	AD+fENhmu7X0UbCC0saWQ1xiyoDCcv1kxofRkRY8rRntbDZMRo4/OEuCeMNLBYR1Xjva2CYqw4aZS
	odTteUXPOW2ecqvc5VefQz5aoIrQN0Jikx5lnrrRvw2EO7/3UYMs7FNjlj4fOvJIPaxYWIG35+m5B
	lxn/vswHyLOUEJT/Wt3ggGC4TtqRkAYHCVpqLGJVM7mXrDxIti8QdkNtM/5YkA7KP2E22z4XDM7c0
	EL4Jll7whj7u1cc2ebqan3iU/nUNs2y81hVOfmKNVKPb9+0A56RwWU/UPlp6/Ibs00gpnSz1RHXK4
	ygRYIIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUZ-0000000CWK0-1VwB;
	Sun, 19 May 2024 18:42:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUU-0000000CWGY-4AmP
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so7331965a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144157; x=1716748957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpZwSG8AUDPUPcQ/cg7yOTW8I5h5fbBcK+XT13gbyOc=;
        b=YWwaGgE5ka6mUkZM+JpNgr67twPXCxqo00Xg52+goRUcCp4DQphLvAy+hW0KwfWl+d
         1l2qyVvUTxlUk+xFkCXdApVDmyGSp/ESFyT28SWjGxKNb1twOFORuksV0tu9G1kCbkyR
         YR/eNh3UgYvELKe6XrBUKC1TiLVKPACjRPi6HkkUaRBOr8aTmoFa7hfzZJ/JjWafIMRk
         tAVw6YIrllkLjbT08v9MwWw60stSMudeqZEvsETrtaLr1rrLh7iaXapAnUoS+C9zTAMH
         wTDdcCr4hwBmqhxDyad05TJ3ykNgTlOPw5mPWsMCmrwKILZ1uZ/aSoHD2g//2xqJMex2
         wBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144157; x=1716748957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpZwSG8AUDPUPcQ/cg7yOTW8I5h5fbBcK+XT13gbyOc=;
        b=abY2gB+CtDiAbV69Xks7lfOjlzAomnjBOV1PRX91lu8+kirSpXZfr2z5Fro3QPtDtp
         8QBXhTjEiBIEV1I0YfsKz1Vu1p1Irj7uROXdZLOWMypKPmXhYHN/THn8LWrMTT+JV/fN
         nIfdGpHdxNCmNzV6y43QntZauj78DNb4ByPz7nUgOZkHv0reDAzb6RG/hHjxTDTwCWlK
         lSyqGoVC49XTAmU6Wqk3RSz5kamkfk8cklF6tC0Dp12J4QEREA5YPjP+Tw0z3bS6mmYe
         FOxBPZJp4+dtiu7g9fpv5mvqhTmlRPthDXQCJGpa3fiAW6eVSZhTNlv7qKJLNO67RBch
         67fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2igPBWj3YJa8yT8osPmrpJwH1Cjs4vzdQ6kbYgyHdGJUCNNfhIJpL31Ajbinozh4DvC8GO2gBtCXjplPdw2e1p95p42YuXGEQiuiqZ0LXikXa
X-Gm-Message-State: AOJu0YyNyWJAelpxL0rqZ7XrZ4k44sYzlU86HPT8ZxV/yodQ8Fojw5b4
	sUYhAQM4G+FWpT/yQo/pRwiX7wzH5GGQGBq0IipwMbcp8qMawooqHez2vAbPT3w=
X-Google-Smtp-Source: AGHT+IGq5QA1nd3Au7MNo1HsMLjHK/fKiObB5dGcnX8+/eslrDY+fDV6uC0IXG4Am+hQUeL97oiW3A==
X-Received: by 2002:a50:ab47:0:b0:572:9984:1921 with SMTP id 4fb4d7f45d1cf-5734d5bec35mr18573696a12.17.1716144156802;
        Sun, 19 May 2024 11:42:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:16 +0200
Subject: [PATCH 1/8] dt-bindings: mfd: syscon: Drop hwlocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-1-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EqrHKI7VqbulYVlL7ynNasI0rcDDscSlOl3m111YLJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgQzbjNRKze4/tMYsq0YCrgQq1HylGQx0Qnm
 fqs4ZngdWKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIEAAKCRDBN2bmhouD
 17QrD/4qpVSOIgs2t0h8pAjNveQargz+qOiw594JnIjDv6W9T5TOx98Bo6TUfs4/dOlgAY5xYli
 0FjQ6Ci8fX580v6LBDTyMzc+nVynHVOmYzmYpvbh4QxfD+Qxra17DEBwcB7F5fg52ZtQGz7lyvh
 rT3LhCwP0H/dp6BAqZRx5X8KCMt2Z7S2w+hbeEMJg6SLOQlIVrS9Uz1kOVGh4hie4ul1I8AXgEr
 PU2JfdPUgI2cRzZyU24CdOD8r3OVy+G+tPKAdU7xcOX+s7C7DpzIt8j1eh9f9wqABaSbUr49cLy
 /MUV00fMYeJD6YUqdtDYuRQdHv5fCRsrb5aqn90Dr85Q10QVChqIHOK5twXFpbodDbxUC2Jm/BQ
 lOfthfNcBxd2CO8POoeiZz1ngZ6ImW5XBCuird02ojDd8Zr8ZQ3KCCnR3AHoIdNCSEpNScROLJY
 SlLcUXAZMj2tCj0/T+cezMOpEsEsUm09HCPuHF1JOOxwth+Ie1zhC8zyxCkEx6Hju1fsNF29jE9
 JK2y1Q5XbOIPL+yOy53hO1EyI9MudcamsNusJ69cRtxodgzP3wJ/IKIyWRmUyc/p+OToz6hDAt4
 SDCiB7zwL1QcJ/K4g2cOnE2bxDuzmviGpLpyoi5X4/+57XZWhBwMDmjr9JyLNoQXLcXABaNQ7U/
 y86LmG1E/OCfb4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114239_091982_64A3ADA5 
X-CRM114-Status: UNSURE (   8.25  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d289935c08f..622ea0f1b08e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -141,11 +141,6 @@ properties:
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


