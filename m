Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADC9C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D10207CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqcIX8U1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D10207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S9q5WOHRb3KXYDlxTqaQyzR5QQxAimW1IMk7i6m4GoU=; b=fqcIX8U1I2V3DH
	LSOd3KKBJRLAb1hOIsl4nYOaiXDgQB8oFYVTq6F3pWTwb/7YNtQ+nfoR94AsTswLL2B/nmbxe21me
	ogLjc10xUFF4aeIqh3pmqeydcLS/UemwcWrddWr4/4Y8APDhQVFV+OlYKPy+F/mg8aDaOXzfPbPNd
	k91IulVqAhGbGPWJ9tu9CPY7g2asycxh8GJxWjA1+D7xsQcG7Xn3DlIIySHPIca5krbqMAQycmUD0
	ecBMQO3gQwFEI2IDSzuIXo2jivwhhJ5IaverID7aYyxqRVZqyeNUxX3JnfILn3V2PHQROc327m7xM
	YdZVGdjZ1WzhFNOgMT6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwDh-0000vA-F5; Wed, 27 May 2020 13:35:45 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwDU-0000jn-93; Wed, 27 May 2020 13:35:33 +0000
Received: from localhost.localdomain ([149.172.98.151]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MUD7D-1jUlQi0JwB-00RKHc; Wed, 27 May 2020 15:35:19 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] [net-next] mtk-star-emac: mark PM functions as __maybe_unused
Date: Wed, 27 May 2020 15:34:45 +0200
Message-Id: <20200527133513.579367-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:cjj7qKhbYdAc+XoRu26dmgr99+0Mva2jDkFaa+78wl0aZCmV0UC
 ncWKQldljAs9dUqWY0pwFACTSCYn+/UUUoGqoBekQdJxfEOmZ8sl1HSxzBgSyVaAO/n82XN
 AkaShtBDsW9lZ8jpzC0+KlPr+2Y837pRS9hMODZSl5LC0r0sD1Ic6quun77ngs6pdMvub+y
 RyKC7kjWmzV29q58j/l4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oj+4JOX6juU=:0m8IpO+rj+vvHLiYhZyv58
 D4pCaNsPZ1/q70Tk2+JpIvmlDIZoPGimTin1lF+Sc16SU5olSM75WbhAaB7DcPnDWoTSgDxpT
 Rs1v3nRGTX5OU7FHDg7T0TwbHPu8hz5P0lA7uSExtaCZ9MdwFbiBA4V5Uifyi7+mFGBB3Ku05
 1p2K/sQLMSkLJ7R5YWl9J1xgm9Q13Dpx9yCdIhSHCNIfbGhxl2xhR1kr/IAB6H+7X+b5MfncL
 hilM5lyLg367eb/mY5vEOmG/BFU7qUYxOx51fTaKMD5piYkjGhe+VbbXk7wXmb8XFrunvAoaO
 stSL9IuHMslwPrE8R9t0OuJyoyD4p9ORgUJAt/aNnOzVWToYoM2Bz2ptG+brORPXNpQleY0vU
 ytUjSljBF9rh/7KWROwvrrIYKSfIksSCrriVubLuVKuTGEg4tF9VM0ENRChN6mstZXasxBdKb
 3kRtme4WFswSSMmttxf00aRO1IxGerzYscCJCqnR5KElnjHh9lUfU1rwx+E00RMappZji8y9N
 wc7oMm2EMBKGmQRYKrNdCboJP3EUNkmaqMf8PmI8lbEUmT6We8ZYT4uqyejwDtqRDlgL+yCsf
 oNg9rZBeBQB9urX3AOO68xlnOj4kSTQGcTYzdp1093vZpJINl9lErqkTeKoKWgRqeU0dZB9dI
 908SW4x0C349asxQQdKek789w1MRNkNgHYeeXo8yhlORH7/8e6gYpWQB6RjTBMZBs/Js+k4aP
 UPfmHIS6Tj4wmqsdhSBh5MmevMDEqNlXA2lfa12XRaqCtpj8w97k/qOMQG5W9LGa5paADueGt
 OMrDQ5hTnr6zTtfaIXcL+PRkXXI6gsp4NOpc4g/BJwgRSgpXJ0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_063532_612365_16D362A0 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Without CONFIG_PM, the compiler warns about two unused functions:

drivers/net/ethernet/mediatek/mtk_star_emac.c:1472:12: error: unused function 'mtk_star_suspend' [-Werror,-Wunused-function]
drivers/net/ethernet/mediatek/mtk_star_emac.c:1488:12: error: unused function 'mtk_star_resume' [-Werror,-Wunused-function]

Mark these as __maybe_unused.

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index b18ce47c4f2e..3223567fe1cb 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1469,7 +1469,7 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 	return ret;
 }
 
-static int mtk_star_suspend(struct device *dev)
+static __maybe_unused int mtk_star_suspend(struct device *dev)
 {
 	struct mtk_star_priv *priv;
 	struct net_device *ndev;
@@ -1485,7 +1485,7 @@ static int mtk_star_suspend(struct device *dev)
 	return 0;
 }
 
-static int mtk_star_resume(struct device *dev)
+static __maybe_unused int mtk_star_resume(struct device *dev)
 {
 	struct mtk_star_priv *priv;
 	struct net_device *ndev;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
