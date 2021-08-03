Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5527C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:00:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E5D60F38
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74E5D60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fv/3JnsaKoeSd+TcGKPI+s+JruSpTStl6NVYD2EQiDM=; b=y2Mei8wePL4Nhp
	D2yiw67ItA1qTdgdVZkJGQEXdIHCrfawxl2E27kE65md/JsZku1Nsbz59YNGpwMUONhNjVWBGyUL/
	IBY8mdFxq6g5gSKcNlKBo7hd3oWtxUizFdFo93gygtluzDpczcjzCyMEwAmpHih5OJrKfAUVHZevr
	pSnVj78Pv0I0CfWt+Ck9YYGr3KFTBv4qPi2pLuQL+UB+1MvhXVZX85oFQB69AYUo8UjFgPMhK92rH
	jZd8OB25HZPmBqzhB7Mx2BDEB0lbHet3Yuux0I3VmKVLZL1B702ADoYHBeSRKLoHB27Y+tn1mbmvT
	pErzkTXRbZu+Ne01C5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu1k-002oZC-1O; Tue, 03 Aug 2021 13:00:12 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtio-002hP1-Tx; Tue, 03 Aug 2021 12:40:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so4479856pjh.3; 
 Tue, 03 Aug 2021 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/4BONrSOBizGoNEGmYr7gQHytyhSTdcu/YS8W1W0Yg=;
 b=U60ASrWzo2CxTUtUrtkvxqko0p3rw+Jy1Teurnr9z2qocwfsOEBT3f2k7yBm+wLiFx
 hpiOHGhKD1gf0hYyjTROX6BTyLZtPUwqolhfPx7QsjvADx6fdkUFI6cPyIxTqpseGq7L
 jS1h0tN574jRu5UrQ6O1mx7nzWOLGMS1ol+MubKsz2J/ScQqA6I38ffK11oHbx5OqIIO
 VN1YZ0GoirNjVqx1cgPifmafdJS6E2sDoyrm2aRf0fS8oawhKqrzkfslLglkNdJDdI+/
 ZWiT0Bjn+MTtQreRt5cSii6xVze2XjXCHzs+d0oy1O4CI+w7+s0FVb781S1YVVcunP7V
 exwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/4BONrSOBizGoNEGmYr7gQHytyhSTdcu/YS8W1W0Yg=;
 b=E8Ohh0ErVdr8Nh4xccnXPO/GeRCyWUhzmSmimFYlzTBYkS9Kz6bFTenJcMulPetFE5
 UWDFhSPpGuN4KMZfgXDNYZg+iXc53wQjiUKYkOx3lXkIVMKlfz9VfWJuaS4EcAaeJNl8
 YjChjP3s1IkgayncNj9wvc1jdEUE+R8ETHvVKtpdgw3crNZlwi/z6wzd9JNOiDJbBZvm
 rZm9UucTjGy1iEeKW3+c+mBoznKQ3WD4dOigavEs0uk57PJv0kpsA4fvDUQwisFH+lSO
 hhxxOsqQlahU/jy1JXtdtK2yf1kYuTTGgrWmvnw59yazrTwlhPZR4jNFqVVZ1F430WBr
 rAvQ==
X-Gm-Message-State: AOAM530/9xVCDtBPNIL2yBPDzGI8LJbzTmiDs+9YPrZj5dE91bFpbLR7
 zKC2RhFaa9KA3B/vnf98QWo=
X-Google-Smtp-Source: ABdhPJzlRZxiHjRaX626SWcK6s9kRrCmhBb+zkxzEUKrSeaS4rwpEg1Bhk0nwO0PvGjvX0uIxk7T3w==
X-Received: by 2002:a17:90a:2f62:: with SMTP id
 s89mr4341247pjd.33.1627994437637; 
 Tue, 03 Aug 2021 05:40:37 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g25sm15747499pfk.138.2021.08.03.05.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:40:37 -0700 (PDT)
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
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Vladimir Oltean <oltean@gmail.com>
Subject: [PATCH net-next 1/4] net: dsa: mt7530: enable assisted learning on
 CPU port
Date: Tue,  3 Aug 2021 20:40:19 +0800
Message-Id: <20210803124022.2912298-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803124022.2912298-1-dqfext@gmail.com>
References: <20210803124022.2912298-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054039_025805_468377A7 
X-CRM114-Status: GOOD (  14.26  )
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
Reviewed-by: Vladimir Oltean <oltean@gmail.com>
---
RFC -> v1: no changes.

 drivers/net/dsa/mt7530.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b6e0b347947e..abe57b04fc39 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2046,6 +2046,7 @@ mt7530_setup(struct dsa_switch *ds)
 	 * as two netdev instances.
 	 */
 	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
+	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 
 	if (priv->id == ID_MT7530) {
@@ -2116,15 +2117,15 @@ mt7530_setup(struct dsa_switch *ds)
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
@@ -2281,6 +2282,9 @@ mt7531_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
+		/* Disable learning by default on all ports */
+		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+
 		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
 
 		if (dsa_is_cpu_port(ds, i)) {
@@ -2289,9 +2293,6 @@ mt7531_setup(struct dsa_switch *ds)
 				return ret;
 		} else {
 			mt7530_port_disable(ds, i);
-
-			/* Disable learning by default on all user ports */
-			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
 		}
 
 		/* Enable consistent egress tag */
@@ -2299,6 +2300,7 @@ mt7531_setup(struct dsa_switch *ds)
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
