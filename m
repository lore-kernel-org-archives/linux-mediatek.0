Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C89C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:18:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671942065E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="paqIaoTR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f1ifvbL4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XFVxZUvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671942065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CW94U5S7ZWwxzyVTcF4PBY1qz+iSI013SiaMF3vrCT4=; b=paqIaoTRwrmOzBZpYYAZ8WoIJ
	+zXF20pqSCaKp86UPj7g13fLpN9M/tc4AD6BLcrg/6+Hb7VT/y3VnclV+1gVwzrEV9jn3QAez06ab
	Ni0zJ/nwsBmqurfWM/qnoeOt+71YLWrNcG98BuROalWYr/FFKNve4NWYkb5ZNdzPCXpSIFyBLHkW6
	ABvfn3t6p3/IAq0nqa32bUS0RleVk5r+ElbkF83pTmxvk8WJyDVw01xhz/h2P/4DkGD7cC9E2DnyP
	7im7c2AZjeno0BuVVz7P6xsydN/UH0qraV8m8lXHfhYN4UKxJKSK0/IP77Wr9qRZ1ogmFNLDwoSDI
	xetuesTHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Nd8-0008Md-B2; Tue, 28 Jul 2020 11:18:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Nd6-0008MM-B0; Tue, 28 Jul 2020 11:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LY9s1nnQKckO3h37XV1S0MJqqf6r6yFpGbgjuCHrjxQ=; b=f1ifvbL42hOEzv5SS56uPFfNFY
 xDlutwE/j8EJCyroWKXPZoGfk2T2TpBHdrJB7Aif1Lywpu4X7imwqDBKzL16LABHYtLQeW2L2GGSz
 jCSmuG4FddifuChAAUvZ67ZttkNH/HKjuyuwXBnQdDpnHs94lHMPttCaxvnbRz7XnIgDV7jG4TcgU
 t/7Wl1VEt6yJfrXsNd4Un09uMOzgodFCGiThwAmPhgIGuA6uh2wVW2PT3Qq8nmmB3pTA2ij3hbnVB
 3ZWAmdKPaJDpyc/2/qHtbwCXA1nu58xLQZeBtu04slQduVqztfT2Lml+6yh5Jt1b+8h9m1a3d6UqQ
 aytHJ6hQ==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Nd2-0006Y8-DJ; Tue, 28 Jul 2020 11:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935104;
 bh=pm4hEMlP1SzMjKQ+uHyoY76koqrhvWkeRDQON2vGLX0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XFVxZUvse2zObR6M+0xBOiKlRSLE0+v2VIYCl0YJ3kC2tf49GCXNPhqSmqusKTBYF
 5/nJhprONs3KnUNv0mp0IJFP8DUXWTRH3BuUm0w4Fp9WhaC1+7kj0kpyfJyhjdPOgA
 KWyDgQ0DJxON7KsfDPirj6/F3kd+B3ImB9v3f89A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MWRVb-1kGiTE44Mt-00Xw1i; Tue, 28 Jul 2020 13:18:24 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/5] drm: Add get_possible_crtc API for dpi, dsi
