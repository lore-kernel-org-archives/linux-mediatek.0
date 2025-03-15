Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C216C28B30
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Mar 2025 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkA4UZVIpwTz+MfKCQjyLNbONPOyz+LdYLZQ/1FoX0k=; b=CauULe9ouYY1IsqWa9gry1ay8R
	cICZ4erCBF0oWj11zPVIS8AUEAWTLNOk2QssC9+nWt1y5YuG1mkaQm1o2saU+Ym1/ceExvk4stHnC
	hSXHTmiKib1JPVYouD6TsSU+9Qlde2LjZhgzAXvapiSmsi3NSEDfm13paegsPNUQbFIW5uCzTU0Vp
	XimqTmC7K6zY+v+GrtCqRavc4MjNAMrFiKc+D+YzmDCk94tvz+k1tUAl0VHfSttyYHFP3vvi/Mjbk
	sz37y3FGpWIvtcXhmQujXchhMP97nZhz8BsZ2UR9fXDl/T5hrN7qDStUOhLoMQENUvCmzeaZ3bN6i
	xy61mg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhz-0000000GmhL-0f96;
	Sat, 15 Mar 2025 20:02:11 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhw-0000000GmfE-45vK
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Mar 2025 20:02:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac34257295dso68703466b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Mar 2025 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742068927; x=1742673727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkA4UZVIpwTz+MfKCQjyLNbONPOyz+LdYLZQ/1FoX0k=;
        b=MGHMoivLcyTa3nfqzgGWWh1RPqiuBe6FvgswtJZL63SNQ3HJyjpajpGCgrdfW5zMDy
         Uo+upEdVn4FOC2ai3T70AWVwF9x5J1AQzlzIphcywESaZVDvwzBaJE+BGAZuEFgzTx94
         ynFNb9Ko8oOWcJGdBSd8dN1T/hSTuUyRXhK0zM3AxNKYIY+IMd6fRLeFkxmkLjuYTef/
         ms+VcKRVR1uuWMZDkUXaOZOHgJOtkmJ2S32SKI0qgHi2xbYSqdy/TmGxQ4JDPBLw7Eos
         cozankZW89SOk7ev/6xbiKIKVpiNHkrNafPDyQxOBDVZVkvgqP0iuN4XMBA3xWIweLMB
         Y33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742068927; x=1742673727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkA4UZVIpwTz+MfKCQjyLNbONPOyz+LdYLZQ/1FoX0k=;
        b=Q0BsN0Xxk07AZ9PMC+H4xxjfhWuLHWN3Td7JhMbCTafyTuHgqP+FpiV2d03C42RADW
         zPJwpCvQtR9FnDTrytCkFcVsbHpaZ7OticH4rKrs3be6/9fo+9KVHRkqQJA23SvJ796C
         TuAGDP0EPufItVc2QrghYZVLsCxYREJmjlMbbW0du3YMb/M/f9TmG1dlWBPb0RdceAd/
         x7dhDsikQn4izfJUxURoOgiBVuqpWikvlV3ZcNO1IYYm1NS729ST9tDxwEC8+BOKbyJH
         6ZEtTyinO6YE7dbW6o14YDkipjZQMjKy2tPgkcOZ55cQNf6zpwJhPC98WxUjM+EATDXR
         TPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeB6YNo1PP8MqXlUd6Z78mDfK/peN2CBfJbfhueMA7buQ8Auzz1mgqUPoGV4GrG7mxwH0YDb3/sCYbiv8Q5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaJLcAfHMGHQz2KmpiMyuneq/z+iEfGOuqJ6odsj9VOt/yGFMw
	AIkoJoyQ4QxpA8Bf55akWZCE8zuVR29qU25IL7trQun97jw98YTN
X-Gm-Gg: ASbGncssHEcJuuBvmtVIc2K3YSTuDhXeOYINWtG3KXQSRZAFLlGvXTsE++UIrzd5ydI
	TWaISH8VeZSJjDKIPxoWY17kcz6F09rNRre7+gy3z97Q99cfglnQS9IMamykccVsjasLuSrQWAz
	fxVlNWiiHXaFXWHOPmwJJEE9HfTJi4f88QHQdotfrfwYTDvN8p7IU4gE+2CE9g6d2e2heyGyB0X
	/plHGBC/tKffNOEuTVCcLLq4knj6LlPas4J2epWTogWJ7WLqxvS9LIZIdZIpXgOh8YUjHQ+A+Kb
	+8arZaE4s8/uoq3OGeSGFlSyE647UOKZZNEJnsddNMVa7bCGVVpqlzNMsTNgb0NyNSPZoleOjpD
	EDYm8LstPEEE7FgQlDYIcbnGJwR7W2ErO6zS++nHtzHU36duvRI5N97r5//IE7mw=
X-Google-Smtp-Source: AGHT+IGZrLPyzUFrsmUJ6bjiHKaOKcN6z3XUtUDmp1EbfQa4TkA4lIxe1N3KZXeS7nHJqoz8wrbu6w==
X-Received: by 2002:a17:906:4795:b0:ac1:fa6f:4941 with SMTP id a640c23a62f3a-ac330253720mr766195566b.13.1742068927072;
        Sat, 15 Mar 2025 13:02:07 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489c9sm411456766b.152.2025.03.15.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 13:02:06 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v10 nf-next 3/3] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
