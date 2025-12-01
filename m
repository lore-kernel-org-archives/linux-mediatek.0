Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDAAD116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=; b=bO1MLuzr2+lXZiaVR9aQxJqDAc
	cvnchm9POV7XDkodTuVHp7FcWfNSAGZp8lKhJOYHPPLQrFLJG2t+jaJceXxOcvfyOdXlLSUKPe0IW
	pruCV2rB0KiFQmP/vzbHbTwNKFo4ZRxqSZ6w88FRmUWoWhzYh4yWt9q5m7tBhMKtkbZ6WHJuNOMhu
	WYgfiqUoUJqDu1Dss4o7D7wsYjNjqVXHxMIulnPRRD2hnZQTeuUrpWMPfhGiv+rF6ksRBr+DzrS6B
	RnIZwnr4qSdxVqL4/9dA+hGwriq1whLp4/RIlJs7XyaAFyYeFiXz6IrE4KbK91K1d1t1mCH8U8Vlq
	IW9+145A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pn-00000003MMw-0EhP;
	Mon, 01 Dec 2025 10:45:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pg-00000003MFc-0qSi
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1408778f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585946; x=1765190746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=;
        b=iGYLq1YiZyCT3EZvnRM1WxWXb7PK326E3yVwo6RdMZ2Rry+4VeA4jld2ZoKMGlISBs
         oddanJj7tZZEq/BbQMAm7D/4OeMTsGil8yJBfVpNC4o8DBuCx5aVF+RmAsvc4kp878C0
         rWOXmGnxs2cqwbnuItom1NrDtAIgFtO3cnvw9bQYDbCz+Su0gWJfwfxj0xnRAiXjynHk
         uOygGj8a/SB3ZVFhLPyoqC+0tuT7QObETX3aEOvUBOH4ien70zBCqnPpX5k4Zzfw4d2P
         kwt0UL5eZqJ+j7gD+JXNaBCQh2gVvTLzN4xmmMye93SSLeCf1pfzhxHLFOl2ZZ5eRD3u
         u9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585946; x=1765190746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=;
        b=h4dfKmP7rp843WG8vqLalbexK7SsRbdUQHgdRTjQcnmUQjvzdnbVP2qMwdly2fiOwB
         1XnRYsmogdQdGFfT9pZ9+0JJwgxn6Lq+HmJ/4EWvq8Pj5Dly3GghxrXZVNacaaQbqY17
         SAE5gIi//hRLqC24oOJdahoUdwpEcnvklynXzhr+v9K4fBb1yOT3WB8DK58B0WUXizyC
         QOqRtuxyu6Nd7LEZ12QDKJh67V2cfW7nYBmIAJRmnaPE2CEqbbF3IWhEOa3P9/WL4ChG
         /QHPTk0FbiSLj7AzuTcD1Ylz2UhqmsETLDSxgDdPtqftxGoISC0cvWsH6asWM0L1jjfJ
         aESQ==
X-Forwarded-Encrypted: i=1; AJvYcCVluJ0CXOGeqW8tPBgwDHqGp65lDt68PXIdYUwEVEoQ5tcbZD9I9Jw1wE3hTYwgNriazRZZd/BAnQZWDkjQ+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQXy4fUTnOmTa/RpxZ+JPr4GzmkaJIJRypCkH4rc2Z/mqjZy6
	HlaBFexwMdK43ctWxtQbqPZffxMDjEU4NqcQ6ybwSAeUriILBQfnOEl9
X-Gm-Gg: ASbGncuIMr04waewXyZLdBQHp8ouFv2o8MyEaGD/VTM6bjwM3HItibeFVPWPd5PWwgA
	4h0NSzy24TClmcupLAIxP0jReFOwQHqzYVa+b+upY/nsqDVrh0wgfnfT+/F7JIrjeer2RvtH8lF
	fE1Xg9MaQsa4ARAv2yPBnnAT0JqzUYuaX/92XxCmZK0Nmo6KWjM266SLBZl/ohYAmjwL9C0+goZ
	jRVDwe2c09+qrqZ9XUpCxmcUGwua05UowroHg5zdFDUf7LrZXI7ifHH5H2wCShaQV4M6TWp/6Zk
	oAQ2QDTa58AkWGpgEKYy6s6j13uCKaT+MyZzlynGa+Z3A9bivjhY01etMmTUEaSwFknCLBtef6P
	GZvwW07Nzou3YPcwGgCGHQtgqxtgBvIkXw+vLE/+SMR2iPl/Fhu5Vam1GWldCVBnoLF9D+CG8Qk
	56VcUIKU9PX4eZpHgsF2Pl6kti8w==
X-Google-Smtp-Source: AGHT+IHPCCG5O4iwIX/7gpyKWK10moypwr6m4s4LZngi2H/39mMdg/U4SqDEjLE2T2Oq9T15qq7X/w==
X-Received: by 2002:a05:6000:3106:b0:429:cc1c:c2e with SMTP id ffacd0b85a97d-42e0f1e3499mr28032126f8f.1.1764585946426;
        Mon, 01 Dec 2025 02:45:46 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:46 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:45:18 +0100
Subject: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v3-2-07f9af7341fd@gmail.com>
References: <20251201-review-v3-0-07f9af7341fd@gmail.com>
In-Reply-To: <20251201-review-v3-0-07f9af7341fd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=1391;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=PNtzRnHeMa9DlpoWVZx3pwmISNuUbrxGoCv/8DLShLU=;
 b=1roTWqzlzM5O+BhkbGLoRapqg+15AtDQG3cylp9Wt2ufCry9QrXIB8uJ4mrXxH/si29U06EJS
 FwMMxEdu0amAmDJBa3PNBeB6wbZgyyhvxaeygqrPZBwMudD3Mt+j4X6
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024549_968436_BE65CD1C 
X-CRM114-Status: UNSURE (   9.34  )
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


