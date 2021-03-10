Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81C3C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:22:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A3664FEF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A3664FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OHJsxCe+ztnm2iH0pFmr0KL7ndJDNQebk810OxqUAkk=; b=pp0/iYUcBpK1IsRnji8KNFQlI
	dj8Rys1unua2gB/dU1lVbVRkPDN3mnHueT4+7BOh7Pf9HV9pzEVXorKumbI1Pw1sDXWtfBn1S9bMB
	qo8aV+H0Is8tvTyNpLjNn/eO1NnKR4SlAP2Ppcs/xwJVHFkTxFQHqIoBBbJDOeV1YHtWU2wxHETcw
	XFHpMuLBVVpYSiB9J3bcVQOpd8585dmn2PfRS42LJRArd04nM4p7uv7iUK41q0O0wASuQ9cgdSDZV
	6UKmm1n/UT9cVpx+4AIZLRxbtSQ04suckSzTDEVhINy59GEspp3o7TdWS38Z6NnJyQj7ilrJAeewb
	JAkY+V7aA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK6HY-007mjY-49; Wed, 10 Mar 2021 21:22:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK6A0-007kRt-Gc; Wed, 10 Mar 2021 21:14:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 16so5806591pgo.13;
 Wed, 10 Mar 2021 13:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yve5BB90c/as2wOa80BfMCFbUCTgC67sdO61zec9GZ0=;
 b=OZFfh8Vt0Cu4mawZtmQpyBKOGCaQ3clX9KdNOdqxLlZlt3nh4BWL25L3UmLNExzU6y
 HP5PnPu+01ahyzmFSZBlPUcZV4hkVhbANq5YHl0L+xf1kEY4DLs5qLrvegvH3MSV11qY
 K1/NVsmNEO0H48Idn80xECABCEvIiuPrNfA8OBW94V4d9dDZH44elFDcYId8ac0lQ3Dg
 wN/a2R+IvD3Jt+sqgDi4yFS/qqxRauhBmESg5Oowog0js8pFPoVV68Moj2fCHKLKmKzT
 5pSvOBjCLlDzJZ/o6UrgnGMCxHwMxHHTMAdqf8ctCZ7Oos49zwWP0YSGQd2/4ZjKbA8R
 kDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yve5BB90c/as2wOa80BfMCFbUCTgC67sdO61zec9GZ0=;
 b=BToD5EyKH14m30BNB6aCkC/K21EYc2NYKlgqloOt3wbKbEemqlvavEcipx8L8M1PDW
 cynqnsysOT5cNWUug62uct1oVvVA3AZmhWanC9igDZzjh6y70OLiGMyTMns7LZ9fptvt
 atHw9gaerrnnCVZJvgFlvQm25UZWtoru9fjsOspfs+KXo5drIXUiLukDR+ebtMRaBvt5
 bgsQZw/+ojbe8TVa3UqwwOdXtJ9Ov9g6ccEyZEUHgafdsO3kV7tlhrr2Ku80kp1OqOj2
 JqDQO2EFImoD+WT/Oo+2RKqlry1mIwDdsYFC9CGoIAMV1/XJsUY1P9BAzlblxubXSN6J
 +SQg==
X-Gm-Message-State: AOAM530gtgr/XhBWr1KnWR4cy8IbRXeqdtj9R4uGwOGg4PPcN5Qb7qko
 kqDQOHBwkBltlckvfmZ7NFo=
X-Google-Smtp-Source: ABdhPJwlWieVx5tgc77i//vC5nut7Ty2JzURJWrddKHuT8PXEAoSEMjY4mbMYUmyAOKryS8JCD/2Vw==
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id
 g12-20020a056a00078cb02901f5d5871701mr4544454pfu.59.1615410866803; 
 Wed, 10 Mar 2021 13:14:26 -0800 (PST)
Received: from ilya-fury.lan ([2602:61:738f:1000::b87])
 by smtp.gmail.com with ESMTPSA id 35sm412090pgr.14.2021.03.10.13.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:14:26 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 2/3] net: dsa: mt7530: use core_write wrapper
Date: Wed, 10 Mar 2021 13:14:19 -0800
Message-Id: <20210310211420.649985-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_211429_345444_B73309AA 
X-CRM114-Status: GOOD (  11.31  )
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

When disabling PLL, there is no need to call core_write_mmd_indirect
directly, use the core_write wrapper instead like the rest of the code
in the function does. This change helps with consistency and
readability.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e785f80f966b..b106ea816778 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -445,10 +445,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		 * provide our own core_write_mmd_indirect to complete this
 		 * function.
 		 */
-		core_write_mmd_indirect(priv,
-					CORE_GSWPLL_GRP1,
-					MDIO_MMD_VEND2,
-					0);
+		core_write(priv, CORE_GSWPLL_GRP1, 0);
 
 		/* Set core clock into 500Mhz */
 		core_write(priv, CORE_GSWPLL_GRP2,
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
