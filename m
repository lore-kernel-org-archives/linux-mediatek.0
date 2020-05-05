Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CE7C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C91820661
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AttIcAv5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="cVzH1dPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C91820661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsnyaVkn6vys0ET0yeWzl/eMoV7ln8pbsPWjkaja5mQ=; b=AttIcAv5v/QvoG
	oSAx8Xo9qcGoCC4XNf30Y2K2bNAQN+pKTCqr3cFmMT2lYzYu/fV/2G+zIjfzHt+26rvNBnh0Dab4i
	2mYxVKOqfZ4L0fH6HIJ7406fVzhL8jT9kN5L1PyWTFbhWRGC4nZw8Jhp0AfiHY5f124yWk3/pzi1w
	8ftYiaNlXE146ZZSJnCNyiNpfaO8WF4prI4ut8kMszsKTPmY+l4yAuwt358h4O8qXjv2NQcxP1kHA
	pqMeK+ArxYt3GOqAQIbxHIAVOzYeym9OBQ6nnK9qfQB0e1ZFBPqx16/FO3cYSQFHVo9UhhP+UvfQ6
	hVIR+KGFI73BsDLOduig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyDa-0008Dz-Qy; Tue, 05 May 2020 14:06:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyAH-0002Nr-0G
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 14:03:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id l18so2872836wrn.6
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=cVzH1dPGpMqAXPxKb2+d0LSY7/HTueVOi2Sdclc1d5WFXroNiTnCGax06ZRUzUzxBC
 BUh3y57hEA0QKHn0p8LMuwuIGxUcGlnDrT6dMvKvVo8CknIBmfP+WtMUK/RXkzf+hQAd
 CG7wMuCkKOANszSzqBn9jqXq1Ze5auYS7lGvNg5z+nbF8yG827NVgpPaFCp8YOAnKKI0
 h6VO7RNUL3pV+so74edRAnGDHHHcdwfPC6u++KxWTUZe+FCdgfTpNkF93LmwoywsYj/K
 gYxW4eQvxZ3fbG8FUAlWnbR/kU00rYU8f+Gn2FKmBkWJv/OV0h6bhhfiL4fJ8mrEn4a6
 vcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=i6/a61XUTojqALZIt8CEUALa7hO4dkaGsx/2/u0bvT3T2IemPowD4AorRsmK6j+sWV
 lHtx4j5FuLziT/MYOLOKKaVR4997Mq1gXYKjKhw6msx9g12+rI2t5/kDlwDIJ/21vJcD
 7dD6/NfGdcF7Hg/sIwYsrkkvag88nu/FhK6SSWX//RU2WqVXnLdckHQiCllWNm0lJr3E
 8kEkSAetqbIj51hudyGRr/lSJm79MtdLxY6FpqQxvjWMssFnER/wMNWKZlQfJIEj+xyL
 990agQJb80StUfILNkZ+cXCgo22gQU+rKeNFAV8UZliElDQpvwNXmD/8iYk0JldMyhgd
 b0/w==
X-Gm-Message-State: AGi0PuYYOuDYOo2KO67IhTKOIzO2/Tqgv1GXd9yzI6fYJ/ZCzvCyU/e5
 5C1sPd1w+2cqvKKxVgGAMNHwZQ==
X-Google-Smtp-Source: APiQypLYiuxJLzQGcByYdRNRqjThYrVDv5Mb46r0e9HU0s7k3vsW2WSb3TSlR7LGVUwNfPWr1XlEkg==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr3951385wrp.266.1588687395284; 
 Tue, 05 May 2020 07:03:15 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:03:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 08/11] ARM64: dts: mediatek: add the ethernet node to
 mt8516.dtsi
Date: Tue,  5 May 2020 16:02:28 +0200
Message-Id: <20200505140231.16600-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070317_221278_93C969AA 
X-CRM114-Status: UNSURE (   9.37  )
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
