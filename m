Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E023C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndN3FycfYuBOTIUhLSdVkGITirgUaBIbaFbrj4frrcA=; b=vUH/zv+io4y6kP
	Fgj8gyrTmLHv4LXJhRn+lp7kzjDAN5qMLvoFPoi3usEANu13bbowV+HkRrgXbFpntnkU7PFfFlmlL
	dPiW0KFuuVYx9Mzk0mlNVXLD7hFXvc+YVVlP2VTqjuT2mBKm4D/5wjAb50BLQAxDPu2i92YMAIU40
	RxNjoqxyeNoHi2S6yZbRtJzi/XspEnGXXxpK4SW908o4jr++Ko+zigPWxeS+v0v2sV6r5wMBCOzLv
	X3wLP/T/rqgssFdBwWttpAL9pzFR45XEYfrhyo56M7QLS2JVjPxHwJPXW7qOjZ14LSYCvrsu0S/5e
	KGEriAasd0O7ztctYLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTg6L-004Uuq-I8; Mon, 14 Mar 2022 08:30:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfuN-004PdE-VD; Mon, 14 Mar 2022 08:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=/Evi3jLJWhMV3viNSLb/AtPMzwjI5uaZv+1MYEasBxw=; b=nDU82sFXSlbmuqYD4Pb3rEGNGK
 m/tryyeFSs9VdVrbqCFQpVrkqw6l1XGAMJ7EYgKaDZFkTtEXZ+zKf8quQLf821g0HAL1QCnyN7RKb
 O7bsOqurj8BWpJiSIl9YyagD0Fno7lFWm4RtGRX2D14Vigo/qIbFWHc1Q5GF1fPokiM/TB2t++yoD
 qlR3Mhxn0pelRE6BOhgGniE8VgBIZZWQE+3O9DxczQ/1/rMQu5Ca1/96/PwBAFdJO+59iF4qkUkvI
 5ja+ZAIRrwHteq13UvdT0mtAfJJ9m70IDWW3XPovaU/zTMhC+q3risfg0wuamJSmZEkGttb8b2HkF
 oa+QSXTQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfYz-003qL7-8v; Mon, 14 Mar 2022 07:56:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C04E161220;
 Mon, 14 Mar 2022 07:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5239DC36B08;
 Mon, 14 Mar 2022 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244562;
 bh=B5nZyd0Il5jD5iHe8BnOlrFLcEa+HQ1DD1wbSOpL8MA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bdUBTjE75pAHoc0E0qw94R4dOAk6jO5YD85Q5Gsw2/nJHiR9c4iofr8q6ZrCUpeQj
 wio5D0KIqX0xk+uWXj3PbzBQpxblBaCs0D2OINpD/VlF1/7zYMDLnend5Ak6/0REn7
 HBK/6dfcgiu3C+8C+Da87xp9U8qttPZHyCz6a2J9pEQ1deQo+8PnojjpqFZhrP1sRL
 flvc9zpOsmk6othbL03d8m4hygIY1CpXHs6ewv6nJl1q9Y0OOzpb32kezYVtWiMPMK
 Om2Q+B8XYtdrg1C5EeaBE+bBJR9780Tl3qGnnB+2Tm9v3HYNfqggyYmYomimsfOyDS
 3E0eALnVau8UA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYe-001kX1-3n; Mon, 14 Mar 2022 08:56:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Evan Green <evgreen@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Houlong Wei <houlong.wei@mediatek.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Xu Wang <vulab@iscas.ac.cn>,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 44/64] media: platform: rename mtk-mdp/ to mediatek/mtk-mdp/
Date: Mon, 14 Mar 2022 08:55:36 +0100
Message-Id: <63c4997f598fca76ef0876151d38dcfbb156f8b1.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_075621_542184_0ACEA9A6 
X-CRM114-Status: GOOD (  10.29  )
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

As the end goal is to have platform drivers split by vendor,
rename mtk-mdp/ to mediatek/mtk-mdp/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 MAINTAINERS                                                  | 2 +-
 drivers/media/platform/Kconfig                               | 2 +-
 drivers/media/platform/Makefile                              | 2 +-
 drivers/media/platform/{ => mediatek}/mtk-mdp/Kconfig        | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/Makefile       | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.c | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.h | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.c | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.h | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_ipi.h  | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.h  | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.c | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.h | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.h  | 0
 16 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/Kconfig (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_ipi.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa0a3de3865f..2203d98bbcf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12138,7 +12138,7 @@ M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
-F:	drivers/media/platform/mtk-mdp/
+F:	drivers/media/platform/mediatek/mtk-mdp/
 F:	drivers/media/platform/mtk-vpu/
 
 MEDIATEK MEDIA DRIVER
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index f1746529e763..8a7ac0b8e09f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -79,7 +79,7 @@ source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
 source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
-source "drivers/media/platform/mtk-mdp/Kconfig"
+source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
 source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index c792f6216918..6f5d09cd8f9b 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -19,7 +19,7 @@ obj-y += exynos4-is/
 obj-y += intel/
 obj-y += marvell/
 obj-y += mediatek/mtk-jpeg/
-obj-y += mtk-mdp/
+obj-y += mediatek/mtk-mdp/
 obj-y += mtk-vcodec/
 obj-y += mtk-vpu/
 obj-y += nxp/
diff --git a/drivers/media/platform/mtk-mdp/Kconfig b/drivers/media/platform/mediatek/mtk-mdp/Kconfig
similarity index 100%
rename from drivers/media/platform/mtk-mdp/Kconfig
rename to drivers/media/platform/mediatek/mtk-mdp/Kconfig
diff --git a/drivers/media/platform/mtk-mdp/Makefile b/drivers/media/platform/mediatek/mtk-mdp/Makefile
similarity index 100%
rename from drivers/media/platform/mtk-mdp/Makefile
rename to drivers/media/platform/mediatek/mtk-mdp/Makefile
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.c
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.c
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_comp.h
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.c
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_core.c
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.c
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_core.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_core.h
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_ipi.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_ipi.h
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.c
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.c
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_m2m.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_m2m.h
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_regs.c b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.c
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_regs.c
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.c
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_regs.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_regs.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_regs.h
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.c
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.c
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.h b/drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.h
similarity index 100%
rename from drivers/media/platform/mtk-mdp/mtk_mdp_vpu.h
rename to drivers/media/platform/mediatek/mtk-mdp/mtk_mdp_vpu.h
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
