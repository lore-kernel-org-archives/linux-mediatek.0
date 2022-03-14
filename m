Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WZ+FB3W8YrqZe1OIAi8rI+fSCaEC3pRwI1luipz49w=; b=EB5Rz02oE1ujVQ
	ZUnpzMQycg28p7eF5UJ1XZ6X0gex2CwbuUW3svNP+DKm6hLRNfkTfxEbjro3O+2OcmCFBv2LPtCIO
	u6nuYZ3x7Ej6NME3kRfcNn//TPIu9vVSrudBrn1ncGK2WP/L3tygXKimMcJi7fzqOQKMiclgKsCG2
	TKQ+/RUOtXK0zmLUBMFrA2cLhYdS2amNJee/4ZBxKoDT1dl+6GWt3XxF3P5iBmpSKxvuM7DIPg050
	5d2+2df61AAS/u0gvWO8p6yitwhy0CLYz1oa/SaXu7JoKtG8PIFba0wAIizR5+MFgNNPV6YORCjvi
	9qtC3A6VH13sa+e3qrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToNf-006LPC-Dk; Mon, 14 Mar 2022 17:21:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nToDB-006HQe-N0; Mon, 14 Mar 2022 17:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=pSX7+LSdiUpirjtamvMB01vqzQzGGVJDo6bMg8sXOkw=; b=XJCADYjcimiTkXcp5GfAW/0rlX
 zk5Vkk1f3i7fwLuqJwFX5nCPX6p7RySqHxZI+0h9FC+om50pRIs1ikjW01wwF61TAdFeJ+BINTh7W
 2WqeOkKEKrAWEYrX4oiK/EGfbIaFmdE1QSyQuM/nXcBANL44zPfrzq5r/HFE6olFQlEJrnQnioBt9
 dclGO+RRfcHAAZF1CbFXUaHo5kK9zErb50TiT8TSyZWeDl/8/xK1RoVBbIUngCbtfxcAlzWh6omga
 uzfU/qbkvaWK9WKk36EDoV/8EDbhO3mxNmL295pcVMZ6Psj1wPPOcHQAKbj4hl++tfVeOazbumISn
 0UWcrwdw==;
Received: from ams.source.kernel.org ([145.40.68.75])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnf5-000uEu-Fw; Mon, 14 Mar 2022 16:35:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5255BB80EAF;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2CFC36AFB;
 Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275709;
 bh=hQD9ONOl5WXP8OLmTwqlzucf8/noeaEmBZnVG9VfKEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OiOnt3YzrD1gBcriZleCrHhiEi/g1KQYvVYGadZAXTlfkebLh8qx9l1CrmHSHJ2TQ
 eVNz7AoMz1C4QTgyJmXi/mpw5PghIhFj4xPEgaogURihOqH4ASCbLQP1MqwYO0zTBr
 LWDj161O5Hq+VZp1E7zEH23VCduZKg+iRyVrEQPfOAD5x7JA8cZUXJx9EgGWJpWa3v
 L1h2odQTrc6Yc03OK30FfufXvaR3F59GT2v1t1iS4Tg33t/bQK7GCRn1U8/of34/jm
 qL09fE2LoMYLIdpi2hf5wjNipLv6NdxIn2m0TrmGGNk/uGe/sd5BWmsrfkhgfLR6NG
 ScZwI+xcoqzGQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf0-001wyy-Iu; Mon, 14 Mar 2022 17:35:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
 Xu Wang <vulab@iscas.ac.cn>, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 44/67] media: platform: rename mtk-mdp/ to mediatek/mtk-mdp/
Date: Mon, 14 Mar 2022 17:34:39 +0100
Message-Id: <8a2f9f065b1a38e3d444ad5408c809f339cbecdd.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163511_743766_CE5C7425 
X-CRM114-Status: GOOD (  11.39  )
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
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

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
