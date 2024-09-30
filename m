Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2172CCF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 04:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6fQANF7cLgNYEImELd2aRDhcfXDngeWPNi/O1BMJo8=; b=D2as+c/BNTyRdhRxxPldr7jwFe
	D0mADUxa15CsWLIVsqtD0AMZAd0DPOou/uJ/u1imI0IHsI5vQA2UYJG1K49zsdn6MrZGC8IECQSgR
	VT7P5gwaPGPcUQvz8ByC3YMYR0ZtR8zncola5h3VutrZfdi2/k6n+4IgvcT/SIpRiYUAkS1RqGEIA
	SPAAySrxcinLHj6ZXXjJxyRDsakPsEskuiWvK74eG1aXLdQ7c0FVim/Jnd/NIBIfplD6knay0Di5Z
	imZ0rBMogI4u5AbywSbbL2SawlMzdEK8Va8cgBEjHpMTMTirjp4A81wvIHku/vUPkk5AeMvpx6kV+
	NsMG12BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8Iw-0000000FuiH-3saH;
	Mon, 30 Sep 2024 04:46:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8It-0000000Fuh0-3oZU
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 04:46:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b95359440so1505605ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Sep 2024 21:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727671594; x=1728276394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6fQANF7cLgNYEImELd2aRDhcfXDngeWPNi/O1BMJo8=;
        b=dFeEAak0PC1CF/EamN3NDumPPpLEGC7EUB9RrVmC+J0NwgiledNBv+U8j6BgyEKrG3
         t1SAeSYEN1YEApkCTEuR9uGyQkbBLPyPZljUaNxSIOZxG0rX9LvN75R8Cq7Z7fUR38zx
         4+OqskECM7ABbmj5ErOzK5P5D3ER6uSHEXNSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727671594; x=1728276394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6fQANF7cLgNYEImELd2aRDhcfXDngeWPNi/O1BMJo8=;
        b=uQhngQpWqYtqQ4bHweMM7kpeGHthxgGdqHHFGGegvPvxjbPvXdS1YMc/Z1p/Aqs4LU
         eZ/mSFyxfkWinVwX3c7zV4VG58oRWYLi61pqQ+6rFNhFNL4IhOvEB5S3KRCjJJbjcqJX
         ggbEBYX6Pd1GcyxLOwTOUgaYclQ68YI57bczdOndRquJMmV4HsX8GhOWxeY9VEjunmSJ
         soJ3A5+Kly2ixjEHWSSnHamTb5zQVy0UWnuOdXkNwaWlOHLdx1mshaTM3971LrpenQ4N
         aN4CKS80Raq7OiSSIF8bWPHLD1N6aq5YQU560HER9krccypUpDMs6Euxzv8UxKx8DB1v
         scHA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7YqEBIImVeYPh0KAu3lbVNCEtO/CwOvN7k+u/LDb/Wi7SCAAdOCE6X28sR106CyVl6Ut4szgVy4udav1tQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0GmGS4oaAjSl4kv98reDK205Y5sUqqz0CmKjfkB5OIYcyBJt9
	UO1+RVRxzm+Ij8ZjvjOTldf8zRTXxYzIDT6o3EoMdSUvufMWvdlxKP+64mkn1w==
X-Google-Smtp-Source: AGHT+IENQ7NhAJEfEEzudtLCJxzrSxYTgcSTJ2qYcUG48+ffvUH/sGw4msh0WJHorJMBcHhknsJBxQ==
X-Received: by 2002:a17:902:e844:b0:20b:65a8:917c with SMTP id d9443c01a7336-20b65a923c0mr77993745ad.10.1727671594304;
        Sun, 29 Sep 2024 21:46:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:659b:6caf:831b:3926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d65asm46236925ad.123.2024.09.29.21.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 21:46:33 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v9 0/3] Add of_regulator_get_optional() and Fix MTK Power Domain Driver
Date: Mon, 30 Sep 2024 12:45:20 +0800
Message-ID: <20240930044525.2043884-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_214635_974115_2BE703F0 
X-CRM114-Status: GOOD (  15.28  )
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

Hi folks,

This is v9 of my of_regulator_get_optional() series. This series was
split off from my "DT hardware prober" series [1].

Changes since v8:
- Reformated stub versions with `clang-format`
- Collected Andy's Reviewed-by for the first patch
- Moved OF-specific devres version to of_regulator.c
- Made _of_regulator_get() static again
- Made devm_regulator_release non-static

Changes since v7:
- Added stub versions for of_regulator_get_optional() for !CONFIG_OF
  and !CONFIG_REGULATOR
- Added new patches for devres version and converting MTK pmdomain
  driver

At ELCE, Sebastian told me about his recent work on adding regulator
supply support to the Rockchip power domain driver [2], how the MediaTek
driver has been using the existing devm_regulator_get() API and
reassigning different device nodes to the device doing the lookup, and
how the new of_regulator_get_optional() is the proper fit for this.

Patch 1 adds a new of_regulator_get_optional() function to look up
regulator supplies using device tree nodes.

Patch 2 adds a devres version of the aforementioned function at
Sebastian's request for the two power domain drivers.

Patch 3 converts the MediaTek power domain driver to use function.


Each of the latter two patches depend on the previous one at build time.
Ulf would like the regulator patches on an immutable topic branch so
that he can merge it and the pmdomain patch. Mark, if you could oblige?


Thanks
ChenYu


[1] https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/20240919091834.83572-1-sebastian.reichel@collabora.com/

Chen-Yu Tsai (3):
  regulator: Add of_regulator_get_optional() for pure DT regulator
    lookup
  regulator: Add devres version of of_regulator_get_optional()
  pmdomain: mediatek: Use OF-specific regulator API to get power domain
    supply

 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +--
 drivers/regulator/core.c                   |  4 +-
 drivers/regulator/devres.c                 |  2 +-
 drivers/regulator/internal.h               |  4 +
 drivers/regulator/of_regulator.c           | 88 ++++++++++++++++++++--
 include/linux/regulator/consumer.h         | 31 ++++++++
 6 files changed, 121 insertions(+), 20 deletions(-)


base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.46.1.824.gd892dcdcdd-goog


