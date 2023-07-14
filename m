Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA3C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lUGvrZ4SNzSbcOr0/Bv9oR2pfXE6QplZ6flVtj8X1o4=; b=lCHWVa9QSGgWcQsqHQLhK9k4FT
	xiQ9rLOBonrvaJR4NXY2EKqE+ohzG6/081v9icX0yhYKc6MDCz4DNFwDxLSJITmffNPkm8QGMV4Bt
	i3gAk+apXDi2QsktIV6TStru5UlEbDG7XC4Se48UdHWbGdP8GIGtbx7hKRqEvPbMv69TNgnIIJd4D
	g9yNbgVxrk4THLttm3VIoJY9hTZUuZ7+Jok+1ujE/IcrTr6gBjoWNKb7hCdoO5l23CfrOfm/b0qwa
	lDpYem/bPMRSvi9YZd8ZOXIWiLGJLwDr77+xDS3U8dXCqnEbF5YhMvSsAF9cYH8RLyTAqr2x2ytoj
	cwPQmX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMwI-006qya-11;
	Fri, 14 Jul 2023 17:50:46 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMwC-006qsP-38;
	Fri, 14 Jul 2023 17:50:42 +0000
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34637362297so9623245ab.2;
        Fri, 14 Jul 2023 10:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357039; x=1691949039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUGvrZ4SNzSbcOr0/Bv9oR2pfXE6QplZ6flVtj8X1o4=;
        b=G/YVe7Q6tne8WptnWGnEdItpgya5Taeb0beBFi/yYhlmPZkVWAtbfiF/0i+nwpSlb9
         Y38hhF/bnuQjZVp2rsss8/EiJnQWD/vv8ZL3Ehf8Zz1G2MW4fxBk4w2+c0QVOHmci8vs
         DaGJyaphqFseciEL/XNNbna8akeQAhvg4xvFDGsMgVZqjHtaJxMYrG9bg9sleMffIIhI
         d6o43+v+KAmlaDRBPtgJjqhBoBBsi1vd6abakR6eAPMg0o8E+gI2fZ87TY1A/i83fhJ0
         bpI0FNiFC3nvhboE49R/bsXH4UoiRhxzyxmdS15/bRFKUaduK3w2zkPir3bdbOqXe6mt
         aUpg==
X-Gm-Message-State: ABy/qLat4jDmc0D9DmVYzpVbfxo1sDO01NLYJck8Z+R0dqD2ZKUwLUn6
	4JUfRKJxZjVlsTc/hIsFng==
X-Google-Smtp-Source: APBJJlEye8ahqaN5k4RFFRcqcmMtxTr6BroCabiANYEE10xONTgVediAHw+dhnaL+ixFAcKf/lFP9Q==
X-Received: by 2002:a92:d952:0:b0:33a:a6de:65be with SMTP id l18-20020a92d952000000b0033aa6de65bemr4775196ilq.21.1689357038778;
        Fri, 14 Jul 2023 10:50:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c3-20020a92d3c3000000b003460b456030sm2906739ilh.60.2023.07.14.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:38 -0700 (PDT)
Received: (nullmailer pid 4065092 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:23 -0000
From: Rob Herring <robh@kernel.org>
To: Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ufs: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:50:18 -0600
Message-Id: <20230714175018.4064957-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105041_050558_B461FCE4 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/ufs/host/ufs-mediatek.c | 1 +
 drivers/ufs/host/ufs-renesas.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index e68b05976f9e..aceb3747f7b8 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index f8a5e79ed3b4..49f7bafc7d55 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -12,7 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <ufs/ufshcd.h>
 
-- 
2.40.1


