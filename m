Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317B0D12679
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=; b=Uk7Lzh/B8FMZtpLyIle2mtscXg
	FL8aY/BWmCMLOX1lM1YDUBGVFnxZvFXfJdXJGPssc8w6gVltRighFM57NV9xO/pRr8sEuNbOxq7fr
	w1ngkaRxBF2OckudLygGkpDKxABRKy5iEVQH8QvON16O1JULqJ1J6idK5/10g+URFGOX0TTPVfRt9
	nNv5vhrHrQq+HZpJMy+6xiBI8+5EqHYyigiqaANcoYfmXXuwRwD+D8zb+IqJMd+9xabkq1UPBTJ9b
	BFdkSxHeOi6e4v48uMKnEJ/Bkb6adO2zyb0q2ip3n/A0uDZqg9XIvNJanwnuP/R64Q/DByvc4LWQ1
	jkHPqWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYh-00000005snH-0HDF;
	Tue, 02 Dec 2025 22:09:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYd-00000005sj3-0xlT
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so61740275e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 14:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713353; x=1765318153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=;
        b=NOMcHT+siVSku81srmF0P6Wiw06pxZYOaE450drWdSQIs/7NWbVLAQc8pPB7lpukTj
         N67ELeqnLEcpThklBW2KInPYGHbgCTUlnVSse/Rv78DK1bAIGQEHrurImBcPp5zQsRfJ
         9urnk6anSJ6hw5SS/P+RcRqo+j8CAq8n+hEoqqJUq7BLVEnKqx/f2obA9H0Z/qoSALB+
         FEHRF9iKSp18YkhO7BLE5skATjsGGoTdEVSo7J3CuZaDLb4ESWZa/zER4m/QQ76OleD/
         nJCbSqS0n2izJzAQE6PMMrm83woxCKhCBype0lxAcmf/uxU+o9PUY0fPGtxKMFniJvj+
         t6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713353; x=1765318153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=;
        b=Z+5DwV5f/UtRsrVGgav/YBTsVcCpuzt91FAqi8Ot4ZV5JQt8bB3W9G1NvDoU5TGRnW
         12VkiwG9rlX1krKM0HSbo6hgw3vMau9dl06uDQ8HNr23b8A5lhxego6SQVXuhu7ZY+6z
         rDQ5+ahb3cTcgCMpYuf8qAPQoSQmp4CUf6YcsiVFEhCniAfx78O2DMz2ij1sOkJRUC53
         lDGMxC0w9vRMyJ9zO3LR4t74ismlCot+pnLN1NwjpstXzvZTlclqwPQiYSp9PZYGVaxU
         Anoqt4SaW7s8nq/dBWc8Q4VV8jKno0PnhmZluN0qY6EgDuLg1u1lYxNyzcVfoSXop6cB
         tGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcseiE14jiW5vG2ll9ADkVVLKhIpaPN8z9X840J6COkNB7BLWqgwMIxhw8oHKkiYZB9g+kJQyCkkKJrrMp+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3rQh7ItmorZ9XKkWLdH1tcJR0JTykft1bo31QBLaGPfaReNd9
	UHj2Kms+JEs3hvuo17H2UrQyH/VPt1f+5boxnGTdFXDZ4USQ2mjWw73vixZBri8j
X-Gm-Gg: ASbGncssJ30pkMgCw/aa1iHnn2mWob1fgQfixPmKG1G2Oxdr2+HIABnyNnWRNXu4d4o
	Pe7xMNWXsTkwzFv9RU2TIcBwBUNyonDhaCQrZu+0g2YODLkBwnwpHVkC1EkGw9l2LEH9TLgx7nV
	q5vti8jXXq1jJ4qdqguTXiNusna+nc9Q7IWVe56+1ImzTDBgNaFEg4edngqqn/zmXk8oNEcdXq+
	u8zFu3ZewbIE2QEI1/AU84XkB1PxyzBmkbIhXzJeM/CZP8J0D3RJHF5aocLHYIOaDA5wwngOcpz
	hUlvyBELigIJSrdRNhasJux+rMgcjcZY0A+MKQGbgWKX/mi9pQQzX3D+ToL/W8Em8LeSS06e9Dr
	wjirjm5f8tcsKJd4DW/1BXzeQ9e1BmjPFtfuNkyrJ4/wi+oark+Ofa88CfCmw9NH2XK2AxCC0dX
	kpOP9so4q3Jd4QwGTVzh1PpEmyQw==
X-Google-Smtp-Source: AGHT+IH8+pWAJ529KWsWa9mRTXD17PRvLsD3mqdf9/QSEPuN1xXBNVe4cD4mvy6/Yn5E/kVLRNx8yQ==
X-Received: by 2002:a05:600c:198a:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-4792af44c59mr1574985e9.35.1764713353327;
        Tue, 02 Dec 2025 14:09:13 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:12 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:47 +0100
Subject: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-2-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=1415;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=VZCofeu/bIsFeris3Pk/WudmT01MguyTXO5GJSCwC3w=;
 b=cEnXOlidRKO+M7EF/WbGPTKdPdjb8GEsg9zvd1HITzDbTlHAiki3fvcee5exQg1ZMD//SqtQ5
 sDYaWYu3Ev8D987v6dW0KDhUp0eNnwGlY4z9EEeAwo/o38O4K3brYzv
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140915_294614_B5DFB475 
X-CRM114-Status: UNSURE (   9.37  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
carrier board [3].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2] https://www.ezurio.com/product/tungsten700-smarc
[3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- Squashed both entries into 1 commit
Changed in v3:
- None
Changes in v4:
- None
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,12 +431,14 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390

-- 
2.43.0


