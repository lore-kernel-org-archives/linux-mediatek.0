Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EF7C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:40:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC9161106
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC9161106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyRVI31XNtvCyPS5gFOsLFZBCCQPs2R0r3xvR4iQUFg=; b=juRUU+/ex6FB8DzDlGV2UMOQl
	mcpYPd65Hlq//8KELhAjqC64UEqV1Hd7nXt9X/kYjHNNfN3Jq0BzPLHzKSbff70hpfrwAPzmtKYkL
	9cPomZZTz+QiVZpBMVfHCnhk/ziKryQgg7yQyT1QXLAR3wRj97MshTRMtUNdvcat+szEaDUzMImlQ
	6mowRu3rs/8is1UwvsBgd3NpAgwc5/E/O+k9yJrdBpV3W34wwahCH1ETHnBgJVQ6UmzqawNQLM86W
	GK3C2dQmi0aXDsMqNTCZw0+LW7ZcnfwV5bLFaQaJFAR4339PEsjkOxslrtj72iNoBuLbEqsgGg08x
	es74s68Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUTx8-0081aT-8o; Thu, 08 Apr 2021 12:40:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUTx3-0081Yn-Tm
 for linux-mediatek@lists.infradead.org; Thu, 08 Apr 2021 12:40:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id v8so967693plz.10
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmFnhaRyZGKmhh6YeRu24XJccjOmUgsYe3aUSqwEOJM=;
 b=sdrEyJmGy8XW5Tzk4vxJNZ8GlNfQeQ8WXFXrGGIx/uGcosQHu/5191zepwOkcbLF+i
 AOruGbLsMv4y19ByxfOYte2JeWh0dGSamkX9OMk8nWIeaZLsN5y4xBY3ZsfEtEuvCF/q
 Z1eDnT73strNZt2ZmehAlPjFXSQ3acTrOAFqi7oz67pNod5+7/cqpJes4zjp6yULS9wc
 0mDf9lWINdxUfp/4HMwcR9bZAh1KWSidqFYKdlxGGSsZ2sruUIgWn1j9WE3mjSsgrmiA
 Xj4fOscrKjbMUbKyNdHkRyCs25myAKjiQ2RmU2uJpemu1q3gXFyYUGGkOISY9k50vINO
 OT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmFnhaRyZGKmhh6YeRu24XJccjOmUgsYe3aUSqwEOJM=;
 b=seI9DnLDegafQC/xLDQ0U6WbuZpsbA/nwqdYsG2Aq8c1Y+2ESdm1H0xvhihKvXLbaS
 IGfCltoUUebMbm7ZasHYDwDlXcw1J3lOKrEt7xYtnsspsAA1FFzWN0e8PdIkIZtQHpK4
 M8gDHhT93jP+axQZAFLKqx3sBU17OFyiso/TjcADITrj8ZK+dpoEGu+iWTTPWv26ce0R
 TFk7SVI19o8sMvixlwqoFjKTeOsZ3yb3uFyVcgkeT7eAZa0LAzuekvE76slrUhexTKmG
 bwnOcpG63zXkr4quxBesXFBQiQO+HKfa8wdfqvqMSnqCxNXp/27jB3LViz4FvszFmCIM
 KHDw==
X-Gm-Message-State: AOAM530gu8rNYQlMqTVZTbfA3OltoIKr9Misvpc+47B9GXE62Um7422E
 hgtIPTSNQKezmp5Oz65NDSE=
X-Google-Smtp-Source: ABdhPJwek5HN1INa68+/CiKVytrivW+Z1sTojuAw8HeUS+/ee91/803ebFNmLRdXTFarQLbaJDtvbg==
X-Received: by 2002:a17:903:185:b029:e9:9253:5328 with SMTP id
 z5-20020a1709030185b02900e992535328mr2507786plg.58.1617885600491; 
 Thu, 08 Apr 2021 05:40:00 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id e65sm25831311pfe.9.2021.04.08.05.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 05:39:59 -0700 (PDT)
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
Subject: [RFC v3 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Thu,  8 Apr 2021 20:39:19 +0800
Message-Id: <20210408123919.2528516-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408123919.2528516-1-dqfext@gmail.com>
References: <20210408123919.2528516-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_134002_497511_1786EF4D 
X-CRM114-Status: GOOD (  10.13  )
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

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
RFC v2 -> RFC v3:
- No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..ebf8b0633e88 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,9 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
