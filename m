Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C55C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s5S7Rjd01NbU6qXT0lu7h6Sx5qHS9b3jLYRU5TvpOw=; b=0qxX2vC7kOoY0PtUWO8SZcwtT/
	eu0SLImvUCssE9mIUoplcbjL4wsDiYLco3WCfX4y2crbPu5S959fxckpIIDIvS5Ye+thJxpro1nE/
	L7rDt2QKKCdnap+OHuq1MorqpfVr+s1DHR0zzz0frS3tkXPqVTIVAXfzIGwmi/jN41l+/K6ebnnqM
	UUBWpB6reTkDeh9RcTmz1VXifGdPbPEzwn56QPZI7s9zo5PZbTmSdGjv8MbaToHpaMzyMZ8gvXKX4
	Taoy01fsCUExWmTit4uyiYhT/ku9rsXcjWaUNJjkMupBIJ0qK8l/Uj1P6TVYJna1CXcS7WqxNu+r/
	QYK+MD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9W-0000000HVmr-09IQ;
	Wed, 21 Feb 2024 07:36:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9E-0000000HVbd-3XN6;
	Wed, 21 Feb 2024 07:36:10 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so4090841fa.0;
        Tue, 20 Feb 2024 23:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500967; x=1709105767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s5S7Rjd01NbU6qXT0lu7h6Sx5qHS9b3jLYRU5TvpOw=;
        b=VtrhlJyy3ndiIpZay+3ltZFqYmXVDxTsvGtl8oVTP7IC1gSZ4R8SnNsOlOEZavLKf2
         ONG3Y45GoQTQYl3JnDG9ut2ZXIAEO1OBrKCy0NlF3S67Xm0pWsp7iJPsz2rxkEbjoUwi
         06bP4mi4H+OODMUVTtfKuSRPC8njFZQaYkq5ge6ubiK3TG0zXNabNlP9sTQIAL60cfxQ
         pvk2+ZsVMF4lPLXrgxkgxnrIBkK4Ib1GKLT5kezvlo2WCs+7juY7JbWlMLCmPTk63fsQ
         IuNpn/c1SsZg1N3CqFevXC+Buikk2VQbtT42/Mafbc5NW5Jtbl0GELHVztpQ98oFNtTl
         O67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500967; x=1709105767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s5S7Rjd01NbU6qXT0lu7h6Sx5qHS9b3jLYRU5TvpOw=;
        b=a7cJe/yNKYPSFeFECrLxNW0cPdcRbgd1nx3Hpo2Xug8FEDsvwOdBgx+rxsi25A3dcz
         oFhf1P0552qmMOiXxkN0ku/LW+QXPfT3Tf8RZczMPXLzWAoQTCsqubcyhHZptuPhOHet
         7+stibGvqDTGUamrdThO6f46aKge4N+p0h58Deof3/ffOBMj+YEhp9OxmEmVwHLcOkit
         K2WE/pR8uI04gVKecl0tbzxUj/V/QnT6RKaRdoFIHjC430HmAlolaT3hTKLnxGuF0lcg
         UG60MgBV88C9znKqEsnIsDXvoKM1zTj3IQbutsb5etIAEqzZvO7sKotLYLjia+sZdkNb
         JBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr8w5rsl2VA5shuFn59X2d3TdhcNCxb0ZQvvUEpzNjjA/KjBaEVU19wP44ll3nd3opxOWv/hrJorO+O25i8LekT3/xxxS3W13c47j2NfzHp/IeZJCwuI9jehJUHr93LAxGiSWm6zWrRnYy6VRVxQY+So2mDMoGdMQ=
X-Gm-Message-State: AOJu0YwtOCEtBs2e+oQ8j6KE9bdEkljW/d34XdET+U7P95+Wtr+R6GLB
	zDKxOGU42wDKLnWRgzA5RYCOKdUOoSrLPHPcaJzLUmOS+wzke0Jp
X-Google-Smtp-Source: AGHT+IHf9ihh+ukC4DGvCnT6oFM/5FyFNb3aV2Gky6aCyQwGpqA8iWryapoTZDRWQfq2B9XpuPeQLQ==
X-Received: by 2002:a05:651c:210d:b0:2d2:4c08:a865 with SMTP id a13-20020a05651c210d00b002d24c08a865mr2914185ljq.50.1708500966802;
        Tue, 20 Feb 2024 23:36:06 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z3-20020a2e7e03000000b002d0f99a7fc4sm1722330ljc.79.2024.02.20.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:36:06 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/4] dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
Date: Wed, 21 Feb 2024 08:35:22 +0100
Message-Id: <20240221073524.20947-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221073524.20947-1-zajec5@gmail.com>
References: <20240221073524.20947-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_233608_982211_DB387D54 
X-CRM114-Status: GOOD (  10.93  )
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

Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..1cf47db94c57 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -85,6 +85,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - cudy,wr3000-v1
               - xiaomi,ax3000t
           - const: mediatek,mt7981b
       - items:
-- 
2.35.3


