Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B038DC369C2
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rlv/e5diWhfKKxuZaHVq7mYgqrrQfSJ3oP095/7H86k=; b=q0whPlnLjwGZ6gbjqtWk33/ZMX
	WfcoT385BoFfUMpz7KDyh1C+vc2Oa+qEo3mEUW8ME4LGHYbVe4I3wCrP3NWrx+WHVxTxWC+IqDo0U
	GIbP301M9ECMwSwi2lWeyowjqKh1GKMQ3Ba+2GnduYK0N4Y4ZuuRP/c9+PXAB7Qz+ewcTyw2VZr/7
	0NgY3ltrw+bDYp5jEaHjciVFLfMUZh3cmvHNxrukzHXs4T/BKa73HmeaT5C4d0MyU+W8Yp++yRSEE
	iztpgutA8PLLSRfPmDfR2BqtyU3VvPOjutsHU1NR+LGfFyVAk+VfoN025FzV3s0eoykhzUzN3ow0l
	MD+zRpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoMG-00000006RMX-3KI4;
	Mon, 05 May 2025 05:27:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoKE-00000006R7X-0Pzl;
	Mon, 05 May 2025 05:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4518C414FF;
	Mon,  5 May 2025 05:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3A5C4CEE4;
	Mon,  5 May 2025 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422707;
	bh=gqLQSv5UjOL9/2FaltDUuXflgvx0PDLFqookN2zeQ0U=;
	h=From:To:Cc:Subject:Date:From;
	b=KfPU20/bIFUy43MnrFC1/6MQmcMePl0M4g8tf2tB09i+iI6iLslBvqfHGWAyCOfy+
	 NnFSdwLwmqwfEIIVEHDmvvy/MtvTiYKtdKgOsfFo0Bi/XQ2r0Z+mJ2T5k8yPIJPUNV
	 CGEeLokoNqcv5cyXTqQIaJ4EUO2DecXmHjy+AQ6CLajDaMr8QMxTDxVlh1hVUg89o/
	 YNZXJdiuXNJvUQW7v0opmcFFkfus6+6IWLYd29xpcAYquSsk+MaS7CE4MmtN1R3bLL
	 Jr3xs3Cv/jBrQBmmfhJKYTllogvriNA/p9Ufg9KDrzusfibir9v/hooEhaRGH6q1Fg
	 sZAr+s+Nmx9Dw==
From: Arnd Bergmann <arnd@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Julien Panis <jpanis@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts: remove unused lvts_debugfs_exit
Date: Mon,  5 May 2025 07:24:52 +0200
Message-Id: <20250505052502.1812867-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_222510_167554_53030574 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Arnd Bergmann <arnd@arndb.de>

When debugfs is disabled, the function has no reference any more:

drivers/thermal/mediatek/lvts_thermal.c:266:13: error: 'lvts_debugfs_exit' defined but not used [-Werror=unused-function]
  266 | static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
      |             ^~~~~~~~~~~~~~~~~

Fixes: ef280c17a840 ("thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index c0be4ca55c7b..985925147ac0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -263,8 +263,6 @@ static inline int lvts_debugfs_init(struct device *dev,
 	return 0;
 }
 
-static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
-
 #endif
 
 static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
-- 
2.39.5


