Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55946C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9276145B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9276145B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uC4EJzPs5ju9yhiD2AHqph4Kg0UkgtDiBPE70yD1dtI=; b=Hedd6KtO1QKgzKSlyNnD4Z6BS
	gqEsKGmKgIviAgUeT3yMgfA//naRW+K/y8QzOmKNXSD6zIXWu7nZ1wk8IaXbr8Zf06jMlGiPkBcSN
	Zo18oBT2myyZrkAc0XKlhfvaUb6nnK8IBk0LCGc8DPMxEoTEvDd+TIfI2BAvTtDprmsQl1zK6EM7w
	f5SVUmhlCVJiAMfnJYcxReFGnyFI6LYQiK47hFAA1sxptIGbjp8reQAYEtweq5JREv5c05jj15mUY
	fbmf9D9nW49sHsLZJCqaiDjxe+YeeJOLmPifYLSebWg+mmTqq19FPWNN7mh7STJsax1C6ewDzJ8PH
	rGcM6z3NQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc03t-0053J6-5y; Thu, 29 Apr 2021 06:22:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03r-0053IW-VQ
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 06:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Dl1eNVmQIqNdeNFjNl1CzKrnIruzMoK7ySTcHQEJGcM=; b=GX6T+DS8Na9zFQ9AqfQMhEhWni
 6HXu9wDDjMIvS34uQN2ZiZ8jA1AsotnaP1JyyksQY18YKl10Q5l0W8t64kvAGjs6lO0U9yPY5kLUj
 Eld+N4/mguZVmnDBSDJsLyqOuYzTmtaKkmESDh5QHEXnLEA6XespTsyJmMZ93SnY4LOd3S2BKG86W
 aMfcR/P0XKmi/5/yXlAJyiyZv6Uer7GNH0iuSRI0BWtHNYZC+m9gQN5qUWKDm7LL/lK5YB3LCHXV+
 EGTSAuOYTsqJIwCTCqv2bk3QrsamhJaIFTWJj5MqUai/JRfFdSPLB74eaH3ztysSYjQ2KJryhT8yR
 p98bfs4g==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03p-000PFq-IM
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 06:22:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id o16so20590365plg.5
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 23:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dl1eNVmQIqNdeNFjNl1CzKrnIruzMoK7ySTcHQEJGcM=;
 b=Sm0Bv//igm4gX1nnNiHZ5xJzmlEYfBdAy25kx28ws2Xny/qTVqGaFiiMqE+EYD9UdC
 DLM00f4wXSr8z8STj2/Nyug7EzNlwTq7g79ztypk+9xE0F6GpfaqycwHejhQt9Uo/pIo
 YbYfgZkxdxWHxot602HCTCJZofgCZ+0qWaLY8rtZMjCXB/kkvga85OePVBzqMosz+2vu
 B7xJ5bT8cfzg0H3dQCzGBAgggrYgDH8v0LLd19v21fKY+XRx/Lhi+84Wq3qt05gL7jtj
 oxMdIqIvgzqYS49LTcMi9aNqZ8PYJq47lvl8C+2LLa8x7SXL9EBf/31Qko/swy63RxXY
 E+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dl1eNVmQIqNdeNFjNl1CzKrnIruzMoK7ySTcHQEJGcM=;
 b=bLMBbo9TKYXW+WUNRIUImHukYyUYciwmfDZvtVb+46vorXrKovHhwCjh0Vq2IzE8Sk
 CXehMJOSbe9oBhvsVw4povtDqW9Lt3ByO0WwqBi88mX157nycs1wT1fzkpIpUy7DPxeC
 K5VUWmOpB2IbG91aR1RoS4f0kdiENHHT6CY0bueOrgxh+asaTJaTAJvh8WQeeW/CDx/V
 nQND3BCK0Pt9b3ZSMP/BYc3BJqrbbJMU9xe/s5u2Rhyu2LQL0axF9QzkDWX+xqoFCdF0
 ZQscdUXNMifCTeafB5e7lTRfNSzK12Qtw4vxtxglH77HUfq5tjAD2GqcFDlUHYXBkX1q
 2Dag==
X-Gm-Message-State: AOAM531C4PEZoWJfdF7UpYPer1cRVXbmYvJQGE9+9rIZWpGsBtMFT7l2
 R7XhfCiRlm4uvMvEUX2KdY8=
X-Google-Smtp-Source: ABdhPJxSVVIoZPrDAm1+N3SJiKuKqytLqnLpkSWd221i3Qh8thNIzaXcyykHLI6m1Obieeh/QSiRcw==
X-Received: by 2002:a17:902:b703:b029:eb:59c3:a9b0 with SMTP id
 d3-20020a170902b703b02900eb59c3a9b0mr32975053pls.45.1619677324426; 
 Wed, 28 Apr 2021 23:22:04 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:22:03 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Thu, 29 Apr 2021 14:21:29 +0800
Message-Id: <20210429062130.29403-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232205_623700_653F9D55 
X-CRM114-Status: GOOD (  10.73  )
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

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v4 -> PATCH v1:
- No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..892b1570c496 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,12 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- #interrupt-cells: Must be 1.
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
