Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE73606A329
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KtWWP/gZ;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ika8H+2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=; b=KtWWP/gZZNMZxc
	jmVEjnR69z0idU10ZwUxHJ0EXqF3TgCctDL3WtnYWysjktFtUo7+VSZuBOC3uXOG5g6zuNLTGPGDs
	8l+Wirz+XGJ5dlXl4+JVTtSW15nBZCTEb/5h7sQhCyVFgZ/xBc4R47vDyb+hbqJEQJ9DUAKcpJyBq
	j87kJ7m3kacbwGrXvoYN1wIedzKyq0F4S5xHwLCw8CwlGh0h9nj2KWBdw7KEuyq7QtslGVLdDlcUQ
	hiDSRs+r4dX1gy65+nbbnj8Lx6esN1qLs5nflNKTgg1uCq/6ZqzlfV3uKTLw3wfQXXU/uAqP0EYTA
	LQoj6c77d49ePpwohywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD61-0000000BJcd-03Cn;
	Fri, 06 Nov 2026 06:06:41 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5x-0000000BJYK-17Zv
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:38 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so371047eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 22:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945197; x=1794549997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=Ika8H+2HIcLAAkHNT2XA/MwfutCQjqXpJEwsLdZEx2tBeeWmFi/Bqahm3l9LmWcrzR
         pQPpvNF9/alQ1j5RudQKd7uy93OEFNIKCYSphNgqj73ZWCOYjFgWBVUHt46i3rKspp0k
         1hloqWvLQ9vw0wNU9dFzF/mHhMnMoqmfJ+WhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945197; x=1794549997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=K0zfhhAa2OCG3keI/as9QSVkZPFrc0R0xjH+Hf/ATQSt61iIyNtRmeOIR2BqgeO9fI
         iyv8nQMhFppXuPqj5xxu//koY/QuNqSmxp3RXPncDDCv3ZVU69Lae6H14SsAyR6UIoKJ
         JurOAkHUqXVeaYggk3rArc7t/JtI/pIK0xTRyTL/HpUcIhD5VHw/4YkaeKwCugllEBVr
         Iyeg47nDU0iluwJFVBNufLS8oQEHf4fJVES2PTIuAR4Z/g02+rT2qORn8H5idm1+9Xie
         MiRfV4RVCm5+7sNmGK/gTwQGBgAdOR7TbSRr/AG06vkEmnUD5j7Rwx1q/yF2eF3sL3pE
         OYMA==
X-Forwarded-Encrypted: i=1; AL+hErExdOG5voc3VeVqTGIMJqoQCxxjrmXsGZqZqwYrKaHQEL86Kg2BzFspqxi5qn5W3N1nJf8GfYq1WdmRRyaVMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/yzlp4pZlBZrBqyvXbZzeVUZjVaBK23dmLUfibLy8SNRzzete
	TsuBplnx2meZc4HMdpAer+h98EqwWZYQfCc+MNHM7p3ZAjKdTh6gPt/hSMyP34IJwEl0M0wl5hU
	O0Os=
X-Gm-Gg: AYBFou2Kh1gw0QeXUDwYQyH9Wb1yT3jjqVL5m5pcowk7YRBdxKygLRlsOx1owcX/9Rs
	wZqpgl5Y+a7JoSiVuY2+Io+8Lg4Z71SPUGNsu9c17va4d1lpPR8ELeypRkwlk1tfJRWDD/z2oqT
	ZP9tBha5Sdt5eXQHtU0w8AQAdGlrQl+gbgT+SwMSoVlEhbu/BVAywgmDXcDJhX9Ai5h3KLsJkbC
	WnXsQ1uWIEAXey8WMHQ4lVMGhTJSnw7RS1KWyr9257JSMUzoi0SH+7bT9vknCmtUus7sMl53Gw0
	SxSJ4nzlrvbHVOHu5aI/P37oLh/x/PB/RPjDqx/FmxX5ddA3T/YsXaEcnJZTlowi3oKSOJUyk26
	INGakc8/oxNCmyMHkNAp6kqXDfkLBvEo8GFiyy9/L6mGyQGTzH720w5fpdA1i+2MIYM4MdL4TFw
	YEexmAWTW/jWvFzKMDCRjDo7HMdZx7TOJ19XDoHjUxSF8GEscMU0e33LbTasnBdq1DScC/pbx/j
	8oxlcTg1s9sh2ibSAUHyxxta8HqdvNgW+LSF8Q0K3YEB8g+i6tmxh0I/WJusqB2mljx2lxawrQQ
	27rsua3XQZHozOaD59JFE03cWnEOEJKpXSj9CWugM/zj0Fp3dURxzGzueIG8A2GcXhuVOP8GXW0
	RNFDL03TKEKe7
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr1986502eec.30.1793945196453;
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Fri,  6 Nov 2026 14:06:19 +0800
Message-ID: <20261106060621.2706658-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220637_347489_8ED001F9 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"pins-usb-hub-3v3-en" listed in "usb1-default-pins" is actually the
enable pin for the USB hub's supply regulator.

Split it out as a separate pinmux node attached to the regulator
instead.

Fixes: 7982bf7ec2e3 ("arm64: dts: mediatek: add device-tree for Genio 700 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index d10ee1603103..63b4af476959 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -216,6 +216,8 @@ touch0_fixed_3v3: regulator-5 {
 
 	usb_hub_fixed_3v3: regulator-6 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_3v3_pins>;
 		regulator-name = "vhub_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -1249,16 +1251,18 @@ pins-vbus {
 
 	};
 
+	usb_hub_3v3_pins: usb-hub-3v3-pins {
+		pins-usb-hub-3v3-en {
+			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
+			output-high;
+		};
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pins-valid {
 			pinmux = <PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P>;
 			input-enable;
 		};
-
-		pins-usb-hub-3v3-en {
-			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
-			output-high;
-		};
 	};
 
 	usb2_default_pins: usb2-default-pins {
-- 
2.56.0.455.g6c5a503b38-goog


