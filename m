Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2789C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7760F60EE4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7760F60EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2A3uykY5nqzXQcR/bYVaW3ycoRLvA1ob9CN0xQLqf4=; b=4MAYE7j1nC5Ah8
	HDPjPRbSejB9HZ2vY8SDa0+4qootrap7HpF/Atj3aPXYNLSXU28RWHQ14ADI0oTDnM8cxsxEJDb4D
	UgfGDNeX7B/WyNtfLWWW5JJKMxsyc8Oe67WKNDdoURQRNFbCI0NL+ZZ7hHpqnyiYhG1bwk1eyx+yM
	nT6kxGGdvkuuInMsfhV0+5xbMjJVVe3rwFHom17Kw+Olj3AfMo3FTuMqG3Aa4esfnYm2sIYxqGmLU
	Clp67taFmPAA1g7YKpfTsyWRQCoLqOhc2EtZZMnrJ9EibZwUXKcje1/3YPlB1FV3TsBZzRiz55t9V
	JlHtAADA2kAFQREqafYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPPV-001jcs-8W; Tue, 24 Aug 2021 05:55:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIPP4-001jW4-Pv; Tue, 24 Aug 2021 05:55:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so1074332pjq.1; 
 Mon, 23 Aug 2021 22:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzm00SI6Xxv7Dr12oDCG09tFQ89IjLql7VYEkcSa46Y=;
 b=U+/FRkIIjFBtQoRW5haOg0F8PlwQaveBzrO3OYhJi0C3fyk25+NPCgb9o8wUrKcNHf
 ae/4mTxPFes/E4AatfwSp6CwzbwS5SaGFPyGBbXiziD0TbQKB0gZxdft+/vbZaaUGmnK
 T8BXeOseqa3/sQo7eyhGLJV0zuw5uy8nvV49gNccJzEZQO+uugR2H50r7uuc8P8KEK8K
 C6PvI7X6UgWBCwHy/5LGZBjO5pQaQkcJWR6JHWf1Riz38nat4JXClCQbsxSEw4U/s44N
 +t4RqSyoIT/IM3HRkfn8mvFyMDy9f2heRo7RIQ02bIRmA4aICIz7u+tHYOxpJ2TblFBJ
 zByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzm00SI6Xxv7Dr12oDCG09tFQ89IjLql7VYEkcSa46Y=;
 b=CDhiOyHlBlNw/TjDzmiht04sYfWA0i0v5ZQGWa3MA3WxFtK+d46Ube+sbYIw7CGb01
 un2TqpvleEUi9TR2H5SCnhBOyZ5QeD/PgwcqK64ijl0a/XdaQ9MReu6njvzS6o4hDT4r
 xZ94BnT02UUPnLkYrkeMjgz2elsidNzQSs+BqbwNY/W28X286eOMLA6jkmpCxZvKEa8B
 Ki00Uf31vSgvW0HzXJ0AfNURWZ4jmk8U8XdEaS/ezf6znthEofyQef7XN3fNWldPPNRV
 tBhoFF+6iJNx5noMA5kMQJH1SuJpKfAnxAzapZbJpnKGhV2i2CryMJ+0jDdUTOFbxtXW
 HUyw==
X-Gm-Message-State: AOAM5335NhmdiDGClENVxFICoow9TvN2KWaN0my4jsQv7xa+vqfl1cv7
 /ORtbZ9JPTvwnzEkc9MUMFU=
X-Google-Smtp-Source: ABdhPJzBi/kmvgCws8SSBpovsykHE9dI8wovC6w+AuFQJxJ7Rnya+3XcIsj2pgCgwhudhuxNy0sklg==
X-Received: by 2002:a17:90a:af88:: with SMTP id
 w8mr2625365pjq.104.1629784518132; 
 Mon, 23 Aug 2021 22:55:18 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id j5sm1053958pjv.56.2021.08.23.22.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 22:55:17 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org (open list:MEDIATEK SWITCH DRIVER),
 linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone ports
Date: Tue, 24 Aug 2021 13:55:08 +0800
Message-Id: <20210824055509.1316124-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_225518_882920_32331818 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a partial backport of commit 5a30833b9a16f8d1aa15de06636f9317ca51f9df
("net: dsa: mt7530: support MDB and bridge flag operations") upstream.

Make sure that the standalone ports start up with learning disabled.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6335c4ea0957..67dfab774618 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -803,6 +803,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			   PCR_MATRIX_MASK, PCR_MATRIX(port_bitmap));
 	priv->ports[port].pm |= PCR_MATRIX(port_bitmap);
 
+	mt7530_clear(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 
 	return 0;
@@ -907,6 +909,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 
 	mt7530_port_set_vlan_unaware(ds, port);
 
+	mt7530_set(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
@@ -1287,11 +1291,15 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
+		if (dsa_is_cpu_port(ds, i)) {
 			mt7530_cpu_port_enable(priv, i);
-		else
+		} else {
 			mt7530_port_disable(ds, i, NULL);
 
+			/* Disable learning by default on all user ports */
+			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+		}
+
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
