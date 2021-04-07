Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4B7C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08A66139C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08A66139C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V9NATTvJ1F1rmOeeHU1BAlsBjYAsUOKxJYbinYnVtOs=; b=JCCsFzf0dKjka/YzflB1/YzdW
	8o5wH/I77/opcSnJAUHFDi5u2XyAXYTwi1f/Yp94QP54LGmsF69b7vLE2I47DhSrD96KbgHD/JHj9
	ms4oQ16hbckki8Pj0dNJcII+4ADlByZNfIFaSllP2EkPEYzp9R1fG8Jij8q1F+ydG4r7ExC8I/dlf
	3Qve1nWGpDls0SyvsXFv7MHNoLyOmcqkoV0l07CBimBCVoUbQ1Vo6hYxsIStejgkgDO4TAVTQD84l
	35LXT2tIB2SQ+lY6VsPwRclcAXJ0RL53hxcZXzGeg4FCDLcutHAi1pzod979MY1d2kr1cMllJocOr
	gJkgXnprQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU09s-0043qE-UH; Wed, 07 Apr 2021 04:51:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU09l-0043nY-IU
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 04:51:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id v10so12015807pfn.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 21:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kob9kM8qKEEzCOzsXAg0KIs7vHQIWVRh0w9PgAne0+0=;
 b=dXTMJsZg/GrMTU0c/AixIr4aU/BTqwR2QxgJV/NuQIgJcB0lxw9kDiw403clhmF4fO
 2aOvAhOEp4uPWww5BxjpbNMunetyw2lgnAHILhPrl1cWpjdFi3zjawLn8xbUGDymzaKF
 RwB+wxHe96459XPgigMcPLBBMNrn8cTytSM1Mcw0WSR1bDNzRzyusv/9PGniwBECy9DS
 VC2KlWjgDdQmS/3rkaTaqkX05KHlcFaJZSiq61cFfIiDE7lMCRkQUToTz5eKGkBxnylh
 Qbw1ARx7qE7XLqlE7ZVnWhRoD3o9wpyINNUIQQzzqpH60RFLWTE3iErbNcucGU8pgrya
 ttOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kob9kM8qKEEzCOzsXAg0KIs7vHQIWVRh0w9PgAne0+0=;
 b=DezNdzoF+Ed2PKol/QOuqWjelqtP7iikFS85tY6OfDjFWhNabBhPEV5RhAxRHXtHz7
 LNMuK71dR4FHQN3PhdPVONsPrRNz72ggPFzEb5bQpct6rxguSqguebI5wmX2NcsAtmD6
 WN+gf1ymudZh+SDXKqqB7dhTC09oseQ65ayeVTFpt+bdGaRE3gm5hmKz+/51SdWa65Bd
 PNXP6FwGxuJudv8gj7DIz0Y0VIdwFI3naDyH4Nolvr9ZuBWtS87ibxjwwS3k4MKIzZ6S
 ajHgol1qk8DHvZpX5p4AfpgZi5jLP4BK2+lWWcgUW2l0LJgt2nzif0uzRTVq4nlEKQbU
 hLGg==
X-Gm-Message-State: AOAM533chhg8l80R5qxfqH+TqjM/IU4IiPbg1X4ofodNxJUgWedWj1lc
 p96ncWZhG2itDzddIRS8wkA=
X-Google-Smtp-Source: ABdhPJxHn4yrsH/2HhCjyRtJImSN9tdocViiuu22y/xFL0ocTxflw1/WU2qpIbwdS8dCJYJWpo/fmg==
X-Received: by 2002:a63:5458:: with SMTP id e24mr1566769pgm.170.1617771068271; 
 Tue, 06 Apr 2021 21:51:08 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:51:08 -0700 (PDT)
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
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC v2 net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Wed,  7 Apr 2021 12:50:37 +0800
Message-Id: <20210407045038.1436843-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407045038.1436843-1-dqfext@gmail.com>
References: <20210407045038.1436843-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_055111_911305_01CF2DC1 
X-CRM114-Status: GOOD (  11.12  )
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
RFC v1 -> RFC v2:
- No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..26b34888eb62 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,11 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
