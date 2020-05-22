Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C1CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:11:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03AD1206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PamGRTJR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="w4oNVCj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03AD1206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UlWu62d+cechifTho4MA+f+fkn+zrgI0g1cGWrsiPw=; b=PamGRTJRtOZFKk
	IpNhcRdbXkSyJmopWfwDUYsklc2E44t7GFF4xO/3N791E7SHTU3v2xx9ChcNzeo5cKlfc9X4GjSWU
	8k+tiRVjTwhduzoo/4IDYoNn+umPX14TWdwMlz7hi53DezXqsjWbXu8XPKKFxrM+Ef7XGB5bG7Lu8
	uiYB04B2xD48cQGBOKMJEpSHU4uQy0ZMgQJgUmPYJT715WhL9yf1qeS7y/GofWWxK7PEQzC4oRwAl
	neCaN3igEESht2yrnYE9FsLkPIkyUQppJscGUysrumkTG/zm4MMjxpRFsloOlonpd2qFj2b7BU9rm
	4O+z16pwNT/YJxLH2Yvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6WB-0000rg-CH; Fri, 22 May 2020 12:11:15 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6Sg-0003Wr-G2
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:07:43 +0000
Received: by mail-wr1-f68.google.com with SMTP id g12so8731824wrw.1
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=w4oNVCj57ugEIKAorgiwr/6ZhMyAJS7/d21wbhVVREFgDobNnsPNnnl0wzfNPGIvcx
 iJsLaX/gM/6OJexLtHL+UEgWQ/Ie371efyRycyFoXc1owXFpLfN7trsim+yWQC8EHONE
 wl1bDzLXkJG502X4CQzRCO/pg8ANFX08KvuAYQqtybM5G33ioTSTwae0nnbCcYuBZmnf
 uXCwj7dSGhQY8fj0Xt+AjeTzbNFfuCjqTzVcG4Xb/CcRE4murxFQ+ORGDNOeANy68FdR
 4z953GHOUhZ3Mu10PtM6oFNTmDEbRv8nI2vWsi3AL7iMeAlfsOoqSoKKGRO6vlpvyYUw
 KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=SoiNr+S1qKrqA8pPubVdHgkZAIFJhegUzHNCmBh/oAcffOYaKC2Lj8OW3u1deV1bbS
 NtWIgKnfNcCQD1sbyq4ZjcFqweoi/wlQ8Ka2rDtv42GXARSTzNO5iC2kUIumCJW+xGnl
 xLombY3oOY3Ee1DdDtfyUhmNqKiubA5LC7SfwqW5fs5yTsoMJa3M64OuXOdJ1gV3FKHl
 G5cvWitIzGlDPkj6vfNN43GM1/0d6ZAcn8JvRGGiTZimVZeJgYqeT09XJsxkAGHAGCZj
 KSDex8E0JyM4/aaaWSXeiWzozTV48nb9R04aXD6+x6YeKu5c0wHCKzeCRNgl4V540FPs
 +BIQ==
X-Gm-Message-State: AOAM532nIEarsqVodAEmx4IP2WNTa7UsPKte8HmLdtuwkIeFO7+ykOmx
 UV7mOaDLKP9jOoaBBwSVJUhk+g==
X-Google-Smtp-Source: ABdhPJzSAlF/xo0X4V7amcXkOuTqudFkmEG0Vyv0vxLP8Rs1EDgRp8NvMKPwUFcm1KhlXMSc0PUCRQ==
X-Received: by 2002:adf:fccd:: with SMTP id f13mr3320501wrs.386.1590149256443; 
 Fri, 22 May 2020 05:07:36 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:07:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v5 11/11] ARM64: dts: mediatek: enable ethernet on pumpkin
 boards
Date: Fri, 22 May 2020 14:07:00 +0200
Message-Id: <20200522120700.838-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050738_594463_A1A6B6AC 
X-CRM114-Status: UNSURE (   9.37  )
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

Add remaining properties to the ethernet node and enable it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 4b1d5f69aba6..dfceffe6950a 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -167,6 +167,24 @@ &uart0 {
 	status = "okay";
 };
 
+&ethernet {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_pins_default>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rmii";
+	mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &usb0 {
 	status = "okay";
 	dr_mode = "peripheral";
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
