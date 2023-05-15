Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A605C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QWC2hVWzxMHKmiP7bFd1/GNl9QWA/6DrOTG6WDSUnGM=; b=3xfpnJFWRfQYA6DGsRh7+3oUHG
	z2ou40XSbbCIDrG8Wlov67tefK/RNO85gA73IbZEX6zAm8mqzj1KXjAehfxTX3xFhaglyFPODcqau
	L2B9thzKpk91jcDiZC5KwTmSUkXKbSthpLNArMafk5Bmby9ZgTCbEjyIjIQT/0Iz67nkA+ZICF1A0
	sMBj4S3FU99poJ1kR4in8haiIKjw8YjzsSAhdsNQIqNV37lGgoD2ZTg6hUzuXBjhdsdfwDmkLmgT5
	DeXX/lrITAW0mAUkzMx/kMbcdR/LMm+u8ciM+X1SOUQApht3YuSy/QeGVVOsaofCxawyaC8oH/zGF
	8hpkUIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUcW-001ZvJ-0R;
	Mon, 15 May 2023 09:35:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUcT-001ZtZ-0t
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 09:35:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f41dceb93bso64359565e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684143351; x=1686735351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWC2hVWzxMHKmiP7bFd1/GNl9QWA/6DrOTG6WDSUnGM=;
        b=hZK1cRCcwAWJjnEp08UbvM3yYnHbU6+YYpxypZ/VKSjb+Fm8fnIX1oXzoBWfWxL3L/
         RzDu8R5AgRibMuAQW6IvIFRbe+xPws7vaBdtMd4ELJ/1nfKw5Ujltx7Bh+nWTBbZBgky
         k0+F+pLAaVJaq94+6i+IcrRF30zI9opSGja9Dsh773EybaWv9hAakHA//0Fz7OQFth/B
         AELOd0CVGszxsikSE23TUoca9hX5VRhRpDrwdOsL1wfzxK7FgX7N7tfjmWRMGD3FUdIe
         Xdp9HfzdhX4c5EJm6XAQ5OuYE2rOIibgU6OV8UnUvi7V6Ai2DhMpi7UEvZj3qM3RnrjP
         y00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143351; x=1686735351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWC2hVWzxMHKmiP7bFd1/GNl9QWA/6DrOTG6WDSUnGM=;
        b=LO5eAD+rT2m/7ITQQy6SGEJhxeUStAMFkDvRJNzjfvW0rv4fe3JalBmFwn0ED3a5L0
         DrmT2h9L2/sqXeSegFl1H8E2rm4gEWS39mxJHIfImtSMgRQax3Df0XHDEJ6TWeolFjdH
         ZA1K0lYvVaUp90TLm/B5lUmatqYPyQFofed8Nc0es5HgOhgxECOfvmx3lgi6S41EmeTB
         +NARGT9WMz9f1cb3vhxHRIktE+AffWmySfO/OZ5lZWtFW5qm60Vyi0vKQhKwaGPor106
         ZE0blIfmj250STCL22it8RXm5fVjeQmUFJc8Ar3Da/vQ3tkooq8JshLggP4rfPOvTW94
         7MyA==
X-Gm-Message-State: AC+VfDxAHr+iyvfkXcfWWHuxALAjVoKAZOMVXVN1KX1NOJk+pXy/Et/n
	FQqWBY9V8LaL9XPeCcbS3yr2pw==
X-Google-Smtp-Source: ACHHUZ6BE/4NK3YHHcWl6EMaCJsUPOYAbAUFdxrDuJwCuPnwJVcVddpO9nt3uz2QQDMX9l56Iz2HyQ==
X-Received: by 2002:a7b:c4c3:0:b0:3f0:7ddf:d8d8 with SMTP id g3-20020a7bc4c3000000b003f07ddfd8d8mr23309590wmk.18.1684143351524;
        Mon, 15 May 2023 02:35:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003f42813b315sm21035451wmk.32.2023.05.15.02.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:35:51 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: krzysztof.kozlowski@linaro.org,
	robh@kernel.org,
	chunkuang.hu@kernel.org,
	linux-mediatek@lists.infradead.org,
	Julien Stephan <jstephan@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Mon, 15 May 2023 11:05:49 +0200
Message-Id: <20230515090551.1251389-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_023553_313451_3BDBAC8A 
X-CRM114-Status: GOOD (  15.76  )
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

Adding a new driver for the MIPI CSI CD-PHY module v 0.5 embedded in
some Mediatek soc, such as the MT8365

This driver was adapted from https://patchwork.kernel.org/project/linux-mediatek/cover/20200708104023.3225-1-louis.kuo@mediatek.com/

v1 can be found here: https://lore.kernel.org/all/20230403071929.360911-1-jstephan@baylibre.com/

Changelog
Changes in v2:
	- fix all comments on bindings
	- move the binding chunk from driver to binding commit
	- fix dt_binding_check error (reported by DT_CHECKER_FLAGS)
	- use a more generic compatible string
	- add a new dt properties to simplify the driver
	  "mediatek,is_cdphy"
	- rename the driver and the corresponding file to include
	  version
	- drop of_match_ptr()
	- use devm_platform_ioremap_resource
	- use phy-mtk-io.h api instead of regmap
	- rework the driver to use dt nodes to declare PHY instead of an
	  array in the driver
	- remove useless define for unused registers
	- remove support for CSI0A/B because it cannot be tested, and it
	  simplifies the driver for a first review
	- edit commit message and bindings to be more descriptive about the
	  hardware


Florian Sylvestre (1):
  dt-bindings: phy: add  mediatek mipi csi driver v 0.5

Phi-bang Nguyen (1):
  phy: mtk-mipi-csi: add driver for CSI phy

 .../phy/mediatek,phy-mipi-csi-0-5.yaml        |  62 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/mediatek/Kconfig                  |   8 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  58 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 257 ++++++++++++++++++
 .../phy/mediatek,phy-mipi-csi-0-5.h           |  15 +
 7 files changed, 409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
 create mode 100644 include/dt-bindings/phy/mediatek,phy-mipi-csi-0-5.h

--
2.40.0

