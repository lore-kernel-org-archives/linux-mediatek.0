Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1054BCD5BB0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2026 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=; b=2HCCsWr4+1Eqx04gji5PPzEkik
	jSmKsFiruFhMbivumw+NmInKxMA5akxBfdRiyDcx3zx/G2K6qQ8JKqixNc/htOll5B5sXYjbLDKaD
	hKvuHFAzXNnwAzRmrBH8y/3eH6k35jvJbu45jo+pQIOc2/hFplr7wctkkxSstRoIVE+PMfwtA4Ld1
	bO32pxHcIwLpLtdbJBQJvHB1VgvfcBra8UbMgMMVYvcXZbXQk9aD98Jb7rfl6nWiofO+hmzrEgraW
	Z7rk1ALpifovdKTr0+e5iViSUEJtbNHzhAE7WFVntullgbiTwn1+m5DoWPR/BH2pIYwbtKxXqXAVF
	drsZS6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPxc-0000000Ayp2-3qo9;
	Fri, 22 May 2026 13:30:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPxa-0000000AyoA-2sf7
	for linux-mediatek@lists.infradead.org;
	Fri, 22 May 2026 13:30:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba1e9d3687so47958765ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2026 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456641; x=1780061441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=FxH9+f8qvqfQqHWz3BPFFkM9Tfvp6+5NUL6Ips/XZs4XSN8bC3gyf2/GHjq+kE2qzM
         GRahUUKCeIE92WRS0GjXgH32WokSyWk6F+NHm+tjg8yBe9ctSvOXxALx+0xCMqub+krh
         PDZBR7rykQx+noDCgda+zdapVl0pNrwz+ZQNK8ZHwIBJstgLaUb2S2ErbcDFALbQJZX/
         7noPt9Xw5DE6n1jm2dTwPof4SVi+aiiQTp1IkJEGta+MJUcwrf7zGkCOZqFaVtsDuzQs
         yJk3mjArs5Qlevf9zmdyvRKnE3qmLZYBndJwON9qS+k7T5azWNpm0Fdf8oWHPYAM4CUs
         By/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456641; x=1780061441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=EarFuidNzcjK6OvUjGzGsAN0pVGLEfFUH6hfrpoeQLnB5C4/F6gfbbERD4FNPUwW1R
         ehok9n1bcQ8hqdE92guABKXtEbvXM55ByjEt5oRL0gZ7nBvnjW4ttdSEFukFUu8o1DDg
         jkUNhWUTr6c9RtdXIJeyf7EnlQ5G8lKKNNiReu6FVyK2PufkI3CkZRTA7haDsyeSHWAm
         rOiUZO2FrYn2ry2rWTYsx2dM/nVXGMRQo20CLnKmghaxjYX5UII4wqn461ySwm9fhl/+
         wi3xqr9kvR2iU33oly4yklpuLaW2CgnYpeqfpUPkRkFe9oz7XA8uSEx1ITGEPK0nGTAB
         HhMg==
X-Forwarded-Encrypted: i=1; AFNElJ8fKVozGQZt8P8bLw+J7tWCvO51qX7o0owRep3wCbuDM/QshkL6HEbN5l60w/ZY9rz+xo8chT6orME+nkc2QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUL3/pPQ8uInns+cFQa25ZYUnXKiYdgrrSxjyfQ9kuBfETpe1X
	RmgCjOZRxHmUZSqrcQ4OLjLXmS4bDjyq7Y8FeHuxRCpOzxGaEb96Lxae
X-Gm-Gg: Acq92OFsPfS2tIcKEKQABNYq1c48h+hGhbRA0+T3oDbzGAx5Yn2WhKl4ARcvpF/20Cs
	GUXEZti2yVZkI67BDGyS7JqJSbvh6xhCgfRkNXQKsHPAIcptdQHC0XoIJFg5hHN0BX8X3Jz9vjA
	n9ty3hDOWU2dWIIaOAlKt6brm/6ixvT3Fug2udz/Xy4kyQNHzEaEog4jN9ZEO4KAHa0m91kKFiA
	yJUud33dgrw1CFM7GVO9emXEDrAF0EVDZkryobWL3UALCS6bZbL0TTfSWbIcT/UmLCHyhsGP8AZ
	BEqfD1F7YljXt/kMhQ9fERe5MGR6khuRG1g7oyB+qK2KO4ADVzy92KcM4TB49Txb9M0VWUKbKcQ
	/7/e6reWS/1u+teCPP9mePj8GLmD3TqLf6PwNmNFY34yw3Y1qWj2ns8Sd22n7BhXNcz+nGQEm/E
	xjd/gK513Sa8VqyaFOxlZLE0foOIzXEUGo8c0LBmLqgz43OEB863sCtQ4HHs63FC1BWyfaRPcrU
	xDemSY=
X-Received: by 2002:a17:902:ce84:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2beb0593137mr38054985ad.10.1779456641134;
        Fri, 22 May 2026 06:30:41 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm25147605ad.6.2026.05.22.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:30:40 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	laura.nao@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Date: Fri, 22 May 2026 22:30:23 +0900
Message-ID: <20260522133023.355404-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063042_719261_FBD78A7A 
X-CRM114-Status: UNSURE (   8.44  )
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

The MediaTek MT8196 vlpckgen clock driver uses
__devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
which is defined in drivers/base/regmap/regmap-mmio.c.
However, the driver's Kconfig entry does not select REGMAP_MMIO.
This causes a linker error when REGMAP_MMIO is not enabled.

Fix this by selecting REGMAP_MMIO in the Kconfig entry.

Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..fd8440122ec2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1006,6 +1006,7 @@ config COMMON_CLK_MT8196
 	tristate "Clock driver for MediaTek MT8196"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select REGMAP_MMIO
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
-- 
2.54.0


