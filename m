Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA6FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrFXwo4nBlWjvQST9H8Vmc/AAq+KPWdXjqhzvRRH+PQ=; b=gPNq1RBcXhGShE
	w1Zi8Ijcktt5gY1vBRNQjtiqP1ZI63a8xGAUFjc1SGfOFLcsiETOQ737NfMx28euu5fD1fbn4RiWJ
	wPlUmmj77n2V5fU9v4o5kUWSmsxdU2OrvDcp4yp6sWNNpdi1NcvlnBdUkhgarf4OpHDInu9LG5HD/
	Lv0MfIIKiZgO07yb/Pq5TZdDrnpUfml2lAUE68x3dT6VdbMHeDnREaELUTYFIu8SC7UaSe26Rigbv
	161j4rSNJ3kGtBj736cAuB5qzuUcpTU1PT1N9ENBac6cwJxdBvkY++xmmV7vF/7mNxNxi+PBpiEhz
	gx42WJHpLZUUJ8Q3/OWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KX-00ArB0-9E; Tue, 31 May 2022 12:50:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KH-00Ar2O-Fj
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 12:50:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id e2so18585076wrc.1
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tEjwaurHVMJcwAgK/RtwUwRV4sLe4udXQl3kl+UTRSg=;
        b=VgN9otLsImmOdEiEQMJvVUswrD4KDRye97AzAK7AqCWUNPQYVsT9mlFSLsIyQadSY/
         aMZexslC1uHQp58ZwYP3iI9BCWRdWMivbS7Hr3dRcDbv6jPk93Jd25DZZ17u32dtcvCV
         yFhgBkcJqPBHGYdIAdWlEFTw8xggBm8krkg/8cZTgP10VsZJ9Bs/1nkiOum+CDcLdJaI
         H0v8nJ9I4lnVf05DworpM4fK7iyPyLkOXVEYF9wq5b1Dwd8aEOgF9F5zC0Lfr29aEsxY
         aGzKv3m4mex1HDs9ejM9W21Bsa1rUulj36QUoAjOi9BPIUaeVRggmppd6Y+1bYe+W6M5
         63uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tEjwaurHVMJcwAgK/RtwUwRV4sLe4udXQl3kl+UTRSg=;
        b=A4YSLjQVA9Qok29ML/XSB3bXLQVde7z+lnCKQL2L4RQBMG+s8BNS37KhGJF9eAyF5u
         wqpoJyh8+2nZ5JvEbQEMnhgn1/KEccAb2oBDtQ73ye2JAVB23dUT915aYVdx93sJXzW5
         tK97Z2tLHwtBnnAeNutQc09jR0s16eq0etACpNEYK0xKVNLm3tym6rsonEdOJWW8R9N7
         Q1afItLAZ2MKAn8j2ulTkk6k1RyLb4W64yj7+azLxmozdN4th6EZSxr3ETLeneuHQA94
         5+vHVEYhoKihsR+wc6qMn9fp0AVJ6ZXyYxIT8sKISxxALPQ5RsVPJnohoAYCV67bXPm5
         v4RA==
X-Gm-Message-State: AOAM532Wm/ts6UC1/qGoD4akRnAKxLNxP7MvqJNjDT0BKc0u4FFKmq4D
	zZ/M+co2eAzyHsGqF1LLXUTn6Q==
X-Google-Smtp-Source: ABdhPJz+0xRhbxZOvqm4trzphmBLxipyzJg9E3N2RcSx9CyjqRtqduu5UbyVouSGVHu6621tAkc0NA==
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id u6-20020a5d6da6000000b0020fbc8a9400mr43886708wrs.274.1654001418333;
        Tue, 31 May 2022 05:50:18 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:17 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
Date: Tue, 31 May 2022 14:49:54 +0200
Message-Id: <20220531124959.202787-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_055021_636440_3A898C66 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..7eb0751afa22 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -12,6 +12,7 @@ Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
+	- "mediatek,mt6357-keys"
 	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
