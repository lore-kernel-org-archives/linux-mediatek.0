Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B71C25B79
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 01:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fChpoExeFzd2Az+Su556Ffsvq3JBbvZA6mRiE3/6qbE=; b=JXQlksEHQ4lOq6d+JIkEMry3bT
	XapNHBoFWv+6JYoRmW0Swl7IzWjQEDE9UN3cOxDMnSt2oX2Qion7moeVVAomyDfB6ZZHtiru1DL5S
	IqxCD5WXnhw1lVW3ixqFhFGsWFsv9m7bQpsoa8uoKlMY19WnKM3i9lcBA2p4vgJWq+KeLFaQA58pt
	TobFtfNVtdJZNMZ13GZ9OQpIVBFD2Bj23BuEpuhszR0wK3THvIkIy5198fXCBNQxRFCyQ83GGiH0J
	8DZ0gldbU486+Img1iunZhrsvnHv1slm0rtkDe5KvGaW3HWxtLZ2//Magk/LdsMcQ5VzR0C5dP2o5
	dWwPYw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6hMD-0000000EkRq-2r3I;
	Tue, 14 May 2024 01:53:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6hM9-0000000EkQj-3lRX;
	Tue, 14 May 2024 01:53:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so496162266b.3;
        Mon, 13 May 2024 18:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715651606; x=1716256406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fChpoExeFzd2Az+Su556Ffsvq3JBbvZA6mRiE3/6qbE=;
        b=lihx5nY7tAovB5nR+Oej+qm/Y3cL7tYN+9h2vpYJ5FcBUHSdl1qzrM9kXmzYYVBOV4
         fFkptS+vjq/EV0uuRrZBAXWKj9DBs/1Jbr7QGAeTEdfF8WHKu/QqLl3Hu37ZIq4F84Zp
         fQ06DscDLB2oeuCgvIIXXcyMaNbH3D1VC9gloSpt+89lZ8lSZ7bmuTcGSPCXtSb6eiSt
         NXuoYc264g4ybKxuCDVKtJ0uxfsvBgGpC7c+BDrO9N4fKCvUGqdt4uYi0ZxFfutgiSjS
         apdGK2wN/bYu5kGUnz+mLV5EDZ8zApIL79CXSzuU/Hz89nyak7TJZQ+ByhmdBrkhDezr
         nA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715651606; x=1716256406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fChpoExeFzd2Az+Su556Ffsvq3JBbvZA6mRiE3/6qbE=;
        b=F7/k3R6isPVGXUl0oNMoSHPQ/LtaCVZ6KUPkP8KPQ3TvwKQrTHo5xaJ7i+4tXehWmO
         nDoIgHF+BjKSjjNlltN+6Q1H3PPlnqLiouTbiBcPtctp+oWr0ewV7VJxCjv8f/QzexuL
         F9kbypkHLmno2XCsaqeGVwXhTzeVXGp2I4iE1/aN7EIEMr0WhHpZPBLvAfy4Dp++GUQG
         MjIPbjvpigm6ZhjqcoDdmVSUUSYCQVOtojJJnCk8oxUT9hi/psGQ6uwWiT7HDjEVOyss
         3kPrVTNv07TjPrZr3qERkvThcGaPUA4pUi+3vE3odwSMHiz7coqu9u4ug6ZQmbFljuVE
         fEGg==
X-Forwarded-Encrypted: i=1; AJvYcCVPDVPOKLb0GVUWfGsUzyJmNr7heBjT58W2r2rmYGEzUtGfePK4oDLxffOpbxuxkeGDE/NVtjEsVkgVG27jHD5MB1UJlfH6JIX6m8JITIg8lhvfPzNCvm95nF/muaVxbkITPwzeD70eWxio6tzlsWTUZES1CG5l3zs=
X-Gm-Message-State: AOJu0YyZ/WNF+VF/1n9mINxjuinIAqz6+EyqbYBJv2gxeB6AOpsXvn3C
	FvPKXI50r0kkcuzIsvwo20wP4txO0kwghb+9e0AnCYZW3bxMSxPi
X-Google-Smtp-Source: AGHT+IEq75Ot9SYG0z3IC3m2UdmZpVoWZknjsilYqX60VGzRKZRAz2xfjnSBvmr44ctRbHZ8aQgmWA==
X-Received: by 2002:a17:906:594e:b0:a59:cd18:92f5 with SMTP id a640c23a62f3a-a5a2d54c699mr725052066b.11.1715651606075;
        Mon, 13 May 2024 18:53:26 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7ddfsm663377066b.121.2024.05.13.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 18:53:25 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: nvmem: mediatek: efuse: add support for MT7981
Date: Tue, 14 May 2024 03:51:53 +0200
Message-Id: <20240514015154.11206-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_185329_967683_01FBA398 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Add compatible for MT7981 SoC.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use new compatible instead of MT7986's one

 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index cf5f9e22bb7e..a773101d8538 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
+              - mediatek,mt7981-efuse
               - mediatek,mt7986-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
-- 
2.35.3


