Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E41CD1BDDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=; b=yrtK1Ll3zOkw/JBuGmdOzL29Wl
	/+/Cts9ULxz5jBUJ4j5ygKrZyk11kUXrOAeMTD9u3fiqm6kN3cCRRbZDIRQI+P902lH0eU6RRI3rV
	8Pi2cJ6USPdsgL7RZPf14YtfMPcknx6VtB6pyz4bgZTT+6Yh+4Hn2rQ7wuFRcIjLUOY3tG3XMrnBM
	1NcIzLRA6RRLRAZWMeoZ+SR/G5Jgz1CAbmKf6yRsY1HRGJh9SFP7Cw2zyISBwpNBwe3qXh5fLY7Qy
	5UHgLiUKYWBgZN7NrR40rdoyVyeOzcBJD77iIWCRfOnwYtTIJb1K5ku8Q6gClMBhWzdVnL/ZmZQtG
	WRecMohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHo-000000077Wr-1dVx;
	Wed, 03 Dec 2025 21:21:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHk-000000077Rp-2ymi
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477b91680f8so2296965e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Dec 2025 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796875; x=1765401675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=;
        b=GT1ArxWm8fKWjF/O3T0xk76ex+HwIpvY4v81yGdXj12iadpinuASLeA23usBL/MwFH
         OPSMbk8pK3VjbjKO6h3smoL15m80nNh8F0QvHhrjpx4rcxeSGXayyj+6JfKmSF5bRNdU
         FZii72+P6J6Ym+hjvAxeu1lYtLPPkMojTCCAVJe8arhPMj1SE5GbyqaVnhShdtA/W4nX
         hiuiS+vYHECQPJVhnoSgaXPUpdP1WVIsNbmkJBs1cfUEzrILKZTuIvMvISmOAXZ2MDS1
         1pMmnMG6n1/Kxh8uk4zkBA61fYXXlhEWVJY/8i/y+WOQ41X0OK8JHFTmXB7v0JvE4l+2
         Kjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796875; x=1765401675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=;
        b=OMHWh4Z9s360syF+3ChMDZTqlr3YbJRilaST+ZEp9//5a0/t714ugRCBnrphtZ5ACa
         FqCY+vhyUtad4oXn3cmz/ZWln6T1GUiPwZcbm5QsyLnvf9YyKJmPTjXkC+/DroMIeuSH
         B2tV5mzgcI8LlNRRMCBC5BYcovEDYmG9rxg/SKXM8bQYIMgOhx/ZG/HQk04DgHWeSFya
         9bmUGhPcTIymCfQ0VNGYJMlFgDY1rLDX1vFSYmfpBBBWf7z+825vVhRQi5UQTkoPX20w
         OcVOeHrzgKaGlLPWqsBPwpBfiS1KzskX1J2VWnZCGHvwuuY5pOEiNCLFUNkL0u2DirO7
         pnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFAkllcTEsn8AhVi/U6dadPuVc3zkM6AEMmxSAfr70iG40lftwPrZLZqdJy3v5Z1mCnTdaFjKy/lGrioInVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtXwOfQTGfVGTiSaya/YsveQsc4p6y4H2EEvejjVJpq0JXqWAz
	BgBmXXiQiozapEJUVc9CTtBmkF5tQUgjeUXFP3S8d9pb8SSF1xt1yVi8
X-Gm-Gg: ASbGncst7fw6Uux9K7OqTnQRJ6Zanqa0FGiIsBhQS/K+LPEVZ7vZI8byNfmzUzM3lKB
	AYv6kChhEwvlgNGFw5mez0UlGbIS53hbl3VnL1W6tv6m0IS3VR7JUF09P54zuob/gsP2o19EJHh
	ex+qU7SRaKtaSgFMZ8+MLqh0jduAHXfHLruZIa80CdeClikKIJuRKxVDYJhItFLNkR5P6ZJnGRA
	iIkFHmd5dMVzFV6CAWiVtMH9I3+LhQn+3ZR2/Ir/Agk6+Rx1CQ9k+6mP4dFwtZAIW9ulWp1PFz+
	nRU+2HGsBF3D4A54XMhyVxF0FnP/5seB0yT785hv2VLuR0AjLvN031FF2XcCMpLID16yBn+3GqB
	k45weo1KWkVf8fCyQT0NfWwh1DPxS6Z2tnKyjukZ2cyBwB2CYzfYRxCvJEMs=
X-Google-Smtp-Source: AGHT+IGxZWzNDUX3hiHjNQKBnSxzzAZx7twXbp1EgxC0jGUK5ezYoXbz0OptPL3GJLKU9ZswN+2RqA==
X-Received: by 2002:a05:6000:420a:b0:42b:3680:3567 with SMTP id ffacd0b85a97d-42f73172b34mr3840601f8f.18.1764796874721;
        Wed, 03 Dec 2025 13:21:14 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:14 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2025 22:20:38 +0100
Subject: [PATCH v5 2/5] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-review-v5-2-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=1590;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=2O02A46urVE1HA8sKir61mogltLD52eOnfpgtmwDo64=;
 b=usZKRfG7to0jkWap1PRigfzy8V6LxDPmF1ruY8y1wPJGnYhpRNrOythsELbDISgNwwOFTQZ8T
 J2mSZumKXODAWVJBDfzBBqrPgrb1LIsDqWTEuyH89pK4OXKDYznH6m7
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132116_762655_FD59A431 
X-CRM114-Status: UNSURE (   9.21  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Changes in v2:
- Squashed both entries into 1 commit
Changed in v3:
- None
Changes in v4:
- None
Changes in v5:
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


