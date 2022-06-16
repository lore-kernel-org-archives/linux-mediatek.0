Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B71C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=; b=CjSOcwZjWa2Q6ptc+RQ2fmtsgn
	EZ1gHu5/UX+m2LPNGoksBqkh1boqKMt9jgE6FQTueo0BVhHXxDuUiFCGu1TRd93rL4a7xUDDW+3MQ
	P5Ac/at7syNwULT23Xmw8gDrNsS1PH56bJfSOqaMoM+qbPO+jP1kGLAxf42zuIDf+Rh79FHXyyLB0
	8spAAmBjcAd8UKKNTNDsYmRvcN2fx0nrxE8n1c5ZextLgGw3yPX8fYmO7chkVG3xdW1Aw3qlZMy47
	lTLKiyhXIdGuQBVx0kLBkUhcq7N+Dcqok4eSlNrKaHvk4zdSnCHQN8a+leCHfGcEH//3p71Zi5E3I
	Uv/x7S+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dpK-00HEgN-9K; Thu, 16 Jun 2022 00:57:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dm6-00HCu7-GO
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 00:54:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id u37so114722pfg.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 17:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=ibyymZp5XlJ1TVxW3Q91FpBJuuWKv1KLncQ//0p5ezpE6CTtYNLXK+lHOI/hPkd6Q4
         UGtRStig8foAJzmDcOAQ/uBCWXgSRhDIPaDpjUT6d5gq/W3B71F6AzM4cYw9qD7rEZ0y
         Jq3zXn8Euvjo8+C9vszNyro3xk+nr3E5nMYzdsLkrau/nHe4nge5+2RxMQ16d0roNjdm
         fT3sDXnnh5bfIq9kNqNdFLnoCK4Mds+xIPcZp99Q405bXeDw1cEN1TO9NawGDH5kVYnF
         sTqhxRn6OVw7r9WhqxRg+k8bClq/XoLEbhtrzDeoQwBGJoWD0BJTgbPewLH3+rP3ldSW
         LD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNSMqPOWSXzw+Ck8M30e8l38LaeW0dc38daK1PaMf9A=;
        b=xkPpzF3bnXbnX+bw4kr7sobFakbsWbML7wbzBqAACTg53SLlz8NL6IDkymuzRSWulp
         US2RfxAKs3OsRjd3ak088EZggNIrx+f1NKuU+GQEBeTm/cIYOgMR5LObUOh1VLvSrzqc
         tFSJuLd2V8G2Wtd32gcuulDbLdlPtsDmk3QTHJ5j5/rPpcwrdTGvMjXx/9/A9AWiz94h
         WjrVppfm28Pr7paeN/BFz+9WC+CerGTtYshEBD1IUdPh33UYG+k4BJrDSkGNIl/ANT8y
         p7rF/ROf3W5btSSBmf5GZU/J9bkEsKVbnXFRGfb00lC7ZK9txtxeLiUPAlsyFI69frtt
         YOGg==
X-Gm-Message-State: AJIora9//m5XJs9/K7FmSzSwQRCDUgyafzMXBGFPANc8AKDd6yF+tx9Q
	zQMiyOC0AtaO5qSDVND1lFP3fg==
X-Google-Smtp-Source: AGRyM1tAEE0u8NJaXgmeTa2NF+QrSpNPiGi/49gozabcDXXUVDUzU+70/JslbQquvEmTpYN9QZnnOw==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id l11-20020a056a00140b00b004e12cbd30bamr2316432pfu.46.1655340858145;
        Wed, 15 Jun 2022 17:54:18 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:10 -0700
Message-Id: <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_175418_595964_D07DC366 
X-CRM114-Status: UNSURE (   9.78  )
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

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index c28da9323a9c..1a86857c9027 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -40,7 +40,6 @@ cpu@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		poll-interval = <100>;
 
 		key-factory {
 			label = "factory";
-- 
2.34.1


