Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7E8C04FF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=; b=3M4Z4yJAXNhyQjY4gZQydXIbA9
	ymt9LU76ZQPSdDycs/akinHlfT5nhRezyJ1p9nZvqguuBygttWWT71Aubu5QBjvqjU6SopgIVZm8o
	oOc8TFokXzu0d8kUe9AdA6wqewmAiR9AoFHwMknEo41oqVZHN5ruCL5mFpGtWjMqx6DFn2asAC3lG
	osy107DrFQNBz3mwCHAkbaUbuBmKHhxtZZ3eyquP5RLAr3sd2dqVnG6d3/Dc0LF+wrEZp2zCienyS
	VntPKP6LWnfK7KyqDvuhtRQCR26lZPELTp8HYuqmcNYDzYjixUBASFz6HlGVfIHtKcttO9RQ4tXT+
	ZJZrf2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSat-00000002ZHL-0ZMk;
	Thu, 18 Apr 2024 14:18:31 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZr-00000002Ydq-261w
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:39 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-418e4cd1ffaso5421755e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449844; x=1714054644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
        b=FuO3Mkcs5lZ+SziTB3+0VzcRJpK/x9v/KhqfIxJxxXH+e4eplSLq8RFjZPxA3Jd5y6
         9DoBk1IqBuoDvdKJVzGKyIElHhSxzej5NODJ6yBHh0pk0BgDcRQlyT+eHw8zGUP9aaPH
         bSMxrbbz4hDr0tUe1r0zxbMe/6jKt7jd5kVCoUC0CmrCMDcIEnGedXQ8Jnuw4PRVsNvr
         3JiVffmOOsU/ywreLDxjVpqKFaxNzOwU78BheO1VR1e8JmTmgREbFdmzeej0htbGtJEf
         BqqN+QUCOdBehte6JYc9KmnfhIJCtvxvkIBc/mSPCRtpzjY+HHMX090B1PKrokToaB3C
         51WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449844; x=1714054644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
        b=aIx0OZ4dvw98vOrD1i10YYwXygvTfpKSMrRVkL17JlZCNZRJ9vPOTTk5cfsf+RlpeN
         9Bb+AD2+9o4VS+xZJaPYk2h0NchQmGN8esWa0rFVWjvQCtO3JuXL45V5AP9nwZ8pyiOv
         cAR3gFBnP5GaAM0Ybw7+xAzGAwIglAiyZGGSwLMOK2kTXTKa7lRBDhK59V40oBq/2oSz
         mIy2aJ2LccRhzx1x/oIaccsqj6juBjo+VlMTqlQZ+BSZgTS620DFmT5TP2FY/lNplWxw
         Ku90wQaF+Fu/xdoEnOOWBhjylgOWpCY8k4qV2HxCvd6wKA0L7BVJrfqFJfPQVyQ8cdIQ
         olpA==
X-Forwarded-Encrypted: i=1; AJvYcCWp0Yg3+WkSGWSpVP3C7bhM8Yg5b9lSxT5LPZ+LPjDVENSBDaLOSag/8lSWI3PdwOI3McDjTUP/5DWZWM+4uRAFNK5GAhsy0ZzzRqIkY1Imh1IV
X-Gm-Message-State: AOJu0Yxs69tN68NRAh77AcdywNKPX6+jEQTTS0kmvaboqXkWNgYYOg0A
	3r07+EmrQSsbIoeIQf8H/bKRwZmRJ0yJtvlM1kXs6zSc1hPdju+SyZ5GLkIW/WY=
X-Google-Smtp-Source: AGHT+IFZpHUd3KKJqTG8Fspa5WV+CGK6XUr6/zHywZgyWssPB2EZ3Ze0JTvaDZBJmIElV5Y3Uwlkxw==
X-Received: by 2002:a05:600c:3555:b0:418:f400:4af1 with SMTP id i21-20020a05600c355500b00418f4004af1mr763350wmq.38.1713449844499;
        Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:57 +0200
Subject: [PATCH v3 09/17] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-9-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=muTuIXTt3JZ+adeVzSiBV0lvPUUpPPEXnWM8MyjFIfI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStje16i3Wmletd3SAhUG1Wug6cEanDayKjSNnvt
 7/PVI9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURfoOD/
 9gj3zgWQpv4BHx8KjNy8JDlZ0g1G2rz8wn3r/LiH75+rS9z1En5UetLdAjaERRHZRZFnApgNefHFvm
 MDqQyGfUNJk8+/K61L1TliZKKv4e7NyIbin/nzyCU2ZvScW9eQxofpZTZO0SUHHLr6cJB9HmxfXjvq
 7EZukXjZ9rKSr7fyJEqe3yx+illLUJF/RSIQoYIU5LhqZYFAPY4JfzmCJIgePfDpRJseUCthCgPsvX
 7mFUINNRHx/ngBxT+lcn1n6DlCXSPEeDu+9iRU1p6tvedD1g4zkXuUIIX93hAyG3bNF+OkBZRXdcLa
 W8FtyrgbSrU3nJ8MwP9OvtHimV9XIJxNY98EmkrY/TvIBasg8Hn/8qDhYKBkjvlZl8PtcgbIIhSoL1
 oby07eKpk1xgzf8eYmyXTdOEZumXcxUvmo8Jnq0Zl44wARwmuXFwGwq0sB3BRaCFkAckSiMAlG2lfL
 cjqdMhKJyn8pTYNVlo+Cvls51wlCIvir1CdnwzQxlv+19DIxt49XPXFUqzto64HtBCleLlVYJElILG
 pXA/MBvVLLFjgWV2X1yGSMU5yKcfqCOxKSgyn5RsRHQkTYFAZTuvQ4AEocDh7tppX/ZrjKKjWCqaeA
 IIzKhwiqMfM6d9/X+qZpbWPzvVA5mUeGTrZihTQmAFz1xemNVViMYtiXHzlA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071727_625569_A3DCD717 
X-CRM114-Status: UNSURE (   9.38  )
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

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index c471a181d125..d55611c7ce5e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1


