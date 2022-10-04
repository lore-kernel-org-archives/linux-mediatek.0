Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C84CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns+bxiSVkvqFogPz3qkJ/X1k0dX53COQFywFZXW+P5M=; b=nD4qDoN1OVlIecMeKxLXNrjsp9
	iTVDMwcATtpIFmsaSBC3qwyb+sz7ZqWlFgQXMhP2LCYvKuJZEPfWcLVijw989GEkih6osTlVcDMye
	zZTcZdh5NLOfDxQP/egZCNMsYgH6QtQJzjDrozu0xMhp887E32IDWD3S19M8gfyAHW9sN5rUEbKDg
	R1oCdxKIeiACeoUDvHqa98RNVgEQNpyUGd8UkbQIr+H4ho+F12yRV0BTIIgv5IOR+gSgjwo8mJWa0
	RgRp15G0nC1FwByeZkecAIUZEf1LMJ5lraOTfr2P9MB2LJzaRSjBEzOGEuzZECGXESMll+awgVSKr
	IJtqVRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjja-00A2dl-Pk; Tue, 04 Oct 2022 15:21:26 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjj1-00A2Pj-N9; Tue, 04 Oct 2022 15:20:53 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 474431884B97;
	Tue,  4 Oct 2022 15:20:50 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 3E6D925001FA;
	Tue,  4 Oct 2022 15:20:50 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 282149EC000D; Tue,  4 Oct 2022 15:20:50 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id 48EB39120FED;
	Tue,  4 Oct 2022 15:20:49 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	Hans Schultz <netdev@kapio-technology.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>,
	Petr Machata <petrm@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 iproute2-next 3/4] bridge: link: enable MacAuth/MAB feature
Date: Tue,  4 Oct 2022 17:20:35 +0200
Message-Id: <20221004152036.7848-3-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004152036.7848-1-netdev@kapio-technology.com>
References: <20221004152036.7848-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_082052_060077_648C05AC 
X-CRM114-Status: GOOD (  19.06  )
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

The MAB feature can be enabled on a locked port with the command:
bridge link set dev <DEV> mab on

Examples of output when the feature is enabled:

$ bridge -d link show dev eth1
1: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master testbr state forwarding priority 32 cost 2
    hairpin off guard off root_block off fastleave off learning on flood on mcast_flood on bcast_flood on mcast_router 1 mcast_to_unicast off neigh_suppress off vlan_tunnel off isolated off locked on mab on
$ bridge -d -j -p link show dev eth1
[ {
        "ifindex": 1,
        "ifname": "eth1",
        "flags": [ "BROADCAST","MULTICAST","UP","LOWER_UP" ],
        "mtu": 1500,
        "master": "br0",
        "state": "forwarding",
        "priority": 32,
        "cost": 2,
        "hairpin": false,
        "guard": false,
        "root_block": false,
        "fastleave": false,
        "learning": true,
        "flood": true,
        "mcast_flood": true,
        "bcast_flood": true,
        "mcast_router": 1,
        "mcast_to_unicast": false,
        "neigh_suppress": false,
        "vlan_tunnel": false,
        "isolated": false,
        "locked": true,
        "mab": true
    } ]

Signed-off-by: Hans Schultz <netdev@kapio-technology.com>
---
 bridge/link.c            | 13 +++++++++++++
 ip/iplink_bridge_slave.c |  9 +++++++++
 man/man8/bridge.8        | 12 ++++++++++++
 man/man8/ip-link.8.in    | 14 ++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/bridge/link.c b/bridge/link.c
index 3810fa04..25a45860 100644
--- a/bridge/link.c
+++ b/bridge/link.c
@@ -184,6 +184,9 @@ static void print_protinfo(FILE *fp, struct rtattr *attr)
 		if (prtb[IFLA_BRPORT_LOCKED])
 			print_on_off(PRINT_ANY, "locked", "locked %s ",
 				     rta_getattr_u8(prtb[IFLA_BRPORT_LOCKED]));
+		if (prtb[IFLA_BRPORT_MAB])
+			print_on_off(PRINT_ANY, "mab", "mab %s ",
+				     rta_getattr_u8(prtb[IFLA_BRPORT_MAB]));
 	} else
 		print_stp_state(rta_getattr_u8(attr));
 }
@@ -281,6 +284,7 @@ static void usage(void)
 		"                               [ vlan_tunnel {on | off} ]\n"
 		"                               [ isolated {on | off} ]\n"
 		"                               [ locked {on | off} ]\n"
+		"                               [ mab {on | off} ]\n"
 		"                               [ hwmode {vepa | veb} ]\n"
 		"                               [ backup_port DEVICE ] [ nobackup_port ]\n"
 		"                               [ self ] [ master ]\n"
@@ -312,6 +316,7 @@ static int brlink_modify(int argc, char **argv)
 	__s8 bcast_flood = -1;
 	__s8 mcast_to_unicast = -1;
 	__s8 locked = -1;
+	__s8 macauth = -1;
 	__s8 isolated = -1;
 	__s8 hairpin = -1;
 	__s8 bpdu_guard = -1;
@@ -437,6 +442,11 @@ static int brlink_modify(int argc, char **argv)
 			locked = parse_on_off("locked", *argv, &ret);
 			if (ret)
 				return ret;
