Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43984C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaDaAFlsa37XitWbHVXc291C6JPHVBPZuVSL/leg4ag=; b=LLNTC4NC4seZn/
	PP/x6uiH6cAdelQsVPsyQ7i+a+R/QxX39fDJIGDDcS+QbQpkKOivaZgWqRoLAm4G602Z7kZ56yP49
	eSZtoX2JLZeFJsLnAIsiukn5LhuepdEkafnEu3UR2na7e8ZCFmSA9eULzKJtg+lKFA/RgHU4u4Mp5
	6KE1kmpD1kaMBE6fvLx0pASAh9cINLfgpS3pG0Xx1pge//gKRlnaG1jQYpfTUVulSwrT6HtAxX1ui
	PtrxfHnaEYaAlrM0yF+15tpNm78kR5jsew80MVb8BycktL6GYO3KBjm1KKn94kWsKqpO6LOF9wMFI
	IvqRshjkbJJE7dIBu4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTLq7-002ZcC-Mr; Sun, 13 Mar 2022 10:52:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTLpb-002ZMa-9J; Sun, 13 Mar 2022 10:52:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D95F61016;
 Sun, 13 Mar 2022 10:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4E8C340F6;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=kuQsLLv+qQVtZ3MO89AZs58u9elVJ+hwK+IWxbSMv/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KV6SZze7o4rV4F4Txlqkh3maE5DLk7jQJN7FJOmjtaGAk8FhYXkZNHNKUL5WCkl/t
 S0KRtY2ksH1k7Uib3pufKaleJHxFra7nP2+0fRB/Db7JsGF3pCyQBsLJ8FPtGCmyjC
 axV5C7Ft/3SN5UaW2OE3GfXZf5BCQ57mYiuf+VK1EEtTYBdwK9AVdaRBb87YvUBOD5
 wV2MN99soEITO8oFiw3p/omOK4BXMkWE3+QCBLIBrDv0Tw7JrXrRmpKE1qzq7Gdmh/
 BwpzVIbCbPFh6NcNCpBqNmGd30No2d+Xtcqx/MThmwVpChW4YOTumEMHSLYv3Opp0d
 JzXBHdQxa3zAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpW-001I1U-SL; Sun, 13 Mar 2022 11:52:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bin Liu <bin.liu@mediatek.com>, Cai Huoqing <caihuoqing@baidu.com>,
 Colin Ian King <colin.king@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Evan Green <evgreen@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Xu Wang <vulab@iscas.ac.cn>,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 04/24] media: platform: rename mtk-jpeg/ to mediatek/mtk-jpeg/
Date: Sun, 13 Mar 2022 11:51:45 +0100
Message-Id: <3c8f6cd0c95b7be3ddcea487028ebef8ae92ad68.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_035211_446734_FAA6C17F 
X-CRM114-Status: GOOD (  10.97  )
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
rename mtk-jpeg/ to mediatek/mtk-jpeg/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

 MAINTAINERS                                                     | 2 +-
 drivers/media/platform/Kconfig                                  | 2 +-
 drivers/media/platform/Makefile                                 | 2 +-
 drivers/media/platform/{ => mediatek}/mtk-jpeg/Kconfig          | 0
 drivers/media/platform/{ => mediatek}/mtk-jpeg/Makefile         | 0
 drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.c  | 0
 drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.h  | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.c    | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.h    | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.c | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.h | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_reg.h   | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.c    | 0
 .../media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.h    | 0
 14 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/Kconfig (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_reg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b0e60da4e9..fa0a3de3865f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12130,7 +12130,7 @@ M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
-F:	drivers/media/platform/mtk-jpeg/
+F:	drivers/media/platform/mediatek/mtk-jpeg/
 
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index d8436923aebe..fdb4e1a8aa81 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -78,7 +78,7 @@ source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
-source "drivers/media/platform/mtk-jpeg/Kconfig"
+source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
 source "drivers/media/platform/mtk-vpu/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 48531f93d92f..c792f6216918 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -18,7 +18,7 @@ obj-y += exynos-gsc/
 obj-y += exynos4-is/
 obj-y += intel/
 obj-y += marvell/
-obj-y += mtk-jpeg/
+obj-y += mediatek/mtk-jpeg/
 obj-y += mtk-mdp/
 obj-y += mtk-vcodec/
 obj-y += mtk-vpu/
diff --git a/drivers/media/platform/mtk-jpeg/Kconfig b/drivers/media/platform/mediatek/mtk-jpeg/Kconfig
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/Kconfig
rename to drivers/media/platform/mediatek/mtk-jpeg/Kconfig
diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mediatek/mtk-jpeg/Makefile
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/Makefile
rename to drivers/media/platform/mediatek/mtk-jpeg/Makefile
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.c
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.c
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_core.h
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.c
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.c
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_hw.h
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.c
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.c
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_parse.h
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_reg.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_dec_reg.h
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.c
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.c
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
rename to drivers/media/platform/mediatek/mtk-jpeg/mtk_jpeg_enc_hw.h
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
