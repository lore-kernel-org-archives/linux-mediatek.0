Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD6606A32C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gk4hNuaK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urrS3s9f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=; b=gk4hNuaKGq48r9cPXHHwqGu4vu
	aMO7oqFe3sNw9IxJAS/4dTJKDcFIAf9IcJaO/EfqiuySfqjKjT1AGbJmHWjIm6DnpFucT9vx7FMpF
	cUsmZ70nZeRgHRca9Mo5oQsj3h1BDptqKFk/6DeBgyfFC2NIgr6PJnjbDGyGXVxC1y1PFBXd12jSe
	fGqhrtjfk/1XEPhQt8nMcZ4UWkHtob74Pcm59hN4Ewudw0hhhYGp1u8sP/jJr0SvxL9p7u9cdihSk
	Zg+6+OEycim3u/0gqLU0Wx05YsDsHuMnEjpiV2Kxvkn+iMG2J9r51+mnXVZo9H+TiBgAANOmib871
	mxHm6Atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKAa-00000000uNU-3dGr;
	Sat, 28 Nov 2026 15:16:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKAY-00000000uMq-0zpJ
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 15:16:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4682642a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879013; x=1796483813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=urrS3s9f11zeYmU2FnvXmxX8AIi1P8dpCxpp2sK+8jL78svQsW0+Yl2yQsG8swmCPn
         Y6b74Dv7TX+Nsvavjf5eGE8IDBxC87KoYaRv8UB9lvs/D0nsKREgrG8edTD7Yp1ogsyq
         gKp1a0Un6h4vMhEUaXEwvNfnXIWkmwpjt5cYTSe48tWiptrakxEN2vaVKZkgizYC32lv
         g4PJLTdIm4MNso/56/bH2Y6EWA1AZ8PV06+M0ADhXd6jKodtbjo0gd+XvtdXyOht9+Me
         WovAG/aBqrw7C0p7Mqeq9mq078wGKFe1iKbtaghJwJHT9DwaS3wc3yTvQmo2d0xNuYd/
         lUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879013; x=1796483813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FB6N3ZVeS2iXSTJX9cZqix9YwUql7fjHknIhnBZeO8=;
        b=b92J2P0ikO5nFEnVhJlW9hiE3EKJugPGmlUpxKehJxjwdBF6wHHajE4PqBD/3ujlDi
         CUjE/U4KsghneEObmtOZ+H8UvcUYuebXp0fxYT+yFQWVlEHlDaSPPGMCtqx4/UWySiqQ
         GaEg3PcIH+lWwG/r3Guc2TEIrC8l4HSAI1zZB2y7zI3pVqaL3ySAVb8QuaA7X1jv2sQb
         Tjs6lJAbxXzeiDSAFL235jIQQ4I1DZSOX33+7UFn96qxpvffcdvG7AkU9cw5pUrGWFi/
         VwdKVBq9KC2zlNcavN0Cc+rnr6mGQk8X08qp95x2iLiAmcBDjYojdxif8uJdif9oDoAD
         GC6Q==
X-Forwarded-Encrypted: i=1; AL+hErH9eHMtuPtUAiXG9bU5yfcjzBEdoKJzoPpZuIP3zrwZiSubE/21E9qcCLeb2ueMJWBtz5sL4Z6e0780fOFE6g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/oRbWzhNi6DvD7XfpjZGTjeHj+g42JpsjUs3uTHFFyM3IfdvV5
	oPq9Tg64flVWY6F5Q6IwCI009xynSP7sR9n5HhygcLIsIwuNrtIB0Y1d
X-Gm-Gg: AZFdTZdDvXfA2tG1aIoM4/K16mUHrolA7miwMVBdlk0Nv6Epuj5Vdpj/E0nZaNzRUfi
	1UCiVw0ewyJjevkq7LseiFdfb7mc8xonBMQsFAi21O6jQLN4vmPMBetgnYCiMwcTGRvy35ghtZq
	XNnT7rbOBgvd57azGjpbBpwiAvKP2dF22Mam2DUwdTLZvKC+Dfemp2sFB4dsDXFly7G70YUHZVm
	LGkP3TnN9Cw+/EDXqJIIrOiR6tZ/6MkwPGDV31pCIKb6A+bJHG6UnKeDldA9AkG5wezMtc1ePNr
	1rgnFVXhr91GL6ipVwuhqThO2/cwqj0IFNAtNm7ry3Zdihr4ugv54Sf2Hl4N2K/y1aQre1nIj4A
	LdgSJa9Pm8+HthE56xoHcZBDuH+wGqiXo/+7RS8cDkRf9LwHR4Y5w0bf3WAIANM6A9ikcNvMY2Y
	nXcrr+DX+2GwO6eHrT8Q7vpo2mlC7r0WOQKOsNOy9UHnz3AoVyucDUR+yAmplH9DaDrJrA7uMr8
	M8jybV2IU8yyRTmhHk5cigotc0J+eOoMO6Lbsc6cCvFfEkaqHCpnDArvAEpUWcuukGxa0KFs/hT
	eOOgkumErUlyfOHtjCswND7WxrVwhS27VSNnVVO8grDfyMImaI6ZHfmQByKzPmx0vm/FvlEMam/
	/W38JwUOZC6uammkjSvJTkGS87mE1
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr27156870a91.56.1795879013360;
        Sat, 28 Nov 2026 07:16:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm19769280a91.3.2026.11.28.07.16.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:16:52 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 20:46:41 +0530
Message-ID: <20261128151643.16934-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_071654_310833_2739AF1B 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SPI controllers on MT8189 use the same IPM design as MT6991. Add the
MT8189 compatible with mediatek,mt6991-spi as the fallback.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
Changes in v2:
- Sent on its own so it applies to the SPI tree, the rest of the
  series depends on unmerged MT8189 patches (Mark)
- Fixed the subject prefix (Mark)
- Link to v1: https://lore.kernel.org/r/20261128141443.13065-2-sinha.aryan03@gmail.com

 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.46.0