+		} else if (strcmp(*argv, "mab") == 0) {
+			NEXT_ARG();
+			macauth = parse_on_off("mab", *argv, &ret);
+			if (ret)
+				return ret;
 		} else if (strcmp(*argv, "backup_port") == 0) {
 			NEXT_ARG();
 			backup_port_idx = ll_name_to_index(*argv);
@@ -520,6 +530,9 @@ static int brlink_modify(int argc, char **argv)
 	if (locked >= 0)
 		addattr8(&req.n, sizeof(req), IFLA_BRPORT_LOCKED, locked);
 
+	if (macauth >= 0)
+		addattr8(&req.n, sizeof(req), IFLA_BRPORT_MAB, macauth);
+
 	if (backup_port_idx != -1)
 		addattr32(&req.n, sizeof(req), IFLA_BRPORT_BACKUP_PORT,
 			  backup_port_idx);
diff --git a/ip/iplink_bridge_slave.c b/ip/iplink_bridge_slave.c
index 98d17213..e5262bdb 100644
--- a/ip/iplink_bridge_slave.c
+++ b/ip/iplink_bridge_slave.c
@@ -44,6 +44,7 @@ static void print_explain(FILE *f)
 		"			[ vlan_tunnel {on | off} ]\n"
 		"			[ isolated {on | off} ]\n"
 		"			[ locked {on | off} ]\n"
+		"                       [ mab {on | off} ]\n"
 		"			[ backup_port DEVICE ] [ nobackup_port ]\n"
 	);
 }
@@ -288,6 +289,10 @@ static void bridge_slave_print_opt(struct link_util *lu, FILE *f,
 		print_on_off(PRINT_ANY, "locked", "locked %s ",
 			     rta_getattr_u8(tb[IFLA_BRPORT_LOCKED]));
 
+	if (tb[IFLA_BRPORT_MAB])
+		print_on_off(PRINT_ANY, "mab", "mab %s ",
+			     rta_getattr_u8(tb[IFLA_BRPORT_MAB]));
+
 	if (tb[IFLA_BRPORT_BACKUP_PORT]) {
 		int backup_p = rta_getattr_u32(tb[IFLA_BRPORT_BACKUP_PORT]);
 
@@ -411,6 +416,10 @@ static int bridge_slave_parse_opt(struct link_util *lu, int argc, char **argv,
 			NEXT_ARG();
 			bridge_slave_parse_on_off("locked", *argv, n,
 						  IFLA_BRPORT_LOCKED);
+		} else if (matches(*argv, "mab") == 0) {
+			NEXT_ARG();
+			bridge_slave_parse_on_off("mab", *argv, n,
+						  IFLA_BRPORT_MAB);
 		} else if (matches(*argv, "backup_port") == 0) {
 			int ifindex;
 
diff --git a/man/man8/bridge.8 b/man/man8/bridge.8
index d4df772e..f4f1d807 100644
--- a/man/man8/bridge.8
+++ b/man/man8/bridge.8
@@ -54,6 +54,7 @@ bridge \- show / manipulate bridge addresses and devices
 .BR vlan_tunnel " { " on " | " off " } ] [ "
 .BR isolated " { " on " | " off " } ] [ "
 .BR locked " { " on " | " off " } ] [ "
+.BR mab " { " on " | " off " } ] [ "
 .B backup_port
 .IR  DEVICE " ] ["
 .BR nobackup_port " ] [ "
@@ -580,6 +581,17 @@ The common use is that hosts are allowed access through authentication
 with the IEEE 802.1X protocol or based on whitelists or like setups.
 By default this flag is off.
 
+.TP
+.BR "mab on " or " mab off "
+Enables or disables the MAB/MacAuth feature. This feature can only be
+enabled on a port that is in locked mode, and when enabled it extends the
+locked port feature so that a host can get access through a locked
+port based on acceptlists, thus it is a much simpler procedure for a
+device to become authorized than f.ex. the 802.1X protocol, and is used
+for devices that are not capable of password or crypto based authorization
+methods.
+The feature triggers a 'locked' FDB entry when a host tries to communicate
+through the MAB enabled port.
 
 .TP
 .BI backup_port " DEVICE"
diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index fc9d62fc..5f31f80a 100644
--- a/man/man8/ip-link.8.in
+++ b/man/man8/ip-link.8.in
@@ -2454,6 +2454,9 @@ the following additional arguments are supported:
 .BR isolated " { " on " | " off " }"
 ] [
 .BR locked " { " on " | " off " }"
+] [
+.BR mab " { " on " | " off " }"
+] [
 .BR backup_port " DEVICE"
 ] [
 .BR nobackup_port " ]"
@@ -2560,6 +2563,17 @@ default this flag is off.
 behind the port cannot communicate through the port unless a FDB entry
 representing the host is in the FDB. By default this flag is off.
 
+.BR mab " { " on " | " off " }"
+- Enables or disables the MAB/MacAuth feature. This feature can only be
+enabled on a port that is in locked mode, and when enabled it extends the
+locked port feature so that a host can get access through a locked
+port based on acceptlists, thus it is a much simpler procedure for a
+device to become authorized than f.ex. the 802.1X protocol, and is used
+for devices that are not capable of password or crypto based authorization
+methods.
+The feature triggers a 'locked' FDB entry when a host tries to communicate
+through the MAB enabled port.
+
 .BI backup_port " DEVICE"
 - if the port loses carrier all traffic will be redirected to the
 configured backup port
-- 
2.34.1


