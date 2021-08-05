Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD3C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 17:23:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353D360F42
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 17:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 353D360F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NsW7l3vB/w0t0Ne2WPTGeOsLMibIz8qL/y7qSh0BBbo=; b=hNRkysfem2ooNi
	x/07NMw2vkeQJrTPVCIDL70Eu5lUcgwsQ4vbLFYAQvy0QVJsxO9e5CZLx9/e9nIZVLbsWMV/rwWls
	GI2wnqOHK97FBh86vdZHB3R7IHacaq7kntJLCZwwADrBXWaE6rn7Ea5+pcavK3GDf3LEHfVaBpEly
	y1BV0zrsdhRfHMKruqLR6mqO90Iax2UfM2aEqWWc1Pzp6kBo7C7Sz0NeLTv3Gc9NvKmctQaMq9Bv8
	JJcF+V9llapAwsgSPXJX636ps1FKhsKMmjLVH6ovOTZADk+hM++UrU81HG9+fsEtMkFCZYlw+ntui
	6p2N7oq7hW0TPdhx2xMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBh5v-00APQ8-CZ; Thu, 05 Aug 2021 17:23:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBh5a-00APN1-3N; Thu, 05 Aug 2021 17:23:28 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso11227707pjo.1; 
 Thu, 05 Aug 2021 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCA4VfC8oJsngcHNQHqxfvcnSQIQ9FY8OuEOGE4n/ac=;
 b=cZavTf7ANl8OFNfJo563qA51fsfdLu+lGVjrKfWZApxc9LCwUJIVKLARVzKNDKTrfD
 yaDhlep9ypUPzIMOIB6QvD4Z2FbwiGGYsBNSZFpYaKvJBZGaa0e2eiBfanGv9uFiBnsh
 gFQX/iBVdVtVi1SLQQACfqq5Pc45KU6RG62xVK6yiBtRg9m0/q78o7XUVOXB3H/zhnJ4
 BUwcKYTPEd303BZgpXjDzdK6CkHVkzLPiMgATGRFqPsrHU5cuvdEJ4xYfIeRQ1OKnIf1
 aRdLHWkr4yupNpC5KNaSJotTkSIHkCZusf0P81XtY4LGMpY/Dc0g3yCfEpIh+BDrcsX4
 TPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCA4VfC8oJsngcHNQHqxfvcnSQIQ9FY8OuEOGE4n/ac=;
 b=DayeNPcGMgNiAICh1EfFDVW8lFWoEFiMY2FCcZUHV79kxssSG4u9spjndDRW1bcS9a
 PoSstc+GZQ9El0cAy23gdPI6CO+WwVI8GLqdEy5VcDQK4hIW7XO47ZhgOxD2eH0/6W6h
 /nnzVZVGa+PIrd7ciRjlq6tWpQAxrJHJ9Ytm5FMsGjVMk4PWjQGQnAgy6yZ9tfQivNsH
 CKp0pvdHIPvhrs/UQYuRml60URWieVK5dl+M30zLpZf0OwTOJKXT780tN+PYEi0L62ni
 yg9WsqEGz+A3WLCp+JXcOjwCPc664gqiZcCNeFUvrHdKzbVaipDf26e6tXLhiALA7inL
 v0fQ==
X-Gm-Message-State: AOAM532vqSnOK5FkHKmoXPAMqxfvLDWaZkB1+CnSC3GtSMcuE2JRWobY
 Tn6AEvxNO9GPUMODncs5LAg=
X-Google-Smtp-Source: ABdhPJxwNlBA5AefYt8BJuAxtTtzEWiCghRdd7UiBDfhSVo+ZgTTYiDj+LCAR2b5qmqgwsbo0yoUZw==
X-Received: by 2002:a63:a0f:: with SMTP id 15mr452388pgk.80.1628184204831;
 Thu, 05 Aug 2021 10:23:24 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id j187sm7381115pfb.132.2021.08.05.10.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:23:24 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: mt7530: drop untagged frames on VLAN-aware
 ports without PVID
