Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCBACF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RADunMSsDBQJOkeIT+sKpwp5kwpbWqG3OFvDFge3gsI=; b=1NbrZfcl9//1ZqqAvDPkX5k1XI
	IXoP4UsqjkgHQoW+7JcHJB9Voueao4xa1b0UKPCUpv7fbkrmuwLEbhGyWDaYi77p5JEcPeeZPafjj
	/DhDKhpT/nteWR+cKerQ6F3hyjQdyzEuQzO4H4SEV08Pz+TfxpCxsRAfYMXNZ3BzWktFe0RehF4ev
	E9ywz2WorshpPiAJgRNLMFUP+Pk8A0hqsptdSoyFB7sAtZvihcI10VhisM1wcO65bWzyDkqURoxqu
	o+TE16Fmh9ips4NBSdjBL0ymp/586o7Q8qP5rJmb3erWj3UM9zWsDL3zvRAJyWBTn/bA04C9ebqQC
	FKX2qe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03rP-000000035tf-2RoI;
	Sun, 13 Oct 2024 19:02:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kg-000000034Z0-48Ag;
	Sun, 13 Oct 2024 18:55:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso34925066b.1;
        Sun, 13 Oct 2024 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845737; x=1729450537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RADunMSsDBQJOkeIT+sKpwp5kwpbWqG3OFvDFge3gsI=;
        b=hn2F0GWvS7ysfbht/Bwe/Qt6hQc5Gbl6QWW7yD030vF0wzA+2LmSwZAcKiKBepEfYN
         Z1ktXMKoq0S3vqvHnHzCKWHW2fDgE1QZ56VFr+Fm0ByfmWWKToBTH/GFVyNEteJSts9p
         5m8BjVh/XusWuPTigeJ4R6GsefPZl3OEq7b02xwoxLGZ5ZTlyifdauQa2I8AOMpWDMI4
         0RCyCxNIARrEHtPtLHqJTt1O7h+zrIwSR1dcSHdQfojOMOSpZK0S6k+sqQTfWqHUPHIa
         Apt5PyKQ01s38I/AIs0Sl/Y2ft436xkbkj/Wu10wE4dWOaV4N3l0LWVs3gngv+xfd4h0
         ahrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845737; x=1729450537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RADunMSsDBQJOkeIT+sKpwp5kwpbWqG3OFvDFge3gsI=;
        b=ACuwbolk5OknU9lxxQr2zbthE29N5FjV9oomckYUKZwbEHIO7+0HVoxncsvQ9fVvFZ
         K4jXIWhE4CPZ03BhRFs/LuWF/zqaWhGQeeGzAmPXcOpnDDRWmXTxmW/VXhGZIabOpAGl
         pnxugmw6bciUcjNfIf5eBrzCqMmjxlkHrSTtupfRVu7jU5kRWmxDQbilro/I4o+Y4Coc
         RZCbhj6zYyDvnZ5aqrGCpUYUeRtOlzW04OWsoPt6PuvDejjVnj5KYPmczAHT4PRUuGv/
         /WsxzeuIksc38riq1O+v6GV4Tt8dNfEK1sU/oFKGi+rGNVS6twzACNFro2+8/piJYRWv
         +jBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKGwTH5Oi3zIbjaGRMqvefhDPYlvxp2m7m7D6lNFa8t1/U7NtZvNBW3kgUFxdY1ZUtQ62qrG4ulIHsSbVhlzfb@lists.infradead.org, AJvYcCVCZeznyjSWw2xWkcENQj81roBBb8GkXgK4IUOCwv6kecVd3WDVR+Rw+BmwWc1+3+yhZrO17hT73+jqv7+yHPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsBtD0mf63/z7dzNozUbIPmGj7FXDGIxk3jk5/FqNkwvij2Gnv
	jJucBkkjEtabBYA1gqX2A9+WSxti3poZrBd4QvtXrmsG0ZbxCKUh
X-Google-Smtp-Source: AGHT+IEWUZNp7HCnVh3j+0U2jm4O/rsy5kDbUxyRD+CLZEqkudsSqyQJlj+0O92gLyoS4IpxQ9txiQ==
X-Received: by 2002:a17:906:c14c:b0:a99:4ba9:c965 with SMTP id a640c23a62f3a-a99b9585b7amr898083266b.44.1728845736991;
        Sun, 13 Oct 2024 11:55:36 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:36 -0700 (PDT)
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
Subject: [PATCH RFC v1 net-next 04/12] bridge: br_vlan_fill_forward_path_pvid: Add port to port
Date: Sun, 13 Oct 2024 20:55:00 +0200
Message-ID: <20241013185509.4430-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115539_076091_1C54C144 
X-CRM114-Status: GOOD (  12.66  )
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

Lookup vlan group from bridge port, if it is passed as argument.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_private.h | 1 +
 net/bridge/br_vlan.c    | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index d4bedc87b1d8..8da7798f9368 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1581,6 +1581,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
 			     const struct net_bridge_vlan *range_end);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path);
 int br_vlan_fill_forward_path_mode(struct net_bridge *br,
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 9c2fffb827ab..1830d7d617cd 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1441,6 +1441,7 @@ int br_vlan_get_pvid_rcu(const struct net_device *dev, u16 *p_pvid)
 EXPORT_SYMBOL_GPL(br_vlan_get_pvid_rcu);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path)
 {
@@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
 	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
 		return;
 
-	vg = br_vlan_group(br);
+	if (p)
+		vg = nbp_vlan_group(p);
+	else
+		vg = br_vlan_group(br);
 
 	if (idx >= 0 &&
 	    ctx->vlan[idx].proto == br->vlan_proto) {
-- 
2.45.2


