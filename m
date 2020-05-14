Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164FFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AAB20675
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LN9zjUnY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="JJCxO3Ex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2AAB20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sngaemU/3Se52h6KXqzr83WluU8zngbXFcsvHfUmVk=; b=LN9zjUnYvDtaGW
	38FBnA7kQO/BzVGQjGV61ALaqpC0tPZ/dJYtwQUBb/fK44IFtxoqL1Dfc0VEPkgXTKJk58TZv21lP
	JkZfFa/svR9hftjiZr8pHbiUDhORG4rolZw5jwQIWmDatW9YghlaZ+Or4hSKXDrFcAtf/zrk/oSfE
	PaH22va+rtELuQJLUgGtX6kyFMKAGv+wlbKO3jj7yfHiscWwB2OKRwtnOMisZrwBWgPDIWHj4+NIn
	4M0NfCoiU++424LsCdunJzE14wDVmo2HeL1HmHz+dDZn1r4MQyZQY8BPj3T5rm/1FweKidsDRHfN6
	g0d3B5HtmZpXvIQBoD0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8r0-0007pa-Lv; Thu, 14 May 2020 08:04:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8n0-0003xm-Jm
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id y16so2634035wrs.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=JJCxO3Exc7DnGIwr2iuuQUzDbvfOLbZbgPpv5L3N74cFZsgnyJHeo5Sc60JJTq+MbP
 XwFLwQsDTsS0wGHd4KAwQHWKbM9MwDOMb86EwwIBhrl0F6j84h5tjc2/n3ZabjTtMh9D
 ky3W3TQ+YF5EhKOyDkGQ3o2KIlO7tbPkHLOmpD4Nrk5F1S5+YN1zv+gHWLHEzDcrxu+g
 rabtnGA8f9E8JFjGQkbJ2p0Qn0ZRvcwuKhqf+n5uk9hGMcmu+GqfDrq5yfic4Rk4Cv04
 Tu/m1I679dB1PLq36SC+1yxLv5TcGKGsz+b/f+0RUtSrRVXjYdBuloDHyilE/A1AhdW4
 cHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=mtdBXxSxJwhIeo+qbLoTq10IuzINnU41uxfFxfQ+fQJimD1xEZfUDqHvO92CHgzIzH
 xrhFgw0u0cO/KPy3WK6iptVicagx/9TQO0k1W1AtuqBmUbWJopITaZfynlGmlhp9w8Zo
 PBLcstdC43IF7ms9h5mOghjQ/VKOhQF4heNtXpK2Nf3t3fpQ9FXmmqZNklTyPr9/znBX
 nIWZVb+8rGVZfDW2Wowi4J8b2nT8mAkNyqhcjup3y5G+ZieGZwctFlL1NHpdORzDgRcr
 bhbIApoaISLc/OiVFTRaR/YdmKwhVHr0Or+7EMrpdfghHq6zUGg5wkpARWZ8vgj6Wz0r
 Ubmg==
X-Gm-Message-State: AOAM5304NY6v3jZSp8oMme7BiMdm9vwFFecEbcATCV3ynecd9Xh0bGbu
 YfBmopSjYJLYkzTZ93jFG/7t4w==
X-Google-Smtp-Source: ABdhPJwQsAtFFDpkxmlp3HoBK9HFLKTyKPF/9otGNSorLEiCutYPpPt/Uz19BtSeOpUqWag0enyEZw==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr4090320wrp.419.1589443221364; 
 Thu, 14 May 2020 01:00:21 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 11/15] ARM64: dts: mediatek: add pericfg syscon to
 mt8516.dtsi
Date: Thu, 14 May 2020 09:59:38 +0200
Message-Id: <20200514075942.10136-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010022_732091_DB3C6EE2 
X-CRM114-Status: UNSURE (   9.77  )
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

This adds support for the PERICFG register range as a syscon. This will
soon be used by the MediaTek Ethernet MAC driver for NIC configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 2f8adf042195..8cedaf74ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -191,6 +191,11 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		pericfg: pericfg@10003050 {
+			compatible = "mediatek,mt8516-pericfg", "syscon";
+			reg = <0 0x10003050 0 0x1000>;
+		};
+
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8516-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
