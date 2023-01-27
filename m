Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE2C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPsz6CoLNjPAxyd2ASpUS9AhmaiVkC3z8HgK93csZ1U=; b=3Jw6qrBAQ2FE4FmDqaZ2QMRcbL
	j6O1eEyo01m0AsndUkCYW6tYZ2SvEERGAu3s93801rfGcTAF8SQdodUZyJlguNtzVqtkNhTujhfO5
	emKCqwoMbGG13qwvd/ae/DDF88wZ9rkHdDtkdhI5VUN2HCZbyWxZcMI8Xb6SzwFGNXOKbGSc274ZM
	9MoWoCD6gCjjP5dNgpIznzF4rqhlrcPmSI/u+xEhiHItaLmJ3eB1b61m47L5XW4AqSTRbj7FJOLbT
	MaQ2munqFPf1pQvtL3e5ykV0lPdxE7ScxNU4EqBUKou4JYD9Yu0FOQeY6+9m4Uez3Bgn/GvOimD6q
	qE9K/vEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQuz-00FV0S-Of; Fri, 27 Jan 2023 15:45:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQuj-00FUri-PU
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 15:45:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5682164wml.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPsz6CoLNjPAxyd2ASpUS9AhmaiVkC3z8HgK93csZ1U=;
        b=0naiJqR3CXP1CSUH1JQR7KqPG5pckDblSfUbPNiY67L+/CLsqv4wi5V5lnThoQnQfl
         XBC9cwMNuPjcBILcxSYXsUZqO9BE9yCR+xJTVP4s/uQnxBlrR2Pr8EuZ6r4G4RbpAur5
         fLaMjFycUMucwjXPSWBteTfKo2O7UPlo5UnMzfZRccczYDKBW7lwXcpvQoooB9qX9cjY
         D/Wt7zpopMVtACqOu/iwYdKALBWTYIdAamnjV1/C4XrzUr+jGYs8W6BG6YjXMwmbukX1
         Wn1lkzevcAlX5ax3PXci1dCalYpVZi9obzdYHx850/weXQ5a2jdpRJfni0sUdxt1bsEU
         4nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPsz6CoLNjPAxyd2ASpUS9AhmaiVkC3z8HgK93csZ1U=;
        b=w3s2fUhX2zsK9u9WOwugqPEzZl4qlb2isXep94DlEOww3SgxDaPI9SCyprW03m3L9W
         LrCAt+v3EttJpbVo5nSpNaV18SJg/zsb3/3K1aHRs+sc9JQYI91J4kZzy/SfBfYClD2Q
         oXzAc2pB66H+xlHquXVmCkMppGe/hqUhRVFApU3k1fhYkY7W+MmydkAjW/8xR88+C5oI
         2lUSCW6cSxtwFJl3CtLEds4RWjXgHyfaYwWeMAoCgTRniz2evdQ3xMlEZkxsZj+50FrY
         c9NQtgf9i+JX9WX7N+P/0ibMGCry6R+zFGZrWD8dtDgta/vHKkdweckiH10yKZaik9P3
         PAqw==
X-Gm-Message-State: AFqh2kpXtO6KC5xcjDZlPnKQjlGDKqo939od6lm2MCT2EeJSHX8+xHwC
	f6cHquAWuuIwEwRcE3+ehE77mQ==
X-Google-Smtp-Source: AMrXdXsg6RnczMKZuJgcZwxUHpUG3sqVBTrRPEnjW9UFwbQg6oRXkOpof410jj6/R6m59blyvzTJ5A==
X-Received: by 2002:a05:600c:3b83:b0:3d9:f758:e280 with SMTP id n3-20020a05600c3b8300b003d9f758e280mr41502552wms.24.1674834315495;
        Fri, 27 Jan 2023 07:45:15 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm4381153wrp.53.2023.01.27.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:45:15 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 27 Jan 2023 16:44:42 +0100
Subject: [PATCH v9 1/5] dt-bindings: thermal: mediatek: add binding
 documentation for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-up-i350-thermal-bringup-v9-1-55a1ae14af74@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674834313; l=1282;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=C4Y1Pt62EoG+4OlWvlrEg4v27fXBsImkQVLZNvvWkNY=;
 b=p84J/BeWtHAWzJ/Wpyo21Fc9gYwpI3/1DIJKFge6sSwRcon816f95HVnjLyZsd4fyWILpsQ8U34m
 FjtNhucEBTBh/OBALocVjgieplh21yx7IezruVT933+1fiowOTEA
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_074517_890016_F2523511 
X-CRM114-Status: UNSURE (   9.25  )
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

Add the binding documentation for the thermal support on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 38b32bb447e3..ac39c7156fde 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -16,6 +16,7 @@ Required properties:
   - "mediatek,mt7981-thermal", "mediatek,mt7986-thermal" : For MT7981 SoC
   - "mediatek,mt7986-thermal" : For MT7986 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller

-- 
2.39.1

