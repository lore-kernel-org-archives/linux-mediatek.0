Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1667BC072A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KytWGFVWe50JiVBLmixmkE/Vv8zIi4OOZ/6LO+g2zKU=; b=XuYH3kTVh9pF9TlVZXZLXEqO/Y
	CZQJUfQgNfurUvq4TNeF8pv3Uv4YmtC6C5VYAKvoZmnSDuT2kVJhkFjibDRv7kOA8FHJ14ycOsFf1
	OzTXPMavJ50RLxcaYnRVwtN/7EO6FSZm8wQWizB8Z8rhozfcHWf7J3YH/hGhljcg44hHKNJ8h2KDG
	gG51ag1nFgsgQlQQRmxLAltF86cV/XNnG0H4zpUDHKw/F2tISr4Ut6p+56ZPRP2TB9kPthsupwaBx
	9KbFGft/b29CEBVNDdA1p6QzKVx41JWDC0jhLLR5WSUrqE+t7gI9MQqudjjX39MrWc0U8PXehBjD4
	D3b0jflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wK0-006FJB-06;
	Fri, 17 Nov 2023 10:43:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wJx-006FHo-0e;
	Fri, 17 Nov 2023 10:43:34 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9c41e95efcbso258356466b.3;
        Fri, 17 Nov 2023 02:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700217812; x=1700822612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KytWGFVWe50JiVBLmixmkE/Vv8zIi4OOZ/6LO+g2zKU=;
        b=QUtdo9hlCNrLzWmjE3hObfB9TaHiNrdjEzORWUm595rjIMgT2hj/8K+42XL+/qdFR2
         zuDLXtSIm5VJqOvue5Alm9kIoQTpLQhrkYsgZwVaTYWcQic+YwqOffoMuwx+GdvUYbRy
         YweiY/9po4YRpZc3kew45mARLKYVAL0hKZisK+BUWMYxuvujxg0Vp+Ysg1AMm1x4IpD/
         7KVpmGIJRX2ua360WxZIcdkuUwido9OKczRbOQtcOqo178V+HGna6OpRNBR8FwwTwZ/L
         t65N4zYSBxfDpfRZmeF4gp5+/ARn0cjIX/iAgmYfT+F1P8GuOh2i/BqgvxtLwjZFx6s2
         1HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217812; x=1700822612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KytWGFVWe50JiVBLmixmkE/Vv8zIi4OOZ/6LO+g2zKU=;
        b=kKIawogVuxCOA1pacDN61e+Qcf2yYVU6GVML86QWxIZ2jdW6kE45crWxEW1fRVfeQW
         sxrQTd8SgIWnvetL5emyrvIBOo36FtGKsINEDWHaypruvcMaml5Kc/VIbpLmw5A6ZdOs
         G8cTlMdzo4U4KghQxSdDqNgrpNsaVe/D4dL8y3yVso770BpSu33oP5JzCvQoTRDbeef6
         j2hQIN+CN5veZD3+gZGzC3LTsrQEJ1jt+KKs+KcIiRtFIBJG+/o1P0bFRlaATB0OibrM
         nFXMwVMk6GdNhIs7eKA5jDx41x7/QE6+LUVjxX24jKINF0VyAcdEZ6e3s2hUbYKyd7nK
         6e+A==
X-Gm-Message-State: AOJu0Yxo6w819n1ZE1otdA6b5DAUxUoqI7jDeHmIEThmiKFbcTsCm/hn
	kCmuJ1AlwXXa6X/55iGzfIg=
X-Google-Smtp-Source: AGHT+IESTOK73JmIT2qpEeA+GuKenGE+ZpMedXllgUQqADAyIchIUpW8CZPdTojooyo5TKRyBh6ulA==
X-Received: by 2002:a17:906:3458:b0:9dd:dc2a:eb8b with SMTP id d24-20020a170906345800b009dddc2aeb8bmr11603900ejb.41.1700217811651;
        Fri, 17 Nov 2023 02:43:31 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709066b0600b009dd701bb916sm637388ejr.213.2023.11.17.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 02:43:31 -0800 (PST)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink EW-7886CAX access point
Date: Fri, 17 Nov 2023 11:43:14 +0100
Message-Id: <20231117104315.9718-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_024333_261672_7D4E1DFD 
X-CRM114-Status: GOOD (  10.08  )
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


