Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C1C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=; b=4wRnFhoSPb+hzNmQYwjKtNO6Yh
	WNufItbQ14DdAEo28XiA1fMW+FUJVVt0rlMlepDib27GgeKk4LRo9aQN/hB5HLtkGgrcbx1yt7N4J
	CV59GZLP2vGCh/Dgrk3oO2oQOfC6zvDZhfJIzbgHY3vHGW2d7Y+I71a0WQyk57md9SfJD3vNFxYo1
	wFccyIQHYiojKyLEpxQtgQ3W15hWs2Az0zR/EiWDJu9Wl9ACxtTyKPavriWL//1aSVEtZWCGbPstu
	OaK5/dCJ6e1wkpFozDWAyOLY6+lK1JPBcRLnWFWdZKkrsr59yLZJNQCBrtCaDjQgJ/TZ9jlQ0ceDK
	VGBudUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwYR-008VWn-2T; Mon, 21 Nov 2022 02:29:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwYQ-008VWc-4t
	for linux-mediatek@bombadil.infradead.org; Mon, 21 Nov 2022 02:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=; b=ONg0o7iG3vv1jt2QvBZCKjsybh
	KHx9o55UrzqVXUfRGtymHNbjZGCxA9+TwkpJU5nz3kE1IhQXjSvHknLjoea6P7hNLpya3Z1IHCep2
	/JW/HnAWDIylcmxdv5nvMVFR7eXfwbnIXAo31v6D3iE0IDtMzXW/5CHmvcW9YMD/pf/bAN2yTP7lp
	hZgh5L88K2NQDX5RhizUoO5b4mCOhFKM7+AbNQ5IGmGhpr0KSPwH6rw61KBtgqMOrnYq2PdRCMbTm
	7UMCdrWD+fFXMTryqw5QcB0bCbbomDT46S9mfMwL2nY/0UYagN5Q4UhyFdUiIRKXpt41gSZYKRbtk
	H2sfcZJQ==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1k-002ybt-5h
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:56:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f7so14273237edc.6
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=;
        b=oVCf0dBaQRUO/gNISGiOEDyHf8reuBaW9Oxyg1O/ZGzHJ5YXsDFXnlrjsLPEDwA6iY
         1B7mGDWxJ73VNrrjyOjgUsSs92kTyc1G+XG6xfKt8nIxEdr2ZKDUlJtfN5QVy8BuTwsB
         9W7b/HerQrh81GVwJAMabl6TMfsl4lII31gonekpYq4KqggIGhhtGRRpcONaqIi23c3b
         oY2+tgIg7Q+TrwHZZDGupOXL81I5c5UaOpUX50ra50fhIwuTU5EQhHYy3whJew9KFPoe
         ri6ovgIpdlKPxqR//i7BF56aNDfWijWLOfoMcDoFQ4b4rroG1R4N5oF0FOaq2x9eZivn
         oRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=;
        b=ENMlchb2T/8RBy/H6I8K5xb+4yBwtQS5LpY9agkhF4gdAy8fMCcIOkn2uJ8XskH4r0
         pvojPgCy8A+5flighTbVHxhsafamGJpQnqURRbOke+oi8RSDS99L1n6KMmPRTFAy30vH
         zwxsvumwMRBj+OpJvr1EFAFCPLA7rZxl8FnHOKRCYSaiIBl3xj3sIR3S9cdszu92v1Om
         GMRuLnMClfmoYM0oeZ7u0+a8foBTnWtKmHU1faMIQ12k56j6XKN00TkwlzIjLnHTjhDh
         pmvobIKQ+67Ho0+UUi17jTgtKjG79vGDX9Q6QDw4JInrbR2Lwu3eQ/xdU+cmgkW3nM+G
         NcbQ==
X-Gm-Message-State: ANoB5pnth/UmmiUFnFvy0sOtX4yyXyljGM8JFEIgXhEiTkdhm89XcUmE
	Klny+wt79BwfeVawLgrclUGxZg==
X-Google-Smtp-Source: AA0mqf5nzqeHeQ0W8nAAWBt3HPWJvXZEGRmFHyAZn6AsruvHH8sia9+rdRmozi+VGBC6564aCklRpw==
X-Received: by 2002:a05:6402:294d:b0:467:6b55:3cf5 with SMTP id ed13-20020a056402294d00b004676b553cf5mr14476119edb.22.1668995713305;
        Sun, 20 Nov 2022 17:55:13 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:13 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 8/9] dt-bindings: pinctrl: mediatek,mt65xx: Drop the pins-are-numbered property
Date: Mon, 21 Nov 2022 02:54:50 +0100
Message-Id: <20221121015451.2471196-9-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_015517_475593_32CAE752 
X-CRM114-Status: UNSURE (   7.14  )
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

Drop the pins-are-numbered property from the Mediatek MT65xx DeviceTree
schema

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml           | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index cca9cc58a6934..cb450da49e6e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -28,11 +28,6 @@ properties:
   reg:
     maxItems: 1
 
-  pins-are-numbered:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description: |
-      Specify the subnodes are using numbered pinmux to specify pins.
-
   gpio-controller: true
 
   "#gpio-cells":
@@ -149,7 +144,6 @@ examples:
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
           mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-          pins-are-numbered;
           gpio-controller;
           #gpio-cells = <2>;
           interrupt-controller;
-- 
2.38.1


