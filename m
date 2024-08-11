Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E799CC52D7B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHTvHF3MuIrehZRyYr5ZNOACu8Umul1Ou6KdEhJmaog=; b=QNarHG9PPT8AONSBEMGYkc5iIR
	V+jyJ426oqyuWVxdpp/eX0OF+iX0k5Qu8Utcnqc9jK5qzM/mTGI/H+/cY2KChTwhJdSVUCDAD0ZCR
	ndfb87Y5eyMJ9uNpYauqW9z/k2VbwydkzN6ZgG/fUeZytJSoyDkl5S96BfJn1fAStHAlobX/QOksi
	+HYPZ4WX89g3pfIWSxT37iRRIV3TqXZNkLL4kClAm2GaxMx0+ySZ/KPhoELRYlVb9CUswY6R/1O7V
	IVgNhAo8TpBGIQo3iPnQHMgEQUvCF0Xn/AS24cLzmnxwOqvR88V+Q0z37fh5Q1N++ecNqfi1eqDyE
	o+7uz8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdDAz-0000000FwSA-2gyh;
	Sun, 11 Aug 2024 18:20:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD8B-0000000FvSb-3s3m
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:29 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6117aso1484345a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400246; x=1724005046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHTvHF3MuIrehZRyYr5ZNOACu8Umul1Ou6KdEhJmaog=;
        b=PVu+hPpa/ccpZ1KqfBRE3Apz1wYMswm8IWHlNjtWatFUQx2/l7DIquE/FoTT+3DgT3
         W26GIJNZzXkp52GOsbuls3ZnhkcO5RA+wZRfv0h7Zc/fM/aoRlEIUi2JwVJ/VBLE250v
         SJM5VfcWM+VDkkJOCH6ZN8MXOQa05O/lFq3ABU4fTCiDcvKX8e9f+JcGAhLieaV7JBs7
         xjJN1oAnEHu/YAxG+FTAr2+/1KMgEE0jPuju/PYNiNH+YaOot7H2i3g7lT/lJwhGCwXZ
         UoSbN9CWPLN7xOxIwSUpFKF5Q4k/m0zk41Kf4kt8tJIKQQcph1QnG/PtamsoARdNkmOu
         XSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400246; x=1724005046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHTvHF3MuIrehZRyYr5ZNOACu8Umul1Ou6KdEhJmaog=;
        b=UldZchX05djc95fVJcGTR+blaycauMgS7CmiN0k5Q0YtLZnXHmbga3ESpF5nnTEkgG
         RbFua/Ulwi3SHgNmfUmifhEjn81w4lWMflSJD4YcxJmzhjTh8N2RQGLXmN+1vgq7Czhy
         BUfAoQDgf3RRLO2Fyvluz1W5zUhoOzEbN/sYuiVfh2s/BrETAGIL5UAlHkO8C71/5RwR
         uPqxVNhiv0ksTot8LcAzjwj8ENjmQk6iTbuGp9KoAfGvXokTW5bKx+H7NY2XIqc1knhU
         x3d34QJQZlXmiJRkct/ieUDNwpYZJY+48HYEzgfTjJlLAp0hDGSzlg1Pk6ijoouSx50J
         Rw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnOo9uJHt5b60tDqZs7vLATwwiFPzbVoj9t5R46sXc/a07edvPfx9uOytVsjm0i+1F4YA6uOIMgvc0thegkkWuPjOO5WfYHO4R46yrFprCFfB9
X-Gm-Message-State: AOJu0YysXUV5IJs2415UxucUwhJ7Ks8S1Y9DwRUHFgw/LGByhRZY7jf3
	BUSQuzSxcAgzyGxc1m5ZCtsOa7EIl/0TY9lC8NwlJCS1DqjKwkhFqoipY+XH5bI=
X-Google-Smtp-Source: AGHT+IEmj+sNFihQ08rrfGWG3a26LT65ynSemEMCSGFHc+3kbvAO24eNC8gMDj/QsltK+PB9TZrL9w==
X-Received: by 2002:a05:6402:1d4d:b0:5af:5342:c5c0 with SMTP id 4fb4d7f45d1cf-5bd0a61c193mr6401870a12.23.1723400245584;
        Sun, 11 Aug 2024 11:17:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:07 +0200
