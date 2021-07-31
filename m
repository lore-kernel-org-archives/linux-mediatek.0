Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F126044F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6F126044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oyi+JWK91iseWIHcVfIv3K7T9EzEmyhygSZ3zekq5b4=; b=up3j8jNAznWEPH
	dEC+S/2XrGkYCPJHoBCv/lGJbKHgNueQhTX3RvYL3D+skTXUXt7MNnFXxUDw7F9XBHpApYGDTemXw
	uFb76G2ux8PBsgC7NJ+LQsbl/C4EsVvLyhnOl9XToeUMCnxu5KTymKtGTw2FRR3CcLuXY8D7SqHJT
	24koz35P9FegTR/CuVEeDjPwehhFFTUETb3n+SgPVbAb7VvzvtJE7QlR+uO2KBOCL7YWGoyMmaWY6
	87+JSv1VQcn2VPwYTkcF4A47DmKFBc132fBvS01eABD21/oGkY2jzEU9DwKv+IXtfMctW/FB2icfU
	m0NXDaBtvERYR1DPOBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9uNy-00C8nY-1y; Sat, 31 Jul 2021 19:11:02 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9uNd-00C8jf-8e; Sat, 31 Jul 2021 19:10:42 +0000
Received: by mail-il1-x12c.google.com with SMTP id q18so12781695ile.9;
 Sat, 31 Jul 2021 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pf4e5z5kl4gOi9zuOWFB+34JLJ0QdGJxH+6mOqzI7vc=;
 b=PcNVaAbr7KAwYQe5hrR9XTZqJAi2liNH9G8jC06hqnvgGaGL43hxSDwkdsA++PfYFs
 OxLymYJgp12fVQSJF9i2aJVU9f4Emb+2Ypt9KWbvfmLwniEXYAprV6NxDmO6XhAzvuiy
 AC0nvZZq3WY+NJuGp3sPZUkgqItUOMeaTkKwAg6yf8fndduHSAct0h9qeoWAsvgm/Mys
 /xKyafcY7okuKHxq0fkerC73AdAGOc7aYOGz1ZoDRBUGveb02q+bcskvmtRWYsybHg3b
 JWZ3TlfZPgGHogWbatylwXgyBdiDbRhWyrxP6rGsQJeFTKGaqYDIPQHu+mhXmAyF/FXl
 Hj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pf4e5z5kl4gOi9zuOWFB+34JLJ0QdGJxH+6mOqzI7vc=;
 b=ocTvtcltEnYNIrArgGb5et5TUPHG+S5BEKVmosL54bBmPtdwab/MZjt6kYafDuMIjn
 9fHUBamT3eKN9kE1Ayv/N3HlQKGaPAhD2WON5WyRI6ufVbUsGH/JO66faYofMbO1PIUu
 Wq/FfR0f5XluOaOWLJCqjoVZASRQ5ABSG0NDmWRS5khR2TDG0kt17HEDQSX2YrDYlS/4
 Qs9uJatjZCIiOLdW9/ceWqI8RZaPGXsBfRsANg3HSJQeOhzsNcAKK6I7TNWMiIAfYVUL
 C6M9f5Als3p6HXj0ea1BEB+OzXpcE0D7gro4SS1SPumEgv0xFaf6W0Mq0TFKIBD01SGZ
 677A==
X-Gm-Message-State: AOAM532dzmDE0ZQfB9ZjtPzhkQ20Su9ragcvmDRVyL2twwMQfdX49J1Z
 wIihTKiFzEESo7K15F9sLU8=
X-Google-Smtp-Source: ABdhPJxRzTveHTn181cO1yF+Rq5/FwFKIgU//FZUL2XfeKtbjr65COP8BnBc5y0Atptr1FbGNrrjDg==
X-Received: by 2002:a92:ab0a:: with SMTP id v10mr223601ilh.17.1627758640338;
 Sat, 31 Jul 2021 12:10:40 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm2837991ilq.13.2021.07.31.12.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 12:10:39 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: [RFC net-next v2 1/4] net: dsa: mt7530: enable assisted learning on
 CPU port
Date: Sun,  1 Aug 2021 03:10:19 +0800
Message-Id: <20210731191023.1329446-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731191023.1329446-1-dqfext@gmail.com>
References: <20210731191023.1329446-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_121041_357262_D02F0AA9 
X-CRM114-Status: GOOD (  14.40  )
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

Consider the following bridge configuration, where bond0 is not
offloaded:

         +-- br0 --+
        / /   |     \
       / /    |      \
      /  |    |     bond0
     /   |    |     /   \
   swp0 swp1 swp2 swp3 swp4
     .        .       .
     .        .       .
     A        B       C

Address learning is enabled on offloaded ports (swp0~2) and the CPU
port, so when client A sends a packet to C, the following will happen:

1. The switch learns that client A can be reached at swp0.
2. The switch probably already knows that client C can be reached at the
   CPU port, so it forwards the packet to the CPU.
3. The bridge core knows client C can be reached at bond0, so it
   forwards the packet back to the switch.
4. The switch learns that client A can be reached at the CPU port.
5. The switch forwards the packet to either swp3 or swp4, according to
   the packet's tag.

That makes client A's MAC address flap between swp0 and the CPU port. If
client B sends a packet to A, it is possible that the packet is
forwarded to the CPU. With offload_fwd_mark = 1, the bridge core won't
forward it back to the switch, resulting in packet loss.

As we have the assisted_learning_on_cpu_port in DSA core now, enable
that and disable hardware learning on the CPU port.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 69f21b71614c..7e7e0a35e351 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2054,6 +2054,7 @@ mt7530_setup(struct dsa_switch *ds)
 	 * as two netdev instances.
 	 */
 	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
+	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 
 	if (priv->id == ID_MT7530) {
@@ -2124,15 +2125,15 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
+		/* Disable learning by default on all ports */
+		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+
 		if (dsa_is_cpu_port(ds, i)) {
 			ret = mt753x_cpu_port_enable(ds, i);
 			if (ret)
 				return ret;
 		} else {
 			mt7530_port_disable(ds, i);
-
-			/* Disable learning by default on all user ports */
-			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
 		}
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
@@ -2289,6 +2290,9 @@ mt7531_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
+		/* Disable learning by default on all ports */
+		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+
 		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
 
 		if (dsa_is_cpu_port(ds, i)) {
@@ -2297,9 +2301,6 @@ mt7531_setup(struct dsa_switch *ds)
 				return ret;
 		} else {
 			mt7530_port_disable(ds, i);
-
-			/* Disable learning by default on all user ports */
-			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
 		}
 
 		/* Enable consistent egress tag */
@@ -2307,6 +2308,7 @@ mt7531_setup(struct dsa_switch *ds)
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
 	}
 
+	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 
 	/* Flush the FDB table */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
