Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D4CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 04:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B7LU1YRsXhbsqmPzCrst4NJ9fxlJXbbFdC3pa6Aj3+g=; b=tpOqqpxsO3dczsEqQLrfSPGcX+
	LS9G0mMMIhBihztgoQL4h38t1FsXM1Vp0o+josLiieCw+exeSY9Cyc7YNJ6PWI+qVRk6D9r2Yy9lx
	VUIwWZKgoF3eDfQuoOiLjie4HDgJFLg0tYIFjA5VInRpxVh0is0FawJM3I3GOsfhNQTeNUpW+WrQ4
	sKYUmvk7vVLUgUSv0lMqfw286tMI1Wv+ORWQQjf2MGVOHBpdVx9EDRqisrhG4H2IMQaVtxtwzuuVO
	VlzjfgLDf+BfNl6tw2RpnbHxiKyherAyzWJM+fOcjjKTGr4MqlDDWkPDL0JUf2yVKafWIyBf+/yiv
	BTtoNpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peTaM-00BBjz-3D;
	Tue, 21 Mar 2023 04:26:59 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peTaJ-00BBiY-2e;
	Tue, 21 Mar 2023 04:26:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id ek18so54922773edb.6;
        Mon, 20 Mar 2023 21:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679372807;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7LU1YRsXhbsqmPzCrst4NJ9fxlJXbbFdC3pa6Aj3+g=;
        b=KgpA/xvxWtTEC+5M243SNSSdQ/sR5n8aNFQoCvZB980MdYygUQ3vXzNPhDGv+OEZHU
         dJ8Vz0raQjqD76uK2yidCiOhvAH8/mLJrnkDZMFlCWLuWkWS7J0OVpyXsuxUwsg0nuMn
         5yLRwbKNtmjoBK2L/3peR99Cl76PmC+Fpb5ZUUdHMHzmA858hwdrTIx6GHngMZlTKFx3
         ryOsDFwKGAa/5fIw+vXxDPfSFz71jBUWNJb2wTnNW5NcqmIa3yZHq8ZpfTs4Y45x5qOq
         qWbb6fMfAJsDFbdSFWpvnCvD2eiiiZTwTwmkMcX3/L3P8nXQsZwpgsB6ZsisfNzJCIkj
         V8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679372807;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7LU1YRsXhbsqmPzCrst4NJ9fxlJXbbFdC3pa6Aj3+g=;
        b=R3ZzvHz0NtRGHHe4kjKDTK00bliTSpcFBdUHnlqX9YJse4tIJAnZadtMM8Idj3EXoX
         6Ge7ldnI7LfDDsFQdtd6f+4ThJsT2H/c3hsNzC4gixTYZY5BFnfiTwZC+vW5HhfkZopz
         ihYt9VTzzUGSsG4NW2rm5jkLwNlsX463PcsKni2UvXnlLxS0zi12Igw950/ThGezDBOr
         8toIYWYv4jQVmJWfot5oJR5DJVeou1V34Y5BkHzmOxuFXgTM9M4Hc3CHvcFGSRi+BkF4
         XTL5k4xg4unqVSPwOC6W1mPryAexKSAhwlPkJEPPzq4CMgG9hi3ai8hefiuRB9bBFpqu
         2q7w==
X-Gm-Message-State: AO0yUKVhuvQjH0relVCzIOG3d7CSq+5n+sh4Wq8e6RdKHKLFgEuR+EPL
	/DvaGKLbsjJ8aYUzeRgwzoQ=
X-Google-Smtp-Source: AK7set/w/ExYAxonQFR20l6IlWAqcYeWwQuLWKpIzZRcDzIPrF57OQOXOYBsPxDLANdchya0fH5i5A==
X-Received: by 2002:a17:906:5e43:b0:932:4990:2563 with SMTP id b3-20020a1709065e4300b0093249902563mr1496687eju.24.1679372807043;
        Mon, 20 Mar 2023 21:26:47 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:6c2c:25d2:96b3:40e6])
        by smtp.gmail.com with ESMTPSA id s17-20020a170906961100b009316783c92csm5290434ejx.12.2023.03.20.21.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 21:26:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Owen Chen <owen.chen@mediatek.com>,
	Mars Cheng <mars.cheng@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] clk: mediatek: Remove unused configs with COMMON_CLK_MT6765 prefix
Date: Tue, 21 Mar 2023 05:26:41 +0100
Message-Id: <20230321042641.21592-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_212655_863234_C6CB391B 
X-CRM114-Status: UNSURE (   8.72  )
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

Commit 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support") adds
fourteen configs with COMMON_CLK_MT6765 prefix, but only uses seven of them
to configure inclusion of drivers.

Remove the seven unused COMMON_CLK_MT6765 configs.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/clk/mediatek/Kconfig | 42 ------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2d14855dd37e..ec87762bfb18 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -144,12 +144,6 @@ config COMMON_CLK_MT6765_CAMSYS
        help
          This driver supports MediaTek MT6765 camsys clocks.
 
-config COMMON_CLK_MT6765_GCESYS
-       bool "Clock driver for MediaTek MT6765 gcesys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 gcesys clocks.
-
 config COMMON_CLK_MT6765_MMSYS
        bool "Clock driver for MediaTek MT6765 mmsys"
        depends on COMMON_CLK_MT6765
@@ -168,48 +162,12 @@ config COMMON_CLK_MT6765_VCODECSYS
        help
          This driver supports MediaTek MT6765 vcodecsys clocks.
 
-config COMMON_CLK_MT6765_MFGSYS
-       bool "Clock driver for MediaTek MT6765 mfgsys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 mfgsys clocks.
-
 config COMMON_CLK_MT6765_MIPI0ASYS
        bool "Clock driver for MediaTek MT6765 mipi0asys"
        depends on COMMON_CLK_MT6765
        help
          This driver supports MediaTek MT6765 mipi0asys clocks.
 
-config COMMON_CLK_MT6765_MIPI0BSYS
-       bool "Clock driver for MediaTek MT6765 mipi0bsys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 mipi0bsys clocks.
-
-config COMMON_CLK_MT6765_MIPI1ASYS
-       bool "Clock driver for MediaTek MT6765 mipi1asys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 mipi1asys clocks.
-
-config COMMON_CLK_MT6765_MIPI1BSYS
-       bool "Clock driver for MediaTek MT6765 mipi1bsys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 mipi1bsys clocks.
-
-config COMMON_CLK_MT6765_MIPI2ASYS
-       bool "Clock driver for MediaTek MT6765 mipi2asys"
-       depends on COMMON_CLK_MT6765
-      help
-         This driver supports MediaTek MT6765 mipi2asys clocks.
-
-config COMMON_CLK_MT6765_MIPI2BSYS
-       bool "Clock driver for MediaTek MT6765 mipi2bsys"
-       depends on COMMON_CLK_MT6765
-       help
-         This driver supports MediaTek MT6765 mipi2bsys clocks.
-
 config COMMON_CLK_MT6779
 	tristate "Clock driver for MediaTek MT6779"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
-- 
2.17.1


