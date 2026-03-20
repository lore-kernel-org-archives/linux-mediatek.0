Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1735108B8F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=; b=Am5gx93B5gHT06+IblKe+dED8u
	oZ4lFkCv1Zw0tO0w/7Klj1Wi9B9XRpVvHVl9aAnrJGQwEZGNG9e6a/95ZKxfD13DArXO7WIBXzI5C
	mXBGcrY3+8dd6vkFYh0FzJuWdXGBpSgXmPZZs0lZAZvDOG9V12yydHaAtPGW052gbY1rBXWK5fjxJ
	B3csAbq7ubyU7fIJeXG3uxWzg+fM/ysdWFHMTiTAckXId48afUQo7CdtTT+o3/DsU9Ta5rHs88VMP
	dSI649vL6VoegwIinOLoCmmAxXQ7rMcF+Wxv9MswEYE0oBBeq1HeT1/8fb7uZRB9ZCfIfOQ7qQgJ+
	53TbjG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYw-0000000Cez8-02IR;
	Fri, 20 Mar 2026 10:58:42 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYs-0000000CewZ-2ElM
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 10:58:40 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c2af7d09533so1326897a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774004318; x=1774609118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=;
        b=CTg6Rg8hOn+Az6rbC5ts+roy0HGq8RLIcALRXIjzlOFSRvzUppO33PPtpZ83aYJrm2
         cu7tyrE6U7zSocz1mlreO3alNU4x0zWgJC/9NRTMKqnZp6riMIFBupq9RpiZ9jF1ehBI
         6zPQfglQqVWzxJNypn2fuGYADOIzvai4BNV8/lKMKkY6F3jjSp+vEw7fMBIQDZUELmmB
         ALwdjo+7Hhhnvz+0GaZBX/oiW4L+iw5gPplVxVQa4D1eTcpYqnVwjgb4xhzH5Q7ySl6M
         z6laf6E2iHGKTZxxOg9wPWfwUjcaP3fRRn7B1oA0YXh33UkLZvRwxqDr+d4LKkoUO5Z5
         TGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004318; x=1774609118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=;
        b=KXmiXdBbeCDxg/X6F51TCk2QNTPiOFtH+EkpzcqP9jiDXUDlux6m7Uo3//exJEpxV9
         Vs0822kU0YcjJmjQsZvdYq/fMo1QYBtbtgRAyO14+ziXGV5D3TW0SmomQqG+A7E2/xPl
         YbflxKppTh2ujMkEV5qNvjUIz2I9arpDLL0Yqxtdos3SKY/4Yue6DDEch8NXEabYrLq/
         YbHALECmQnTTBkfe5Zb1GQzoyUL3IJ0FZD1Dy2M1kO9BGYkNbuL1yZ0M3MxmmpY3K7po
         90gKp5XGaacIVkOs4J5bT0Q3yc+tWSqd1nTgerERl48fpl2xmtZtZeXb9lEzMmCAvgT5
         M+gA==
X-Forwarded-Encrypted: i=1; AJvYcCVJKuY9GS1BN13eLCdV92tkBH3wo27meuqyj5+T+mXVdWXVKsUJZlL9XAVDwbNZ0F/hZME3PSact4Gf2t3JfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3o1xD1KbIVmPc4HICMUy8vh2l0FEnsRLFnHePnOELCLs+w1V
	hgY/95fxrcB0pK5pcgIFw8br519i/wn08oIyLUGC4+mzisUcCjkfduw3
X-Gm-Gg: ATEYQzzaAosE8NLIi+5HidmbBd2PW/20QoVOkjhIfY2cjykiZaO2rEJpJNXNRPZSfjB
	Sr1sWk86EYOz+hykt7/baLtM20CuAtrvB0jQH5Brn8vtk6y7ae7d4ovNIKl3Rsbe9qyVa9wwo91
	MhdpChxqAuOgaZxVpNLGVrO3jyxEMwZcJrjPnr5h/KwChnLJpaVemaALR2nsMz/nBX7qBn3a6Gr
	69BVVhH9Y5MGNIQVAy1vwT9HMJZV4w2wIQ87xd9txdGYkEB7mWL9Df7J4XbkacbLiFlkqKHu1sh
	hsBNxUoASwgxeisloJ5Nk4Y7uK7Bv8x6t2+Pc6iMR4f3VHbb0e3vT63iJpeLfX1xAy/kF6ccqIz
	AMSHid8vSU0LJ8WBGmQ+naYsIkJ82YU1envVeZMKt+SKj++7TCqMxHg1MMfDNadtyGrNiJwVXWh
	POePhuVcgXqBpeRho7XJabmQI/HyFWPD0Corr082wy3c0xu0ybOFwtQg8LLIMfwvj+0Q/4LDUM7
	879A4gaX0expNqx2w==
X-Received: by 2002:a17:903:244b:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0827e926bmr23836145ad.53.1774004317735;
        Fri, 20 Mar 2026 03:58:37 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm25636405ad.15.2026.03.20.03.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:58:37 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri, 20 Mar 2026 19:58:21 +0900
Message-ID: <20260320105822.447337-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320105822.447337-1-akkun11.open@gmail.com>
References: <20260320105822.447337-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_035838_571460_18ED2CC0 
X-CRM114-Status: UNSURE (   8.24  )
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

Add an entry for Lenovo YOGA Tablet 10 (Wi-Fi) tablet board,
named b8000-f.

It belongs to Lenovo's "blade" product family, a codename found in the
stock Android "ro.product.board" property (e.g., "blade10_row_wifi" for
B8000-F and "blade8_row_3gdata" for B6000-H).

The "blade" family includes several variants with different screen sizes
and connectivity:

YOGA Tablet 8 (8-inch display)
B6000-F  : Wi-Fi
B6000-H  : Wi-Fi + 3G (Data only)
B6000-HV : Wi-Fi + 3G (Voice)

YOGA Tablet 10 (10-inch display)
B8000-F  : Wi-Fi
B8000-H  : Wi-Fi + 3G (Data only)

These devices feature 1GB of RAM and powered by MediaTek MT8125 or MT8389
SoC. Since these SoCs are tablet-oriented variants of MT6589,
they are grouped under the "mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
No changes from v2, so added Acked-by received in v2.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..ab3c5b1152f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b8000-f
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.53.0


