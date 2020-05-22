Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F33BC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DCE206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqX+6UJC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DVsXn2eY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DCE206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewjEEU1MlD9XSDaowpdwULfxBsdBaibUAs/LA0VQY4c=; b=qqX+6UJCFkza7k
	2LvshiNL1bi8JXYmXrUlPsbXk7Xvjcn9AaDSLZIEbZ9ps5dzmqJLil0dxH4nJbEHMM0Hg+5C/DoYw
	ZoYR3jzC5q1eAkF1y8vTzbIrwHyLQRdMsaltd6EYCSg13VgdCJ7ZF0OIdWeICElmquRHDj7WtCq8W
	MtVMKvdV8tVg7F3Ut02GNjqRbDTCGek0INnnfFa/Y/x4XVXZmkwZROnyJXIOgu3H5TkwPN/4egZVl
	dZ2XaW9d3zmJeBH2pEu2RmbOtOb/byZhTiWhKrW/c1TwlWqBmixywHm7a0u+VHQTdb9oWEJzclOSN
	zbFNPFfHggJH4zRBxe6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6WC-0000t6-KA; Fri, 22 May 2020 12:11:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6Se-0003Uy-9f
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:07:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id u1so8429977wmn.3
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=DVsXn2eYoFofqn541LZ4MfkWal+3Vy9fBdI9yAspaG2zAyqASOY0tqc4Nv4/+Bi62Z
 tUfQjSY+FHNzvALMKzVBCmTkLM740jnrTT30ToZZZzw5iGAWEdQKVrwkIiexpGELhLeO
 zrU088OFMx4gG4ErEwJxSrWOubMuE+9AUwAWJEOXRKSN2g6OXzZp/iTxw8DRAJlYedqz
 ngTmIuwLXT5hVEDSTz+QlHrw5qnO6fDzlZdtpPnREpOR9PzLcfhal6JyMl/WxmqcCCde
 fOpT0KAuZcee9ng8kIq8noqAJrKMD/yd0N+cE/pHu7NboS6Ct6ENqOoOjSo3cOcQ3Qx1
 gWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=YE1GhFc7cXRfWnE2hcUAQ3unX55rhBqUSNYfJYzfpIOX51AuQL+rG6d/gK2X7iUfcA
 PJnkDEuzaeVOHwSJ5x0VDzMS0rSOt74wJHx8hByhE/JCwB1fUyaWGB47cR7SG3L4AdVf
 mMJ05nP7W7BRuunMp6y+pqq+3vj1EMPvzynb1CatzVCTnRr6Yfl+kxGzehWhAl15X+DG
 G5/fVlRaLoP9McKSDTkjfB4x1OQxx2qFB863+/Q4hKBxIZQhSAxEi+gFNycDBSXvCdwz
 AQkLUDOOJvdzZvbahLYQUIS0lRIjnuXMv+hcUUAyskD6TdpLUHYs6niUISF4s8CmFIpp
 nB7w==
X-Gm-Message-State: AOAM533xnLT3HfYWsQ5J+ERHU0zZFQgT2KZvXGpUPQRtw5XFOQ/OeSgl
 2LluhQoLxJ5V8cRna1w12F92fQ==
X-Google-Smtp-Source: ABdhPJy2dPeRTy6mlLX5UEd/lcC8TWwiaJ2T7GRkUXTF72jg1Gp3bgoI92xKzRbwpRCpK5LJsVLcOg==
X-Received: by 2002:a7b:c767:: with SMTP id x7mr13670227wmk.181.1590149254930; 
 Fri, 22 May 2020 05:07:34 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:07:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v5 10/11] ARM64: dts: mediatek: add ethernet pins for pumpkin
 boards
Date: Fri, 22 May 2020 14:06:59 +0200
Message-Id: <20200522120700.838-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050736_398840_261A91E6 
X-CRM114-Status: UNSURE (   8.54  )
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

Setup the pin control for the Ethernet MAC.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 97d9b000c37e..4b1d5f69aba6 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -219,4 +219,19 @@ gpio_mux_int_n_pin {
 			bias-pull-up;
 		};
 	};
+
+	ethernet_pins_default: ethernet {
+		pins_ethernet {
+			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
+				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
+				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
+				 <MT8516_PIN_6_EINT6__FUNC_EXT_RXC>,
+				 <MT8516_PIN_7_EINT7__FUNC_EXT_RXDV>,
+				 <MT8516_PIN_8_EINT8__FUNC_EXT_RXD0>,
+				 <MT8516_PIN_9_EINT9__FUNC_EXT_RXD1>,
+				 <MT8516_PIN_12_EINT12__FUNC_EXT_TXEN>,
+				 <MT8516_PIN_38_MRG_DI__FUNC_EXT_MDIO>,
+				 <MT8516_PIN_39_MRG_DO__FUNC_EXT_MDC>;
+		};
+	};
 };
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
