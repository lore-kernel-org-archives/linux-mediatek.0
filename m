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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D3860C51
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1D3860C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHdKQdhjSbzFsmejMjYCSRSxubB1LDb1ijbMvX8jgeU=; b=dPUJJjDqv3Yral
	EBgItJ1dL3qZZ/pF90dxwcEg/0S8bTs1tB1YTM1cMLdMBeo7Bwo4Z5gRMBDeasMmVhRCpHsIfsjzM
	vPFDxa974ssld9GSv3+0VH1g1lyJv++lo/2LXGinpnYd3N7YRCcJP65EJhX2SXDSUR5KaX0zaVMIA
	oPNAqiazFspIEtvY60X7nyRX5VaN9jBQUw+sZhQjpcVh84M+DD0Dc8VMF54RDEnfGjJakIMqy/sPo
	OT39PwrPTKS3iaex8szixoqjyWRzaxbwN0H45BzQ06uiI7tGzqPhGym7n0xYN7BXS/uAhUZm1/ocL
	yC8OxKfKED8xZz+2rTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPKi-001iT5-Ni; Tue, 24 Aug 2021 05:50:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIPKU-001iQ4-9j; Tue, 24 Aug 2021 05:50:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id m4so531278pll.0;
 Mon, 23 Aug 2021 22:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gSDqXBdeSRky6h/E1OhzdBjGEqrt1+vEPvVVQ4fmdY=;
 b=fkEVVaTV2+cKJJTlepLZ+0uRX9rphvYYfm69e6vR0mmyT45p0tH4xcrDtLDjUJ0IWj
 B5Pk6Rf63UvqGjwmtNPuqFriO9Cmk/8zLn6bIr218PYLHhLzm0dtRS+lmndoYqgSVdnO
 Y6l1pl9z8Y8YeCJ03gCEKEqeB0BPaRUEgwIRJ0QDfJdOQK8vHgcK48T/rLHQlaeLBTIV
 y2mIs/vttXwW5aXJAqi9EdhYpZwReJp2gUgaSrWpgIRbHG70pL2ejANsWYu1lubgUmf6
 WwFWwm4Kw9K76q9qx9VU/OHB1OhXiIPTA4NFZIqhaeLLr/jXV5cXLs6Rr7QRbxpfAPoD
 Scew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gSDqXBdeSRky6h/E1OhzdBjGEqrt1+vEPvVVQ4fmdY=;
 b=Rb6CVuVojHRHJSdYbuvfKPt1XaSiurc7nJ+s5ZSXkvLmZ0so6RQrEQbzRO2laIkO8p
 N7IqJJL7dkUf+b7xynS3FLc+XCyWwlGYYivaIephwDaG7OAQO/Flgiwiboz0hRToS/dz
 70362CUbKRpvOLDCksOE6tR80BFQhmhbbBD6Mi0OdZdq8lLC9qDvGewAa5Lb2eKUr4zR
 mw48xQRlO35pThOkmludAdIzZjb+/i1fLsdn7CVqjfF59A+xQp1UETqIpK/OiymRuZbX
 wtXGkXf9JVF1cHnhecE4JlFPLKfoGhJFmalwF07180bRIxrvgdplAmhvtkzwobME5bmk
 jCGg==
X-Gm-Message-State: AOAM532lOwwp2gvgJQYOb0FqRsn2vZcWkuzx8QsDWKpWVYHrzHPffWXh
 WphS+4dmerp/R/FNO/4Fp8Q=
X-Google-Smtp-Source: ABdhPJxVYFJEp7CkpwK0eGclGAm8CLw2ohd2D9rXLv5HSKLtdOEkciNduvW28N51frgsTWS87ms+rQ==
X-Received: by 2002:a17:902:aa02:b0:134:b387:facc with SMTP id
 be2-20020a170902aa0200b00134b387faccmr6828783plb.22.1629784231961; 
 Mon, 23 Aug 2021 22:50:31 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id s32sm18278054pfw.84.2021.08.23.22.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 22:50:31 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org (open list:MEDIATEK SWITCH DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5.10.y] net: dsa: mt7530: disable learning on standalone ports
Date: Tue, 24 Aug 2021 13:50:19 +0800
Message-Id: <20210824055020.1315672-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_225034_400669_564050AD 
X-CRM114-Status: UNSURE (   9.66  )
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
 drivers/net/dsa/mt7530.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3fa2f81c8b47..c9c02da3382d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1083,6 +1083,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			   PCR_MATRIX_MASK, PCR_MATRIX(port_bitmap));
 	priv->ports[port].pm |= PCR_MATRIX(port_bitmap);
 
+	mt7530_clear(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 
 	return 0;
@@ -1183,6 +1185,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
 	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
 
+	mt7530_set(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
@@ -1636,9 +1640,13 @@ mt7530_setup(struct dsa_switch *ds)
 			ret = mt753x_cpu_port_enable(ds, i);
 			if (ret)
 				return ret;
-		} else
+		} else {
 			mt7530_port_disable(ds, i);
 
+			/* Disable learning by default on all user ports */
+			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+		}
+
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
@@ -1792,9 +1800,13 @@ mt7531_setup(struct dsa_switch *ds)
 			ret = mt753x_cpu_port_enable(ds, i);
 			if (ret)
 				return ret;
-		} else
+		} else {
 			mt7530_port_disable(ds, i);
 
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
