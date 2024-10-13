Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EC0CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upE0t48bx6bnFX6rRPJniUFr4RqVvS0QgUcy6/B4hDA=; b=GczaI4EqwoRV5cGkqmVt4ccYhF
	fAm/o8k56k2xmCgXD7c98mieUrgnJ++mLuaRAa0YUxOsbwSRmMFYxo9X61GAAiLE73tTzPVymfoA5
	rVov271ZlkbmbRqoJxdU3kn3AKVSPIFXLibrJAAFQSgWkCQGI8WBK8HWA4yUXon+WP0JOfK4K5o8Z
	CrHkiHN1hTozWuKSIoXQgLyExwSUJlosyG9iD2HpCxkO5gexnMZNIHtrGpGl5cSoTWVrbMTJROh8z
	+3Bd3y9BS4dyhff0+0Vavaeq7XKxbGjyCBt282f5Z24d0NV3XsHYqmHi2T4Ry0psGmLvcn6M//yLN
	hvz55pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03hv-000000034LM-2Nmf;
	Sun, 13 Oct 2024 18:52:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03gX-000000034Fh-4AKe;
	Sun, 13 Oct 2024 18:51:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so4579535a12.2;
        Sun, 13 Oct 2024 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845479; x=1729450279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upE0t48bx6bnFX6rRPJniUFr4RqVvS0QgUcy6/B4hDA=;
        b=LWZ/TFG7yl9XNBNIyXySvCaFN+OS7Pz9n39gGDf/Cv67FFdSXXzeA8DvmDNaqJEnq+
         fMJXruXLEWw2u0HlcibEN1Cy4hAFusVe1GfXeX4h7evFk+IjdvoJirP4T6PtR4vMsXAD
         oDIHEiAFW1KRFyaQ57BEdaGpr7UxU+hZ4yTda6CYQYEtrBKQ9S77Rk3ueMbkQRaLywzK
         Frl1qPkM8HCBzqwFQQDvEeEiyoyrFiar5vuXUvQ+fWyOmPE994tWYuw95WTScj9dLAPT
         jiviLz7nlBnLk820xIPtBs2KwvJb8uiDi4mXDISlVeaMwfrT8ecvCzXsBk9bybdYXsgN
         wUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845479; x=1729450279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upE0t48bx6bnFX6rRPJniUFr4RqVvS0QgUcy6/B4hDA=;
        b=CW4lbt3k8m1iDNlyYhQkLHGV6mYzYt7NSSNKWhMeexKEyeyxIaU41R8/WITEagIhvM
         /YZSkAELT7mL8ctq6bUZBgC5eWLWWjEeqGfNU6mkrPcozXVtshMF0uLVsRndW5PwX7N/
         Gy9Xo7f7gaQsCFomyLSNlxQplp7LGcSQRoIDZ6MCjlo4iVRsLPXFACv70afk0QqrhK/l
         gvuyUJZBtDsvpX14MMOREeJgkNK/IfhUOBgeIJ8AE2iq37TzuweIaxSoPF4e9UQd/tkG
         FZqO/nHHjplCz1v1Oj0lxqsnepg2r5iH/9vCvmVRiZS4dZrTF13+re4VfjgOSkU1QmDn
         jMpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3IN3DpjHN13uYMQZNEON6ENRHnouTgzwft29ymX1WgkGP7zVvdEXtxXvw9piZsNfeN71j13+ktk4bXLulPuWE@lists.infradead.org, AJvYcCXmbUFVXMBR9lsZ8HjEjGi+5MlkXyC3lWmpI1LS4EyrZAM7mpf8ahIijHc/47nz4WNCaSjZU+FDWNPFJs7iDLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOMcj71QV8K5DMME3GExzaYVj4EPcNFnaO1HM2Gjfd8OIq0cZz
	UHf4K4ojUurJ5oaNDnUBQcoE+S0DEHIE67tZizBA7APC7utg9pjK
X-Google-Smtp-Source: AGHT+IFisFXHNsMThYF5hflDELoTjfJVgJKtvK5aGnjqGXgf/Lkez2iRLHMqqM2Mpjy0m2JcUM5ZOw==
X-Received: by 2002:a05:6402:42c9:b0:5c9:6c03:48ca with SMTP id 4fb4d7f45d1cf-5c96c035050mr2810750a12.31.1728845479275;
        Sun, 13 Oct 2024 11:51:19 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937156781sm4059656a12.56.2024.10.13.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:51:17 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Date: Sun, 13 Oct 2024 20:50:56 +0200
Message-ID: <20241013185056.4077-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115122_060146_F3843D39 
X-CRM114-Status: GOOD (  15.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
double vlan tagging, but mtk_flow_offload_replace() in
mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
combination with pppoe and dsa tags.

This patch adds QinQ support to mtk_flow_offload_replace().

Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
of PPPoE and Q-in-Q is not allowed.

As I do not have any documentation of the ppe hardware, I do not
know if there is any other reason to not implement Q-in-Q in
mtk_flow_offload_replace().

Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index f20bb390df3a..c19789883a9d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -34,8 +34,10 @@ struct mtk_flow_data {
 	u16 vlan_in;
 
 	struct {
-		u16 id;
-		__be16 proto;
+		struct {
+			u16 id;
+			__be16 proto;
+		} vlans[2];
 		u8 num;
 	} vlan;
 	struct {
@@ -349,18 +351,19 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
-			if (data.vlan.num == 1 ||
+			if (data.vlan.num + data.pppoe.num == 2 ||
 			    act->vlan.proto != htons(ETH_P_8021Q))
 				return -EOPNOTSUPP;
 
-			data.vlan.id = act->vlan.vid;
-			data.vlan.proto = act->vlan.proto;
+			data.vlan.vlans[data.vlan.num].id = act->vlan.vid;
+			data.vlan.vlans[data.vlan.num].proto = act->vlan.proto;
 			data.vlan.num++;
 			break;
 		case FLOW_ACTION_VLAN_POP:
 			break;
 		case FLOW_ACTION_PPPOE_PUSH:
-			if (data.pppoe.num == 1)
+			if (data.pppoe.num == 1 ||
+			    data.vlan.num == 2)
 				return -EOPNOTSUPP;
 
 			data.pppoe.sid = act->pppoe.sid;
@@ -450,11 +453,11 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 	if (offload_type == MTK_PPE_PKT_TYPE_BRIDGE)
 		foe.bridge.vlan = data.vlan_in;
 
-	if (data.vlan.num == 1) {
-		if (data.vlan.proto != htons(ETH_P_8021Q))
+	for (i = 0; i < data.vlan.num; i++) {
+		if (data.vlan.vlans[i].proto != htons(ETH_P_8021Q))
 			return -EOPNOTSUPP;
 
-		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.id);
+		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.vlans[i].id);
 	}
 	if (data.pppoe.num == 1)
 		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);
-- 
2.45.2


