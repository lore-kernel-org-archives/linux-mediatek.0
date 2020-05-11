Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B700EC47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A75B20736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ctlj9G3x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="IONh+Dpn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A75B20736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv02LsBjwJjBW/VMfFITHCayfKlSxhx+2i0tGrmSolg=; b=Ctlj9G3x+my3AP
	geWat4zp/cwgZ8zYtoDF5qRyEpSOYV58L8e5m10XGPQGoGMHYzYIb/K+TDSeZaLE6EkfPYPBu2DAu
	wbbrb22d0PCfiMzOo3sFs2MjJ6epsTPPZJEv+OjSRpI5b5TXTvX6RrugMzFZtLeRfFykK7ziAWaWK
	U4zjAAyc0qHq7CPjYaoBqa2in1HsB++zZrVNyoxm24T4bfySqg0OTQbo5M0CSOVaoq9q8SsnUf/FI
	94WlV7+HVmP/Gj9gCEHxZQ4iFFREWg8MgrmqNOQaJ1kqVSmnhO9ZXmr/Ifw4sYttZkNpTMBmSmX/N
	oRUU+w4ktFe3zxAkvRQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA3k-0003al-Jc; Mon, 11 May 2020 15:09:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2c-0002QB-Mn
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id y3so11432193wrt.1
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
 b=IONh+DpnmejFuXALAwr/I/OjxLG9/eNbjfLpyONcGQibovX8pI46VIZgC9xXwCv98H
 Ky9NUKjT2vd6Ug4cS8NQuuG/ijvNN86K2vpP/v5IdxeXFOrdi9TwLnprkwDDJXsKFnuw
 /vRoJJX2IslmnZxnrfWaBBRCyW1JbduGoxT58Yx/n3jOInNrLcgpirPWOVnp07i32Q7+
 vjHPKCdqY5TRz9Krgcho0oar/Ep/f5M5qDpMJgBk88UWDXbKxzhxsOeSaIA8vbRlD2Eo
 XUzGSDPMVx702v2gEp1ifsTebqSwhxEbem43H0bhsSH+4P7qfxv5J+IWtyUaPlnHxjuF
 Fq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
 b=buwyEzk05PYZJyuT73tv43AEAd4OPJkiXRHmX32aXCO7ova0606EE1+2eeD9+jjgoI
 J+lCcRMa3spFOnH9TgeNR1LyBaOokRDNAsvJXoK70CoZLp5BK8c84N7cNcm+OQBmWxn4
 fLwJBaEDaht9vzrrTEsjolcEFoPO8OCbMMU8an2rh+VieqXrqadFFWuNiaZ0clE01s23
 LcGw96yEs333sw4y3dkKxCprGPHnDfPrPLe6edMSj9chSDlYARcyP+/UZbjmemOWxNyk
 sczxvoeRWF8I0J4d3o9V4y6tG6dZrJRy6/KuCvAc9IYqZjFknDBAPSwiU3QB/+9DRFQd
 wxzQ==
X-Gm-Message-State: AGi0PuaNDubxGpjgmYId702YjmUG5BnclFIcxr30tu8nLNuTzwbT+Mfr
 Ee3/4v2f7G6RF0fwPWSNIuImxg==
X-Google-Smtp-Source: APiQypIP0Bn3KOIOBxC1UBNqcqDai8qWfKN8IcFL5zqV14Hb8VXZDCZKqkzaVDqG/Ivki43uegY3ag==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8322148wrp.427.1589209705382; 
 Mon, 11 May 2020 08:08:25 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 04/14] net: ethernet: mediatek: remove unnecessary spaces
 from Makefile
Date: Mon, 11 May 2020 17:07:49 +0200
Message-Id: <20200511150759.18766-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080826_887651_DE17F76C 
X-CRM114-Status: GOOD (  10.28  )
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

The Makefile formatting in the kernel tree usually doesn't use tabs,
so remove them before we add a second driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Makefile b/drivers/net/ethernet/mediatek/Makefile
index 2d8362f9341b..3362fb7ef859 100644
--- a/drivers/net/ethernet/mediatek/Makefile
+++ b/drivers/net/ethernet/mediatek/Makefile
@@ -3,5 +3,5 @@
 # Makefile for the Mediatek SoCs built-in ethernet macs
 #
 
-obj-$(CONFIG_NET_MEDIATEK_SOC)                 += mtk_eth.o
+obj-$(CONFIG_NET_MEDIATEK_SOC) += mtk_eth.o
 mtk_eth-y := mtk_eth_soc.o mtk_sgmii.o mtk_eth_path.o
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
