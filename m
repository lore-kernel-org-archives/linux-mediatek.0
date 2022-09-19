Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0426CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqdfX/1lhtDbmfJeIadecs7tBJ8OWa8eyinT/PgvpPY=; b=YWBxC0Sq60PAcnJ+Cn7pflFP4R
	JT4ii0v9d1y8oDAMIfk6ZHX7QQGtoCn6ohvlJuVEziAcUT+Pl9Zv+ikWRFHv5IOLPvi9M27MNH3ne
	GOI9HFYvqXwHkOiw9lD7KE/p9lRN3RXUwSuiCWaXWi37YzQPOHJLCqRH6JEN/nvXTqjLGfgNhzlmz
	LkVFGhq/EbPFlfiN0j9mr2G6j9mLqsCdNm71iEtX5pLwneGN2gw+SsDHaS3OvJouaGv66SJWmUx8V
	AXDZtpLAOrlHyjY27UEzNK4au+DoaOs6sme8CGz5RQe/2K4rVJg8gXrZuWOAj41hDkXoDGshVLhE1
	i/DEitTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKBE-00D6qr-3h; Mon, 19 Sep 2022 17:03:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKBA-00D6mJ-Gx; Mon, 19 Sep 2022 17:03:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id o5so17261387wms.1;
        Mon, 19 Sep 2022 10:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gqdfX/1lhtDbmfJeIadecs7tBJ8OWa8eyinT/PgvpPY=;
        b=ZfZ3F+T1rO9Xo20L5ZV5e36zfIvSTZwRqaV7ygVZzaSQ75HuDe4xA/hc51RpZqn5MM
         iST2P9W7JgM8TgtkvbIfkSbCJGmeKPfiKsQOBJ+7cRoVFK60lcqYLSdHc106YtDtTwTs
         zgXplemn4zZOHF0lsAvJPMr87eMjq4BQAz7V2xOEXrU6zeucfTAYKc8bvfgXLiZy4ntg
         THeiSiZH27eIjQCsjcoPRl8Bo6wIn9iHcDycodSpvC71vivtqksYXFnei2q7MRE0o37d
         JV8E1kRa3Cp7AusVUjCpc1QFzRUU4+m55nEc5dpe2+QGIumSTLpxGFF5/Zy0/G5lSk+9
         Jbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gqdfX/1lhtDbmfJeIadecs7tBJ8OWa8eyinT/PgvpPY=;
        b=ES5N35VByrCTXkiC3NACP9mAZrXYJdB+z5Dsgw1n/j4bHEonLSEs//o4mveF7Y2//p
         Njz7FCkI+FNCxc1673nhY4ogQbZ/iwADpf6BzY7YyZRtZI6qtL9QFUF1U/2E9/aWaNBt
         gZ2uujpFsInvEEktNorVSvBXnHivlytuw+XA1HaRaJqVqH4/G7S+pSxTPkXrmQbTDzL+
         lmxMxXWf2D5vj9w5nokm2yBNvPyfbOLpc/W4iAbmpafxQqvxzHufNuAiObsxTWvmYsTM
         5wi2+ZwI9/kfVa5jWfZ5/t2z84QMQQcPaLI61VAXaVD4ybHDDCkzbhYC61hIvKtpUYlc
         8LHQ==
X-Gm-Message-State: ACrzQf3zUtGkOZVrJm3DRL2bUq6sSVeDVhGtB1PJk3J1VfgUpCLlhpAU
	0cjWB/G4x/3gqwZGVsE5TR83JKBwVR8=
X-Google-Smtp-Source: AMsMyM53aRgt7aTtewkEJRuCo4upKB8GdNM1JJ6NEcbMTicVcQPz3s47Zg2Ya84IFAwXiMMXV79GRA==
X-Received: by 2002:a05:600c:26d2:b0:3b4:7572:4317 with SMTP id 18-20020a05600c26d200b003b475724317mr13194152wmv.134.1663607009937;
        Mon, 19 Sep 2022 10:03:29 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ci10-20020a5d5d8a000000b0021e6c52c921sm17562487wrb.54.2022.09.19.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:03:29 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MediaTek MT6735 pinctrl support and DT binding changes
Date: Mon, 19 Sep 2022 20:01:11 +0300
Message-Id: <20220919170115.94873-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_100332_634857_D09E25D8 
X-CRM114-Status: GOOD (  14.98  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names.

Yassine Oudjana (4):
  dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl binding docs
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt67xx-pinctrl: Document MT6735 pin
    controller bindings
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  207 -
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      |  176 -
 ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} |  222 +-
 MAINTAINERS                                   |   10 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 9 files changed, 4778 insertions(+), 441 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 rename Documentation/devicetree/bindings/pinctrl/{mediatek,pinctrl-mt6795.yaml => mediatek,mt67xx-pinctrl.yaml} (58%)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

-- 
2.37.3


