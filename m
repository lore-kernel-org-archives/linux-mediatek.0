Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94A4C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 993B52065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g42Wz3/u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="HEmrcvM1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 993B52065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsnyaVkn6vys0ET0yeWzl/eMoV7ln8pbsPWjkaja5mQ=; b=g42Wz3/uaI3SkK
	i94IcFhY0ew/4OIRjjMcfns0d93eYOF71bcM4wyYuzFLuQcxJ5pj7B8H91r9xCSSb6akd3gi88jTR
	IpjVCaf7XXfo8YTKpI8BNFTlfIxXD7p1C++PREt+Ndo/I7bRLD3fG0XlPszIP1KtKjxrLIfeS+Z+s
	zOUizAD6hany4s76pVXhfj6JmrxlTKNie+yzwQHfKCDnYyJR4snKfPNpkfVU6pT9SLgDN8c83xUt/
	6ikMbjL6x89648lfR4FCjArjQb/d0sNzBY93KMiz5kRU8P1+IArzXbc/y4RILiuWCjrfnWuheQH2k
	PEO/MFzFmoRtJQB77r8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8qP-0007Id-LH; Thu, 14 May 2020 08:03:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8n2-0003zn-Oe
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id h4so29164501wmb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=HEmrcvM1MOsX04VShtRQfw8wX95eDldjdaz2ns3Yi89VAbdiUxlVX87C6nzdephlup
 xHJMCz6e0Z5r01RY+lzPy4wHor8E2bIsMkvwpFAKFaBcg96Yv1a32HR47oaX+TXsTmxa
 tZ7BQztG8IQr3XPcRIMaWryF7+6ihgGVZH91ZuakknnofVFjDvamLmrgqsjevIBTIecd
 D//XX+ZSlcunyYyK8Qs563ju1w+pRSmKcL46Gx+DIpsLzRGBl4u61KIqVfRWAeiKOdzK
 G1WrNxSeiQ3W4YBBAZ1ChwL/wg09tzntcjmSjs7CEdvDYc5GX+643Ls0LEsYi8J2650b
 emRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=Nw5ZKgB45tfzljaMnp2PjvCA1KzeOFSAnXNEtdFoysjDePJdG2lXsivq8uxQGLbB50
 nvvs/o5NtY+zKcDuLz/uPqLUyFc2JlTfs/lO7MGh+w+fd8Dk7nsSx8G/h+DZO1U1sYLM
 yAT+t9HjgG286nouCiury1mV8P4lKjN7oFmrAlhPuQoc7Ihpc28yk3CRx7D5yWZvttmk
 PgN+B4R73uIQD+0mnXyv9NP5LQB7LHEn2cAn1fJ/uIqhP1SRAJEnMev/16MBaYJLwz46
 JE3AcVdvQ1xFPLOk2YcvO7P3Mr27+dS3VwDVWgk43qcJuUu1VyLcOzotw819gx2KIZ4x
 s0Ag==
X-Gm-Message-State: AOAM533f+h1oTI25F2nkOJ75v0dAVYT7Aw+bev9f0pI9Nppn9vcBdgeK
 absQlfPeWCG04XAg0S9NDVrV1Uc5FC8=
X-Google-Smtp-Source: ABdhPJyVjd4+wt6kvtuaiL+tPilOBT+IL6rIp/TSm7VviUo+tkETpkHnlzpF7kAbFINWELiacsGnAA==
X-Received: by 2002:a1c:3206:: with SMTP id y6mr10610900wmy.12.1589443223305; 
 Thu, 14 May 2020 01:00:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 12/15] ARM64: dts: mediatek: add the ethernet node to
 mt8516.dtsi
Date: Thu, 14 May 2020 09:59:39 +0200
Message-Id: <20200514075942.10136-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010024_853133_1330666A 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the Ethernet MAC node to mt8516.dtsi. This defines parameters common
to all the boards based on this SoC.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 8cedaf74ae86..89af661e7f63 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -406,6 +406,18 @@ mmc2: mmc@11170000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@11180000 {
+			compatible = "mediatek,mt8516-eth";
+			reg = <0 0x11180000 0 0x1000>;
+			mediatek,pericfg = <&pericfg>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_RG_ETH>,
+				 <&topckgen CLK_TOP_66M_ETH>,
+				 <&topckgen CLK_TOP_133M_ETH>;
+			clock-names = "core", "reg", "trans";
+			status = "disabled";
+		};
+
 		rng: rng@1020c000 {
 			compatible = "mediatek,mt8516-rng",
 				     "mediatek,mt7623-rng";
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
