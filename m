Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC66C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362F320736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KiP34J+6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="JIdJlCRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362F320736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsnyaVkn6vys0ET0yeWzl/eMoV7ln8pbsPWjkaja5mQ=; b=KiP34J+67BsNS6
	CVUJ7Tu5Qn1Hu9v335vSRNy8CwVdskZQM+nwomLCpZwPyGl7ukjBBWJfm+OOY9Qt3NbZSd9n2CZdC
	6gDyYsBLk/Z27b/g/hsYF2L/pkZRI+2xmhpq2d9YjN+n0iRAAexxIE9qHAakGmXDSebbqogC9A05Y
	TIFsqHGOSgEVPlnM7AQLPTBmdA3dXVv1Cyw9ffKsjCqGiECu0BMx2Kac+aWrhExUN7XPEYVOiVYwz
	hWU8/P6JGgAe53WRwj3ml83H4CwGp1jzLHpJxza98CpnCdcmZzexsCjPrsBqIVH7Q8KPmOCXUM6fX
	xNXVh5zGuyoQD0wKumUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA5k-0007zt-I8; Mon, 11 May 2020 15:11:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2n-0002gO-AC
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:43 +0000
Received: by mail-wr1-x443.google.com with SMTP id j5so11433604wrq.2
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=JIdJlCRVq/GMgbBOvi6/7vVciRUSXXPqqjgduOgvL6hA0KWWzhAvAc4R1L0GT4gHDf
 8IwpdH2Yu9XMwIwKiNXbtmKgEvK4I/GzELYFo8rR2E8gwlPB3G4Ci5J99YwzgjqqQ3mm
 tKGH8HwJEXN73O+tXJbA+hKlAPPmJxkYMDVJOuNh/sm37mW+SRwSnwEvlor8o9Rx9QEH
 hnJ+YkdjEzwA/2jbkn4zicFLDMTmRXu3oOOCdGkHMZqEr7X95rALqp2a1WUtMH+ozBxQ
 FHjKG0IMFQJ9PtkrWaR8RHbB4qXgsRrsjCCu27j+GJ5AhVxFQHMrjbOzvmhOeEw2l7cW
 +F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLB08H4ZIlTMzvj5hInDPm3tTNq7mk/XtYoMNSk6v2w=;
 b=TzSBi6nrZRXEw+Md/P10kyeEv1X0X9w0CP92p+lJsfzzakHwqerA0R9t2TGNPdIVQY
 ctLpLy/Glhh+8LzQGZsCoHKDuHohjW2dLxCcUrCnbOEccLQ89qxIeOB4it8KIPmdNo6j
 yqT6Tum0hhsUQ7uheVXEX7w+IxQ0RRC+nib9i45cuxo1tVrlFClb4jCVxYbQ8N2wxD4L
 D9FZH8bQ+/c2UQ9ia+oWZ6FI7miip4jmctT9jugjEyqmr2jO/jHszJX9BbBBcQ5v+1rF
 87NnAZsklf8US4owl6y+/XPfoSK03fmATOdlGqL1AD5dOcrihr1/Dq1oj+uqlhwBAP4V
 Nzgg==
X-Gm-Message-State: AGi0PublBif0lob1gs9fUcW6k6qtiZdV7x0oYggJtmMfrNwnVnqMlkoa
 tqFfUSF1xhBOriwyUHd83gxBjQ==
X-Google-Smtp-Source: APiQypKchqURWEOE156yp9c2Gtsg+rjBGU1OyYDs5zNKt1tBVinXwxb57TLkJavCyiOfPrG3uEzb7g==
X-Received: by 2002:adf:9264:: with SMTP id 91mr19344771wrj.362.1589209715886; 
 Mon, 11 May 2020 08:08:35 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 11/14] ARM64: dts: mediatek: add the ethernet node to
 mt8516.dtsi
Date: Mon, 11 May 2020 17:07:56 +0200
Message-Id: <20200511150759.18766-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080837_464851_163BDA88 
X-CRM114-Status: UNSURE (   9.55  )
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
