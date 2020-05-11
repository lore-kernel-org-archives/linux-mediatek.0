Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A059C54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206F220752
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQTGB5t7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="BnhSIlLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 206F220752
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUOSFI1Jbzr+jmbUc0xhz77QkQfLUnVNZzPFu+68cHY=; b=oQTGB5t79I3wHd
	Kzcm49w7R/cOIcED+eu2J3qvH0jx1B2nincFpgrsLbmsUh2CNkK1ax0FxZRQrCi2c10R7KdXcawRH
	biZk0/QJTDw7X4yVbhNNL5Y43Dp0NbExOGJhxiqvTtf20AOWTV5MyhwOLyUd1eEjn7+oFwJiqAPaV
	IJ92xsLVyvKuRPVxJQFg2x9AIC/jWG/rIwY6qH8TlUv2tutSZPxgtHXFH8s0g0rWkjbE1S8tSzQyj
	z8UX/5hswnmm836NMpc9nAacoNcTxFRx9ksIblC/wYM+OZUV//2J4oIF+bd1vxXTN+rVeTqQ13uQi
	aC15EG2kmRAtEeNCrTMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA3W-0003Kh-KV; Mon, 11 May 2020 15:09:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2b-0002MD-EU
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id l11so5512412wru.0
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
 b=BnhSIlLGUOMFfC52MRwFwUpau+oL5+IxT7j73mv3XA1jTJZIJIQz2A/+dUwdH20AGh
 coCnf65IfW/UjA0wdDtQEthrmM8Ua/pXygXmqI4yi88+KH4Uab82HS2/hHcO4784GWdB
 0iqX/pvaP0IKonT6d12xExIGCNHih0ZfZQU8HVvdvGkTTHUxUKAb8glPwIZ6XV94TsaT
 dxCnvPFTg9k8b7kDnf62Wlr7b6Ux+/TCMYSL3XMCogB5LHqGBfCnPXkFZHH0b7TeHnja
 qCqPTnXSnlMojw3lCfew9QmkzTsHB8hA3NlY5bQ7vBpf0MxDJz4DQ4jVFgerZnnu2hS4
 r0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
 b=Y7/1wHApiNaMo7DA1U7HKN+nIUjiEE7+SAXOQ5ntWrNpkjCSF5oWg16F5PPeGj9pl3
 KiEwOY5t1IyQWFZgyE5NJwB+BriEsSsN6W/YLgC1SHFhv5lCSMKZqWAeouE2NzaTM1wC
 zFdg7xNmYwzmBOHZxrY24HfeFkpSryNUOyC6cH2wkGk7qZ8lztQOuh9oCWz1t+is1eML
 9E5eQRME3VOUapxsg3djc/uf2ezy7bgKeg3mG5moj4ZyvyomNRz+mUELcRRLrlzdBFw9
 pg3XbAk+PQmE2v+ggFtkwJbVw0H6tcQ6sariVFlr/6Yok/gg7pd/JM2HM/4dudzpovAy
 UkWQ==
X-Gm-Message-State: AGi0PuaY8TkqLLjOv5nrBvaBA8W8E8aIkamkScDq70CTuUXZrNFgZVB0
 kV1YowA6uLY/ZqiLvK0b25uL+TZJJEs=
X-Google-Smtp-Source: APiQypLau2nbF8LlznCAI/x+Zn88CGRz70T0Uof7qjtAsaEtaADMu0aaeRnM9pZ/buyq3Tlceyfynw==
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr19191837wrv.79.1589209704001; 
 Mon, 11 May 2020 08:08:24 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 03/14] net: ethernet: mediatek: rename Kconfig prompt
Date: Mon, 11 May 2020 17:07:48 +0200
Message-Id: <20200511150759.18766-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080825_588920_978E4A02 
X-CRM114-Status: GOOD (  10.55  )
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

We'll soon by adding a second MediaTek Ethernet driver so modify the
Kconfig prompt.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 4968352ba188..5079b8090f16 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NET_VENDOR_MEDIATEK
-	bool "MediaTek ethernet driver"
+	bool "MediaTek devices"
 	depends on ARCH_MEDIATEK || SOC_MT7621 || SOC_MT7620
 	---help---
 	  If you have a Mediatek SoC with ethernet, say Y.
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
