Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43FAECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fbdFWdGoT5TyChVzYAZHBA9+fCifaM+n+YZpxGlEIlA=; b=YuMPNM4U8r0Ng/aclxW67nvozd
	19gMzr89LJ8pG4llMq1zelxSDgjyAD8ER3bxCyDMZvy7rmib2KBm9W+xmdhPy4a+zAWJNsTwdcAhq
	Kq5mAbQqGe94RX+gte3IDXymz9r7FlGLItfDKBqrZK8eQMeOTl37SMHvlodKPh4rMY7Ui0rBHonhw
	BapgKHN5lD6FffE4O+5Wm5MLKj6DdH2jCEqyAoTB1lI5gEzkIOYD00t+80ihID1f2MvE8TP8xc/ts
	+JHXvFcUIFg6EVLQ4EBL6Z2eiULdqroc98G6DZL/zOZFogAQ/m7/FDY1g5cSYCPTlPtXNKlDONOkD
	Nm7MQmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTlWe-00Cc6A-L9; Thu, 01 Sep 2022 14:50:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQL-00C8ww-At
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 13:40:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so1475250wmb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fbdFWdGoT5TyChVzYAZHBA9+fCifaM+n+YZpxGlEIlA=;
        b=YkyloLFSaMRlRbS0LNqxBw/KBaGy50J7eVlBh3OgmcCNcKEYvHjsdT6riJKiYAApuz
         70gS8KwXJe0jglFkZ4GXcFGjMqAt5/xKEx9kNugUhWkAKPHy4OABZ+wxMI9273tig6bC
         FZZyd+vijCPQMFe+0II/bsw751CjzwxUx7k5bGr2oCehH2CgC6s/yXtlSkV+qn9yZsM8
         qbLqH7Sia9HJ2B4+hgVYpoKdCGOqrtvBDCX3pKyRXXsdpn33El6WupdSCqMP26HjMqcb
         SImbyKhefhB6zd9wasjJCfbx+7jp19L99HRu6ZmNNxOpsQUZOruxQN+wDCVGfpXdoQOS
         HBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fbdFWdGoT5TyChVzYAZHBA9+fCifaM+n+YZpxGlEIlA=;
        b=49hs7SRiDvtzEudUxVWREcKGdjYJgqOPyOWIzRQMuSOljvzL655R+yY81AaOfB04fo
         5GJ+kXMKjA5HJ7kSgeaKVnwqMesqLsUauq7seFHNvCt71CDvxl88VOTgAcQk/AytGEbs
         Cc1Qbr0Tneox+E0i9XiG3OLqvhmA4fo7QODaUAaNGz3ZGa5Ne9kL5h1coSeyupr9pPAx
         l7tUqGlSqmZPHGHRrJYLVVL/41LcCdwUcvzOqom3vYzjeyyI6a6gFcIn5bN1iEYnayFs
         LqHOKRtJ9fksn8G1C2ME2Zh3YCF5j43n/LocXT7Yg4Qu/R0WgTSYHckLnlUWCKeEFoLI
         6tPQ==
X-Gm-Message-State: ACgBeo2EmPn5DjL7MR/jFdQ/VC64bH8nYzOJkuOFaJgWHfOIc14EvKIF
	4bzbFx4SDMHJ4B0V3M34nS7+lg==
X-Google-Smtp-Source: AA6agR7Qo1EbkHVH2Rb7zV3Lv9+qvbPXOjb9N1DAQF94ZpIh0K/Z7ceowWedOH8REBvxlFzOvJfcdQ==
X-Received: by 2002:a05:600c:1c19:b0:3a5:51aa:d041 with SMTP id j25-20020a05600c1c1900b003a551aad041mr5235294wms.172.1662039598864;
        Thu, 01 Sep 2022 06:39:58 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id e3-20020adfe383000000b0021ef34124ebsm15399016wrm.11.2022.09.01.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:39:58 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com
Subject: [PATCH v3 0/4] thermal: mediatek: Add support for MT8365 SoC
Date: Thu,  1 Sep 2022 15:39:46 +0200
Message-Id: <20220901133950.115122-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_064001_458379_03B0C32F 
X-CRM114-Status: UNSURE (   8.25  )
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

This patchset adds thermal support for MT8365 SoC which contains three
thermal sensors.

Amjad Ouled-Ameur (1):
  thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
  dt-bindings: thermal: mediatek: add binding documentation for MT8365
    SoC
  thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
  thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt     |   1 +
 drivers/thermal/mtk_thermal.c                 | 193 +++++++++++++++---
 2 files changed, 163 insertions(+), 31 deletions(-)

-- 
2.37.3


