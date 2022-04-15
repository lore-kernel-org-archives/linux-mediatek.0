Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBF4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ys8g9lDMa3u6g+a3VakvWRiPNk8OrEiNcW7nQh4LfXo=; b=A1I6Gyhho08zfe
	HgB63jrhDVvsGmxC+bKEYWxgwISaVob0kH+du66GvJzjTEfQ7ssZdOQjQnwHZoOM3ZDvuK8ULE4XK
	AvG2l1SWBMixEyd7opnpHEQEQ/Is7+5auYNi5c2Yq6iBJUZVNrSCvJCbkp1oKEVI/OmLQ9rp0f64L
	pSYcHlEi2uV16QjcG4wd/eqFOsNGeT9Ume8yoQLRv75VCdHk1ATjt54KmavPv1+tDftefY2xEzI8K
	hsEI8BRPZb4SfvUMiqvoJQuPDK6USopYhPXmXGBFJifhLatALT9fd6iIBQe3sAs7V0dwTt5JTfxfc
	js6dl10XLsHacustl9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfNRA-00AQoa-7R; Fri, 15 Apr 2022 15:00:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfNQy-00AQlT-1z
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:00:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e21so10937730wrc.8
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gWln8EcloMLq4MXchooJ68Qtpk10rCsI7MldnXcpTmg=;
 b=yv6FcaqifwuSvSv1LCpIJuRGnj/BtWk6ayTpGtC4VJBGUVZYLCa53qgxFHA3j2GSyL
 WDRX8XXquyuyewpiPlRnjfxALUYBcELjldBEXZTuy7FDXRgYs0LtWtsr8HCUa2rXoCKw
 xP2NuNVzGF6y2mC1OzmofeKy+vZCG3XWybxiYMfMC1LE3WeWMLxGEI3bBpROgA6OFoRZ
 Y6ik/i/kdaCIscredSzIgPh7xukyZF4gY9BKDDB5oeGW6ogFK6k0lpJ2X+LwnhHernxf
 1O+iZXB/iDKiSlYBNrsHDdsn5BKlt5Uu5iPp6EsC7ab/W9ru9or9UKJErSo3w4FbtCKb
 UaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gWln8EcloMLq4MXchooJ68Qtpk10rCsI7MldnXcpTmg=;
 b=4qCGSMcphzc8Nd59smYZZ0H3M+SxgnGf1cjir9kmRNUFUenW6LOv9bWGDoUGRL6f1B
 QUI5L1Hp/kDEYTOVd9c9vfaj4IFC4V0XL3FBtwsoA/CKzwp3SFJZXOMROMbGh7Hc6IK5
 v4Bje5f6pGM19xDZCTjwxRj+qLFizjEW/pDmBGE2dy0cO+AXbeueq5tRP2bAmnK9RWVw
 wwWfpbyL87FtbKiip5CchEaY6D0LSzoPwgemTc+P0zZkrsSHYK3hhCmn9Ct2xOEFT3r+
 4htjFR6Qjg05ElzkI6S+GOuW6VtNYHoE0v3nPAatDa32UzUjjCpTd55NpHBvZLoVyZaS
 Ubaw==
X-Gm-Message-State: AOAM532wt4fpQ1Og4fJEi/6mc3XzgCOQzrpjA3IOZYc3FYE3B8QHMBcI
 wKdgXyooQNVUNo+ZPGJ9YDQKWw==
X-Google-Smtp-Source: ABdhPJxi6lhjraLDZCiJguKAnyDC7y+dD7lUmCrreEyVDLvHDpRH+jCUy7r+i0Wrv1iHVtq0bAcV9A==
X-Received: by 2002:a05:6000:1f17:b0:207:a6f4:7c44 with SMTP id
 bv23-20020a0560001f1700b00207a6f47c44mr5635647wrb.81.1650034824404; 
 Fri, 15 Apr 2022 08:00:24 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6b82000000b0020a7e34ef20sm1579664wrx.47.2022.04.15.08.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:00:23 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] Add support for MediaTek MT8195 demo board
Date: Fri, 15 Apr 2022 16:59:59 +0200
Message-Id: <20220415150003.1793063-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_080028_308455_14FAE9ED 
X-CRM114-Status: GOOD (  11.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch serie adds basic support for the MediaTek MT8195
demo board. For now the support is pretty basic and allow
just to boot, use USB, and the SD card.

When more IO support will be added for MT8195, new changes
will be pushed to the device-tree of the MT8195 demo board
to support these IOs as well.

This serie depends on the following patches:
[0] https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220411022724.11005-3-tinghan.shen@mediatek.com/

Fabien Parent (4):
  dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
  arm64: dts: mediatek: Add device-tree for MT8195 Demo board
  arm64: defconfig: enable MT6359 regulator driver
  arm64: defconfig: enable some mt6360 PMIC drivers

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 445 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +
 4 files changed, 451 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts

-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
