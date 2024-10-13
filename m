Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AA6CF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wvQCHOWWIW7US3Y24oFxpAEUoI5Ll0qD/qvu+rx8QE=; b=bKAP+PPu00g5evt0Hyq3XYeAsz
	GEm1ujiq5veJJgBEevM4AWU2o5E9gOHbQMVyKWOy5dq0BHi6VmSLCrJtt9tpaUwxF66p/HwM2Qi95
	5KObwi6LYNkKsb5jl7OfFnI0GHTUpyi8Qr/CZvWFqfRaxclwNQMnWoYH5UH0UIv+0kPStPI99KCDu
	aQpxyBX2PPtjrTsmFAz1i5kbt8FNz1EPWDaB3Ry2eQuzPU6yIeKmy3o+TIUjbbdk+CKiGl+RaIX/s
	RbsAj+Do+8/vugRZmXzxe7OXoWg2PblUg5dTO5v7OQbQkLCY2bUStZrLwbUt9la+fL2zhY9x63/ir
	B0cAAeWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03zm-000000036ln-0sHf;
	Sun, 13 Oct 2024 19:11:14 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kq-000000034cY-1JhF;
	Sun, 13 Oct 2024 18:55:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a99ffeea60bso108393966b.3;
        Sun, 13 Oct 2024 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845747; x=1729450547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wvQCHOWWIW7US3Y24oFxpAEUoI5Ll0qD/qvu+rx8QE=;
        b=Ris191bUauvVukcXLLC5UHc0dk0yAW+UyOAxYvtK+lv1akaz5hZ98E3WnnpvefhGTC
         ysxUUHAK00pUdzwckjSZDPRPmQ0INltro4LCrvMxVrYZZUOO8gwQFnnBzX2XeX2mDHb4
         2uxDl5fdjyx54PYQShI34imrHHCUUjwElKb98uIWKa7B56rfe5vrX0AoEVy72ym+7niA
         bTEBOLGwSY+PYlyfz/NXjwHl35wV0uES7Le/FbewE9lz0KmZHfFcuHQOlhOqy+xA5Eu6
         kdaAg6ktcY25ZHW8UbLSjNWDdYKwcuv1sSeI12X7LbwbZe94Jv6o7l/Zh7BRyYFL+A7u
         DBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845747; x=1729450547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wvQCHOWWIW7US3Y24oFxpAEUoI5Ll0qD/qvu+rx8QE=;
        b=u6Smhwx3tL8IxW+g4EA4t1wiDywaeBfq+L06rMS8YQLUgkRfLGhzu9eYJ1rXPAW4Z3
         Vk2nOQ2QP3dikSQxO9DJoGDAdUz3CliX6+Vgc50utilbrdO/e6XjU68UaiREdU9JFyG6
         9ulErVmsHYu4oy6ngrKL5kCcBnFtUzSjnD52eQ4eB5iHD7S1tuGsnfjIZHU/DvlsY0SI
         U9e8sTwyRFxkLksObRJSDrYaDo88ETtxNCUyaVU/l574yhfGaw2qnCPcDnbBriRAW99r
         8Jc/YRubjo1t2GDTdtb0s1zeprd22n9cEZIJaBv6ky24wna8ucbOutll4asKnLHO0Y/h
         7POg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+jTgM44vBMcczhh1LVqvFgDWeqqSonjz7suvcipTlE4tPktYqg6SVDbSN7u2TSFerZsDwv4pjyysmO6u8PWT@lists.infradead.org, AJvYcCVlcbGpr2QNrlMkhkSgj1uHojDCLsE/BGRQqxsGfXOBcZlc1+VzDQM9agdDBYW0jKDf9HoWA1DT9Ym3UCqRKL0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaoW4BVqosS7dPHmQTAYI0ONI8mW1A3sHh8eqi2kH4G88C/lX7
	A5gqgpM1lAy9khXnwvhEHpOJkcJz9IzdxNo26BkkMFNzI5OFh6Vv
X-Google-Smtp-Source: AGHT+IFcMh7X7AR/VKEwvdjIeYhwzK2WvA/EYBgn+NK/HakHY1UTKH1K6wSO2SOJbW3fWApGJV4UEA==
X-Received: by 2002:a17:907:6d27:b0:a99:b592:edba with SMTP id a640c23a62f3a-a99b93a7d8amr743812866b.1.1728845746819;
        Sun, 13 Oct 2024 11:55:46 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:46 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 11/12] bridge: br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
Date: Sun, 13 Oct 2024 20:55:07 +0200
Message-ID: <20241013185509.4430-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115548_392945_1EB73DA2 
X-CRM114-Status: GOOD (  17.67  )
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

In network setup as below:

             fastpath bypass
 .----------------------------------------.
/                                          \
|                        IP - forwarding    |
|                       /                \  v
|                      /                  wan ...
|                     /
|                     |
|                     |
|                   brlan.1
|                     |
|    +-------------------------------+
|    |           vlan 1              |
|    |                               |
|    |     brlan (vlan-filtering)    |
|    |               +---------------+
|    |               |  DSA-SWITCH   |
|    |    vlan 1     |               |
|    |      to       |               |
|    |   untagged    1     vlan 1    |
|    +---------------+---------------+
.         /                   \
 ----->wlan1                 lan0
       .                       .
       .                       ^
       ^                     vlan 1 tagged packets
     untagged packets

Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
path is filled also when ending with the mediatek wlan1, info.indev not
NULL now in nft_dev_forward_path(). This results in a direct transmit
instead of a neighbor transmit. This is how it should be, But this fails.

br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
filling in from brlan.1 towards wlan1. But it should be set to
DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
is not correct. The dsa switchdev adds it as a foreign port.

Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
set when there is a dsa-switch inside the bridge.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_private.h |  1 +
 net/bridge/br_vlan.c    | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 8da7798f9368..7d427214cc7c 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -180,6 +180,7 @@ enum {
 	BR_VLFLAG_MCAST_ENABLED = BIT(2),
 	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
 	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
+	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
 };
 
 /**
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 1830d7d617cd..b7877724b969 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -3,6 +3,7 @@
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/slab.h>
+#include <net/dsa.h>
 #include <net/switchdev.h>
 
 #include "br_private.h"
@@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
 	__vlan_flags_update(v, flags, true);
 }
 
+static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	struct net_bridge_port *p;
+
+	list_for_each_entry(p, &br->port_list, list) {
+		if (dsa_user_dev_check(p->dev))
+			return false;
+	}
+#endif
+	return true;
+}
+
 static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
 			  struct net_bridge_vlan *v, u16 flags,
 			  struct netlink_ext_ack *extack)
@@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
 	if (err == -EOPNOTSUPP)
 		return vlan_vid_add(dev, br->vlan_proto, v->vid);
 	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
+	if (br_vlan_tagging_by_switchdev(br))
+		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
 	return err;
 }
 
@@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 
 	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
+	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
 	else
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-- 
2.45.2