Date: Sat, 15 Mar 2025 21:01:47 +0100
Message-ID: <20250315200147.18016-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250315200147.18016-1-ericwouds@gmail.com>
References: <20250315200147.18016-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_130209_036087_A01B0948 
X-CRM114-Status: GOOD (  20.70  )
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

br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
filling in from brlan.1 towards wlan1. But it should be set to
DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
is not correct. The dsa switchdev adds it as a foreign port.

The same problem for all foreignly added dsa vlans on the bridge.

First add the vlan, trying only native devices.
If this fails, we know this may be a vlan from a foreign device.

Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
is set only when there if no foreign device involved.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/switchdev.h   |  1 +
 net/bridge/br_private.h   | 10 ++++++++++
 net/bridge/br_switchdev.c | 15 +++++++++++++++
 net/bridge/br_vlan.c      |  7 ++++++-
 net/switchdev/switchdev.c |  2 +-
 5 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/include/net/switchdev.h b/include/net/switchdev.h
index 8346b0d29542..ee500706496b 100644
--- a/include/net/switchdev.h
+++ b/include/net/switchdev.h
@@ -15,6 +15,7 @@
 #define SWITCHDEV_F_NO_RECURSE		BIT(0)
 #define SWITCHDEV_F_SKIP_EOPNOTSUPP	BIT(1)
 #define SWITCHDEV_F_DEFER		BIT(2)
+#define SWITCHDEV_F_NO_FOREIGN		BIT(3)
 
 enum switchdev_attr_id {
 	SWITCHDEV_ATTR_ID_UNDEFINED,
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 1054b8a88edc..43f04bd69d73 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -180,6 +180,7 @@ enum {
 	BR_VLFLAG_MCAST_ENABLED = BIT(2),
 	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
 	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
+	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
 };
 
 /**
@@ -2182,6 +2183,8 @@ void br_switchdev_mdb_notify(struct net_device *dev,
 			     int type);
 int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid, u16 flags,
 			       bool changed, struct netlink_ext_ack *extack);
+int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid, u16 flags,
+					  bool changed, struct netlink_ext_ack *extack);
 int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid);
 void br_switchdev_init(struct net_bridge *br);
 
@@ -2265,6 +2268,13 @@ static inline int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid,
 	return -EOPNOTSUPP;
 }
 
+static inline int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid,
+							u16 flags, bool changed,
+							struct netlink_ext_ack *extack)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid)
 {
 	return -EOPNOTSUPP;
diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
index 7b41ee8740cb..efa7a055b8f9 100644
--- a/net/bridge/br_switchdev.c
+++ b/net/bridge/br_switchdev.c
@@ -187,6 +187,21 @@ int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid, u16 flags,
 	return switchdev_port_obj_add(dev, &v.obj, extack);
 }
 
+int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid, u16 flags,
+					  bool changed, struct netlink_ext_ack *extack)
+{
+	struct switchdev_obj_port_vlan v = {
+		.obj.orig_dev = dev,
+		.obj.id = SWITCHDEV_OBJ_ID_PORT_VLAN,
+		.obj.flags = SWITCHDEV_F_NO_FOREIGN,
+		.flags = flags,
+		.vid = vid,
+		.changed = changed,
+	};
+
+	return switchdev_port_obj_add(dev, &v.obj, extack);
+}
+
 int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid)
 {
 	struct switchdev_obj_port_vlan v = {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index d9a69ec9affe..6bfc7da10865 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -109,6 +109,11 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
 	/* Try switchdev op first. In case it is not supported, fallback to
 	 * 8021q add.
 	 */
+	err = br_switchdev_port_vlan_no_foreign_add(dev, v->vid, flags, false, extack);
+	if (err != -EOPNOTSUPP) {
+		v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV | BR_VLFLAG_TAGGING_BY_SWITCHDEV;
+		return err;
+	}
 	err = br_switchdev_port_vlan_add(dev, v->vid, flags, false, extack);
 	if (err == -EOPNOTSUPP)
 		return vlan_vid_add(dev, br->vlan_proto, v->vid);
@@ -1487,7 +1492,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 
 	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
+	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
 	else
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
diff --git a/net/switchdev/switchdev.c b/net/switchdev/switchdev.c
index 6488ead9e464..c48f66643e99 100644
--- a/net/switchdev/switchdev.c
+++ b/net/switchdev/switchdev.c
@@ -749,7 +749,7 @@ static int __switchdev_handle_port_obj_add(struct net_device *dev,
 	/* Event is neither on a bridge nor a LAG. Check whether it is on an
 	 * interface that is in a bridge with us.
 	 */
-	if (!foreign_dev_check_cb)
+	if (!foreign_dev_check_cb || port_obj_info->obj->flags & SWITCHDEV_F_NO_FOREIGN)
 		return err;
 
 	br = netdev_master_upper_dev_get(dev);
-- 
2.47.1