Date: Fri,  6 Aug 2021 01:23:14 +0800
Message-Id: <20210805172315.362165-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_102326_198669_4362863B 
X-CRM114-Status: GOOD (  14.67  )
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

The driver currently still accepts untagged frames on VLAN-aware ports
without PVID. Use PVC.ACC_FRM to drop untagged frames in that case.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 32 ++++++++++++++++++++++++++++++--
 drivers/net/dsa/mt7530.h |  7 +++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 385e169080d9..df167f0529bb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1257,9 +1257,11 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
 		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
 			   MT7530_PORT_FALLBACK_MODE);
 
-	mt7530_rmw(priv, MT7530_PVC_P(port), VLAN_ATTR_MASK | PVC_EG_TAG_MASK,
+	mt7530_rmw(priv, MT7530_PVC_P(port),
+		   VLAN_ATTR_MASK | PVC_EG_TAG_MASK | ACC_FRM_MASK,
 		   VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
-		   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
+		   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
+		   MT7530_VLAN_ACC_ALL);
 
 	/* Set PVID to 0 */
 	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
@@ -1297,6 +1299,11 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 			   MT7530_PORT_SECURITY_MODE);
 		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
 			   G0_PORT_VID(priv->ports[port].pvid));
+
+		/* Only accept tagged frames if PVID is not set */
+		if (!priv->ports[port].pvid)
+			mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
+				   MT7530_VLAN_ACC_TAGGED);
 	}
 
 	/* Set the port as a user port which is to be able to recognize VID
@@ -1624,11 +1631,26 @@ mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 	if (pvid) {
 		priv->ports[port].pvid = vlan->vid;
 
+		/* Accept all frames if PVID is set */
+		mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
+			   MT7530_VLAN_ACC_ALL);
+
 		/* Only configure PVID if VLAN filtering is enabled */
 		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
 			mt7530_rmw(priv, MT7530_PPBV1_P(port),
 				   G0_PORT_VID_MASK,
 				   G0_PORT_VID(vlan->vid));
+	} else if (priv->ports[port].pvid == vlan->vid) {
+		/* This VLAN is overwritten without PVID, so unset it */
+		priv->ports[port].pvid = G0_PORT_VID_DEF;
+
+		/* Only accept tagged frames if the port is VLAN-aware */
+		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
+			mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
+				   MT7530_VLAN_ACC_TAGGED);
+
+		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
+			   G0_PORT_VID_DEF);
 	}
 
 	mutex_unlock(&priv->reg_mutex);
@@ -1654,6 +1676,12 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 	 */
 	if (priv->ports[port].pvid == vlan->vid) {
 		priv->ports[port].pvid = G0_PORT_VID_DEF;
+
+		/* Only accept tagged frames if the port is VLAN-aware */
+		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
+			mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
+				   MT7530_VLAN_ACC_TAGGED);
+
 		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
 			   G0_PORT_VID_DEF);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 4a91d80f51bb..fe4cd2ac26d0 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -238,6 +238,7 @@ enum mt7530_port_mode {
 #define  PVC_EG_TAG_MASK		PVC_EG_TAG(7)
 #define  VLAN_ATTR(x)			(((x) & 0x3) << 6)
 #define  VLAN_ATTR_MASK			VLAN_ATTR(3)
+#define  ACC_FRM_MASK			GENMASK(1, 0)
 
 enum mt7530_vlan_port_eg_tag {
 	MT7530_VLAN_EG_DISABLED = 0,
@@ -249,6 +250,12 @@ enum mt7530_vlan_port_attr {
 	MT7530_VLAN_TRANSPARENT = 3,
 };
 
+enum mt7530_vlan_port_acc_frm {
+	MT7530_VLAN_ACC_ALL = 0,
+	MT7530_VLAN_ACC_TAGGED = 1,
+	MT7530_VLAN_ACC_UNTAGGED = 2,
+};
+
 #define  STAG_VPID			(((x) & 0xffff) << 16)
 
 /* Register for port port-and-protocol based vlan 1 control */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
