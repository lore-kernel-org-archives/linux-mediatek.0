Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F2E77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=; b=P3wFtTHoKAjsUs6zuLRdTioqFj
	Qxky/lcHH/XO7+Ail46+hkieBhzM+az19P/LY4hUL8/jvWe3oEStTnMcZgY0QiZc7SVvZvmE3F9lS
	5hXJ3UA9m5Ng7CDap6LprKepkMb6BfnG9udLnXgzbEr8q240776sAsFmj6M2CyHyRDKUdN13ktjDg
	EE83LGi/EZwyLcMeSSQXkR9wxSxuO0BgIZ0pPwAr5s8fZlRZj7l4hAcuVi12+rU5BEXbOWPnujjoF
	NKFHJx7tvZccX61VxwVg8SZvgtemxlY/2TTRo9kXS543biIpIDooNTCONreiPxrji97rgKileCsiO
	DC5WhL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdxJ-0000000Cbdc-00uD;
	Fri, 03 Jan 2025 09:26:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdtr-0000000Cb6Y-2EI4
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jan 2025 09:23:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216401de828so156744525ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2025 01:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1735896202; x=1736501002; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=;
        b=AHc4mUbvD1stoYSXP3KXoW6IsumcIbURcUXm2+lkRE+RLLG5SZygHPYGhd875PpeI0
         /TbfYTUOJBaVteMPQxe0YQt0tzhk5t8q6uP5aDzXjsQIELwko9P011+6Ommr7JVrRNI+
         b4xavPM/Ec0jpBYMaVRDF0PzYi8IZtPbWf8UMa4sbZ4+KIQ0+dhZ9qSF5kEyVaMglJc/
         eNVW9Z/SWJkKzDUIn92PsYPzB7qig5UibXDHehsQC3+u5FoEV9dEYOpdzhHrPta7MENQ
         ol/Vp72/NzlXy1f7ZL6cbCMt3+/tz1h4n+JwCkKbSRtQyHEOXEHUDdCusvfH6hodH03J
         oKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896202; x=1736501002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=;
        b=mAOuUHTayIvOxQBppyzi7WsZkAbrrRImO+AlWkeScQ7SGW3P2BQmy37uaupmk0J+MP
         sK/tXHPX+mOzzFGfHIZhLJ0qhgeuUtHXXqB+QCGlAXp/HlI6EO9JGiFIc8cRqnjYKuVY
         tz9BjQpyfKu3JfE2u/wZmeNnM0yUed3oA+fh+GOdficsFel/GsGn72PwZJ0rDqrsvSSK
         /odsOHfTStp+JHn+gb6WuxARiWefXB0nsYHWMYL55W2lxMXvglVnsD5DXtu2t+2/fusN
         PxO2dA4zFXmDcl2055K98XsHpmpW1/Xi1njMkUDOc5dVs1hIZG1cDOGJlISG9qWGSRnt
         EfGw==
X-Forwarded-Encrypted: i=1; AJvYcCUBjYa5NgiTItiMXXJlUmwLMW1QbteL0LlbQIWlZYUzKjJ6zKH/XqWNkWvStQrx5u5uppBH9VgjZtQK17f6TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LWCamsGAUzLWCYU58yJsbBxpedWKO/l9w2sffiMorK2tzsWt
	YCJ7eXaFhw6DRjOehgRI72uMCHEIEetYzIU7PfnIoxRgK0GKfhlvG6thpmp6eKU=
X-Gm-Gg: ASbGncvqybZPupkdI9gvBBaZXSL6Ag7MqwF2Cqf2B5AmbUjY8TkGG6j8hATVzrbLAvh
	dBe9cSwCG0pLhKjrjyEIl+CTxC3KSdQKslVD8JbJ+7zrkFsSkivUTLMSJBK3YfqYwm5hI4V91Fj
	kQs+3QosmP40FUTKhXfbmhlFwgKXCIO4g4Ggs3qDUTzrg6syigAtBhx/8CahVu6tNCte5gaiwFo
	z03n8oLTgu2LPy+N6v2Lsppu+mKXMviLHZJAFDgFU/J0XSKd34a4kd4HLOMW++yDEo36IGpFePO
	xXBBelyjJRliINsh/MVPMeZQTQzHLEq5+AGKiy1JY8KBvwq0FuTeRDtjSwpdsWQyQf7msXSWMq6
	8NdUZyeSbaeeZGx+C
X-Google-Smtp-Source: AGHT+IEnZKKebuabwrL995yGg4GRRyQw7Q+1H1NtZOkoQn4B6vDV5xv+vAG3ASFFqKYXfzHyLA+94Q==
X-Received: by 2002:a05:6a20:2443:b0:1e1:ace6:c98 with SMTP id adf61e73a8af0-1e5e081cb7dmr79088381637.43.1735896202223;
        Fri, 03 Jan 2025 01:23:22 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e203-a4ff-54cb-33de-dc32-ee26.emome-ip6.hinet.net. [2001:b400:e203:a4ff:54cb:33de:dc32:ee26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad836b90sm25920870b3a.72.2025.01.03.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:23:21 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Date: Fri, 03 Jan 2025 17:23:06 +0800
Subject: [PATCH] dt-bindings: arm: mediatek: Add MT8186 Skitty Chromebooks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-b4-add_mt8186_skitty-v1-1-96ac770842d8@pegatron.corp-partner.google.com>
X-B4-Tracking: v=1; b=H4sIAHmsd2cC/x3MTQqAIBBA4avErBPUSqyrRITlWEP0g0oU0d2Tl
 t/ivQcCesIATfaAx5MC7VuCyDMYZ7NNyMgmg+Sy4oIXbCiZsbZfoxZa9WGhGG/mkJdWq6KqpYO
 UHh4dXf+27d73AwitZc5mAAAA
X-Change-ID: 20250103-b4-add_mt8186_skitty-fe04d863592f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735896197; l=1486;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=HzsCZIYPQLN3rAhPo+FvZIU1phcYLS/kN+/o6gpGYeQ=;
 b=olJZOewFQWoF5LLhRDRPvCLVP7JbvxWk4SLZyYu089uODsS9kNuNclDZO33vFQwZaccBb7JiI
 qGNpn2GSqEUAGzjFGhoXCtnD6NTGgPOJmd9TIfubjivajy+K/hyoElK
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012323_753407_A3205E3A 
X-CRM114-Status: UNSURE (   8.26  )
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

Add an entry for the MT8186 based Skitty Chromebooks, also known as the
HP Chromebook G1m 11 inch. The device is a clamshell laptop with an
optional touchscreen or keyboard.

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..b57e86946d7565720fdee31b2bbef288b0508769 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,14 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Skitty (HP Chromebook G1m 11 inch)
+        items:
+          - const: google,skitty-sku1
+          - const: google,skitty-sku2
+          - const: google,skitty-sku3
+          - const: google,skitty-sku4
+          - const: google,skitty
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:

---
base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
change-id: 20250103-b4-add_mt8186_skitty-fe04d863592f

Best regards,
-- 
Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>


