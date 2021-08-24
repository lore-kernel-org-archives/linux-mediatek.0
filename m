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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64380C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13D9611C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E13D9611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sKqxijz9YxT8R5iM/GEJKsZNkUYNONdf6fLaP3lwS8o=; b=f2K4kXENQhn+BQ
	pBtD45PYW4TOQkpCsCmHPhWfyUty1fVn2no5UqM2JZEPgU2TIz81E+2g6JwtegFkV4qN/TGY2bPtS
	2RJoqSE9QOs8NPLvy4uUzPEzSAdNylB6ygeJrGjRT5h+uIlcl7CPcVLi0kiQTdCNxQ811qG8JBxMO
	zMWbiBLdiDViZfE3VJnKAX+X90jBK7Roo4JQHWwG0a22UOSvvs0FhyJm3ebrO9tLsZeAi4inEcbxs
	w9EvlyTYBfVwhCUDBXAEgkannLFqfUA/jkqssFJCJLfHDcj3Jgs9SZvjtmVl33VfMGG000OWBvyhy
	DUBxjvMAcc9OibAaEwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIPN5-001iwN-QK; Tue, 24 Aug 2021 05:53:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIPMr-001it4-O5; Tue, 24 Aug 2021 05:53:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id oa17so13519397pjb.1;
 Mon, 23 Aug 2021 22:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrFQm7flTkEFFwdFjWBoVvPjc3n+60qzJ4VZO7fQv8w=;
 b=QtHbrhx+OiFXKxbRJkfrAnvATXqGIwuBUfDWLS4K1YRlorq3cvz7LGthbDYr/oXXVk
 s7cdECmXymt8NJ57+vFAUdnp68J1mH0/y2Tw0y4vh+yNWAE/Crd3fUE+VrbvsaKJ16Id
 HF5JzDzZbgD5534vSeV8IdU2O/rwDIMn12/k2hjXE9sUSIynYswyuDD6kpXxMAmeRkoJ
 tPCwt7QBEsUa+DWKdGvyvYC5oyhS2AFF+sDIXqiujdm3CMU/inbiVTakOhMonUeETN8h
 mj7PapFPePifK07+7iaFsg9ZFWTeb1+BcydRX7gr4m7vi8/ROq3D8ETloDq8wg4/KCCu
 Kt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrFQm7flTkEFFwdFjWBoVvPjc3n+60qzJ4VZO7fQv8w=;
 b=fl9vVBYY9DzaSSQQKP300UKsQdg9gM/RdIy0Zv4gZcV841oGs6DcwAsJHo6JDWZRIk
 ttnfFvW+db1n++5TpbxhmbxtMAgaRouN2d6RqCi0uAvnCTbferxOR1DJGmezpJUJwAXy
 usm6cUNIBC+p5TgKrUf1FRDpWlQkFBPk8B5E/6Ac/tLy/MhikREy0X+8F38UImY/KkTS
 vWlRzqT/BFQPpvYHWlJ7BMajLRg23S/9lIHi0SZKTIJMFbSrxqJBXdCQkbfznDF7/XHl
 gmOEXiHHMexSOcFzcn0gLUu4eGtLUup/2CUKIdD8iEtXHUsxusA/VrioqEZGVwbBXBJw
 f6sQ==
X-Gm-Message-State: AOAM532BSblbppe6LdqgXaGJcP2beXZ+JfNXTaXTUWNEBA/HyrDVB07y
 mGUPMuEvj/K5JivtHbDq33k=
X-Google-Smtp-Source: ABdhPJzz5xrfLOEviDCGsTH9xdIXyACp3PC0jd7A6XrFLpI3PQQm8uMigntzQtlu6oOPAeuketZ3bA==
X-Received: by 2002:a17:90a:e641:: with SMTP id
 ep1mr2530027pjb.209.1629784380935; 
 Mon, 23 Aug 2021 22:53:00 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id c23sm20665523pgb.74.2021.08.23.22.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 22:53:00 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org (open list:MEDIATEK SWITCH DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5.4.y] net: dsa: mt7530: disable learning on standalone ports
Date: Tue, 24 Aug 2021 13:52:50 +0800
Message-Id: <20210824055250.1315862-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_225301_828056_1B8F1FA5 
X-CRM114-Status: GOOD (  10.03  )
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
index e1a3c33fdad9..b21444b38377 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -764,6 +764,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			   PCR_MATRIX_MASK, PCR_MATRIX(port_bitmap));
 	priv->ports[port].pm |= PCR_MATRIX(port_bitmap);
 
+	mt7530_clear(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 
 	return 0;
@@ -864,6 +866,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
 	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
 
+	mt7530_set(priv, MT7530_PSC_P(port), SA_DIS);
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
@@ -1246,11 +1250,15 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
+		if (dsa_is_cpu_port(ds, i)) {
 			mt7530_cpu_port_enable(priv, i);
-		else
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
