Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925BDC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 07:35:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F89E223C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 07:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6LgUENP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Xaj8Hufk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F89E223C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1iS9dRiwUQzYbJ/PkziuTrTyI/B7Rv01Sl2QzVJQCOA=; b=i6LgUENP5pVXJf9oTI5Irck5+o
	i6JP6Udl7RPZbZXulZPeo0/2WVncCNlYP91ufour+0NB5+qpz7yqoLHXcKe8ZRKiOK4t9fTOE7phK
	TLhFAXTiQJi8siiyKB83HySdbHXTJeTQO404N3ccXRopNaKL1oYfh016siScQkql0Tt6irXT6Jnqf
	4Z97/CpKref1abNG+qONLhP6ND6G9l3R/CNCE1yWJmqo2xIXIdp8cGEXPLoSDG5vfHAAT4riJwVkJ
	LgWIIsTae4FYDkIP1fqDraIxZVb3YCjjZuk2HGRRzZyLKypchAIGnOLkaIIupJX/7UH3GmheY92D3
	6OGDcqGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmBD-0001jT-De; Tue, 20 Oct 2020 07:35:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmB6-0001fn-WD
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 07:35:30 +0000
Received: by mail-wr1-x444.google.com with SMTP id e17so819583wru.12
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 00:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQmPt/tsW+HEDpe5xrLjZAgYGGi4SsWx2wHRRbyaLCk=;
 b=Xaj8HufkrIOIGFyU041LaS2NHh85dVEh/A6HQALiW1KbY9KP+2CGqr8G9UAg/0W3jC
 UXAlRnIEeF7em+Grap4x3/W3wOX5cIi7ubZnewRHaRHlutasP5GbCyXYnQC4TUXVcUtD
 1b2VuGvt7umuHn6fjGK5SrYKmzqmer+/O6Sb+KOChZ814gBC2thvDrwvJNtGGukLhkIF
 wmaZ8faZIfSMaVc/tzd9MBQUcRZ21kBe56EEmuurC/RFbSTTluQwfVd75d92q6CX1B49
 QOaMgS0x5cspfwhAZR+oSBKZdlV9qKk+UGQ8D/Kyh+1IPAFvkodU5dy6LBmlOTIJXj1l
 1gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQmPt/tsW+HEDpe5xrLjZAgYGGi4SsWx2wHRRbyaLCk=;
 b=J3lIlHo71E2A6axPINC58IYyMkU+w4rru4TppNg2KCFXHmat6Qts6DMgIZjCKawPjH
 nz4pcTF9ly45OfV2wz1pqMOD1nGGUhcU27yQGZU9tmQpirYXZvDhhDVWMuzWwa9zM8O3
 Kr+xGbUwRgKft19JRWhDxBRBe3huD08YGJCLjciPHs0gFD6Mx1FmyXQ7UfDbOMWFBQzg
 /kXG3ETimvTI2tGUNH6UN40ykkLne+XoOd1ioabhkFfbn66AljETqpMdBQkgk/FcR38c
 rnW+1QH7GUqCcXTMGCK+HI5wlqmzLLwpyk+AnSoZRCM8mKE6hd+ou3E4phk3BVfMrwOE
 zmvw==
X-Gm-Message-State: AOAM531G+U9GbcZHta2XbmEIzu4PYoX7uU8XQYd6uUWp2qUGTQLwmQJu
 5IpdlgxnamINIjQ+UNdfkEtzhQ==
X-Google-Smtp-Source: ABdhPJwJhMusNjyYU9HLc0n1BQp5qSSpjfmaREGTGllyXc0ludIpaQZgaVGHxhCQg0b8x0hyiI5hbQ==
X-Received: by 2002:adf:9504:: with SMTP id 4mr1928821wrs.27.1603179325854;
 Tue, 20 Oct 2020 00:35:25 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id g83sm1344119wmf.15.2020.10.20.00.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:35:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] net: ethernet: mtk-star-emac: select REGMAP_MMIO
Date: Tue, 20 Oct 2020 09:35:15 +0200
Message-Id: <20201020073515.22769-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_033529_228034_66BEB5D8 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The driver depends on mmio regmap API but doesn't select the appropriate
Kconfig option. This fixes it.

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 62a820b1eb16..3362b148de23 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -17,6 +17,7 @@ config NET_MEDIATEK_SOC
 config NET_MEDIATEK_STAR_EMAC
 	tristate "MediaTek STAR Ethernet MAC support"
 	select PHYLIB
+	select REGMAP_MMIO
 	help
 	  This driver supports the ethernet MAC IP first used on
 	  MediaTek MT85** SoCs.
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
