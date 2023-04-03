Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C75C77B6D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Irg/7rQOFrCsVoB1iKX7cg5MWHzQ1y6ZxDuwYrAWoc=; b=YsDoaxa/fnrmB0tBfVxng+uWKk
	Pmug18Mqpkittaec2cW4qqcD82YWfBDUQUinxOGINpRcPRMOm6ZcKCPeGcydibRCSn2kLwHSp7e8q
	OKwZBLqz7mENB9JeRuUsm+ccG7+dtY9OqFWztOOsqZDTtMOP1wjYNiIA2sqFwREfO9uhTBWxa1WTZ
	YY9FGRfFwYWWO261GzWUaz6/InR24WuVkkU62AxCkJPFAoi/LCdYFvglJMI4J5MiXM+YEsGvrOlG9
	0IGMtsM6/j4OwDpaEevcCL2oKKUKWl+aC0WTdaErdyI74FL0gSvLFeQaovRwjWsqPvkWTRsSBNcvz
	c8RPe7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjETx-00EMJN-07;
	Mon, 03 Apr 2023 07:20:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjETu-00EMHe-02
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 07:20:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so19105866wmq.4
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680506394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Irg/7rQOFrCsVoB1iKX7cg5MWHzQ1y6ZxDuwYrAWoc=;
        b=33vMDoof/ZVt81quDw5pnXR13jpzPdm9umpWVlgwR2kX1snECZjf8SVg3318ZHkynS
         oZj5iitilotfk9jFK+Kk4IsQsAy6spce0tyzYBeypUr2WnGS2fH+yUzho1gv5Cg4qzNv
         xy/imFHPDQRbcSJaIP1vLSw4HnJO7hzc4c+0OFXzp6LdX/ZHh9PQvHznBzdKQrnM/pWJ
         ICMZLc7DNc9lN9DyeEeOqFL2JnL3U5a/CELckzzyNjAF9EhD9rKVG41hlVxmJ1S7vfCj
         mqlrCiBKi/1U2Itd5QCHzg+1CG9bjrOOBTAK3/eCbeISg2jnCYPytIleP1xTzFZPZmZ+
         ZVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680506394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Irg/7rQOFrCsVoB1iKX7cg5MWHzQ1y6ZxDuwYrAWoc=;
        b=HTs+vCCQKijHf+RuWPsr+3x8QvuaCzuycaF0CcdVCm/55UmvVlmtnn9zhVtCK7rESU
         mAXvdJn9hO+QZ1oN//oZSFRAeG/VOpwKvfkpe9h87+vcXYowsV0/7zVudakVBHzzKSHk
         mMKFHwYeLkjcGK+wznVyqRhuQYApfvZj6bg35DmfmzfYo+QZoYi1CVPLaq0NSetO2Ut3
         as67+Vobc1Az7KKGLqdgFTJupgNPUetXazd3cJAU3zh1vC3rlURBATVfbC0tIZPToIdM
         rom4okn+1rSMr0aQIIipDY2rEhM/yE6IWXyzz+jqEzCQtUkwCnfVg4anKxLQPFOcukZ/
         UWJw==
X-Gm-Message-State: AO0yUKU2kvV4cpdmCm4ItGRC36jttBNxIH0eses1gRNlCuHMq/t9xqI4
	lDx9XJg+WFybUqCx/gVWz3Parg==
X-Google-Smtp-Source: AK7set9uKvwjGwiUFvXKdrCeAqnDtu//P693C2rybBYt42PMluDg39NjT9MnI3jWTkA0+bq3jSQ2fA==
X-Received: by 2002:a7b:c4cb:0:b0:3ed:253c:621b with SMTP id g11-20020a7bc4cb000000b003ed253c621bmr28390520wmk.21.1680506394326;
        Mon, 03 Apr 2023 00:19:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003ee6aa4e6a9sm19060418wmp.5.2023.04.03.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:19:53 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Julien Stephan <jstephan@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Mon,  3 Apr 2023 09:19:27 +0200
Message-Id: <20230403071929.360911-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_001958_059444_1D52D7D2 
X-CRM114-Status: UNSURE (   8.28  )
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

Adding a new driver for the MIPI CSI CD-PHY for mediatek mt8365 soc

This driver was adapted from https://patchwork.kernel.org/project/linux-mediatek/cover/20200708104023.3225-1-louis.kuo@mediatek.com/

Florian Sylvestre (1):
  dt-bindings: phy: add mtk-mipi-csi driver

Phi-bang Nguyen (1):
  phy: mtk-mipi-csi: add driver for CSI phy

 .../bindings/phy/mediatek,csi-phy.yaml        |  46 ++
 MAINTAINERS                                   |   7 +
 drivers/phy/mediatek/Kconfig                  |   8 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
 6 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c

-- 
2.40.0


