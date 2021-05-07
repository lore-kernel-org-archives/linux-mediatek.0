Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF5BC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1E061468
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB1E061468
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CK2LWseW944+8FMfTy5eZG2QS9atW6YNuomcxmV4+Gc=; b=ADJmB6PNLkPkPVdv7kFQhJ2rL
	2cu9aHvElJ6Csx1lVrlbpUyXu5qTIdZFq8sE8zBuMJl6YUDBQiArBaalL1ECubPbC+hmcw/rmZQ35
	L1G2DiDxlaSSAUdjeXG6qmiWYy9OGZmZTZ/N9Y6wtrjUXRx4678tgszAh+VUEvnvL39BaiafRhAc/
	LLPRO5ol2lVNdt1o94HBI4YNqfWwd7JCqvHCJoI2F7UQMa8i6oaePnXFLzdR5AX/RxfFvwKoixYlh
	OJhgeZdhGUIyF0UIyIZ1PcF2+CsVLeLdZGy/43grJRu9L7rI6olUPtT7fLg6zCsGIUrzUgqFOjLws
	aE6cFy8RA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0KR-0078FM-AU; Fri, 07 May 2021 13:15:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JI-0077rI-VQ
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 13:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/iQHjQJIEusNn1tquHlPyPfKvKOnU6uAD3LtZICkSiM=; b=u96GqyznJzTg0rmVkzjFqoVux/
 UDoiraMsZUfzXC7P2T7kRmZaFGC84rUdzyt6H7gUNrO2NjUVZ01XC77TuQp5wCQKC63UTRIAyrWyB
 UKr8jrz8rHeNklGQ4iIGhb5K+KqWnzQqZ2ChtOMAecbCcR6CyVm+tZ3uyIjDGYi9uH0zmpM3aqyy2
 Vf98i3E8dod/OPUj/IDi1rGd6HsYCG2vPxBiSo8GuIjBerrcmdk8JKKxS0Ku2yN9clehdMWbutTRI
 DYqaPvEK+6YG99M4JZ/qFU+ZWE1TuPBrGk/AqXz82O83Vw8y924ECcaYMD8SlR/MsqZqyZfVBymhs
 pSxaswAA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JG-006sZp-D7
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 13:14:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id q2so7528815pfh.13
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iQHjQJIEusNn1tquHlPyPfKvKOnU6uAD3LtZICkSiM=;
 b=Ntg96WjpZ1VistrBYqL1M+HK91mFEC+3LlO4WcHsmMOyYoAslkXmmt2h1ClxsM3Apb
 W0RPjQkzmRQ6pAeshLswDxYI/yHhuHUvntGs7ECONjXx5tt/ikILaFPgozqnrKsSfYSK
 y0Z3sfhDiGGkMJ4FClXIiU33vLsL8BM++f2IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iQHjQJIEusNn1tquHlPyPfKvKOnU6uAD3LtZICkSiM=;
 b=OeJccs3d9bZHadOkG0aa7OhO5a6Zv3PWOg9cnGkOcdhcK00JUd9gJKvWGhdbhiAHK/
 /PqiHidlPJxA5rs6iGFj8lk78siFcLO6mUTV/5ADU8/wnfB/HJ4LAeDgSlxc+PkC28Ma
 buS6F/FRk62ClRtXT6/CjcB/pgesvYOeoEIPAH44/UkBfpES4bzKjj5MjGJFyq/mHtnC
 GLrKYjQG2/eHhsRHp0GXyhDEQaHq67VKEYrFWap0ZzRurYzMxDj6O3MGhfEEOClImyoE
 gBMw0Qg7eb4O2D4OZxdKjlwDhXWVO/nJJ1JetXklMlLPacoitkYHaPrbWeZxZrnfNYN1
 iYLg==
X-Gm-Message-State: AOAM530XVIcb8kksLo1ud4vWz7yk7ec4b9xvQ1lfq8v+fG0SGoWb2I/f
 MhgjquyGeD4AApWASLs/EmWbvQ==
X-Google-Smtp-Source: ABdhPJweownY6VlR0g3o1Ae3IqbU2FAY+KMj3UbN7XuWvnzt3rtaswXISD0Xy/yW7E2bmE0y6nb0Ow==
X-Received: by 2002:aa7:9191:0:b029:256:898f:150 with SMTP id
 x17-20020aa791910000b0290256898f0150mr10411116pfa.74.1620393265252; 
 Fri, 07 May 2021 06:14:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:711f:8553:a124:a19])
 by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 06:14:24 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 5/5] arm64: dts: mt8183: add supply name for eeprom
Date: Fri,  7 May 2021 21:14:06 +0800
Message-Id: <20210507131406.2224177-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061426_448657_6B17E892 
X-CRM114-Status: GOOD (  10.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add supplies for eeprom for mt8183 boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index b442e38a3156..28966a65391b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -88,11 +88,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c32";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcama2_reg>;
 	};
 };
 
@@ -101,11 +103,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c32";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 2f5234a16ead..3aa79403c0c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -62,11 +62,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c64";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcamio_reg>;
 	};
 };
 
@@ -75,11 +77,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index fbc471ccf805..30c183c96a54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -71,11 +71,13 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcamio_reg>;
 
 	eeprom@58 {
 		compatible = "atmel,24c32";
 		reg = <0x58>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcama2_reg>;
 	};
 };
 
@@ -84,11 +86,13 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
+	vbus-supply = <&mt6358_vcn18_reg>;
 
 	eeprom@54 {
 		compatible = "atmel,24c32";
 		reg = <0x54>;
 		pagesize = <32>;
+		vcc-supply = <&mt6358_vcn18_reg>;
 	};
 };
 
-- 
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
