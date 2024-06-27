Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E69C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4DjhfkRszKoe5oPh3mJCAe0ASyt5TfGg8KpZA+jjx0=; b=g22IfYF3yTkXdKIyZ0WaDR02xn
	Jw3e3oM8H3lGPepvdZBMc+g011toifGAnz/kenYEeEZvDlB7FtPVBnVniWludnD8Y+BAsLPF41C5t
	W9l3q0xuXmfqDd4IdC8EDfoqLpkyseiBKpZunCCKsCWnwoObdCBiUhdiq09oQtVZ26YannPwkurmv
	gWYB1oYPdWXA5frxk+J8AiwpllAY+sf2XCAgYlr275JuRFG3dp9CMrruz8lFXZWJ4fPOHJSJkL3C9
	xPAzLq/jkcqhyA9Fq+AOErk+ZqXYi0yu1t7OXvatQu/ZYvMF64caq81HsgOap7oJIvUbiuEsUbe83
	fk6LRa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk3I-00000009f1X-2p5V;
	Thu, 27 Jun 2024 08:00:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2v-00000009esh-0WSr
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 07:59:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1faad2f1967so2405415ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719475195; x=1720079995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4DjhfkRszKoe5oPh3mJCAe0ASyt5TfGg8KpZA+jjx0=;
        b=dn4AEn3Q0wGWustofrNs6gtQ7uOwWO6HDc+qS0UNAGj8GjvpUwl8ngEnUKNdW6kFm7
         BEnY6AU7ZMgav5oYf5pcRvSIsBXDwW2OjTgtfBgbL4REQWjYgjmLAN6ZjMGKEDJbrZCl
         5zFJlYdqW51CAber9H/mUTo6uNQH4k7+kU1aBfRaEI2/ZqVT5c7rfpbA4Y8y5b15G5wb
         rFOjj39zu73NgOY85IZUoN8VAB4DNx4QIGBcoH6MhTnOV5IFM2wJ9Qxtx19oQVO1rZiy
         sdcoDFr8MePn204QIcwbyAQNShKOxKrYYWGMIWXhWXK7+zj+mPnomDWUc5uy6rneyeIY
         RfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475195; x=1720079995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4DjhfkRszKoe5oPh3mJCAe0ASyt5TfGg8KpZA+jjx0=;
        b=da4ARKF1aG+TQIBH8I86k/WfgSqO5M/8jsnDlL951BJ483T09inTq6LAsJDgAs+J0K
         j76YoYWGm3pqixdcXYUhnhaJql1Od34cfrbv1a0oqcaKA443EuNbU6ibf0zeh3nMBSCF
         NVrYC0rUxPsMOvb3B7f0sDV35SuxSawflpU5d9BvIWli4pk4w2tzVThVFOGWzqcqYMoz
         H1IxPgi5sUw+ap838M/WU3UYBZc/ywpuQRg8dy/McEryAppIUBqsOkdQwyWNX893UEwi
         dWhzUluxLEueALRq+47dz22VPywcNTQBf7Eiw+GLqEj2xX0pxYoJBtYVgGd+iYnjqwTD
         WAPA==
X-Forwarded-Encrypted: i=1; AJvYcCU7HQi/Us4GdlNfga0NK3nfLHFs/LghNfE0TfEe1JhxTTxKA9vW4vXJho6C78seNCoQNkhC0Fchg0YF6Ndy5SCLLv+elrCzoN1kKsWNWLPvCsnO
X-Gm-Message-State: AOJu0YxQoaU0PsQBv/UYBaAAA/XcJKj3LWDgu3qLn8Xuy9PqP7hFihl5
	/a3eLYMdYlfjAyWK9c2ajxPhjVNoO4ORYBVPjVF3t2SFqklrhmQ3bvhOf6j/2Q==
X-Google-Smtp-Source: AGHT+IGFxtbZWAj2r9WPTPIPxXPYFLn109hfACu8p35/RA7zE8bhOqk7d/KHHpV8aS7hPB3fyrSIWw==
X-Received: by 2002:a17:902:c945:b0:1fa:2b11:657d with SMTP id d9443c01a7336-1fa5e671d16mr135158015ad.10.1719475195391;
        Thu, 27 Jun 2024 00:59:55 -0700 (PDT)
Received: from localhost.localdomain ([2403:5816:cd6c:0:6d45:ae2f:1ead:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c4cf4sm7181895ad.290.2024.06.27.00.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:59:55 -0700 (PDT)
From: Leith Bade <leith@bade.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	didi.debian@cknow.org,
	Leith Bade <leith@bade.nz>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt7986: add missing pin groups to BPI-R3
Date: Thu, 27 Jun 2024 17:58:55 +1000
Message-Id: <20240627075856.2314804-4-leith@bade.nz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627075856.2314804-1-leith@bade.nz>
References: <20240627075856.2314804-1-leith@bade.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005957_211508_74F3D502 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The uart0, mdio and switch nodes are not connected to pin groups unlike
most of the other nodes.

Signed-off-by: Leith Bade <leith@bade.nz>
---
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 2cccbec39d34..54087001cc8c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -194,6 +194,8 @@ gmac1: mac@1 {
 	};
 
 	mdio: mdio-bus {
+		pinctrl-names = "default";
+		pinctrl-0 = <&mdio_pins>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -206,6 +208,8 @@ switch: switch@31 {
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&switch_pins>;
 		reset-gpios = <&pio 32 GPIO_ACTIVE_HIGH>;
 	};
 };
@@ -335,6 +339,13 @@ mux {
 		};
 	};
 
+	uart0_pins: uart0-pins {
+		mux {
+			function = "uart";
+			groups = "uart0";
+		};
+	};
+
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
@@ -349,6 +360,20 @@ mux {
 		};
 	};
 
+	mdio_pins: mdio-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio";
+		};
+	};
+
+	switch_pins: switch-pins {
+		mux {
+			function = "eth";
+			groups = "switch_int";
+		};
+	};
+
 	wf_2g_5g_pins: wf-2g-5g-pins {
 		mux {
 			function = "wifi";
@@ -471,6 +496,8 @@ &trng {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
-- 
2.25.1


