Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EE8C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C2720735
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iam5xiuo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="lSlyl4mO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C2720735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewjEEU1MlD9XSDaowpdwULfxBsdBaibUAs/LA0VQY4c=; b=iam5xiuofRki1g
	BPff+ADQbmcddSfVXZt3R61QdySGXDdM+nUtYTteQd9WtS2/l3NeuderEIVfTkvFx/ARuiQpDlzg+
	OXImrLABkHBHzFbl8/iPTn4GywB6OfBAJ39ebUChmI1oIQFQ5i348UZilYPU1uS7oXqVFXdlEI8FE
	xCSutUBFNOxSxNvwQqvEDZwNWvexSD8WvNsp/lJggIkHD3P96GsYaM2oXO2u4enr+SUrJVDtpDt1v
	MbCVv/ssm+xwqtKFJDWMBOIab7tXqsk695kZlPMTpakGExY5AQvJio0D6vW/gaWD5uV2JMB/1J9kR
	D9/rQfIxhDQY40J+COug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyCw-0007Tn-Qq; Tue, 05 May 2020 14:06:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyAK-0002Qd-A3
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 14:03:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id h4so2433935wmb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=lSlyl4mOElbeeStRAJ4CWke7R4swrfRTDDvLBAB45QOvM4+7cfviB8IS+q8YjTZ9ER
 J/ERsLiOQHNV1mTXN3jPp9K18esFG4ne5yM9GcYpMm01CSVnE/W734lRVikO4BAQNJfp
 NIJ0jLuZD/AMpS3Co94mCUYYzA7Mbr3GSRHF0qswguqdE/7M72H1HNornTVQfgBDvMBf
 J2lJdqjGdfJQJZaUMRQJG+LjJd44f4bKZ6cbr2NR816aGdFW5ioRRvqPprprQr5Q4qDe
 0CAUeW3L2CkjgSaKgHc1XyVKlBJjesE4lOuflOL1uJe3/07Mw43PRohiyBdxf3FGLcgj
 LT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
 b=sc6yirAs4U17JABbd6xZFIC7KTjGSSGRgEXCofHn/92ntaWdjCry0kEJGA0ta49pOs
 JGqBiE11DlLUNglae6ptuj3u/vavtm8JyXvsFo5XuuA/nVboFVesUCB4HxsECNJjx6Qo
 vu88T3bCqaideoxrkmIHp189FvBdYJcOT5GLKEZ/phGELKICAvOJFNp3g1P7SXR6vCAv
 gqaUkumZKHCTHZLhcTTKmvK9yiSTBdBDHGHKTkZP1umSDSJN/7kOrqK2G9AMrfgFUaFh
 Q3/oEB5fo2pOLjzs2haRzu1r9VrjI9bsxMpZ4nKHs06ZXI2zkW8gTr2EtQyoR5pV/4GI
 iiOA==
X-Gm-Message-State: AGi0Pua/Xwh0A+V4+VSMEMgXKHwXxjAb+MQYUFaJhV4wEH2BU/fqYeM3
 zUNpLiDVaWqp11LtezgxQuU1jA==
X-Google-Smtp-Source: APiQypKwmZMdeEmUAzcUU4K0jiEpe5kHCS1F6NfZ1/9dSidf/8PeL2h2zvcjETlSxePjjPJCHSUbNA==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr3689658wme.139.1588687398732; 
 Tue, 05 May 2020 07:03:18 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:03:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 10/11] ARM64: dts: mediatek: add ethernet pins for pumpkin
 boards
Date: Tue,  5 May 2020 16:02:30 +0200
Message-Id: <20200505140231.16600-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070320_458972_AC3F7E73 
X-CRM114-Status: UNSURE (   8.48  )
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
