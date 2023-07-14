Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FD9C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKCJUp4CqCgC2RTMueqPi4f10D3ol+zQTAqiaFzYSUI=; b=hIhawfXnuwN5dEDNKhjuyMMKdT
	kx9MCT251BTvdz5mdkQHo3EDn/0tavGTTxpC71aaJZCaSXre5Kh2netzETv5qjqlMc2Hn/s0cBt9Q
	uVUpIrSiOnJY9UM1omHXzclMP/Z0BNJGywdO1QfdchSWYOBnS+ULYGrh3VYJ+1A1SnWe9a/37ln9s
	JcbQ2ZGj2+nQ11psu9qpdk/RJAThaeoA+9EyxZObWb0yZ1D3GTpUFUV46fpjexDtD7NhD+Ssru2GL
	iOHT+T7zADP5Vsz3ztoj4PU1REfLTwTJZ/jUwWNhP/sTzmeu64/UpyUvk2gb8ITIammqZdVuJfKam
	0ZSj/TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMqP-006nL1-0e;
	Fri, 14 Jul 2023 17:44:41 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMqG-006nDk-21;
	Fri, 14 Jul 2023 17:44:33 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-78372b895d6so89340739f.2;
        Fri, 14 Jul 2023 10:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356671; x=1691948671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKCJUp4CqCgC2RTMueqPi4f10D3ol+zQTAqiaFzYSUI=;
        b=PlVUT1KaoxYXQUEsZH1NWCiAvaQPjz2BE76qg8rys7bFbHTmzcZBfB1P1Nm6UracLC
         /2l/pfy5Z44Ey4Egi3tj0NNxZr8X1SH/i5wiJJqligsb6bswKTwGbUXXb9wYOaVq3HmI
         yzRxjstIwN1ojDEjYkvuuD3TAZXvlmcOF6PxK3+ReVxsaxtAaoucCL2ayGk4Y6O8HL5I
         C7iZDUSbMs9GD2Djn64TKMsoSW7HVN6KRDPPueE3541YsFAVwOEmOYjdVMgY4dfIbXpd
         +fQHncH7g28eNTFWjsUX/rAerroK6P4H7A/5tJ8Va2bpKDnq7UBWTi4V1euT6DnYstge
         UrGw==
X-Gm-Message-State: ABy/qLZAzsU7+f7oZs1PdXSlF4wdDNvsSKy9H9lCIY3H936UE1nlMQDK
	l+UCD8iFjdWIBiY3Ge2Knw==
X-Google-Smtp-Source: APBJJlEyccik+TIwQfOddVchGfwmKZ7WoQdwb497EuKnOfrzKhIDHTtwjajstHQLl9YBsyUSMZLMNw==
X-Received: by 2002:a5e:c010:0:b0:783:58d1:823a with SMTP id u16-20020a5ec010000000b0078358d1823amr5981939iol.9.1689356671351;
        Fri, 14 Jul 2023 10:44:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w11-20020a6bd60b000000b00787496dad4bsm1741226ioa.49.2023.07.14.10.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:44:30 -0700 (PDT)
Received: (nullmailer pid 4054490 invoked by uid 1000);
	Fri, 14 Jul 2023 17:44:27 -0000
From: Rob Herring <robh@kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH] devfreq: imx: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:44:25 -0600
Message-Id: <20230714174425.4054393-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104432_666984_7D0B0B89 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/devfreq/imx-bus.c         | 2 +-
 drivers/devfreq/imx8m-ddrc.c      | 2 +-
 drivers/devfreq/mtk-cci-devfreq.c | 1 -
 drivers/devfreq/tegra30-devfreq.c | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index a727067980fb..86850b7dea09 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -7,7 +7,7 @@
 #include <linux/devfreq.h>
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 16636973eb10..e1348490c8aa 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -3,9 +3,9 @@
  * Copyright 2019 NXP
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/device.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/devfreq.h>
 #include <linux/pm_opp.h>
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 6354622eda65..83a73f0ccd80 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -8,7 +8,6 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 503376b894b6..4a4f0106ab9d 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -13,7 +13,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/reset.h>
-- 
2.40.1


