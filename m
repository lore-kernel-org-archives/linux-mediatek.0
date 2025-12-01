Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E05D116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=; b=IXjhrJWjEpDuUqPZZ5jvif5Tr6
	FvvaElCtcJ+w4oODEcIv2mJ00E5u9J6kOugOj5j1dpG80GH0KhKh8TNhrbfWfU+Nr1mB9+ENluSH7
	3gkYKMwuZ1D2dPuJh0nWW2fEwSkRTJBvZt7H4NjpOE93K3+mCYKwyM3geg5AJUcRGNt3dQiAaEBnS
	BRvoBaCFD6hQwVCpjm8OloyPIGFfIkxTiwx+PiE2ot0fMhO8MuDdoQyAyYqGfuO036dsVQTui0CZA
	Lra9oqjnGIEhS8W1662XIS+GbnVd/XBz/wPCljLo1DJN/gsGxmRpx+sd2u59DbcWAhH+uyIWX5MK5
	1bQ50ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14I-00000003JZ3-2eW4;
	Mon, 01 Dec 2025 10:23:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14C-00000003JSl-2bkP
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477563e28a3so26740165e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584615; x=1765189415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=;
        b=RNgGwiuROyPCGpBp4fNQ978gw4O+KBNbioCx+Ho6Tu1q4Sfkz2WFpavRhr4Hne57ET
         F+yAgegeCt3g2zagtXdbUGdQj+LCUmphoTDShC8h5P5HLuEvcaLgaTMcQmKOeoXkG9XE
         GpRTahcl92bo4V9FvE2hPTyst5GPYu6ypFpV692P1PP6DZSRVS4MJrZbPhNlPb6vuHU0
         ml6/6aT8LQLK9EH8vnasK+rOR4UknXdeJU9XjwMNm5H1+MFdou3eKz25oMPkGLD3Urr5
         wVzxUwXocnADHBWOMUpAtSel2A7g9VvmiHtUZKMetfBpV8K2W7MC9KO7JzKSaOmSBLEv
         N7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584615; x=1765189415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=;
        b=kLPRKAdv1aFjy5ZWhjQvn7xWdvDpyBIJTvi3AekUOPf9CTu2QtZebCY7qhaXX7b6tg
         UEzya3dUmWsyG24MxPGtUDbhx3oXPIEQmLg3ZfPVwYYsO4eKW6cKEEEajLy1QHFNqC1P
         GiW1MWwo+UMqO+7dbz187zBwI0YnuFxNT2Xv80ZC2wtoB3JqDjf31VoqqpxMo2LSCTAu
         qTF/p8tl1qSEb94NhphoD7L8BSKIr5p9qz6/r0JYuQXGMjaXsj+GFEgXYpAGe3W+V1ek
         ZLkO8UwzV8AxdTRSHEZ49RvQ87iejBkVUCJe3Py23zhm9/cpdoYqk9WtUdi3X6u6JylG
         ejwg==
X-Forwarded-Encrypted: i=1; AJvYcCVgVsvXRzENUMNTSA1PN8wPH6i8N5Kb5CfY5RUxoRoXq5e+lXhNrkUfzNfApd4Rzrs4oRtGZLQRi5oRtB6gKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjiXqw+Ao7X0bnRrObimsoNZr/ph996eDDzx8y3b48BmgiqBIN
	dClCpQUeryOhS8KwKyxuFw6gi8WoLUjKM5t5N+qHZeY+cU9DYg0iBzBz
X-Gm-Gg: ASbGncs9XTqCRrLE97C0fbDAU9p3uamOamDQL7t/CuSR5Ol1N1yi4DDo90LeUVcfwMB
	5KcKsQb/U9cLXj4GHsgkUORltuYNzcBzh1gLVTIk7SUQ3cevIXmEYGRHgdLX4nXltUAgGpHgYqw
	4sXTUPdp6jl91nTKWbh7oWtzEJy4J868LeBHTi4PTc4NsNw0cR7CG6VHALJ9UlKJNVE50S8H38S
	mDMBD+LsYIEaHutEpRCVJGUG4JgG5rs0+E7mFPF5Cn6D1Cn+loa3+rkss02tloeM/fvbMSdg+Cl
	VFlukUxN3jOVnHhNnjiqyvyrGT6Hc5yIJECRqlUM6Rs45f8ooamSAZbMkj9EA7o2zwZr8RUhzpu
	FCzWmzcySQnG+gch3pQClxwM8mOCua8U4ADD2H+MjHxOgDfn6LnpPnPxJPD1Kwn0fXcyF9t1mO4
	HGx9nEwKlr+W2YGAmJ3DSAZdThsw==
X-Google-Smtp-Source: AGHT+IFAwJxBI469N7L9CqPS5vNwebnCpoilxRn/5gXB2dFYAtif9suU451xCgzkE/Q6bFDKsWWdtA==
X-Received: by 2002:a05:600c:5952:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-477b9ee4fbfmr302253395e9.9.1764584614500;
        Mon, 01 Dec 2025 02:23:34 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:34 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:23:16 +0100
Subject: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v2-2-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=1305;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=xFX5YgQIiA3apISM9uVyuqH8avDy/oWY29ZCIQmyCTc=;
 b=p/W1wp7YQyzzW+UcST+cXTXhp1K5/zznvhV9cPYVl6t4+RrDx/duXQb+41zcP/qryk570Nmqi
 IQcmlqNpFm/BUR/uG+UqUQsgS1sG9MZDYeQtxzZgt1obzSaqVB3do3h
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022336_688097_4164819C 
X-CRM114-Status: UNSURE (   8.80  )
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


