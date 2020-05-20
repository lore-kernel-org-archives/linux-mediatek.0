Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D8EC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E76207F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OMDxLcG2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="gskof8By"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E76207F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewjEEU1MlD9XSDaowpdwULfxBsdBaibUAs/LA0VQY4c=; b=OMDxLcG2O1Tz8U
	cn/94Jokq8ro4NkaV60KG1rHSAZYasLnIHd3phf046rvRThKqvo0/lptr3P8dPpNoWe9jPfJs4cCm
	wwaZXMc+AdKcNSBmVUc4K+o8eV4G5xACW/V3BF1aQgnvAI3ra8DCJCyW9ldw1kPOXMNpu/xaRJnkQ
	rCacZl9DE7XvqwmTU1UBL4SLk2OM2j9QBNzk9NaenhpRP54oZHDafTCyX4iSBwYBo0IdZsAdjnYcF
	rZe9ZlXUIfC4Ej/VxCSpHX/X8ckwszkhebcHb2AEjF6wbrNE6o4RptLeW+038u0WsZu/sW3QfQo1L
	joPfgjo41pyRH9gc0lfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbMuR-0001Vg-DO; Wed, 20 May 2020 11:29:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbMr6-00075G-II
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:25:54 +0000
Received: by mail-wm1-x341.google.com with SMTP id m12so2209291wmc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=gskof8By63+0KDD0DdUs0emDDhPZad4DsU+WhXpPPj2iCFcQBV8IAhix7s9OuBI8sF
 FviIaCv4wlLAN0CX1SzhYWJ+ytJkU63OctfconMXzNUhgqh7/eP3s0pp6d2lO6riWM5i
 QzEFy9o8v3BFNvOjfiNOt7hPupLGEitK5tSVjVytErQ0Uf4A6a6Cc6pqURjYroF0xGFj
 JXLWZ7fMxCFLTDWF239HN5D+wphw1HGN5u0IEseg2S4FYh+M38w8DPk/n7Xn2jIWWb80
 laDuvRZpyjA5gIkZnU/Sp7NnoG+Nl+P6F1Pm0n4hY2wZEewn93GLh3Fo9KXPaRRgL/g/
 NHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=Rd3K16/fQqwXIyU4zZ2hJ9V7Ldl7iX1jJSsGM3qLLQu6uuq6vkSIlQZK5orPCSyKZx
 SB80qTZDOwPFseetyAw6UO/OhPZRYcEwjKlBCy3sJtLfqVnJW0s56sJkda8fBiW5f9Mj
 Te0rdMJy54+V2CgOH8qm8C/UcEeE6v9GKx5Po4zIDwD51Jwu2gpivp+0QTkYA54Gjvpi
 Gpk194qn5YQbQbISYy5rT1O2Z+KHZ/J4+r616bvnd0zCa2pzHuPTF8Hvcrw205G/jwv7
 wZ+7Kjb2kPNroixNcM3GYp9ZBwu8ipoVKVfRnVqpyMwO2WvBkJFRADPjUFXMTpc1JIfu
 ILNw==
X-Gm-Message-State: AOAM533Waq0WEd5JoqRTNXt0lpY5XfZwzqwgTjqlEhVHDauT4Vkg4S96
 2+xl5ljd/Zka5C1W83Yt3tD89g==
X-Google-Smtp-Source: ABdhPJz0ZhvCEVA3BYC4i510rBDYS5vNUPdwWlMfTD8jHQeyLe6hAQkKC4vL1pXZbA/yRsghalkFmw==
X-Received: by 2002:a1c:b60b:: with SMTP id g11mr4282669wmf.49.1589973947229; 
 Wed, 20 May 2020 04:25:47 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:25:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v4 10/11] ARM64: dts: mediatek: add ethernet pins for pumpkin
 boards
Date: Wed, 20 May 2020 13:25:22 +0200
Message-Id: <20200520112523.30995-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_042548_669809_A6C8F38D 
X-CRM114-Status: UNSURE (   8.84  )
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
