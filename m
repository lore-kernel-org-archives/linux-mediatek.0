Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55F4C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:33:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3655861184
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3655861184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TRqAOPfDCi98IfDrpz0CfgJczc7VkRU09tehjknVSRo=; b=Id4kOKJUGyCWqWMQ0Sq+34JTO
	5BD/ko/krfymVqrZeBwM977bNlRAu1FNA1rqpFTJ+R/kKWOnuvS3MQ6stjmPhgeKctrrFnLp32LWh
	1I/ALlUbkr/tn3XLDeUQ/h2lmqijzWO8dnSDNeuc3SPDqc2RIV6V/Y/YuSte6uKp66pvVn5e2z2zJ
	ql/iBaHLcVDXQMIqIpcKW/SF9KL2r8+Xl84FbBtNf4PU97Yga/MFfFbULbrkSnB30ltkxu48YwIZe
	Ln0dNQUlbP25b9tuirekUKmGx6Ze92i1eE70CLX0Qx2ErscXqEhl8a9INKLxPM3P4D7hWQgWEY522
	OmhbzwxgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljCwv-002amS-Q3; Wed, 19 May 2021 03:32:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCws-002alh-DT
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 03:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PDM0WuZX1yIfkmFl6be0esAhzpUXa3/Aurhrr7XvDPM=; b=gGKs6JbKbIX31FTipmNm6UmiPP
 s+mdvlogLKN15JfISC/cTckXR7wELiMslA8xM1u8torrbDWWR9UlcsLwv4lj/F5QyR2Eq5AGKdrnf
 +aBKza+t0IfYkO7yshHARk1OkPulH4iuIL22sFa5sin9SjlxKue2E52v48cnWmwFGGLJ0XnQg5DmV
 jDXl81G4wA4KWoG74XtHMC4odLkc+lHL+M2DwqE7+cwC7mzHzUKDLoGDEy2tJ/2BHHXKhQXPhNrUN
 7ZuaiTmo3HHODa6KO0EC0NJTcCJ1LfAxStzkJAk4QddvUhUR9CNw6YwnVhd3H/zB4k5/p96byXFOT
 T3VW/4zA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwp-00F5aa-W6
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 03:32:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id z4so4046309plg.8
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PDM0WuZX1yIfkmFl6be0esAhzpUXa3/Aurhrr7XvDPM=;
 b=oyAW7BlbmqjuHJBPJb1YBJ8fZJgNvvTlbqP2zwAUMP3CwKxp19dWpxoQIu/n+do6Yx
 tJKA28crQFPZqY/1sE16YEbcC3R3wmkUvSr4MJPiitnLsnKru+MW0WeklCO29wfxquyl
 Msdc10P866HoPbayGW8P5XmDQNMFFoNom1//VPwA0sESGw7vSHI+E8q3txA9et9g/bbS
 xnIRKNXjbJR/tBelY6c3CwEnEcp3tz0u5ZqkYWZNYMCitFdpRJ2gnl7gKiZSs6ZQOdo+
 9u9Old23sAkc3w6XraC/j8BekVH/bjS//B8yQVWJR2dlGJzwt1du2dB4y5XGF2X5Fy9o
 Gbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDM0WuZX1yIfkmFl6be0esAhzpUXa3/Aurhrr7XvDPM=;
 b=RdFkDhdxqyi+qz11pnPzh0u6+3ZB1ASA4083WytD/q+nsypVjcOanlpTArc7sNlcdc
 43dpC5e9V8hp4uOwRcS/DK3cPnVHjHJQPTJIVa2R4b7e9JHMXk8lwFRbPWhr9fs6sr0a
 f984OTgy2jKCN56iL7TNFbDunqElpBBwhygvc6e/38IIP+6Jo7J1VT0HitOjW0Mzg2K8
 l5BxruQGalRDrALFtcvtbt1Vpffe7uSk8F6x3f9jL2iRiYEQlmQwAfeuXRWT9one4kR1
 oNUMBtMpWjaSdOL1tSKhkAMFRUf4BSXTqUZ5cPiXpFwkGm5gPqynficJaWa+dZjBTphq
 w54w==
X-Gm-Message-State: AOAM530yTJWfj3jEFfstNiKfbOWvNPmKZi04qaSiFy0QvJ8NvY2k6l89
 Yb1yQJspuNSCNklro3nyh1I=
X-Google-Smtp-Source: ABdhPJwqtxge1uuHi1Aa0NPjjm29H2edDQ6TIs+ffsUAY3h0ZbqTsJsBWS/aurSb0mTdAXXo9PWpcg==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id
 p9-20020a170902bd09b02900ec7e58a54amr8523868pls.62.1621395159142; 
 Tue, 18 May 2021 20:32:39 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:32:38 -0700 (PDT)
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
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Wed, 19 May 2021 11:32:01 +0800
Message-Id: <20210519033202.3245667-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_203240_049291_8F2B9F87 
X-CRM114-Status: GOOD (  11.67  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v1 -> v2:
Fixed plural (property -> properties)

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..18247ebfc487 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,12 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following properties are required.
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
