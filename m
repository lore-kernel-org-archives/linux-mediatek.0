Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7178DC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XF0M7uZbzNZ9RU+izdrVf7tIYf1cA6nVKbtuxlKJIFk=; b=j1ZuJFiszuepDYCnIWeypnk26k
	DMGKx+OCWfAjhUMPdXraemBySNCt/LmfD/YL/M2idInntnJII0o5u+haR1x3q6ipf+5Di9E7/gUtQ
	OklYH9KclwkHtJ34hKLWJuXB1EfJMgF4u8Yho9yOBYaoLCfSBN9T1ve0KVh+uqpnZOZvYFLeLXP+G
	TDddAevAkvYx2hRp1vN4hOTW0jSgfahO1/Tc1yFXxIdRjvyA48IMW+jJkLWEgINPUaoihHLLwF1i3
	44IBD9nEgd1Du5R+v92RfZZo2xJDvePNDl9P8uKz61V8J/ATJc1Tn7ArHHe9B0r/zC+8ON4xHC/qh
	+m9Ma/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaGc-001Yc0-DV; Tue, 07 Mar 2023 16:34:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaGW-001YXv-MI
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 16:34:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so10802118wmb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678206855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XF0M7uZbzNZ9RU+izdrVf7tIYf1cA6nVKbtuxlKJIFk=;
        b=tBJUgEd0FQrErE0j90np5BC+5nKfFqaf6M1h39mR9FhEY2+OUfKStaMPp0dkWS4hnD
         2usQf3sbT+rD+D/uAYU4Ejk4be3qW92gEY8Q0Yqi5njTgIGNgSUmXK3oT1qjUzJpu5sd
         Zf86n8X2RUCnj0QD8Dz5syvNlWWJcVbE4yVoPS16SIWQtojhTZuhG2pES2/jnUHw3XwU
         YKmNAZjenFD+TCG3au3df5WDj+l78i1EpKK4FNjoc2Q8rdowmrtk9pAxKzxtAN8yhTXf
         MzBNS7fjAT7yMzo3WIxx+IYULEY9og1CWQQV9dA0gJHRLuxTFExESf0usHTz4OV+X1x9
         8wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XF0M7uZbzNZ9RU+izdrVf7tIYf1cA6nVKbtuxlKJIFk=;
        b=y/rbbD2kDPve/aQ9wFYymw/X2g81hjdpZY0vbCqfMuPog07RrEYoG5/bV6FnJqfnN7
         oRWPtLiwl12NHMO1NWtyQPSHJNnkrSN/LedouWrlvJzEgBESDcrwBnX+q1lxoBxMgHpF
         8whEH+TEb5VRQtNA1LtvJeTjJCvK5221a6sN/lSNDmsNHZX1qASC7lH60sCuWZ0Czc6e
         N7zEnJDg8IU6W3gw2cAdQEkSbG702zBSYsesX1bcLQfjAinDY06zNh18HJzPykhJIdm3
         VRmmafyOHxmOc6ocFhjei4gcIzXGi/+qmepAtQj1QNFAf86o588er96GSwDkFTEDfEv9
         uaAQ==
X-Gm-Message-State: AO0yUKW3nbi4IHO49qEcOrYYKvrVx3uQ1jacWc+x9+PpNwje2q6OOO1h
	rEMaEn577GbEp8hL9qkO+YhIqQ==
X-Google-Smtp-Source: AK7set+wqd8TopV09QEWHXr4GZcjeN3JQUoHUM4XtO6ka5qQm4lRRIvlStjXSZL4Vw270Jc1Bw6ZBw==
X-Received: by 2002:a05:600c:444c:b0:3dc:16d2:ae5e with SMTP id v12-20020a05600c444c00b003dc16d2ae5emr13080448wmn.32.1678206855177;
        Tue, 07 Mar 2023 08:34:15 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d49c1000000b002c563b124basm12778117wrs.103.2023.03.07.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:34:14 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 0/4] Add LVTS support for mt8192
Date: Tue,  7 Mar 2023 17:34:09 +0100
Message-Id: <20230307163413.143334-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_083416_780670_73CF40C7 
X-CRM114-Status: UNSURE (   8.76  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.

This series is a continuation of the previous series "Add LVTS Thermal Architecture" v14 :
    https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.50294-1-bchihi@baylibre.com/
and "Add LVTS's AP thermal domain support for mt8195" :
    https://patchwork.kernel.org/project/linux-pm/cover/20230307154524.118541-1-bchihi@baylibre.com/

Based on top of thermal/linux-next :
    base-commit: 6828e402d06f7c574430b61c05db784cd847b19f

Depends on these patches as they are not yet applyied to thermal/linux-next branch :
    [1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal controllers for mt8195
    https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.118541-2-bchihi@baylibre.com/
    [2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
    https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.118541-3-bchihi@baylibre.com/

Balsam CHIHI (4):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for mt8192
  thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
  arm64: dts: mediatek: mt8192: Add thermal zones and thermal nodes
  arm64: dts: mediatek: mt8192: Add temperature mitigation threshold

 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 106 +++-
 .../thermal/mediatek,lvts-thermal.h           |  19 +
 3 files changed, 577 insertions(+), 2 deletions(-)


base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
prerequisite-patch-id: 73be949bd16979769e5b94905b244dcee4a8f687
prerequisite-patch-id: 9076e9b3bd3cc411b7b80344211364db5f0cca17
prerequisite-patch-id: e220d6ae26786f524c249588433f02e5f5f906ad
prerequisite-patch-id: 58e295ae36ad4784f3eb3830412f35dad31bb8b6
prerequisite-patch-id: d23d83a946e5b876ef01a717fd51b07df1fa08dd
prerequisite-patch-id: d67f2455eef1c4a9ecc460dbf3c2e3ad47d213ec
prerequisite-patch-id: b407d2998e57678952128b3a4bac92a379132b09
prerequisite-patch-id: fbb9212ce8c3530da17d213f56fa334ce4fa1b2b
prerequisite-patch-id: 5db9eed2659028cf4419f2de3d093af7df6c2dad
prerequisite-patch-id: a83c00c628605d1c8fbe1d97074f9f28efb1bcfc
-- 
2.34.1


