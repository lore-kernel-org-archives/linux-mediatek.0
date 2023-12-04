Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A7C10DC3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=; b=QKastK6qjmP8A1GZJatpIkDKBg
	OGZz8VaKC0APuPfY0p6c3zLLVI6d8U3nEAz52H+Gn1Toi2t3qyuNewOLkywVwEuqs09S2Dj4K52bt
	1PhRbc2RVVosvLh5DSbXo/NR0p8TPlna2ZYqzQYDhFC820/r8+e1HqS491G2P9YUdFlv8hUx0gO/D
	/vh8WQtmkxQFUR15uAZyipSN0HS+51O2Ko5sFCBToAiO7ItlNBhrg5bufFzqu3KOXgsaubzTfVi+a
	lgNcdlxY+NoNXw5Z91SRNzEVHalELSVndwgjCUuQjBqM8V/MyHX4ssBULeF2U5x7GRhl1PH5JdbpQ
	+E2ZOZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFGG-005WH9-0v;
	Mon, 04 Dec 2023 20:09:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFGB-005WFK-0e;
	Mon, 04 Dec 2023 20:09:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso21260275e9.0;
        Mon, 04 Dec 2023 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701720579; x=1702325379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=;
        b=dpY0zkuCOs/C4YPRqDVZp+xQ/wrioh1iw436cVat0RSwKkORQfVmj412HnTgtImvip
         rsgjtPO3rZ9j7E/QfrXfRm+KWMtRFGw7n8ayTr/vU03rtZVhbof5O4RB78qe4HgfVPFc
         1hZOK84U4CNnD8Vqjnb7PkKUIzxOJo9sc74uu+QlR/LK61hsFLjNZqNKB6/2MZg2yGZc
         U1eYDHimsfUFsmpbzcJe55h3xNEOXOMiBw2MijClP92iB8Slro07Xo4f3J51I/ozXfRw
         lf4blyJhAitaYbmX3dr7cYAweS3LedbvIwZ+e7rqZb+XsZUNO1mbi6RF2+ptDXTL3wms
         2Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701720579; x=1702325379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVFpYtqEexLfydhqoFIxA/jZIztn7bZ/TEnG+oaDfrk=;
        b=jvm2NjTwboubqsydH3VHCuz3ry4+eiBa1UaKpmaTIyAdjHcSv+4Uvd5iN/MZmj0yWv
         vwwMzbOatbTcemgwZizV9DdFaJ8Wn930vhC3hHyGrb5/XFRSJ+xtWfTrW8J4zou25n/X
         +6a3iMXukjqL/rCgEQDDF6VWhwi00L8j5CFP4kQLIjY8o75wx5ZgDsEtit2pw5ROkzop
         JYiYmsIS+eGT2y0xeB1JBkIfXVWFDWdyMhHkJdJJu89VkyAs029uBT3ugaORsd/Vl1d6
         IUVGzCEIOI/9uFSwqspT337BjucJMZ2Mi4f+zfNEq80Y6TfqFo/moWUq8hCsIdYEi8js
         976w==
X-Gm-Message-State: AOJu0YxxQPZw30xSiyVhlJCFC4c81bF4XFT9ZRnX4koTOFvqbr2v5Cmk
	fYV45JEhLHMJMkk6O07gQRw=
X-Google-Smtp-Source: AGHT+IG63Al5DfRoGZvaIVTd9NWsHUAPVQRrDzaNLOrtrbQT+bnF7z0RJvh2ycDEMAsNA6qCgPUXYg==
X-Received: by 2002:a05:600c:4448:b0:406:5463:3f51 with SMTP id v8-20020a05600c444800b0040654633f51mr3026285wmn.25.1701720579155;
        Mon, 04 Dec 2023 12:09:39 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lt12-20020a170906fa8c00b00a0290da4a50sm5620666ejb.186.2023.12.04.12.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:09:38 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink EW-7886CAX access point
Date: Mon,  4 Dec 2023 21:09:06 +0100
Message-Id: <20231204200907.5687-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231204200907.5687-1-zajec5@gmail.com>
References: <20231204200907.5687-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_120943_399783_B3DE3426 
X-CRM114-Status: GOOD (  10.52  )
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

Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..cfdd3317edda 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -84,6 +84,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - acelink,ew-7886cax
               - bananapi,bpi-r3
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
-- 
2.35.3


