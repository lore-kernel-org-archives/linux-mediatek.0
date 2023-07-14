Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83123C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t8B9VdIZYHl/5f2hD4bWd1FxmyEJhurzf9pPuxBMOhI=; b=eyRshf7h+z6wJQk/RovLoxpkss
	VrqVy2ikUBBIeBGWDvr1DeRQrSngOS1nVEw/WsxTfTcazhOKQrQMgjBElUjgy4vZD+fwGHdubKvDd
	YVtVyZ4VedOI6pGyTKa7rmeTkKJIJmuURoTREuhCV2UyyECwxHgAeA0G1AMhRNFuOH7voaw9TsvPE
	CYKUUimd4hWkF8XcEsQQkpdVFZz5d6qA7guK1j7z1gaPZMo3hCpr7ryTPNRljpwKhC6bHgHr3xihb
	e63d7XbVZMIDJb2exkI6YaIJTU57fgDsH8ACe3Sp0Uk7uSWzQstqff896yItdJuITnk/IYie9DL3h
	VWQWyQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmw-006mJj-2M;
	Fri, 14 Jul 2023 17:41:06 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmt-006mIK-0k;
	Fri, 14 Jul 2023 17:41:04 +0000
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-783546553ddso85538339f.0;
        Fri, 14 Jul 2023 10:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356462; x=1691948462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8B9VdIZYHl/5f2hD4bWd1FxmyEJhurzf9pPuxBMOhI=;
        b=Df9EDu4XNFVHAaPOLWClmDWRR13t4rbfqWChNabf99spSdy45EMaTvtv0RPNlaJE5K
         plJKBjVdxDLcPad5dN8nB1KayeWhqdnMuWdhllPjk8nM2bJ0qxiN8GmQDseSikN/EFfH
         1aw2V803uEhutMWyMnzV+Q6chW64pT4cUHP5DR80UI3vt//biv0BST9Sviof/HdaNAwL
         f8kx2WbM1th3tbwnLa7oRDBH77lcCkdR6Pv0kH1RdXlWi/tTmDZ+REWevLrt3agk/aLq
         Pc4oGoto+fpu3+b7DEPPxQ+q0ElfOCnd8yDoWkf4aTZo7muNhQSl5i8ZHqb+FQfaxIMI
         6juw==
X-Gm-Message-State: ABy/qLae6FAETt+Oat208v8O0mw6Fl6Gp4DXjkHwNY9HqqZDk1dLFXiz
	XkE0QSEuiYh9gEFwkJAjBA==
X-Google-Smtp-Source: APBJJlEwpCn38iv9tGhrnrnRZNdeny56jS4GeSg/y1spExD6DCQAepba72GgW14TRDqilD0Y6vUlXA==
X-Received: by 2002:a92:d44b:0:b0:346:3193:224d with SMTP id r11-20020a92d44b000000b003463193224dmr5476204ilm.5.1689356462577;
        Fri, 14 Jul 2023 10:41:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k18-20020a02ccd2000000b0042b4e2fc546sm2673897jaq.140.2023.07.14.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:41:01 -0700 (PDT)
Received: (nullmailer pid 4041135 invoked by uid 1000);
	Fri, 14 Jul 2023 17:40:59 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bluetooth: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:40:57 -0600
Message-Id: <20230714174057.4041063-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104103_269147_2E067F09 
X-CRM114-Status: GOOD (  12.24  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/bluetooth/btmtkuart.c | 1 -
 drivers/bluetooth/hci_h5.c    | 2 +-
 drivers/bluetooth/hci_qca.c   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 7680c67cdb35..935feab815d9 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -17,7 +17,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index fefc37b98b4a..71e748a9477e 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -11,7 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/serdev.h>
 #include <linux/skbuff.h>
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e30c979535b1..dcab942fa5a2 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,7 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-- 
2.40.1


