Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C68ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCPcoUB7YiwSSscJBnh3JUInbmnv/uLJ/66Lvn6Y6Yk=; b=TpfIh2jboHn/QZs0HCO7qy0CsP
	xWChB3CUpzifDLFNB1VMq21Gbj9v9mvCgnerBLDyx33gE/94AEiyfay06hR2vGwFnq9PydUVdqk6Z
	PhaQDxq2v7uO3tJ3yaiv7ZsY8eyhZjm0DCThHeEqwNfjstj6zJcWfceXDixP2H0N9R+bJmNA6aUtc
	qNfYup7uW9FSZ2A5ZeA7AnE02l2SFNoFKUrzsdbQz17JLre1+8VF1LfaXLDptFJZFabodxIhXBPNu
	FwkVBLT9WyeR+JKMKATsbonvZubBfjjATU6NkjE+605DLaMKRJMf6XuSYx5Fmzy9zlvFcZQte0nw5
	1pBuDymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkT2-00CAU7-IC; Thu, 01 Sep 2022 13:42:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQR-00C8z4-3D
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 13:40:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id v16so19689929wrm.8
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KCPcoUB7YiwSSscJBnh3JUInbmnv/uLJ/66Lvn6Y6Yk=;
        b=DWof82jkuxZ3n6qKS1EJKURTcSwcpmtxTYMAj/vYMQobBAxY2dZV1YyE7wyJpx2g2E
         2LKkmPmH9KHkSJ+JUqRatHWEGRzoCsS89jQe5VGzGWBHD4UPkFPrdnI154eRSDMPDSMP
         4F9Q0rmuAkQyRzb2LsOFyCXFa7JDTVvy6wEnlKGxMfrz1TiArI1xgnjCCix7ognj6S+y
         l/B14A4qUpHABLSuQ8hILmqGLFcQeWlUT+kqx1bxS+qIyg3ANii4YB40pSAezoOLLqs6
         TYWYGehFj+25Tgv99GVaRebUxsWdI/W2TfKTuA+TFQPgvNuDqnt3j411E7ow6099AUnt
         Blkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KCPcoUB7YiwSSscJBnh3JUInbmnv/uLJ/66Lvn6Y6Yk=;
        b=iB0PAwiu0MzgQeQ3pKnfAL8GTpPkrfk6EyRGMvCARWvkU7gHYaiU951JysQXIhXWeX
         z1YhnM1POS712xy6kYU7helgckLPnJDsA0F6FuWDedyqht1KtolbOXasjt6mHBkvjVJi
         BCvvRsv56hlRzLL5Yn2xPvjgwbKjhlJEyEK3NAUbRZ8MKDUyNogn6noTPDxtjpXiMR9r
         /mbKKNhGn/vUv6ex5Nm+qbCnVJ2Q8IcL843lnh2DEILQFpDs+DEogAQQvbB6IBaheIny
         q4/DUgQoK0dv+cTxdb3D/c6PZPTlninDybltwEi4eaa/M36u5Sz822UZ2hThiS8y+mbD
         KlIw==
X-Gm-Message-State: ACgBeo2z+lQmAV3lLeTI7g9IbwFQkZ1vA9c0K/LGWqKEqPXtvXY8L8g2
	ODWdrOAGaZtuCbmMl85XFyHqhg==
X-Google-Smtp-Source: AA6agR55XF5dbEcnTiR/UclqwGBi/5TuoAKQ/vTJ0Bk12CiomfceiUFfMs0rxZEZ/oAupen1Fx/ltg==
X-Received: by 2002:a05:6000:1374:b0:226:93af:9c26 with SMTP id q20-20020a056000137400b0022693af9c26mr13887160wrz.188.1662039602954;
        Thu, 01 Sep 2022 06:40:02 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id e3-20020adfe383000000b0021ef34124ebsm15399016wrm.11.2022.09.01.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:40:02 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Fabien Parent <fparent@baylibre.com>,
	rafael@kernel.org,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/4] dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
Date: Thu,  1 Sep 2022 15:39:47 +0200
Message-Id: <20220901133950.115122-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901133950.115122-1-aouledameur@baylibre.com>
References: <20220901133950.115122-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_064007_280640_DB4A25CE 
X-CRM114-Status: UNSURE (   9.67  )
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
2.37.3


