Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDC1C47254
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574B82073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqPwI6jm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="b1g+w8Bb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574B82073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UlWu62d+cechifTho4MA+f+fkn+zrgI0g1cGWrsiPw=; b=mqPwI6jm5RzPXc
	f/bsbbW+lkfvDlJK/C5lKQXa76x1sU0H1MO3JQ9krhP7lR8FrWIwIsv91QNfP4wE2IGKBeExEXFjo
	NjSm2xEUUVGoVS7/oi19MbmWlSGx0ourmenexbfL17biyj54hWmKJlykPz+iYYF3Zl5SWOvnwufZw
	OReJuq/yh6nz5OD0qlz1ObRooQGXFyjP1IhGTYtVbtapvEt/BXadBR+OuZ2qZ2WmzHUDvtDh/M/4s
	UjHB4j2eZ8r/KErRbmDxdkEhWogC2/o81w1iJfNYuSqSZ1WiTA0sA6NBrt4CdBY4TEtDJdVpYPwcU
	NQkdPWSPROtBMYBXrzZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyCz-0007WR-Rz; Tue, 05 May 2020 14:06:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyAL-0002Rr-L8
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 14:03:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id f13so2856696wrm.13
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=b1g+w8BbUfw1KBw5K5flqcpokPuwWxqpurh2OtOPaunuRCeznQpZQlwP/WmuzoQgod
 CFSP4OiPt1lnEwVmBbNmoJbW8Lp9A94lN6aZgEgid2Id63oLBylgAseWNbdxn6jtSsYR
 E/Fc3NnZWPVr75Zc4iI18RNGT0JBcgshtWeyJ7ygIa2DncTH6eFWRlYLO+juQ1IJuzRg
 qq/R2tbLKwU0DYSzilgyEMuOgD9YzdMBKR7ZxLdG9s7DBdX+mipCe+CicuEcioBHW8Pl
 SLJzfUoWzzS0YBpfZIcrkuLP4G1MO1KO2GPMW7SFg0Od6O4NZwujxJubuNCjSksjEPFg
 B38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
 b=csjtNPKrVoKna0grhFxt9ejRZhxZZf6VvOig67ijNqNGNW5oEJHJgvk6w7x/NJTHjc
 jnpKMj60I04+w4+T94UkTJbBz67XH4KwLuXtsZ35se1EzmKShUWWkM+vT3N1cKnvXDWK
 V1+YO5GZOhThUJ8Chio5IVys0Krx3Z3sU2PwjcSjKtG6enX7va9M7mOBv3hHjGdCcIFE
 /dATF782q75gjC+osz7Uibm4Ej0TZ+XwjhilTHRgkQefuqKDDKnTWqZsyt17/aVZeFbC
 3vkfGO9ky3zn+z07aCdR0iG8jp24YrPz8+Vns+l5G17wFhVxfkWK4j0HepGEeTUwccl8
 cdyQ==
X-Gm-Message-State: AGi0PuZhhjqrHC3yXn5cH+9Rn0FgTxzDevTR6NP17vZuYBAwfwufCUwt
 BjBV6ExtS4UNjBqfOP+/m8P+JQ==
X-Google-Smtp-Source: APiQypKSn8NhwYdJ0V9/oJPNixCPyhQzeTO3N+zmykXTaq3hm8BpCPa3gRNfEdcvq21s3N2xigB8/Q==
X-Received: by 2002:adf:e905:: with SMTP id f5mr3949344wrm.409.1588687400189; 
 Tue, 05 May 2020 07:03:20 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:03:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 11/11] ARM64: dts: mediatek: enable ethernet on pumpkin boards
Date: Tue,  5 May 2020 16:02:31 +0200
Message-Id: <20200505140231.16600-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070321_820730_FED45D88 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
