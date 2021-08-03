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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9FDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6793E61102
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6793E61102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V77IAY6h4Of8qb59fQy7JJvtUNPD25yUY8jVYmKioI=; b=3EzYEmsB01f1J5
	a4GnO2U8Py3PUWf/kp9z9VN436ZqO8piz1idhOXSvY9RZ5Sm8KC/uPklRwbVNQow5x+jw/21R8MQs
	Wsa2odxySSlWJq25K4U6gS/WMUIFzuS+fzIrowXIF7Xw1ZGY4tGvFlUzLPpDhWkx8qB40kX2pbnHo
	m0odfprTgXrf0nzKZYb6b0SwcyHC1we94G+y5haXYNhMlEENk73vQGu/u1PvLN9i6zbLbGMyh7Gdk
	ezJNcP21Vv2MPhNNxRY7QT6f2D5Os+ekekoL9Wx6TQlYRkNMA7gszzRnAjII+V4HlEKobBHCDL1WC
	9Ar4gYc/pefWDJ2O1AyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwuI-003WUl-PH; Tue, 03 Aug 2021 16:04:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwu0-003WQf-C2; Tue, 03 Aug 2021 16:04:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5357506pjb.2; 
 Tue, 03 Aug 2021 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DDzV8/Fk1hQnq24aZe35CXn12AVhJ1i/aTFMFKXbn4=;
 b=okNC+95eqklwvX4zzy4qD21U1kMduj63CtRXA06V5Amw8XOIBhmMIV94OVgWUE7CY8
 DSisxbhuSmUI8zFKabPhDSo0SRLOmEn2I1ZI+JMVQZyW8fTOaK/JnSPBjvjxz64A2OUs
 7vhlyD5d3InukEjdCv9uW9Z1zKdmIGdEnEIfUP7JKh+i3HM8Ir+KCn0JSJSWN+a+UcxR
 zhHMLBrXihkhTTLnw4Ul9Oym3uHDuhWwg3UtWxC53eOqCCpWBwWxRJ2D5WAY/Xosc74f
 x7w2eWKAyv+fjEeNurlAgsWi8juyXarv915JGKd6yeqwsVKSGSpgJgVtlV+kNdg3Wk83
 sMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DDzV8/Fk1hQnq24aZe35CXn12AVhJ1i/aTFMFKXbn4=;
 b=Qoh8gRDlrtTiwtVMgMNYEYsodVKkLd0LY30gr1E5O8y7QJ1H9e0JR97fgybgJJ0pU3
 KbLtKCexA72H/V0DU1Axd+3gptZC2/+2thWdyOv7nO3V8IJlHzpkHK2p56J1RtkQBrrn
 lf9GSJLfnXjuRHxJyzZBI7p3k0T5KhaWv3gJHKQdV8PUPAqMEsAKq87hj9Oj/Odg83ah
 fLTM8dZk0dd88KBi8ZC/6iB/0fng0EfMyAYSyGfrMLtCOwQ56JRMZcOdkNZX6JVoXmCV
 FXXBSrZEHAYrXzS63hxGXgwWeHK1Ky/NwXciZvXD6SnwRso0D74ja1gtcMZompysnhuC
 3QZw==
X-Gm-Message-State: AOAM532vaqXfAeuZkvM+LR5kBiHyfbSEPCBVu4ICH+Hc9WPymXgNbkgX
 KPekn+DZpaMfW/mU6ZalUG4=
X-Google-Smtp-Source: ABdhPJwcMc7pBn9npc80n0nNmDQDDZpGDghJbvj7Xmc/kAG5aDm7AWrnBKfIYlEynAavc3DkERbqYw==
X-Received: by 2002:aa7:9115:0:b029:359:69db:bc89 with SMTP id
 21-20020aa791150000b029035969dbbc89mr22573713pfh.32.1628006663340; 
 Tue, 03 Aug 2021 09:04:23 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y6sm14390653pjr.48.2021.08.03.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:04:22 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/4] net: dsa: mt7530: enable assisted learning on
 CPU port
Date: Wed,  4 Aug 2021 00:04:01 +0800
Message-Id: <20210803160405.3025624-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803160405.3025624-1-dqfext@gmail.com>
References: <20210803160405.3025624-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_090424_458467_96620ECE 
X-CRM114-Status: GOOD (  14.09  )
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
v1 -> v2: no changes.

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
