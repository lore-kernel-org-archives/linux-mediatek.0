Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE4C197A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJ88IwdiOvkbHJtvRBlItyTFrZZfFt5aS8G00MHeueo=; b=McUI3jI2U+ZxR71cyrcI2wbLFi
	/cM382VKDgi2EzfIxs03hSq8SHvpytO9+4zATU4E2GPKId8hTC9lEr49YP84jjEUpDdypRZwvaGXO
	aB3iE3NKqZOueV32cKCntlt28y30BE54ru9zhbqRd5EO9CE0DRYquWoNAZAWboSu1PkBHU/JCxRPg
	wH3RQiRreyq1zr7u8uOru60cSVByJAQP9S3r08F8RV8xAesw+5679iS1QuYHwD8Cm52C3J+52TyPd
	xHFMpAxi/cewftmfX+H5fcw8u0Wj7ZA9YOE/J4SKaXvdmNXaKyNgOWahBYxhxM8bM6Wmbgym9aHe7
	Adn+sKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wHk-006F4b-2w;
	Fri, 17 Nov 2023 10:41:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wHh-006F33-3D;
	Fri, 17 Nov 2023 10:41:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9d10f94f70bso246706066b.3;
        Fri, 17 Nov 2023 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700217671; x=1700822471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ88IwdiOvkbHJtvRBlItyTFrZZfFt5aS8G00MHeueo=;
        b=lcIn0+OfrOiSISk97uQu6yb2l2Nl+dKpCdVMMZ1A0lK5JswiGEGDQ2/rMzjAhmp6cI
         CowXdHay1VTVjcKjbW4hzIkQjPtTbHKk4B86ECIcLc+Kcrz86WGIL1R8AdJhwRJZUGNT
         VFO2ZlPMR0NGt6eR0DuVS6t2x4CmQKSQOYROwsM6BK6JfmOwA31aV28OLzdvpZIt6zNn
         XTljcPeKvqQQAk2dquGOjZ8xXfznTeHpavh3ys9Of5a6k9DN8IFfx2k2KwvsFKAg4uX0
         CAnXCtAkDS4+MvkOt5fRqtpBEra9jvUhsxrnmPttu1kSgzdeR4QEIZwREqzRcvgiQd8w
         SQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217671; x=1700822471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ88IwdiOvkbHJtvRBlItyTFrZZfFt5aS8G00MHeueo=;
        b=gGDLjF5AuQxD538r3iJZgHgtOynxpWBTdOuh001727mR3NzMH2YuTpRCWyDQrUuj+/
         qUhGmwK71XDZJHDJhnYa6Sw/mhXlNLVGhHGLvfx7YPJvgyHSjc2BsAJlXKA6Muky7vkb
         ReV4Su/iq+9K5YQB3IEPkv3Dbixi8YuXfWihhN5GLQmJ13d2D48hI4Ia82wUEGVf82pZ
         4B4Ct8kCjEHu2+7OImS5VgdC1qCxWIt4WplH2BH/3YcuzNxCBkuA0/01mcz4bOaJxsq2
         jwuGS6HQgIZ1aIZmAC5mECvOw97Clo4geX9hPwAtgrIYSJ6GlX3Ja/gnYzyssFuoAQI0
         +kyg==
X-Gm-Message-State: AOJu0YzmVrdu+09RwyDTUj2uGNToUhi/CcBGXF5ALVuiofZ7Yt5Yef6E
	8YJFOF2oFWsjVcfOa9/Judk=
X-Google-Smtp-Source: AGHT+IFDFSZuerVdE87A34NYgCYoDzSsFybwYsehWhEvfGBZXxYMrZGjwklbhgsWcBs4n+AbYXMHOQ==
X-Received: by 2002:a17:906:3942:b0:9e3:b88c:d735 with SMTP id g2-20020a170906394200b009e3b88cd735mr12999101eje.61.1700217670799;
        Fri, 17 Nov 2023 02:41:10 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ox17-20020a170907101100b009920a690cd9sm639868ejb.59.2023.11.17.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 02:41:10 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add acelink
Date: Fri, 17 Nov 2023 11:40:59 +0100
Message-Id: <20231117104101.9374-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_024114_034846_32836D2B 
X-CRM114-Status: UNSURE (   9.78  )
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

Acelink is a Taiwan company providing network products (routers, access
points, switches, cameras and more).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..503a3caf6fc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -39,6 +39,8 @@ patternProperties:
     description: ShenZhen Asia Better Technology Ltd.
   "^acbel,.*":
     description: Acbel Polytech Inc.
+  "^acelink,.*":
+    description: Acelink Technology Co., Ltd.
   "^acer,.*":
     description: Acer Inc.
   "^acme,.*":
-- 
2.35.3


