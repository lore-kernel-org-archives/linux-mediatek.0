Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8038C77B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQDZ0kl/qap4qMPXG3KZzTT6FQaXwjteHFJnaNZ/47Q=; b=MyKbQiaTzY5iFBL+38oY2aYQMw
	HKMB4y0lR9048nr+XJb4l5R/BLiVbD4uPXw5Pb1qmr6JRIWhTe/rRZqsNPKrE2pZ7gBW1ll/Q3y7R
	mKMcA2RaYtewmq8domAGcLTFJSOOvAXMu1uM5RTc3IRF1UZa+7WdZCy2l2M+qrG5G3O7mepRZvIOM
	Y7ZShDK+K36UzBhldmIwGO07py5Gydl5tbAiLHBp1Clu9C7bPCGC5ZrIm86oQaRu68mLsLcd/Lpgk
	tOhafE9345OTgukouHGnfnNxcOEDUbEjNI57PGu6sCB61XCg7Bc0pMBlHfBwcR3T5SXN2JS5/+IaL
	vAyLcvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl3-001EYF-0x;
	Tue, 25 Apr 2023 13:31:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl0-001EVL-0J
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 13:31:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso37404575e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682429455; x=1685021455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQDZ0kl/qap4qMPXG3KZzTT6FQaXwjteHFJnaNZ/47Q=;
        b=hQgeKxRXJ0yHcM++OOFfZ0t1UtuWdAqbDsuB6SGX7Ucu4YkEFj7SyEU7cfe78wh+WQ
         G2J2731hdkoyvLD/hBXPyMWKJeZMVW5OlF8grQLS2Kmv1Vv2/eQvanMbmwwR7XBxTXcn
         y37uRQmbLsZgCFk00oAo9v9av5lAeyjjGKD/BoARvUNJtB1t4a+JPJUkrr4MusKUldXG
         Oapm1Ar155TbJ1iK3hhZWOR0eipY1t6iQk0zErCepOqEWsih5iZ/eLpTZJcKvXf0+17U
         grR9+PvnRUtvydxZ+a5PEqaAtuggkpOvYQcqkLzdrtkCjLBVZH6cyaekT46Td2jQldb4
         ealg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429455; x=1685021455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQDZ0kl/qap4qMPXG3KZzTT6FQaXwjteHFJnaNZ/47Q=;
        b=OhQIp8Hvazr4zAy+y+iYDX8/ZzsNsnhDo1A8xEO2h1j7gNkO9/KIOPt1LICpElqQFH
         unlLynLU27iizaPiDNL8lRAIRqWnruVmZ28OYkjxnBH7QpJ4EL0IC3C6YJn2CUYTmkg2
         +7SPB6rEhqoU1olwEbDi8+FVT8+tJChkueWVde/BD5oA5TknHUgAK5poafW5fgPKOyiz
         IB7EPmiHznDsUNk8m+WFuOTxPtg78ou4ht63bdK0ZdXErTNREk8WHVpXOf0L2hCS5SP6
         BJxHzzRctld6JJE29VrNDQJZmcyR9CvmbcvlokJT27gCLAbxjOK1HKxAvoaZv0TyRG0s
         /OSw==
X-Gm-Message-State: AAQBX9eOfglzWxhj1Qf4gF/vvjqr5s17rUMfSDO3SC5CjgYugsA9GLS0
	gcNEteFvEEXaUG/6EqPv5SbI5g==
X-Google-Smtp-Source: AKy350YToaXY8KjK9MDJml/HHBSHgv1qFk3TZWeCRSWY630xTgykwAXRAj/XIk46jXGX2hvyI5BZSA==
X-Received: by 2002:a1c:7211:0:b0:3ef:8b0:dbb1 with SMTP id n17-20020a1c7211000000b003ef08b0dbb1mr10272347wmc.7.1682429455493;
        Tue, 25 Apr 2023 06:30:55 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003f16932fe7dsm18575434wmq.38.2023.04.25.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:30:55 -0700 (PDT)
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
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v2 0/5] Add LVTS support for mt8192
Date: Tue, 25 Apr 2023 15:30:47 +0200
Message-Id: <20230425133052.199767-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_063058_370177_2D24FC71 
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
Also, add Suspend and Resume support to LVTS Driver (all SoCs),
and update the documentation that describes the Calibration Data Offsets.

Changelog:
    v2 :
        - Based on top of thermal/linux-next :
            base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
        - Squash "add thermal zones and thermal nodes" and
            "add temperature mitigation threshold" commits together to form
            "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
        - Add Suspend and Resume support to LVTS Driver.
        - Update Calibration Data documentation.
        - Fix calibration data offsets for mt8192
            (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").

    v1 :
        - The initial series "Add LVTS support for mt8192" :
            "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".

Balsam CHIHI (5):
  thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for mt8192
  thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
  arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
  thermal/drivers/mediatek/lvts_thermal: Update calibration data
    documentation

 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 185 ++++++-
 .../thermal/mediatek,lvts-thermal.h           |  19 +
 3 files changed, 642 insertions(+), 16 deletions(-)


base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
-- 
2.34.1


