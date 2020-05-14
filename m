Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFE1C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D332206F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncLvC3fx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="nXmcTgWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D332206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UlWu62d+cechifTho4MA+f+fkn+zrgI0g1cGWrsiPw=; b=ncLvC3fxvRGb42
	iCu6mRENwmBWHuXPZO0BojHd6FKYRr9uxoQYAodMZZIQHZqRct/xOhaxPIVMHvcH5+hXjgFHBBS4k
	elYCT/TjAsjOnbLgQXx8UsK9Sus08ro4YIWNSiUOfiEm9F7mIpUekWVKMWRh9nfo+FC3sob6AF1aS
	nJ2G9PezQYPGGH1PskIpzzr9qvrlzR6NH+17tcqO+Lg80aHpT5SUwBUbp9bP1Q9Bmsxb89vhf0u4I
	jgSfvf89DwHj0EYYpq8hJXDLea1nKcVypC8qFbwU8rLcDe492RlC3KsRLNdWxxRKoiaxJKHN9RZ5t
	sEXFlMzb4H7KFxDv3Z8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8rG-00088e-J6; Thu, 14 May 2020 08:04:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8n8-00045C-IG
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id k12so29102836wmj.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=nXmcTgWKai8rBQ2DXas2d5H6t5IBpKKtBOFHUcEyAvlLdEQGxeg/oH6FNz59RFXfP1
 P7Qkldx/02KKtlnaijnKKo8qjlOii2FQNyb0gmqEdu8VwcCQdYj6QtgMy32fr6gphqMs
 7RJ1yCfST+TpHaSnZ1uw1gU9H+l+9GEZ4z8cIuXsToR7E6n+IZbRXPy8YZmXzcTpV4j0
 nKM0IY3O82aZcgwehgScYrbMYMQyyI2Gy90P+Et9IdpErBIOvAYByQc+cW+D49uP72Lm
 NOIOWdT1Jgd2LiHVVUqA2u2f/rYlHEJc0jXjQ0XYKT7TteUWkZPzMfha+VuT7f4ys2Ky
 tuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=k3HwQGOgRWrRS1triywcYtaiEgaD01Qt1Xwky3y63nOiudvW4ILQ+R3fhTG6ggmpzD
 vimkGAUVeWGh0++zKJRCxfDWFt525CMZl8fgkKq9y72pLbl2huy7qzJ9gVYC0iJc/of4
 Ss1YXGqlB3w4QBy4r9Gee0w55zIPxRuvFDqKI/c2bJyPqF3pefq9ZbKEW+Gc6m/KzExT
 VBuETCFlXw3IzzhCdLejtQzc6HQA8cQUu5rzdKABe/KOGxye6K2bBxvonDPZIoD6IWeH
 VFXDS1Ly0L/dNKKrzG2TcbeVjDRpgg/adgPl/tM0GgdBwNLKleF/fP3TAFC4gj0UE9mQ
 1O0A==
X-Gm-Message-State: AGi0PuYabt5KOmOe6bfOHDh2nzByogxrKMsrNS1lI0tNIxG6ab/WHSqS
 UCVIRGUKsiLVxWFfjQGZvV+3vA==
X-Google-Smtp-Source: APiQypLkHL0DWLpTgfSdy1BAdMqLrKiddZcunwHMW5P3bAckgztG6gV48Xmw/vqS4Ej0EtW7WbyHNQ==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr46778546wmc.123.1589443229077; 
 Thu, 14 May 2020 01:00:29 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 15/15] ARM64: dts: mediatek: enable ethernet on pumpkin
 boards
Date: Thu, 14 May 2020 09:59:42 +0200
Message-Id: <20200514075942.10136-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010030_774334_CBFB228D 
X-CRM114-Status: GOOD (  10.24  )
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
