Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AE3C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DBD020736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chtIX80I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="oCYe8gxr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DBD020736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewjEEU1MlD9XSDaowpdwULfxBsdBaibUAs/LA0VQY4c=; b=chtIX80IxiDszC
	KbyLc5JqoDxjBzFyc0ZhtkCaewrefU0oMt/01uS/xO4I+9dXCN5TNH1OCKsA1Km0Dxjmj1l0B55FG
	dlVH1iO8XWdskmN97U2wTdMgBw7kk2U7Fif00uoz+qmGKFeE2lQuimUb2pq4rMcJFlDAasdBeFY5N
	uMs+5YtR9IBXiKlklIwR74O07nAMNAKmTnxe9OQw0Z3cbewxTSf6EFcGJJwlI5Noejg+voXrnD79q
	3hK7Vt5pJWzXm91pQZ7HuzV2+cJkEp3cOg0qYeq6KZhtR9mstz+DNm38MZmdcXqgaLMpXdhKd/DbV
	ouOURl5XGdGW4br7UMSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA65-0008Ml-Rt; Mon, 11 May 2020 15:12:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2q-0002jA-EO
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id g12so19703259wmh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=oCYe8gxrsb/8td/jVnM+76EnsEaUJm0Tw62USaNMXXLzhPeP2Raxa4qM2uMqbWDTpH
 tDbnc2TfFcgYOAckv78xY78GlbHkdTVS7vgeXY2VqYITf6fSe+2A6JBIqDcTPA8YbBz0
 qoBisEzlmO56MR+MjwDSHvAjpU/2YQCp9TlFHCtsSY3XHRrAVPWG07uMmyrkVf4jGZVC
 wcBGt9lfggYUVrX7j7djZTeH6NfPmR09L3x3ge5m7NDff/LBBTEKf20JwuAjnB8bPZmf
 192y26SwSsKp4UDi9f6CyHUzJ46En2MCUZQrLZTAT5GxjySYZCwjSVc6LSHKmw88+c6C
 N8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=D6w2/9TEC4O4/7FwrX3yo4bydHmMrRsUeSGG+1cS8tnvRfkmwL9dOuHZyJehaOdzua
 /WUuVI00epcjSSxWFCfghPm5Vvmj7GRMXAHf5zP0v9sT//iIONtCg7U1miCmDZdG6mYu
 JEIgZMZKlU4mT+lU0tUdQK2BZkpvroj2I8K+TLjG8LOnqRunjteVRmhJfnpQnQf47F1u
 zF8q8EPQIMNy1EG/cIGkxGOtOCZIaLYc9MQSKIUz50GVa3+s23ppXH7MLJFZk20r1Z8y
 ZuNgCT+bySQJavj0ZajhzuPAVYkuIoB3vE31OR+kTh/LA90KdnA8exOnA7x3H2f/yusM
 GUwg==
X-Gm-Message-State: AGi0PuZe5TReAB6sT9GS4PXx/ddNk89VtP57rTz0aqYaUpFXh4Sss/wc
 p4TKr7KdqLy83oqVeCg0zXPknA==
X-Google-Smtp-Source: APiQypITmPETczyz929tepB6ElHqCDCdOl6rPzyocONlBGydghLbf/NhrY+/vuSp72Y0ABP9l620WQ==
X-Received: by 2002:a1c:9948:: with SMTP id b69mr30816508wme.44.1589209718831; 
 Mon, 11 May 2020 08:08:38 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 13/14] ARM64: dts: mediatek: add ethernet pins for pumpkin
 boards
Date: Mon, 11 May 2020 17:07:58 +0200
Message-Id: <20200511150759.18766-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080840_552774_D50371D5 
X-CRM114-Status: UNSURE (   8.94  )
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
