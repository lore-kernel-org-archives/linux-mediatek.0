Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E00C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 03:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A45611C5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 03:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26A45611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cye3axaHi5B3MBkdRppZdh584nZYjgTAl1clBciCUmo=; b=Yu2ZFgmFqF+qqP
	tOxPaRiQNa3yxpT93qut3oAYFoXgUBg/plmHIyT7BeomditNrqeUhsaqhhAtUfaAKGZxRZRCcRi7O
	WOk8kQfVc05/1R+9BYUCK3zR/9ZZuPoPizjuVi3CgXGuXEB78zsLq9VTVThi0S1DMEDWCmOcdjxvQ
	3geVDDpGfDj+JoUOVBdLXB1pc0y66ZXJkf588dLjBIZnlZrgtyh568aAQnF42z0al81IluSe1ZQso
	0z/7YgdcLGJZU2Vav6iMwRem6hMhMJhGbdR/Rd6JHBtG7OvJncJ9rWuM7yxHSuQQksZiE5dEQpDTu
	8qE/njxu4PpTqakjyKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBqpd-00BRgI-Q2; Fri, 06 Aug 2021 03:47:37 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBqpQ-00BRfM-UY; Fri, 06 Aug 2021 03:47:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so11113972pjz.0; 
 Thu, 05 Aug 2021 20:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRjfmIu1ztv3rpF9qempW092Tg0Ic9nW64q0L4U0+XM=;
 b=hsSIzfO4YdxtdYgjEL49PetbJFrHtI+H437tpeBWWAGaDnmpCThKq5vk4hq9Mesruq
 Z0s8/XY/pzTiUjnT0uuTwIeZGJfDYe3E8pBpZU4bqijj43TYGB1sriJqQHgUUqCuOpdL
 3exrENopXv6xRcJ0Xm66EsjblaxR8+YwDYzvaXu6eEBNogbrV7cNC7cl2Wfl7RKHS2kc
 iLQ3KQh1u+CI43c65RcyMqwxyGYB2/sAW27+f8GxlBXZXlPp8118kyXpgNIHuuPuZqTJ
 c9Y8Sjv6nhrAOzebYAeXNpOiPQuRMc7PJ8f3Yt1iXDdGopiH+yvPZKam1FOgJEdMUp6r
 he8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wRjfmIu1ztv3rpF9qempW092Tg0Ic9nW64q0L4U0+XM=;
 b=Me94mX61nMgn/YnBYj+aM1hcAG+i1VfPGJGYiKF99N0R3KHsovfxg17a6zdsR7dst6
 5hYIbKsbkNLXFZ3g3/UZuAf4+kHsulHx0zLHNzKOMW7FJRMsz/7njt/IVAY+bO+ws9gZ
 KUHRFU7LTK5n0mRnW/uNdlPvKy2r2D/utx0l6WIqq7oFZma/7Gqp/Z7niWZjnyDm9IB/
 xP/UZG5FyRCOO6jT2Cub75MdSsXrQ6S+Dv3G23M4cswYfQDxoRXS5xpaYHfAKbmEmJhm
 3BpE2yqjsgn0VbTto+o85CKxqKdIN5boKVLx4uPd+CQXjieBrPL1DcO4HNxN6EBhIx3l
 cbeQ==
X-Gm-Message-State: AOAM533+9viRH/BgzoIQoYKwkr8yxPa2RIyE8YbkjHSE7dMqnET0oQDv
 Vg+kraiv1xK7eadX+ixAMa0=
X-Google-Smtp-Source: ABdhPJxwv6rRE8p2TJYj8mRBp+eNNzdwKgjhixJvicNtSX0ZYgam5OoMeQFKHRT0/UIsKcYjOBN4pg==
X-Received: by 2002:aa7:961d:0:b029:3bc:dbdd:7a9b with SMTP id
 q29-20020aa7961d0000b02903bcdbdd7a9bmr8427782pfg.32.1628221643926; 
 Thu, 05 Aug 2021 20:47:23 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y7sm7723301pfi.204.2021.08.05.20.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 20:47:23 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: dsa: mt7530: drop untagged frames on
 VLAN-aware ports without PVID
Date: Fri,  6 Aug 2021 11:47:11 +0800
Message-Id: <20210806034713.734853-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_204725_073706_57A0EF32 
X-CRM114-Status: GOOD (  14.94  )
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
v1 -> v2: Avoid setting PVID to 0 on the CPU port.

 drivers/net/dsa/mt7530.c | 32 ++++++++++++++++++++++++++++++--
 drivers/net/dsa/mt7530.h |  7 +++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 385e169080d9..07db71f129ee 100644
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
+	} else if (vlan->vid && priv->ports[port].pvid == vlan->vid) {
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
