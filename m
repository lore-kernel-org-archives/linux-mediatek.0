Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49A8C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=; b=cjfqu5JFGxM3rog1wawMi1xkgA
	4d+KnyLykQd5VrUigscPoQ3570jq1Cnpk9Fn35aFFCNGzyTjSJByEgbOPCS3qiNzIYxhwoIT1kkXn
	oMdlL3zMUptlRcfo804oNSijfT+wCtn34IkCWDSmC3/tkayLPLhwlkVri8s/5tIBB55g/ZER2ZMAm
	2QTp8LSbXXMo4V2QOEb5VoOjvCLcG0usNhjWRL5GJ3PsAbVGTc/qUHdVrfpLL5nyoYK7y9UixSHGp
	1GrO6Tqzt1DHF7Ifcz0bhuX0H/npFgCkMSk9X2WKA+8xbzezmdwVY8SQhgrj1KlrYn/YmwR0KXwDh
	86eUZDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAFh-002qHD-6K; Wed, 19 Oct 2022 14:41:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9tR-002i6V-VR
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 14:18:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bv10so29302442wrb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Oct 2022 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=;
        b=JPvOjOjxdsNpbrCQHBqtoxywW6mWGG18opKEyaUSu6nFu34JNAixSJZTiggazyIuKO
         JpmcgtX5p4jP8v//2TP3u5gQ/PpIn0q64X6IP/dI8atpdOuf1R60J7ZYAIKBOyQuX8Tp
         t+HBBuhQi8gMLHjILayvZyWQ3+KRCt8wR3CxnmoU/QsFSVbQo+U856lECGsknFYLU/B+
         LW6RYt6WS+9TCjP7HqLvjxskkLe5oxGU6dQbmxni8gnZ6S4KwTrd5mehV010ElybwUwy
         pUOYWISU4Y3sEicdmgzg2uLd2tY8l7onGpVZXwZYxg5NiXnuR6RRLpArgKW1GsQS6VnP
         nXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=;
        b=Vqjz5Ts+zfYq8/YDKrZHqMokMBQnBUjuYtyx36XftDb3ZHqHG+XWc+I8P0a1c/DGpO
         0uFts9qQPd3uTW/jKf+StX5TcK5CYR0ZxUSWMEqp0TBGc010Bb1vjNAim1Ty+ht73B5O
         XgulNv7/JdOI7zgez9QVlQwbZQPiookM5zaIhJmVYGIVvCsRohwYkyFTRp0W6jpAqJwO
         tpvR+iQZtNP72P66WFzNi71eFXRL9hiSOP2caXXFjzIabhxkdvwS6yxK0g+3NA4nr3ZE
         DvRoBV93fAeDYSQEUzpHUAzCPXKgmcY8npsliMuRI7tJDOsPTpZjACGSZK7hFuRpnH22
         m1ew==
X-Gm-Message-State: ACrzQf2Da328NBjGa2mDkqR97ZZN+Avm4pk60kDSJ7vJCGhLh0yPNxVD
	e9qj1PuFLcaewiIQrKKBJcrVqA==
X-Google-Smtp-Source: AMsMyM48WaZ/8SPoMcLucOsUO+1QzG7wrI5cbSiVKHWebZnaFwP8u3LfGv904PwKI8eTR2zF+60r1w==
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id d10-20020a5d6dca000000b0022cc6f957d2mr5371565wrz.474.1666189078381;
        Wed, 19 Oct 2022 07:17:58 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id n9-20020a05600c3b8900b003b4ff30e566sm2126577wms.3.2022.10.19.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:17:58 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:17:54 +0200
Subject: [PATCH v6 1/4] dt-bindings: thermal: mediatek: add binding documentation for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v6-1-c87b9f75550b@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v6-0-c87b9f75550b@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v6-0-c87b9f75550b@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Michael Kao <michael.kao@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666189076; l=1269;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=fY1CncUk6oCKZLxDY+iXmY9IFHJPxuBaTQTmU142aZo=;
 b=VpCgMgtCTDppg8K0f+sJTcN7+zAUVonGGeuj6re/jwiuSI8UCWEnobcpOClxnqKzEtedrcwYytlg
 NT5c/aJOAQVmTuTWyPBVC6p0MeUuhkYPArkdPlkRIaipl/4eODXq
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_071802_036502_A2C2C6F0 
X-CRM114-Status: UNSURE (   9.00  )
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
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller

-- 
b4 0.10.1

