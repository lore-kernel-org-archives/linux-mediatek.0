Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D2061168
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6D2061168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RYfxI0OZSghy7hkC76EAe2xo7r1kgv0LrJW9gvIcL8=; b=rUQUgvLWqIyYqS
	tAhVIKoW2D21zxWCzp8tIg3eObaxfCm1qgnfdIiJ8brgzG6ZN/7kc2RCjP9XMTXEbCnQSYPeUCDRT
	6YnXeZYR5d2nA4zCjO0hvN/LEFbOSCLNQj1CTAhuxgFvyW9io2MHZqs7d5Eibz0OP9RGzbQqZW3Uv
	50fZZxomvYBrG9PkslsrjuI0jghGSwJxwUZ55xuaiWMuh2/53CAjix6By33MqXAMUojmY0ybd1Gww
	uGRaRFdKK4K40aYTemVn+DTgvxOdme7H2YVMehR1nr8VRLxELkDyisKYUU0/eh2+uMFOq3E1WpFqk
	8wHdbVesd/imcBwa6E3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktcZ-006DB1-NZ; Wed, 10 Nov 2021 19:50:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktbt-006CsI-Pj
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:50:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n29so5905902wra.11
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvmETFDU1aZRyg9GHS+FGtvzWa39IdshgN6HuoFmqYI=;
 b=dKuxtI2584RvobmXc8CJP3nWR59VbsiSNVrW+FbRSzx2kB3wxpqGivnSRkUcp+4oZO
 lzWMBSPeC5rT0BpFt0LqmblipaIUtKPqVoYM/N1E8gGsmCOHEjbfv8CztelutewnqNTo
 Hhb7cwYhtPmnkx2/NQZKwhXVIfeqpiFiI2bnGiIHQfMyE2+Ml1lzfc6Maz8R/Oo8DVVB
 2JkI1YYbZfiJjJ6MR4jdcb9FXhgS/mj9ivAhVAKHnT8/O7rkfFakekn9UqgqKKHaD4ad
 VDeqnGPDJdCa3HgNZ1Fhl6jFv7I1d+UMvXXiqyVoogMBMl/9ientCN5Nd+RoFByj0mry
 3HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IvmETFDU1aZRyg9GHS+FGtvzWa39IdshgN6HuoFmqYI=;
 b=N7hIT9WlMIkZvGmtR1M4r8U5A1uEo18xbeN4UwVrSuFO2cAOUSxRF/dnViBSS47Bt3
 rabsQ1GYN5hMxbczJSG284a2jngtHbHg41yzlcu02uuX+0WEze6Kp/3yJd87xmktS7OU
 PtL2p6J3zmzm7bPtua70CDLl2WUhOoW1vZqL7jyJdHeq1S9OQoCuIHxGVya+RarU7ygl
 /sI829ffgvbs7xphiNEsdNPB11Ir87aOKJcPDPD9+BG37vkGc4g884ysi5J8mv2Rwauv
 8/WCZ7SeK0fJEfpg2PrtOZcsO5/f301zkoXqEg4kOd3Lth3yLVS14IyEV3XW/6mcJuKZ
 Y3Jw==
X-Gm-Message-State: AOAM532nw4Zk+B3J9TpoA5qGk2qnDXW1laKPlvzpn9uFp5wSm5DmOLDd
 /0N3MbJAK9n2LkS08U3+W8ejaQ==
X-Google-Smtp-Source: ABdhPJyt91L5dhbRUokBF789uCxIJneb+BFFENpsod7T3a54QzIpI6DlYXnYJQHB/pK/KpbL5weNvg==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr2028688wrc.204.1636573816415; 
 Wed, 10 Nov 2021 11:50:16 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k15sm750935wrx.53.2021.11.10.11.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:50:15 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Date: Wed, 10 Nov 2021 20:49:57 +0100
Message-Id: <20211110194959.20611-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110194959.20611-1-fparent@baylibre.com>
References: <20211110194959.20611-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115017_857710_AFD813EC 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v3: rebased
v2: No change

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index af0880fcc22b..843f3b22e975 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8173-i2c
           - mediatek,mt8183-i2c
           - mediatek,mt8192-i2c
+          - mediatek,mt8365-i2c
       - items:
           - enum:
               - mediatek,mt2701-i2c
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
