Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853DC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=; b=IXyNzRTUXlT0RwmidV6yNqu6vw
	1cK7f5VMZhTgpGoIupbx0/lwYx/l9/7prpWY8l0cPNvMf0jtnbsAPRxj9dWtYav0Sy9yc6SXgf7kf
	W6Irn8onvatAHXPraNYOr4RcIt2TQEXkQ+9QKk+7uhkm/1qaEYPaKOqc6wC9AvS8jAWmiBRzjo7ho
	qXScgRWBGwZZu2XtHu3JcSeheW7x6FwIlEIuGTORPsTpCJDCSBuG0M9VmjBS+9E2FBZoNIG/h8Ws6
	Iqd7JCV5RQI9ZMdxCuLfHzNZ2O1DoJkn+WyQDvAXauzjb9V07VvA7jZAZAiAj5al1N4XJdZpjybWQ
	Dle1xgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9OE-00CA6f-0M;
	Thu, 07 Dec 2023 08:05:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9O5-00CA1L-1J;
	Thu, 07 Dec 2023 08:05:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54c7744a93fso837658a12.2;
        Thu, 07 Dec 2023 00:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701936328; x=1702541128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=;
        b=is6Ns+mPKa7nvZADe87DYxIOPLojUr1hFQy6O/hL81sUQaPN54IrxG5gU/d1gc52nv
         gSVf6M0sBTNhtKPPtYOtEjomYc7tbLFNj40M8gLyPKEzVhdwa/1qxp/j9zdYcaXTdRsx
         S3fdqpPcrPcxVlNWqjpdqBuCj9kRQ9R3wlee3A7UYtxeLOQSvHGcEnXvR47XSUhqOsGZ
         d+o+DDDgkupqFuGF2E81+PK4Muny/DF1RLo64EgHdudHiVYfXqJJZ1PxqpLhf58+7Rfo
         6EsRbgvXFz7SzGmRkQf8ZEW5zYV9h7KEAL/hoCP/+b6XbUrStOFBU5SNKMM8/sFAVx8N
         AfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701936328; x=1702541128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=;
        b=tuKAJT0NxYuJn4l5f2CuHp/z6jvLBo7y7Tnu0HRV21E12ckIKEbM5EeFTU7wbmAyl3
         EmpVVNmva4Kjm9H3JfXFNuqP/MCyrHBuc7GSwrZSzo2WvUGWRcMqEzRvr5Fq1dqX0+7q
         fsw8lAfauX5rt0oan06fjEvg7B4ckuljsJlhpT7AMrU8Dm+c30t9A/OqlJ3zB/PiOCrs
         G+qKLM8IgB+O3stP5ksl2Q4UU8n6V/zT/qILUxA1SmqA/LviOuzEpqR4jM54yo1API+R
         XxAS3smDzwkKHkfFGWpTePFM/M+GSNl0wtRKFhe6ao8NaNseThSYuuy8VBtQD7euCRFg
         HCqQ==
X-Gm-Message-State: AOJu0YxXnhcZXacrtIxvL2U9kA70gWoruv8Lr2Qu4V3qP3g33Ab+5ygm
	CZa8t6yfL9FA1L0otdpYk0Y=
X-Google-Smtp-Source: AGHT+IHGExzVJI0JNZnzMpnT/zA2jwAajmSzwuoeAVX2qr0OGkYdXz3xEXI4GuL+DpEEhlHCu53vFA==
X-Received: by 2002:a50:baed:0:b0:54b:5f8:2df with SMTP id x100-20020a50baed000000b0054b05f802dfmr1333854ede.9.1701936328261;
        Thu, 07 Dec 2023 00:05:28 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a509b5c000000b0054db2b5cd30sm480133edj.38.2023.12.07.00.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:05:27 -0800 (PST)
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
Subject: [PATCH V3 1/3] dt-bindings: vendor-prefixes: add acelink
Date: Thu,  7 Dec 2023 09:05:10 +0100
Message-Id: <20231207080512.3688-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_000537_452025_9F46174C 
X-CRM114-Status: UNSURE (   9.81  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


