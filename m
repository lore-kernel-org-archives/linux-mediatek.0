Return-Path: <SRS0=A4vX=IL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F6EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 07:48:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3641764E58
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 07:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3641764E58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L++3ZlNK74iKuJD+uEVfbhgnusS43Cn8zLakDxByqRY=; b=XAuLgi3iI4gN6E95Uhpvy3beLM
	LqMOMhP79LzkHLmUVdiIHlQajfV4plU5btrY955t7/DkMDUdAghhqcNm5ZXSEx9vlficz0tqMtWl9
	q7+r/tgv/Z4SR1yftaU1iujtps/W3fDbyCLduljUZ8IvBnRYY9c4c4hwitjBuoLX+GFzRcW5HkaxE
	fjOo8fce6yyFFYFMuSpxCdVyZqLXaGDV+uiWDSvGollhUAG2ChpucYLgN7rSskkMEhWYaz8FUhEzE
	FO4Ot2Mes6OcJLORl52NFu0hjE63DpKfckROy/6pI54iV7joi0Jn4OcRVelmIBghHTl1fOG4r+KdV
	G03vjB/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKz0d-00CyH6-Q0; Sat, 13 Mar 2021 07:48:27 +0000
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKz0N-00CyEC-C0; Sat, 13 Mar 2021 07:48:16 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id C002F40011C;
 Sat, 13 Mar 2021 15:48:06 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH] gpu: drm: mediatek: delete redundant printing of return value
Date: Sat, 13 Mar 2021 15:48:02 +0800
Message-Id: <1615621683-2122-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHRpOGh8dGElDGRlJVkpNSk5NSUpNQ0xKQ0pVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRw6Ixw5Lz8POVELLR0KCSMd
 MEoKCTdVSlVKTUpOTUlKTUNMTk9NVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFJS0hNNwY+
X-HM-Tid: 0a782a8e873ed991kuwsc002f40011c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_074813_273570_1C120642 
X-CRM114-Status: UNSURE (   8.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

platform_get_irq() has already checked and printed the return value, 
the printing here is nothing special, it is not necessary at all.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index b05f900..0ac4962
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -751,10 +751,8 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 
 	dpi->irq = platform_get_irq(pdev, 0);
-	if (dpi->irq <= 0) {
-		dev_err(dev, "Failed to get irq: %d\n", dpi->irq);
+	if (dpi->irq <= 0)
 		return -EINVAL;
-	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
 					  NULL, &dpi->next_bridge);
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
