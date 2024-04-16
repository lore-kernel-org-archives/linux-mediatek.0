Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D7C04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=; b=TAk0HUZ/u3G67HuU16zHu7NpwM
	VSQLhyXFReTkkNMKHn1BnTF3N2PsLOr4Iuh6Tg0PchAHsAXn4zPl/FBQEDidQQsUVt3v6h6um6c/i
	91Z12Vjw5OcYt2xjTOGfGfO/ZzRTBSiSoHICP18UnXTXb+/5xShA3HjhYgUmqmewIohlJ+5fWrhU0
	d6sMUnnSelOOsRBghTqj4NmpnxUlkVvesp8MQm38SdbXmOJyCHHbFxfvmmdFH3LcLKPgokXE6PzXT
	eFGknxSuNHVRsprqGYl/SdYnOl9QXehG8QMPSXqCb5Qi3lseit/7Agx91oJnTFefCeSYeIkbcBjbf
	O/7wlHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7q-0000000Cqko-00rb;
	Tue, 16 Apr 2024 15:53:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7b-0000000CqYJ-25Wa
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a4702457ccbso576894066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282801; x=1713887601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
        b=Bi5S8dgIKBpAgfSGkf6fhZL7vCq4EYDXbN8CKs7m6eJCIce+JXMxwpL51XwkLE9qw7
         ybm5Q7hI014CKiPwdZLwCyHcWo4jELbFifYPkBYkl9ytATK0esZ+sq1eOQOUiZ5zNgnf
         YsN4lZwRxYyH+dn1xU/Scw464smRECE1X0+vuji2tcjsueUtIlyKrlsNVYeI8jlJuvA0
         ld1+B9DRJZMgcT/eBk/6SUlcpcVV2ba2eC/2E89cgCgmB9jmAAYLMOsmgnf/RGcoDiqO
         EFdPO8sXzZrDQuEnXBUt+rWMpWEQF28GnQYtDH+C7Tklk4Uf/eHXOZMf6k5nK8McspZ1
         mFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282801; x=1713887601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
        b=cCUti46pEkEQr8+YyNByAuEvE1jzrQ8akn/+SWtaF9/fxRRQ46gi3s0XLnsMhoLWhM
         Q0eNxDtJZIjYSxRLBO8P61Ysjen98LnXArJN1ByqBLUFlQv6ilVgLZAwIsHerVC+WvOb
         ZrBooF42q0o5CQ+owughG/SDy/+qj3tfxLJ3kItNvMIfRv2TGjPIHFV8hiMp+HoDG//1
         z5hIWLcR0FqwTAXPXJQNF+RndBLPfJ3hhfNgH8SkyNUXzLX+eLPuZVCEF7T4lVQm3mxe
         BCH85aknd0F407CrvvdmouYltF8jDYxQUkvxmDgSklEd+GBEPpFYhsH40aYeh9Yhb1NE
         Ybug==
X-Forwarded-Encrypted: i=1; AJvYcCXWm7ky5d7E1VU2ubQn6jDamfg75U6NbHS5lE0wInLHxHUbcQx5UZz6gOVGWNp9uPogUuYbkogsWigiGsqutaMURKmTouqCG4EqTYyTPrmVRiZ2
X-Gm-Message-State: AOJu0Yx94Z5qEr6VjwcqV8MgseKY9GIhZblDOA9x3aAULOXZVbePDFqu
	nL6A4z6Vpk8daVvCjvZAcIF4qU792hYechydbhRc2DTAijAFF4gOWPVyoNW1H5Q=
X-Google-Smtp-Source: AGHT+IFHhEszesK9q09DsR/2xkoSYe02wtLO0cXjArvzx9HgMzPqi6DEF0MkcuxXMCf+zXa2GmXu3A==
X-Received: by 2002:a17:906:d28f:b0:a55:33a9:7f10 with SMTP id ay15-20020a170906d28f00b00a5533a97f10mr2555951ejb.32.1713282800855;
        Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:03 +0200
Subject: [PATCH v2 02/18] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IeDOCl06JfjlPFghfO35UROWR8m1btVVgKsMaQNA6d0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q+HnTXMENk4xikmBtAqBzPzqGGoQTN87rhFQk
 sL5tZI2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYtPD/
 9Qm+/9xOYNXV0ZxQe+5NoZUD6q0aKZfjTzUxCwH02q5XEjsHWdaLH6zWsDsPkVwMuCKzKcizClDjvx
 NynHcFjOS+89EVdprokd+qZoM14inG7kJ4axYW7ozOAcB6gbOAwBtOmpUsR5/XK9c+iw2vNy4AxL8U
 B4BVG6AfwKhlx0RNzBLgomixGSAddHxIpr5jf0YnvB2LX5z6sBO8FK5P2G3nIbNTu9Q/3q8A6/IrMi
 7md5PGdAKiTK6v2Sl6kdlhKJMUtkNtlPdvvebkfNGOrCSdfnQjhoGG4E+vlHIKBlYIfmLNtQh1tjp2
 xEPAETS0seMkLxfQNT+D574GNpaY3HaHZ9fKa9W+fqad0nBI02IcRjyssJZeDbcz4xAYiw4t1OCIN2
 jyfO79XA6cgbDmS6x+uh/RE3RYZyMNu5O/OILPXtsUVGOvwFqHJnXgCK0Zeh2qHi8jo5GlK/lW8+RH
 0rPz/NkrQRr8Mgs+5xTxN+8cqwvtXvnZh9d8qf3vkjlqcWH5i1lm60sQFjxUcJv8k5ohXBz5hOB2Eg
 zlo5360N1S08YLYo8RpTi3k4bA33I0BRki4k3XzyxiuvjGKtlngWsAMta4R5sSKjbtJWUNAXTxWF3m
 /FiP6xYGFesR7PHXVNjoui9oFDOnQ583ecoKMc1WodBAyB0gxsnDLH7VS5aw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085323_715388_58F9A600 
X-CRM114-Status: UNSURE (   9.56  )
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

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1


