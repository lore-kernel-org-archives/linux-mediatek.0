Return-Path: <SRS0=+XBv=7F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93955C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 13:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC3920727
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 13:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zd8N8kAW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="WCoxlxcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC3920727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EENaklHDdjYmZtp2inA9lMkwFYY2AJggLuADeOPbxOI=; b=Zd8N8kAWiODF/8
	PkuO18xjjOYnGip/Rbmv2bmEFDMh9hLmPOJdTls6rHT4tkIvzUxwuoSQoVFNZL1w+GKvNfrcJqFXg
	/3O0eGzI4tKh4sfcIfvKMAZ6aBdP2c5RINp1jijGgwndhNx9z77h3x0EgrrC5cdBrYsO4aRmUXx4X
	GS5D/7yxXYCFoFIUr74vaCqOoo6HCNqnDk476uiz8xXa5Ioagyf7XDMHfV0pEs4TaqdYwf9pWgt66
	72MX1Un99QjobUpFq4EiSXZb3WzMmLqwZX9fCLpty3nxZ+2hLW3zitLE2qk8zDNChgC9xE7z0fVox
	F6jDt2UNt6/W5/3CW/AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcUDN-0004e2-Np; Sat, 23 May 2020 13:29:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcUBU-00031U-D0
 for linux-mediatek@lists.infradead.org; Sat, 23 May 2020 13:27:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id e1so12974070wrt.5
 for <linux-mediatek@lists.infradead.org>; Sat, 23 May 2020 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64kvwBG1/A4ZIpIpQ81Lq/ynCrPXhKaGjAzI5WzwgPE=;
 b=WCoxlxcAreaFf6FWNGwNvYKxgyg/0gU+HbaYFg23bXDv4PSZYQHZlcxTOz7FCYoubj
 5e5E0jUoENWF/3lKC2kOeluwhMEcroHJYd4LLhnNzHEnkUXIYnNGkbayPKVmcdBOa4Ct
 Zd7GHa3AvzA8wj3qLAFTjfju/dvJxGVk6M8DDJ+ik4ZotMuSwK1r56f3O59Uk50PFPVn
 R0DaSsNzfIUyeO9IWOXdsNRiOpScHj5lcBRivA9lt7wATE958fMmZQ8bNr/E3zw9Lp+a
 lRCGiGC2Qe4t821qu5XEVbdXbkQ+sQS32lFBOC3K6B9MwNUMYCIjE+kQk5GoDFnQ/755
 JQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64kvwBG1/A4ZIpIpQ81Lq/ynCrPXhKaGjAzI5WzwgPE=;
 b=AKk7fdkyRiNqyjIl8ZvYVQ/5xbUmXIO81slDX+hTa0UO4H7G2w+Hq8yTDE/q/ZM/pM
 CG4oUqlpoy5qQDyO5if2n5ZaI0VYwx4/HhHBt9XFIBFV6AnoaS4J0fOB80rla4kUIwmF
 DvFs3/XE9v/4BrxidTX6guhXXnxhyRZ2DYRk7sI90vJ9gHjh7wmwHjfEDT/nU9U42s0J
 AEN8q+AKgxDP7zuoYv9P1IxvNoP9k3U8iQSpuTpLF0jJigq5UiBXxH0A6kj/qIoK51ue
 oD/Asrk8p20NxgUtdLyyAGAznJvk/2Ga2yX+SF4BQcduu/xtuyx4sQzgDi8jFaKN0V5o
 JP8w==
X-Gm-Message-State: AOAM5333d6Rpv2LfvDBzmIid1du7RscqvawxgAO0cJu+BAkHTNnt3CdZ
 iC0jc9d+2puAzMAYWz/Az/IJqQ==
X-Google-Smtp-Source: ABdhPJzIGyb5J01y0YxEKH5gekjElLjvEzQP6NEzA1GtaboJVo5CQutHS2WF+ceWndsriO45lbSBPQ==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr3797110wrm.33.1590240446683;
 Sat, 23 May 2020 06:27:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id g69sm8098703wmg.15.2020.05.23.06.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 06:27:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 5/5] net: ethernet: mtk_star_emac: use
 devm_register_netdev()
Date: Sat, 23 May 2020 15:27:11 +0200
Message-Id: <20200523132711.30617-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200523132711.30617-1-brgl@bgdev.pl>
References: <20200523132711.30617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_062728_459041_D3E52EB5 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devres variant of register_netdev() in the mtk-star-emac
driver and shrink the code by a couple lines.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 789c77af501f..b74349cede28 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1519,13 +1519,6 @@ static void mtk_star_mdiobus_unregister(void *data)
 	mdiobus_unregister(priv->mii);
 }
 
-static void mtk_star_unregister_netdev(void *data)
-{
-	struct net_device *ndev = data;
-
-	unregister_netdev(ndev);
-}
-
 static int mtk_star_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node;
@@ -1641,15 +1634,7 @@ static int mtk_star_probe(struct platform_device *pdev)
 
 	netif_napi_add(ndev, &priv->napi, mtk_star_poll, MTK_STAR_NAPI_WEIGHT);
 
-	ret = register_netdev(ndev);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, mtk_star_unregister_netdev, ndev);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_register_netdev(dev, ndev);
 }
 
 static const struct of_device_id mtk_star_of_match[] = {
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
