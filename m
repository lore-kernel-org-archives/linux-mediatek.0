Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC568E7716D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=; b=ExrnrIR2RP7gek
	kyT3UGYJa2iWDd519/LJfjZvOJP1HHe9ZBWIzymzU2T8UkTfA0KbEsyiq7WBPmg38t4jjTix1slJr
	oAZ5DG6cdU6H4abKB89HGQiDx9CzMlPi51pjZZB+nD91HGQyfbLj9Ge+wCiuRkb4kbJX5MHt+8cdY
	3hzrqMVF2gy92ioOzU3VRQb9VqE/4aYpskTlwrFCXupmcg2iP+beZXIp8gUxkC7l6poDUp6ZRi7Sw
	C4tH130g/eA0eSHutEqtD5UDhrEfXJ50YdmVWDy9M7TofO2aphcVY6jvkneA2BpwpRM1kSKWErPOC
	UzP+qFp680I4yhGKglyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIliq-0000000C34t-3Qzu;
	Wed, 04 Dec 2024 09:31:04 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgv-0000000C2eR-1xH6
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:06 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-71d46ace74aso2982982a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2024 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304544; x=1733909344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=;
        b=Ki+4Pq5YkFbJnYmofVxezeuEi7jZlgTj3WXAt46oDkN03iu17pejsuDTt8ZhuEplgk
         uTmJk0JNt1OHr7rIdi3Ft4Ql8tkevM8He39ob0gP7G4GxruZZdCuyk0RB5wZv4pxpiZw
         HqvjvAyMIYXdSuNdxSVQrAazPyuprsr9Z0EMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304544; x=1733909344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=;
        b=kbjYPcQmZRL3oL+Jm/f9vOKP3aVIYot43IYtLuc1pnR99ArpKYIsHvJjqbJrsUdbj7
         qM2/NGmiT0tWtb/6aNt3UBpiLghynSJmy2rB63S7bafVzLm8vxzPi4sNiGNxC48bHFq0
         Nf6WFaAXpLF/HSu0OjGqXo6Y0Wz8BQLUjTcjgzjYR/CxLe704ik2h7PdncHGYWsd+uNS
         svpWKQl9YGIpQo9DMqDoE1iHTrOL1unxwPMBX+FKbzFhv9jnRz1wR9CTtErmNR+Lux/T
         MvKtBor6j6m1waTQovd1SueOsY/0n0edAJUjIGPrAvcmZ95+nx53NrHvJQqJIqI5U+1j
         S6lw==
X-Forwarded-Encrypted: i=1; AJvYcCUQl3Dn5T/KTyXd6yn9Ch1N+TV7gKQ7CPKdlPIxEOvUu4GOSuxpWEHHL00yARrplvgfJ12z2UvHiJ0mMq4qXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YworPXfNsrAMpK76mhR0YIylerbMLuqUw4sclbIASSaQqYDltvI
	x011BMbnvzlKm7ZNde6l7olq3yPobfXHf6P5T6Et5WBDP7x4C60wHw14u+M1cA==
X-Gm-Gg: ASbGncuThAQ0fUSUrRwecbZnMuDJ/THeaLFROC/TmcBjbSZkhHpWi8ApEgaMHtBUP5B
	9fXpONd6PCssubx9XPwYGFBfDcIF6fNqQ0ALSmr2DPD2tPPNyiYHWwpwgQ1oknVzTPwrl0AVdOn
	QtoGHVFZcdOpmqXmsPVrHLDA1TsnFWESGJn78uSv36YhOiwJ+o6Np0W202aIHuRlNeR/GzICz7K
	xzlvIptLBppL+Aqfcxt/zpngIyJtQORl3X0hO5o3mIxQ4AGv60ny4Zdp9+hK4hEbaB6
X-Google-Smtp-Source: AGHT+IG2OOr+DFMkoVU9c8r19W+ABIjfnQAct57iSGJbN6PcBsKoE81tPXls96jiKM1xKEyUQ5FchA==
X-Received: by 2002:a05:6830:2045:b0:71d:5b70:41bd with SMTP id 46e09a7af769-71dad610b0bmr5596609a34.12.1733304544427;
        Wed, 04 Dec 2024 01:29:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that need two register ranges
Date: Wed,  4 Dec 2024 17:28:52 +0800
Message-ID: <20241204092855.1365638-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204092855.1365638-1-wenst@chromium.org>
References: <20241204092855.1365638-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012905_502260_607263A8 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Besides the MT8183's MMC controller and all its compatible derivatives,
the recently added MT7986 and MT8196 also require two register ranges.
This is based on the actual device trees.

Properly enforce this in the binding.

Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..9ea035928563 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -235,11 +235,18 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183-mmc
+            enum:
+              - mediatek,mt7986-mmc
+              - mediatek,mt8183-mmc
+              - mediatek,mt8196-mmc
     then:
       properties:
         reg:
           minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
 
   - if:
       properties:
-- 
2.47.0.338.g60cca15819-goog


