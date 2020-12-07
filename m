Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BC8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 15:10:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3AB82370D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 15:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3AB82370D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MP+RP8eUUn4b+ZvhlIU89qVYatBjSdtJGhYmsPaM+q0=; b=sGGvHZtJ5tbFZmnO5Vh2eIAkyE
	pUGpxmzVKafyd+txQkp9Hg7UWmazARsJGDZMZrmNxKEngGctVRc+Yft1ixQAugben+1iNmuyP5OZk
	2WDQVraMJBQMF045TUgxS44dDr0u03YAeX1y3bSaDJGMMsricpHjL3cb8/RXpbTKQDCD7lp6ibGEe
	9GV9bQcNmm8ak1nditGOAwhPu9ffbNGrM4vVq+bsrIE/kiAa0kZxdeXhsQIYV9+7jatzbN83jpyn+
	djMws0Ol/R6wY9jNDZylvsIsTXHDR3f2rIYY82BrOij7VTZFdtWqiHSDmlY082tKnoA8Hl5nzlW5f
	gZP5crfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmI99-0006qK-G9; Mon, 07 Dec 2020 15:09:51 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmI94-0006ol-Sc; Mon, 07 Dec 2020 15:09:47 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kmI8v-0006O4-Im; Mon, 07 Dec 2020 15:09:37 +0000
From: Colin King <colin.king@canonical.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy on an
 error message
Date: Mon,  7 Dec 2020 15:09:37 +0000
Message-Id: <20201207150937.170435-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_100947_053222_B9BCFC26 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a null pointer check for hdmi_phy that implies it
may be null, however a dev_err messages dereferences this potential null
pointer.  Avoid a null pointer dereference by only emitting the dev_err
message if hdmi_phy is non-null.  It is a moot point if the error message
needs to be printed at all, but since this is a relatively new piece of
code it may be useful to keep the message in for the moment in case there
are unforseen errors that need to be reported.

Addresses-Coverity: ("Dereference after null check")
Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index c5c61f5a9ea0..5184054783c7 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 	    hdmi_phy->conf->hdmi_phy_disable_tmds)
 		return &mtk_hdmi_phy_dev_ops;
 
-	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
-		return NULL;
+	if (hdmi_phy)
+		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
+			return NULL;
 }
 
 static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
