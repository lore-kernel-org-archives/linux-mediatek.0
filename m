Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B57C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=; b=HfDgwPzTSjc+F5cuUMfIPBm5W0
	0BYgczI8BHkGIHq5aiNr+3M7EhFvD7CNCMjZb8ERbxoWbl+eq/LGBYFAX763VYBQhYwldQJmGE210
	Nqi91MLfWP8JmSO+oGhGLTjnKBV2wVZ2LtDgWReQdJ0bu4dD2Q6tOX9kjLmvX4E9+rva6UJe4tTlg
	5E0mqNQT59uMgETx3Pg0h+rkkOzLB4Ju1SnIKBLz88uM2Vl8nZnCQxDFLVd+HLo/GIprYy8XLnXYu
	007wXvX2UPmVvffaT9swb5/Kr0DX4Y1VRr3U2o6Au/gpFlGr1P9IR6iexJa5j+cx9/jXtsHhtyevO
	ECXsFqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlrg-008yeO-0q;
	Tue, 02 Jan 2024 20:59:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlrc-008yc6-2x;
	Tue, 02 Jan 2024 20:59:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a2345aaeb05so1017172866b.0;
        Tue, 02 Jan 2024 12:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704229189; x=1704833989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=;
        b=R2KOrMP2X8E0CrC27fgfidZVRu/1tgECHhI9BziipO70sQ1m0Ww7Yj5mUzcvpZ9JkX
         ShYRnJ37K7LU/mb3JGQGghARCDOZ5fCZ8uNVHVmvVW/3DsWVxv8O8HnFD9d6Xsr7j2o2
         3ZVaEtXGxy9aKv6QPJnLFrvyL54mP0dOLsi6u+KXE6TAFJfKcPjxC+87jn/eXMJjyklU
         T2yyUgLB2x9Fq4z4vwvx1l3AEXFpzfPAZo2/dLzKpI2ctq8GBU5XIO5XoXvZujKWuDDZ
         WToM5+NEl82j5liYtnU6lw3C/ZGPkd6oTD0B7MivxFy1QoHw/V3uzqc1hdxozmg40yyB
         +z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229189; x=1704833989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=;
        b=crnnoq6eqVilQeDrCXe41qaddJqMOfnt+6mdKhjchOPqicp7ik5cd6aZruA29kK9JW
         2FdBZzGF5NcV9ZxQY+WntZ1s6vk/KkpU53y9u8nJmZ/QthCW1sqdnyvoI0hdvt3cQKLu
         QWTKy3nExXwnSrngOCeMod5VRexspxEutYjHjVECiZDICtYB/yXN7gy6aqHRtCU4zyyY
         YtaIsiy5EiAWzngHZOdj1bCbZnPoMLEkf3nB/HqjkrrW9WjImosi3xd4G81Dp+vngD6E
         m3v+jHKNDosQeqn0oastawOgwZsYD54duWvzwyN/jDXlgc/k8802Tv0doK4lhjQlXVwP
         AB3g==
X-Gm-Message-State: AOJu0YzCZAsYItSdFsL0qKuwUq06zOiU5kFnTyqbYmCvi6msHAdTEaJi
	zFA/RT8xWIe2iMYUqHfWq+o=
X-Google-Smtp-Source: AGHT+IEZDtyjr3TDGl71MjIXeUnjOYvve+ifXX/rtGtFSzaJ2n4S8WtkBLuo7hGh0LPIgO2MSMlsUw==
X-Received: by 2002:a17:906:3987:b0:a28:2374:f39d with SMTP id h7-20020a170906398700b00a282374f39dmr1156014eje.50.1704229188691;
        Tue, 02 Jan 2024 12:59:48 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f15-20020a17090660cf00b00a26f66ce72fsm7941200ejk.83.2024.01.02.12.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 12:59:48 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
Date: Tue,  2 Jan 2024 21:59:40 +0100
Message-Id: <20240102205941.29654-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_125952_982337_CB7CC679 
X-CRM114-Status: GOOD (  10.42  )
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

MT7988A is another MediaTek's SoC with just 1 device available right
now: Banana Pi BPI-R4.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 6f2f64ae76fc..92dbfb862757 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -91,6 +91,10 @@ properties:
           - enum:
               - mediatek,mt7986b-rfb
           - const: mediatek,mt7986b
+      - items:
+          - enum:
+              - bananapi,bpi-r4
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.35.3