Date: Tue, 28 Jul 2020 13:17:58 +0200
Message-Id: <20200728111800.77641-4-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hmgR7ODYKvx8oPlcDw8Lc1GdvQDfiX/JgJnDv87nXPtte2migzq
 ZD98y+zmB/ZdT2oYW7Y7j8ofZCmyvZqa5eJRoXNRmZdV4lhEsqqiCqPF33I3WAZ5nzXzcip
 5b5gV7A/c4AzsF40MizKtDOUfJhcDZss5KO+Y5HIkLY1uKWgvNw03Vd+wONHCMSGrAmN1Ya
 g9M6z+lByXTke2b9AhiEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cj6kSjaFYw8=:ibEsBPbF6stniMnVYTZhpV
 zDkTCWx13nsNCZy0D5Scrx7JkmlXPW9zL7/aTnkpDis106jtkcOYgFza12v6q47vNqG2godoh
 gLhY6SVqb6ELX75sq7sW9ju1u74/7nZLjimkkHxejvjvC68ctmMo/7sCG8m2LGloyFKovYFGN
 c084KbHFzK9BOtz9pW99diRqvqZk9muoO8ZF4eUUMP/5Ua+mXClWA35s+POS6yTJrsFPwrJz+
 cM7pYI9fulZGb1LVAnxq27bJR3AaLdbEsE4P5haSQNgi0V0Mh28cY/wEacu2MRiG7NvnFxc+x
 8TIXF4DBnyNnv8jOmtkGTfOKlCcvQnR4J+oh8Vtp459QvDO3rGcWc1AGR1IPwjyT50XSS3VR2
 B7/HNGfrnBFeiqEfvmz+e1TwHznJDsTFNa2PTfjh0e3z0wqLAreht+MlcFoISSgKETCNcdJhY
 378QtY91hzcKzat+4kHeGsq/dGy8uzjqJTepaKJFyoBkM9ZvLW/bCowAvUYZdl3Hy/VJHONB1
 5gZfV8lE5CDynHFSpDYKzbPuQHCc3dZ/Aju0A/Mmuss+HJygnabm37a1Y5joD+/zch5YeehTf
 k0+7i8ELA8ASlNL9e58PPPos4+lgPi78XRBZbHZ0uwLMS9MJl12Bwq6cJ799NDSoBNXJapmfz
 9KPRYgR1OFKg9LSLIz6wLpETayxOFcD0CxlNKVKvaoN6NpjICpTImFwRBsf4COXV8UPWM4R+E
 SJP6QfiPkjP0JGyFQzVCqiCagV8pdNlwahDp7tODe1KbJFS0goSZBVWs8r0uYnW0DVXaBAGh3
 EICMUtSprDwHaR+AloPUW8Ra6ngCNhCyu+VcBhBbjjQGxs5CDQksdQUdEYgGdK+wa+7FXxFKk
 VdOQlWAxgq6NFRas28wxZmZKiJu7cNeqyAzWoufPrLetgvQ3l+zAdxOBumVKoJGEs2wrsTfAx
 iFZDjKY5bQUk1iAAiVZHYWr0SLM8SlY8u7J18msdM6iRv8Xg+bG5t4a//wlAYrMzs1MS0ALVs
 Tj3qoYk/KWnHFUVVg3h2U10q76AkiMaBO3OeakA8+WJJpSer5YuLJm5PtUwQkknRxx7XZe99Z
 x66jqTHfYLKBRUnifsBLBcv8rdDLDDHf2vofJmzUTKUhupHuUuOeWTM8wbq7jw6805Cz9USj+
 /942CydVIXV2AafeVEPUm1hHx3wbdK2S8htiYNjoRmsJoOFPWZEdsPBD91x8OTDWG7iu9sAm8
 C2JokM1mtSHkutkn75y22/U+jB5+nK2NzE4tkNg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_121840_903897_53121946 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Stu Hsieh <stu.hsieh@mediatek.com>

Test: build pass and run ok

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 42 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  2 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 57c88de9a329..a5f2ff6bea93 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -13,6 +13,8 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
+#include <drm/drm_print.h>
+
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
@@ -412,6 +414,22 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
 };

+static bool mtk_drm_find_comp_in_ddp(struct mtk_ddp_comp ddp_comp,
+					 const enum mtk_ddp_comp_id *path,
+					 unsigned int path_len)
+{
+	unsigned int i;
+
+	if (path == NULL)
+		return false;
+
+	for (i = 0U; i < path_len; i++)
+		if (ddp_comp.id == path[i])
+			return true;
+
+	return false;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -427,6 +445,30 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }

+unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
+						struct mtk_ddp_comp ddp_comp)
+{
+	struct mtk_drm_private *private = drm->dev_private;
+	unsigned int ret;
+
+	if (mtk_drm_find_comp_in_ddp(ddp_comp, private->data->main_path,
+		private->data->main_len) == true) {
+		ret = BIT(0);
+	} else if (mtk_drm_find_comp_in_ddp(ddp_comp,
+		private->data->ext_path,
+		private->data->ext_len) == true) {
+		ret = BIT(1);
+	} else if (mtk_drm_find_comp_in_ddp(ddp_comp,
+		private->data->third_path,
+		private->data->third_len) == true) {
+		ret = BIT(2);
+	} else {
+		DRM_INFO("Failed to find comp in ddp table\n");
+		ret = 0;
+	}
+	return ret;
+}
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
 		      const struct mtk_ddp_comp_funcs *funcs)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index debe36395fe7..1d9e00b69462 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -202,6 +202,8 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,

 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
+unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
+						struct mtk_ddp_comp ddp_comp);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
 		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
 		      const struct mtk_ddp_comp_funcs *funcs);
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