Subject: [PATCH 4/6] dt-bindings: gnss: reference
 serial-peripheral-props.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-4-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mvi7UVUD9P+O/9ZF6mKgCskHov/XbgcktorvQahRWR4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAph8zdk2rT4gjVTPNarYAGEQtTiGQ+tPDnk
 z+uS96hib+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAKQAKCRDBN2bmhouD
 123oD/sHJtccDxWIKerFfLfEW5rsmWD8qOVMuFTY5l84PnocCY4R8F48r/EZSn68llNA+9ZmLq7
 9y4ttt7gyZ1Um1LtQGOU8iMx/qOwFZlok9n7T6s6SNEWutgQ85Xl9pxuwl5nhGZfjbRxmryrU+c
 Nbb/X57g466nS9vp5O+if35f1HiFvdexj49/cl8NRRhrz/o5rvzThuoTToV7luXIV29oZNzH5qj
 RPaQGmcInaS3hUxQLNrWSHvzUct8ekruhnD2WjqupAhLCeyHqy0yT0mthXLNwcCl8DWpHr+eCqF
 x9r5jHVkh64bqoaU4qV97KLjsUmLS45x+MLOERasuGMtosuSTgRbOgTwTeo3SxCBTppolrEU5c4
 WhioFU3jjWEFUE6EywTduzyjPM0ouHpjcpq+Vt+e6OC2YpD9VJ8uGgm3vHx7tCxd4dOg5Vwojb3
 Opv7ut5m9kkttwlw5eTtVdHGnM5aUQYUcfottSPuu9X8pbalTs1G2ao64JI+pMXQhr83YYIQie/
 IsQivDNOtCtYjJBQz0ReqTca1rXa9u/cyxjVCKnoe3ayenxbNDodPnH0cqBFjoqINN369zhGZ/r
 WW0wPHp7Jk3MNChrIcW0xpivPckAHrPgdsROnoCBU7UGO4EgsRbyY18FTfCmP3l9W6JQ45/LM7c
 Howv8GVMJJo3Mhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111727_982887_887058E2 
X-CRM114-Status: GOOD (  12.65  )
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

The "current-speed" property is not a common property for all GNSS
devices, but only to these connected with serial.  Drop the property
from the common GNSS properties schema and instead reference common
serial properties schema (for children of UART controllers).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.  It depends on
the serial patch adding serial-peripheral-props.yaml.
---
 Documentation/devicetree/bindings/gnss/brcm,bcm4751.yaml  | 1 +
 Documentation/devicetree/bindings/gnss/gnss-common.yaml   | 5 -----
 Documentation/devicetree/bindings/gnss/mediatek.yaml      | 1 +
 Documentation/devicetree/bindings/gnss/sirfstar.yaml      | 1 +
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gnss/brcm,bcm4751.yaml b/Documentation/devicetree/bindings/gnss/brcm,bcm4751.yaml
index c21549e0fba6..089166089498 100644
--- a/Documentation/devicetree/bindings/gnss/brcm,bcm4751.yaml
+++ b/Documentation/devicetree/bindings/gnss/brcm,bcm4751.yaml
@@ -18,6 +18,7 @@ description:
 
 allOf:
   - $ref: gnss-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gnss/gnss-common.yaml b/Documentation/devicetree/bindings/gnss/gnss-common.yaml
index 963b926e30a7..d4430d2d6855 100644
--- a/Documentation/devicetree/bindings/gnss/gnss-common.yaml
+++ b/Documentation/devicetree/bindings/gnss/gnss-common.yaml
@@ -35,11 +35,6 @@ properties:
       GPIO line, this is used.
     maxItems: 1
 
-  current-speed:
-    description: The baudrate in bits per second of the device as it comes
-      online, current active speed.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/gnss/mediatek.yaml b/Documentation/devicetree/bindings/gnss/mediatek.yaml
index c0eb35beb2ef..2b9e5be4ebf3 100644
--- a/Documentation/devicetree/bindings/gnss/mediatek.yaml
+++ b/Documentation/devicetree/bindings/gnss/mediatek.yaml
@@ -15,6 +15,7 @@ description:
 
 allOf:
   - $ref: gnss-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.yaml b/Documentation/devicetree/bindings/gnss/sirfstar.yaml
index 0bbe684d82e1..7e5da89a5ad7 100644
--- a/Documentation/devicetree/bindings/gnss/sirfstar.yaml
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.yaml
@@ -21,6 +21,7 @@ description:
 
 allOf:
   - $ref: gnss-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index cd80668182b6..7d4b6d49e5ee 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -8,6 +8,7 @@ title: U-blox GNSS Receiver
 
 allOf:
   - $ref: gnss-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
 maintainers:
   - Johan Hovold <johan@kernel.org>

-- 
2.43.0


