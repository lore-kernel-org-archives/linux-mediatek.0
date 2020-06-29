Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB22C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA4A23D21
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xkO9u6zD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="VvL4yO6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA4A23D21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wMfBJxIEmPes/WiN+u2LZJ5U2vxINxwq9AXXR8IoGj0=; b=xkO9u6zDOoXxRW54GkhDhPs+3
	16l158m84Y1lO37g42zOgoq6PIlipYofEG0kveNu9teHhwO9mggAEj1gcE7Bw5H0sFpO9QH1Ew7aU
	uhu3l+pbGYMUQA4oGc21yC+i8r+6ruo4S6NyKWXp7WzAxYBWWl5X6TZaxlt4hw2BupOtH8T/Tz/h0
	HTDjpptA+rZXpDnsPByP8EdhCqapVmPdQSru28SBldSMcV3ULaptXZB18Qbw1mpAx/xm+MpK0PG2f
	6CPJy+Ar3rHlCfdVqoUuxzuA4hX3jqZx/h+TuT/KBXIktL5guDP8ie2XFwti6r64QD+7RBygYu6Ke
	iISAPszEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWT-00087q-Uq; Mon, 29 Jun 2020 12:04:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWE-00080l-8j
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id f18so15866684wml.3
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hz0iVZuquqaAZG91zpdXr2Uyq4D9Tl6Yab1oO2oLyu4=;
 b=VvL4yO6jCcGsEdtzYiLzKqRQKd+CJHaFyeqJWf7CcFeUmtn3q8wK56Ka3u84RH2/TB
 NB1CiAymp//XtqnFz5/H+ApJeRCUh/SqYJkad+wuFzUrSypwMyamn05nNgh9bLzgio/4
 QBu82NPhZZT4p9ki5bX41KR4ZogP7bglHyn0k1CHfqSTORfkjFmMOuW3F+ZcTgaapo1B
 kH2qepefaYlMyQ/1lvRS5epPqtlijcTGvri5VRyh7kANgzWCz96TsJFHbd1OpXN75CnZ
 b9jNoyvkUTRs0Vyin0UkoI4pBwLsrwpFCWDaCSYqIKh9GuRWgBS4RIRv05e4D75Eph+2
 us+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hz0iVZuquqaAZG91zpdXr2Uyq4D9Tl6Yab1oO2oLyu4=;
 b=o9/2XT+coOAnYPgJoV/CKDGdeE0tppnPCPpBzvE6W/doo3DLcu87QXpletbJrk3z0L
 IQyb+82lOCfmIlnp05bucKPc2HcRWfsm11rEVMe/mgKlekOIrS5dV+MKMROYClvBBbbO
 R/m4dMHyBo5JIcASgNfGdDLVRS6XK/Sv8Mq0XocsgnyG1XQYHCx6b9odQJy3o4XNN0Zr
 82sHshgZT5U+G3K2fFuT9H1YWZHgkBFfodfIKlrhqJW/gX5loAQFfowRHqVBAxW0O0Vi
 y1naxWs9Os3++nXEHcXy73ZukXBYCwIXpjY5TrS3g45e0EV8LUnDzK2puP0+rMy4IgN9
 1oUg==
X-Gm-Message-State: AOAM533ioitFllNgsfdLvoyk8iXDCkadmhODmiwl751aJfXvJXFqg0//
 hpLrLrAte/BTdC7dA7X/k6w12g==
X-Google-Smtp-Source: ABdhPJwR+XCjvBHh7hN27yb4wbyQ2NgRHNnJda5bGoNm1j9W8pobPb9+mBDwQzfYrDFvbqSH7NAqWg==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr17632537wma.180.1593432252690; 
 Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value of
 ixgbe_mii_bus_init()
Date: Mon, 29 Jun 2020 14:03:37 +0200
Message-Id: <20200629120346.4382-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629120346.4382-1-brgl@bgdev.pl>
References: <20200629120346.4382-1-brgl@bgdev.pl>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function may fail. Check its return value and propagate the error
code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index 97a423ecf808..8752b5eea091 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11175,10 +11175,14 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			IXGBE_LINK_SPEED_10GB_FULL | IXGBE_LINK_SPEED_1GB_FULL,
 			true);
 
-	ixgbe_mii_bus_init(hw);
+	err = ixgbe_mii_bus_init(hw);
+	if (err)
+		goto err_netdev;
 
 	return 0;
 
+err_netdev:
+	unregister_netdev(netdev);
 err_register:
 	ixgbe_release_hw_control(adapter);
 	ixgbe_clear_interrupt_scheme(adapter);
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
