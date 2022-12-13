Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A68C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMWE91a+pM6oT2mNZ7gfHqIhmh1zpfFSCXxbfA75K/I=; b=BU8aaTXWfcCG3qyl31eILdpLrK
	0X+HOuEZiGbfhXrf5AROAdcUVCHEdEoSVdWaj8gbJjvwp4SFpMxRzQU0xB1VAtQQ4OL19+YTZWAVj
	IsWKVkJRqXvdU+OwczxsEF7skGQ9Whba8q8khcAD6QOPrxUjddklgS3snMiKV+hygHBBKJDyX82gJ
	JQLgu6xCeWwNBa1ZSfWfECeng/Aj5yvHn2lmyLHKFZz8dWdJGlgo7G/XfBDFnEpDnCOoZfjOpuvCa
	Jnzax3jmg21j+gG1PbB4LRxgYkbfne5W3sGFzGPWeabE6bovCo4o5vA7Xww0Knt+M/b79OeVoCuzD
	WtYXs9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EyM-008CHY-Es; Tue, 13 Dec 2022 23:46:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwI-008B1V-Cf
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:44:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s5so20171528edc.12
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMWE91a+pM6oT2mNZ7gfHqIhmh1zpfFSCXxbfA75K/I=;
        b=KjTg7+fHnrZSJ9TzbIsuime+L1iUIUwcVnapNP7Kz2D3un0pTvjzZ2erx7j4s4gVEU
         q2O+Vn65Z3QsWnPwgojrcUuASdZU9O7eDJQMkV6U1OxmSnuYP5GNYwZrPChVe8WFciB2
         OiPvOOHpgKhu/WeZsxcNCVhLDYqw81qj4+mqLePCEsClvo2uz5DZ+UF9meaL6L+aGPpP
         otkWO9YYIY9wAzU4O+wq71Ly0Sh4qD1zTPYUhH+bPgPaJE+KDqUgsnIMAenQaWv1mbIZ
         vvN1y0vi2rSHWWPw00xS2aB/KQb00bBRXp9lm4MoZjLEx+w7ivYWFXiITBSHqTzALnmc
         NFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMWE91a+pM6oT2mNZ7gfHqIhmh1zpfFSCXxbfA75K/I=;
        b=lxFv3lRO20oAgdkT5vxu8uOlyfOY9F29A7dMYRC4eWA/i6673QMgREEr79l0ugI6dJ
         xS/aRa8PdlKX6EiD6LGU+Fjlqld3nxdDS2rvtczb1KJIWWNwIsYRRqgyauvkoDpvFmTN
         rPklyA1QFJHP3AGOxOnPkkqB9NhUxnd0v0aCGSw7GX6Jm70Un/KkhrPajqATFtAzIC61
         4Q4Xyhcr+gTyoZqeyuve391lfkrwAfiS5Crp7TgH4kTpT+16mD09eydvli3S/ffXgQhv
         yoL5ve0PXyC+xXO89tAfde/FiFAoEfm/yThIF7jYHqBqccobklZ9GxP1tYJoALBXUmM2
         ShKw==
X-Gm-Message-State: ANoB5pkmDyAXHRiuHYZt9BEiO7pqAWT8GmlGurxxr0+SxAHF1DRUMmOM
	CGPPK5Jvkw5NR2tv6tEbMdL9dBi9D8vmgSeJrCs=
X-Google-Smtp-Source: AA0mqf7VY+UGWGAMmObwTeYssJFUqQjOW3MtCDrFoe81hJCUG38R80/7WKyZmkUHMO+BOY6yug4ZPA==
X-Received: by 2002:a05:6402:913:b0:46c:fe2d:a588 with SMTP id g19-20020a056402091300b0046cfe2da588mr17564775edz.18.1670975035226;
        Tue, 13 Dec 2022 15:43:55 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:54 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Wed, 14 Dec 2022 00:43:45 +0100
Message-Id: <20221213234346.2868828-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154358_484049_C48FBBA9 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.0


