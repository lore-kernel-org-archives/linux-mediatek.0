Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABCFC54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:13:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C2520736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZyi7CNc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="jSfI+/vZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C2520736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB/QYMKvJuLMt1uKsrnMb1Wd6aOdfEMqRzSZl1Cgrjo=; b=jZyi7CNc0+U4wT
	jLxQSwdp36yO011CnwCOg3aNwrCOVmm2wHS9+5iibtc9hh4o8/PZInlbEeDexFVIlU2uGPAo5g5U9
	Drg/QOfkuJTadH3LmCFIaZ95VlLNA3eSfcWUe2MN90XMrPSmaxtHl/eTQVLhxZPhmfBIsIE2dZEIB
	TMXdf8wNetFk6IlHPKBYdcC1md3wd6/XE5SRxjAlVQf5h9WIXc5+ZoVAwJyYQQELyfJBG0KEWQ67Q
	/leg3JJKxc37V/S3Py/dWdDTdWo04ysGvMaw7YcK50V/Tn75wv79kwiIYiryeH370AzFoMLHUKfEc
	kLORObC1Ju9uX8UQK5eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA72-0000vp-6t; Mon, 11 May 2020 15:13:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2p-0002i8-NA
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id z72so10108119wmc.2
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=jSfI+/vZR/vNDIop5tYQipIr0sMk/NiKnIXCptTaZ1UCH8HUZKtoJB0OgdBC9z2vBa
 s1xE55pXv652Vn9g5VfKY+a9uy5dJ58vb388YQHIUELGwWKiI2Kklor5r7oNIbEpXyfw
 KV5YwxqgIpXxq6QZxVL59d/K3dLnJ4xHCK9jH8DxWKN9GV74AYB4ifDBaK5c8FIchySB
 jTy+eyVKoq1zegnDbhlXUrBw3PNUSPehwJhxpAelJ3W7RqurHnfFTAdHIpqCDlnFydz2
 ylL+Sv0Z6G9Wnhh7GEJTTL5mfenRpGEj6fqVZUHtSmuR5ND02ayD/nfbulwZMANrTHpk
 vrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=mkoh31bq6jKXgkkg/Ug6ruRbzefRwc52JVCwfie1Sr6KC+FjCV6Q5ehxJacLs70vHq
 DOW/YxLZoc1grDDo2QIh7UgnR63YJ32yGeDwSg0RA+oQdYaayDjj5pCA7eZ6p6nYVe/v
 vp4PwZ3YXY5KmsKNedHb8i90in6r7P02J02GdHJ2TSkE7KEwzqtL8nRt7vPsQ0BbplXU
 3Ho+lelgIJX47HFx2N5ap6TI/seNKYSPCvzgZ6AKFK65ehBot/EY7t4vW4sGBERD7ffA
 tdcZnbIuOgvj0LJs/rNb3TNSEPref5r61S/S2JHyeT1d0cc6qpZ+NBy4QtZX/znrV+YU
 fFow==
X-Gm-Message-State: AGi0PuYSi57ZI3bACRBHnKZW/x6QTy8wRxfDqe8mjNLPqdxipkLH9sq9
 F2jWb64QzQOt/tZJXi5dVTuHTw==
X-Google-Smtp-Source: APiQypKpf/qfe7MFRJIMepNxeMQg7U0eG0wqy9FY4xaWhiap/9Tgl6YqeR1YMWRXjoWZty2TygbXNQ==
X-Received: by 2002:a1c:2457:: with SMTP id k84mr30054044wmk.96.1589209717331; 
 Mon, 11 May 2020 08:08:37 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 12/14] ARM64: dts: mediatek: add an alias for ethernet0 for
 pumpkin boards
Date: Mon, 11 May 2020 17:07:57 +0200
Message-Id: <20200511150759.18766-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080839_777891_AD511C2D 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Add the ethernet0 alias for ethernet so that u-boot can find this node
and fill in the MAC address.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a31093d7142b..97d9b000c37e 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &ethernet;
 	};
 
 	chosen {
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
