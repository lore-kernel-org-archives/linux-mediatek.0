Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D411DC25B79
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaynX4CLsc9MHihMomyw8yza7pwT0BGnTWcRWzqsy6w=; b=TYqjcu55v4jLF51y/6eZumtZr3
	X/j60j97HYS2U6ynXJJ3JHjfSWhvARY+wxI29DGrc5fqHQYNkW2hAUfr3zYL0pfGCdYvg/R6ndEO3
	VY0Ntr/7Zf1wUskx07lzwodV4fjkiKJrPulB1j0pOe24jsBpNa33zo6G3UjuelDyvJKd+8a/+Hx92
	yLs6erdEYBtrw7ScEf5/Mg31rVEzSHuGqSvER5pCG/bKVL0DD1w5PEyKR8Y1Qkm2hX3MbZRjgdYLU
	gVvh30gQhloJeJcAWCudXQBJPCIXOAfaIQvJYZsP/+43azHblSG7/6LyrWUYNmmQjvUHKN4UMfnMM
	6TJWa7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tm-00000006Faf-3CDL;
	Thu, 23 May 2024 12:50:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t3-00000006EyV-0LtE
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-354cd8da8b9so2045868f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468575; x=1717073375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaynX4CLsc9MHihMomyw8yza7pwT0BGnTWcRWzqsy6w=;
        b=BsxvzTmC0pdOnf2cfN3OPm44m5NYqYEUp8hDKC+asVUe/HYvIAJMmQD4KxN8XDKGvf
         vUe4b7zUfZXjS0iKTBWMBbTSe3BIuZKlL57YUo12qQTwOo4pTPLvaiQA38c95EbmfD6X
         oFWzZ/LLyo2GSluO+gIIM3XN6avhQWvKjq+fSkrbv9WW2jo1Zcalw83TMuibs9mTaUyU
         WI6t1mHwwo9AC3/5IaEmTEve0Fli0thSTokVbopuXocfakIDv/ed4mOFnYePYUw0ldil
         IKHJ9c9StjBZLS2VqHznXiIlNOgvJfs1xdpQjp9z+emEKDDzYtDQjYk292w0tzaSUtQg
         ooLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468575; x=1717073375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaynX4CLsc9MHihMomyw8yza7pwT0BGnTWcRWzqsy6w=;
        b=NBLEs+yEJEeevWAv2s8rBluN4IrP+7Tv/dN4ubFArg7/7nuRN5KgJ9HmUJ5zt0Iv8N
         +Z8uDehS0k/aEtpOxB3EwO7C1WmM1ghZJJB5f90TG7qP/e70ckln6exawJSLc2lbc+y4
         Kw9Xi1r+QzNG7fK9wG7RMV6lcqxWSmgBScFidZDwL14qN2vRJWXuF6Tcq31lCxKImyPr
         kHB6x1+mVYKRbgfUF1gRFNke6yNCu5q4JDSdceaUtqtTarFgBU/5UdGfNdUeGv+Kmxvu
         GxM8w9WfgOfbi5JRAakKeOVQLn3SPECtQwpOfBH1zanYTEu2hdaQr7vFdNGvDZi0uMJc
         XAIw==
X-Forwarded-Encrypted: i=1; AJvYcCWSvrAv78jZo4SA99+vf2cp/LsLVCkIGLT9RUIgT0RyyHOlbhIdQ0N+ZneLCcUILApvoW714JEOk3iRp3pQbkJ9VZjO9lDvSx+XvepWr+UX9FP9
X-Gm-Message-State: AOJu0Yx0c87kqYcHqkVYV0ooHH6Q/AikJs9blqDIDtmKO+Ld83diYVuf
	xVIeHRlCRboqdviYu3dx6wMGz01tud2JfEyCWakaYbcNf8VmeSUsPtRLfSNdOJk=
X-Google-Smtp-Source: AGHT+IHrxKVIn+Ah4T60PhRTqB3+VWnYaiGrW6bwaLsVu7Mv9Ph1QZoghW7iJVxfZBri7m2KYPvfcA==
X-Received: by 2002:adf:a456:0:b0:354:eb35:a02a with SMTP id ffacd0b85a97d-354eb35a23bmr2884242f8f.70.1716468575603;
        Thu, 23 May 2024 05:49:35 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:20 +0200
Subject: [PATCH v4 07/15] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-7-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ofsgAkx0Hd1eRdaHM58268obvfR9196ltfSHKJAspXE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTCd5N4Za7TkELJ09Q0aesgnC7TN8Qoc+T5A0V
 knVQ1uKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURTLbD/
 91F9gMAuFOYgmF+MAGvE/cY6jranhCAPq8fzGOEdtuqzJ0p7AOpHHhHXC/kZ+OIZabzd3pf02nCIOn
 XfCymikLALbvweG6G5T5fM0OQkbYANV3defBGV6hFEMjjh5+LZNLSiofRDeGELdRtHc1HtMC2OESWU
 rDVqy8dLnMYO3MdwpHahhTpT/KAkgOR5uGW6TxFpzYJsNjqPPObt6YadpJiH/RoEY8SgrQ5yI1wlro
 EpO80JbZqdH9bDyMVh+NxuN22stpZSh9E1ag3pBuAxW6O7/kVG6nvcsQz84BkZH4H4dZ5xAbziAFBo
 zqe4BxJnDoqiq3iDkE9yC5+pa+1W11RCh8o833mRoz7++dYlU7mmP7kxT24M7OxnReGfOUl+uoJv3g
 lZuVZvMtv1j/eg6pPRSKC+lkXo5esu+YST/8MJ+fhPW/9GdgzQ+ZJDtcMlyjH8MjwrIW9b7UBoHEAC
 UOaZvloM4OTolWKfTSswUU4PCvUhvz4WcOOAX4CLj3PzO6KPNjMawmZJcpAGMCV8Of+ouSJo5jAoP3
 XFpQuf5bzMOMrHSwFfe/uXvejPpv5LTWaKFO99pcG+Y52JYDWO1mZvrDJltWEsY6XSZGPe+O2AtMh4
 eXpg6UyLhdqHp72CcnTYXFaKbknfZkhCtEoFjXk5X1wmbLUl95NOMErcdEtA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054937_333903_28E9789A 
X-CRM114-Status: UNSURE (   8.19  )
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

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 169d054d81ff..21b93f356901 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -31,6 +31,10 @@ properties:
           - enum:
               - mediatek,mt6795-dpi
           - const: mediatek,mt8183-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1

-- 
2.25.1


