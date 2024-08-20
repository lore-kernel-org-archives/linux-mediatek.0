Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1285AC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkKGSAKuHmkOcXhq4rTBRZZbsedAQGMKKV0Dw3RFXH8=; b=4pZ/niWqo8GdUjv/u00brlM4mU
	pm1pg6KU8P7Y203vfOy67IdPwoBGkuOSTJ8w5NEKvwueTsPFFaNTlcu7nBrrpsjmfxkALw2pW7kiQ
	EdT1r4U5tJXspovf1bOPlGsn7XFJrCUra0aKJHuMN3hAPmYNNYCanVdcNYHA7NmSDMKnAKTebY+rV
	qOQi7jzGxuvm3l4frc2PhG7nBm3O/Z/oKIY/7EAcWNygDgcu6+5BgvQi6FgI87YJyTqyEX80XXR5D
	XrdNgDD0FoV/3m2rn3RKPtoYmk2eV7wDjOFMlLDliKdvBcw/FFN4XpBKNNVnKXngmTCmEbnrmx4V4
	grJciyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJuO-00000004KEA-2eWI;
	Tue, 20 Aug 2024 08:08:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJtb-00000004Ju5-3vVX
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 08:07:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714114be925so149895b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724141235; x=1724746035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkKGSAKuHmkOcXhq4rTBRZZbsedAQGMKKV0Dw3RFXH8=;
        b=W6ldkmGddbjLXy8lDi/OLTOyxV9bF3V/kWkSQrRx6No5cFy/9MZGAwZWAPsSh2WQws
         O17x03Zk8QgOu3kgc2rGLl/ToARzD67wFAyg7VLmZKQ+ufPvpzO0Y8LhO8NuWP6pFqY3
         MSsFpo4th8BlbZMbY1fXxtpAB7lRx4sHZHxd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141235; x=1724746035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkKGSAKuHmkOcXhq4rTBRZZbsedAQGMKKV0Dw3RFXH8=;
        b=JFJP55edPjPcjbvTrsy/4RfnxeH0URS9Q27+5BzyaQFyVSra6fs7aA84JBmQbgBFWt
         /xCpYxrz64aFgBpGXjpVoahmqHZ5g/HGe9ZNGiHKELDdjhrDqXgtldt2WFddUaAgo4/m
         zTdheddRoq6ZScXSSKhRenhZd8B0usAA0yeig21oI80stNjwzvHCYbqpz0ZIBYIRLuk1
         QFa3+8Qr4R84MBVqKvlCYW2pSofCvSjbHAZB9BEDcBJ8/OfW6GYk1xAKy4ZdZkvPRMcB
         ZFLG8Gl5/mcwIS91iDPibW12nnbK8aDWiKfbuRlKO8fJvxclhtl587+pBOGW7DFDHtIS
         OrpA==
X-Forwarded-Encrypted: i=1; AJvYcCUKgCfZEDYbSVAlkQFcDD9wvbsQmTrxnvHmp7m91Gpccx6mOlnT+pTjUAqKVZqyPehWVZkf9lhG1/h0hMiVAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmyls5lbXjN25PtKR4h+v/aC+DiZ4FENFqYK3rYmD3r0EonaZk
	Us5uJ2PQChbUVpCQImCPDanK4UgsYUfurabmcQH2ZhcjFYBK2DVeNxl7JxsCcw==
X-Google-Smtp-Source: AGHT+IHwKaoQ6zqgeUDaUr0M0mia8HrEnOi0MHVVZtaxLErdruMh0fQ5zoE5wSNwv2WofQFKlv2X/w==
X-Received: by 2002:a05:6a00:2e1c:b0:710:5a64:30d5 with SMTP id d2e1a72fcca58-713c4da0349mr17959374b3a.6.1724141234688;
        Tue, 20 Aug 2024 01:07:14 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7c6b61c7202sm8829978a12.31.2024.08.20.01.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:07:14 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Tue, 20 Aug 2024 08:06:57 +0000
Message-ID: <20240820080659.2136906-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_010716_003182_7AE7DC14 
X-CRM114-Status: UNSURE (   8.73  )
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

Add power domain binding to the mediatek DPI controller.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..10b8572dd922 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,9 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
-- 
2.46.0.295.g3b9ea8a38a-goog


