Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C617C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3B361357
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E3B361357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FuPhHpxR+Kv3J3cpKcwgI+G8hOqDnl3HZNJnF8Q/f2k=; b=zpp6X02ypcNA91
	1BRH9KFQBvf1FeU6aZ/doAFEgNZT8ReYi4JTjJ6uxHyeeSm7v66JZZJUrd/YOO8kE8kJdtBsKqCZs
	vSqKsojByjlkjjw9tjEMgnXmv4+tdt3lpyAK1rgLZGOXZEu88/RdcLfQQ5THoDxABQDtnB2P35dZZ
	ayoKyMaMx9wjqzN/YuiPxNTIunJWBSKIei1rC5tWZgJn6Kidq7H+PbYWYoZXKRYCZ2A02HmtOsAju
	sRAdcuYoA5GiqQs//7UtIyjQaYg4dVbBM8veubBUpwRhTkoEZeOvuqhJ9C3gf/1VgeJtOBYXSE9Fa
	pWYdiLKjwOvx+i5qTC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIZfx-0041Zk-3j; Tue, 24 Aug 2021 16:53:25 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIZfc-0041P6-Mq; Tue, 24 Aug 2021 16:53:06 +0000
Received: by mail-pj1-x1032.google.com with SMTP id j1so14635664pjv.3;
 Tue, 24 Aug 2021 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zUDFYhASAyj6uEGnniUrjXm0ESgZHjV/ksAROysTnI=;
 b=jBAIJufMr/bS3ImM6Lxg2oL7tGRqTlcoylgAcTaZw7dbvBIWMsoLcOSKasr//BYH5x
 XK5nNZoVwjca0/Rb+El2G8nOQQy2jMC7ENDV5ktju6tOjcrQ3Usig3bcAwjmaRw2qBaI
 VPi/pbbUD4Wurm64UKQUniWGT74NRhrqQ3X2hG00sP2EtM5MGDIL3ww3RZ3unOmuNG3q
 waI3iXMk6gCzcWnSetA4puOSidqyVAUXfKH0C0vjPlTjA4xrvylHsJOYTSfg5k4CLsO9
 ++jnyMQOOyQ9ChvOy9o3zE1yeMg7tYLEqFktzA4RmyaPAK9LU8MvN7ZZx4S9s4XE3ll3
 JcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zUDFYhASAyj6uEGnniUrjXm0ESgZHjV/ksAROysTnI=;
 b=XPSaJbbuOJqNVZ3/l8XaqR2Fwe41aCjVPICOTde/2e37dx70ZVgJ84Nq/igGJAtIGg
 DtM25WqT5z5aNXiYUUgDLZc+epWI80IzwtN3pWmPUs63npZ64w8451kDmohhxD2qEOan
 RE/b3ZUCsyw4WuiuLqatJeWsA+9dl87LPXAaCFjuJrXFxcVP90Ve4ZazlBivGF3dP6zl
 aAuxgM8wrs7uix7Fp6v6p/WGhhBpX2DUmeV8EqmskZ+Q8MmMnonui9sdBIOKohvmIYwV
 jq+T3eVIm0/6yXtPyrfOACYC+M+Sah0X2sMB5xdTLI9ic1tyL67g/0RBhNbFYE2cjazQ
 d3GQ==
X-Gm-Message-State: AOAM531oTAdU9inHAamCqBvPOXWDBiFlO+AKvb80Gi+Xi6h8prn6xrEy
 kU32c08zLuwH1BdAgbt4A8o=
X-Google-Smtp-Source: ABdhPJxe98BaiW8/mF2ES8BEf8/eZ0x7SRNfLw78J9qt2FTEadgzRDw9vP1be6irFZ24Awz0eKOxrQ==
X-Received: by 2002:a17:90a:c481:: with SMTP id
 j1mr5415108pjt.164.1629823983611; 
 Tue, 24 Aug 2021 09:53:03 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id x19sm20275425pfo.40.2021.08.24.09.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:53:02 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
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
Subject: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Date: Wed, 25 Aug 2021 00:52:52 +0800
Message-Id: <20210824165253.1691315-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_095304_794976_5A555E83 
X-CRM114-Status: GOOD (  11.98  )
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

The driver was relying on dsa_slave_vlan_rx_add_vid to add VLAN ID 0. After
the blamed commit, VLAN ID 0 won't be set up anymore, breaking software
bridging fallback on VLAN-unaware bridges.

Manually set up VLAN ID 0 to fix this.

Fixes: 06cfb2df7eb0 ("net: dsa: don't advertise 'rx-vlan-filter' when not needed")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 25 +++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d757d9dcba51..d0cba2d1cd68 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1599,6 +1599,21 @@ mt7530_hw_vlan_update(struct mt7530_priv *priv, u16 vid,
 	mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, vid);
 }
 
+static int
+mt7530_setup_vlan0(struct mt7530_priv *priv)
+{
+	u32 val;
+
+	/* Validate the entry with independent learning, keep the original
+	 * ingress tag attribute.
+	 */
+	val = IVL_MAC | EG_CON | PORT_MEM(MT7530_ALL_MEMBERS) | FID(FID_BRIDGED) |
+	      VLAN_VALID;
+	mt7530_write(priv, MT7530_VAWD1, val);
+
+	return mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, 0);
+}
+
 static int
 mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan,
@@ -2174,6 +2189,11 @@ mt7530_setup(struct dsa_switch *ds)
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
 	}
 
+	/* Setup VLAN ID 0 for VLAN-unaware bridges */
+	ret = mt7530_setup_vlan0(priv);
+	if (ret)
+		return ret;
+
 	/* Setup port 5 */
 	priv->p5_intf_sel = P5_DISABLED;
 	interface = PHY_INTERFACE_MODE_NA;
@@ -2346,6 +2366,11 @@ mt7531_setup(struct dsa_switch *ds)
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
 	}
 
+	/* Setup VLAN ID 0 for VLAN-unaware bridges */
+	ret = mt7530_setup_vlan0(priv);
+	if (ret)
+		return ret;
+
 	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index fe4cd2ac26d0..91508e2feef9 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -145,6 +145,8 @@ enum mt7530_vlan_cmd {
 #define  PORT_STAG			BIT(31)
 /* Independent VLAN Learning */
 #define  IVL_MAC			BIT(30)
+/* Egress Tag Consistent */
+#define  EG_CON				BIT(29)
 /* Per VLAN Egress Tag Control */
 #define  VTAG_EN			BIT(28)
 /* VLAN Member Control */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
