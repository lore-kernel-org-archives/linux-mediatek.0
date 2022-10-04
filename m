Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81B9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDDYNPmPIO8lF82QnYDHqknyAJoGYuOkiVjkdrkRog0=; b=iccHI1CIL+eO0DyY1Hpp0yZMgz
	wf+dt+zCwPZqm9z8CGYAdmP0yGuMDPtMFdB2QVePv7WkPdyw83g0jRtSgBRHvYOkWuYuEsS8SN7j7
	Nk7g3b/kNCpVQxp9UNgjXfBZuIcU2RmmzuBF+hJ3E/pETUstfGuC/QREdXVdgUvKk4CixEQhUP79F
	R+fMTsa9nA6V4hPw81PJWFRQYwJ/GEWanONoj8C1JUAZ5Qaks570VW8nYtWwGCido71LgVVdSahnx
	ElDZArcKzzvCd0ZPt4f66mQ6JHGsx1AviVr7HPQcq2FKjq8s2XkPhdTpJgvvG4q8BT7IbJrxIguel
	eM8sEZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjjq-00A2ln-F3; Tue, 04 Oct 2022 15:21:42 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofjj4-00A2R3-Ag; Tue, 04 Oct 2022 15:20:56 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id C91BD1884BAC;
	Tue,  4 Oct 2022 15:20:52 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id AC91125001FA;
	Tue,  4 Oct 2022 15:20:52 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 8B1649EC000E; Tue,  4 Oct 2022 15:20:52 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id B5CFB9EC000A;
	Tue,  4 Oct 2022 15:20:51 +0000 (UTC)
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
Subject: [PATCH v2 iproute2-next 4/4] bridge: fdb: enable FDB blackhole feature
Date: Tue,  4 Oct 2022 17:20:36 +0200
Message-Id: <20221004152036.7848-4-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004152036.7848-1-netdev@kapio-technology.com>
References: <20221004152036.7848-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_082054_679203_1A122DB8 
X-CRM114-Status: GOOD (  16.01  )
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

Block traffic to a specific host with the command:
bridge fdb add <MAC> vlan <vid> dev br0 blackhole

Blackhole FDB entries can be added, deleted and replaced with
ordinary FDB entries.

Example with output:

$ bridge fdb add 10:10:10:10:10:10 dev br0 blackhole
$ bridge -d fdb show dev br0
10:10:10:10:10:10 vlan 1 blackhole master br0 permanent
10:10:10:10:10:10 blackhole master br0 permanent
$ bridge -d -j -p fdb show dev br0
[ {
        "mac": "10:10:10:10:10:10",
        "vlan": 1,
        "flags": [ "blackhole" ],
        "master": "br0",
        "state": "permanent"
    },{
        "mac": "10:10:10:10:10:10",
        "flags": [ "blackhole" ],
        "master": "br0",
        "state": "permanent"
    } ]

Signed-off-by: Hans Schultz <netdev@kapio-technology.com>
---
 bridge/fdb.c      | 13 ++++++++++++-
 man/man8/bridge.8 | 12 ++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/bridge/fdb.c b/bridge/fdb.c
index f1f0a5bb..1c8c50a8 100644
--- a/bridge/fdb.c
+++ b/bridge/fdb.c
@@ -38,7 +38,7 @@ static void usage(void)
 	fprintf(stderr,
 		"Usage: bridge fdb { add | append | del | replace } ADDR dev DEV\n"
 		"              [ self ] [ master ] [ use ] [ router ] [ extern_learn ]\n"
-		"              [ sticky ] [ local | static | dynamic ] [ vlan VID ]\n"
+		"              [ sticky ] [ local | static | dynamic ] [ blackhole ] [ vlan VID ]\n"
 		"              { [ dst IPADDR ] [ port PORT] [ vni VNI ] | [ nhid NHID ] }\n"
 		"	       [ via DEV ] [ src_vni VNI ]\n"
 		"       bridge fdb [ show [ br BRDEV ] [ brport DEV ] [ vlan VID ]\n"
@@ -116,6 +116,9 @@ static void fdb_print_flags(FILE *fp, unsigned int flags, __u8 ext_flags)
 	if (flags & NTF_STICKY)
 		print_string(PRINT_ANY, NULL, "%s ", "sticky");
 
+	if (ext_flags & NTF_EXT_BLACKHOLE)
+		print_string(PRINT_ANY, NULL, "%s ", "blackhole");
+
 	if (ext_flags & NTF_EXT_LOCKED)
 		print_string(PRINT_ANY, NULL, "%s ", "locked");
 
@@ -421,6 +424,7 @@ static int fdb_modify(int cmd, int flags, int argc, char **argv)
 	char *endptr;
 	short vid = -1;
 	__u32 nhid = 0;
+	__u32 ext_flags = 0;
 
 	while (argc > 0) {
 		if (strcmp(*argv, "dev") == 0) {
@@ -492,6 +496,8 @@ static int fdb_modify(int cmd, int flags, int argc, char **argv)
 			req.ndm.ndm_flags |= NTF_EXT_LEARNED;
 		} else if (matches(*argv, "sticky") == 0) {
 			req.ndm.ndm_flags |= NTF_STICKY;
+		} else if (matches(*argv, "blackhole") == 0) {
+			ext_flags |= NTF_EXT_BLACKHOLE;
 		} else {
 			if (strcmp(*argv, "to") == 0)
 				NEXT_ARG();
@@ -534,6 +540,11 @@ static int fdb_modify(int cmd, int flags, int argc, char **argv)
 	if (dst_ok)
 		addattr_l(&req.n, sizeof(req), NDA_DST, &dst.data, dst.bytelen);
 
+	if (ext_flags &&
+	    addattr_l(&req.n, sizeof(req), NDA_FLAGS_EXT, &ext_flags,
+		      sizeof(ext_flags)) < 0)
+		return -1;
+
 	if (vid >= 0)
 		addattr16(&req.n, sizeof(req), NDA_VLAN, vid);
 	if (nhid > 0)
diff --git a/man/man8/bridge.8 b/man/man8/bridge.8
index f4f1d807..0119a2a9 100644
--- a/man/man8/bridge.8
+++ b/man/man8/bridge.8
@@ -85,6 +85,13 @@ bridge \- show / manipulate bridge addresses and devices
 .B nhid
 .IR NHID " } "
 
+.ti -8
+.BR "bridge fdb" " { " add " | " del " } "
+.I LLADR
+.B dev
+.IR BRDEV " [ "
+.BR self " ] [ " local " ] [ " blackhole " ] "
+
 .ti -8
 .BR "bridge fdb" " [ [ " show " ] [ "
 .B br
@@ -701,6 +708,11 @@ controller learnt dynamic entry. Kernel will not age such an entry.
 - this entry will not change its port due to learning.
 .sp
 
+.B blackhole
+- this entry will silently discard all matching packets. The entry must
+be added as a local permanent entry.
+.sp
+
 .in -8
 The next command line parameters apply only
 when the specified device
-- 
2.34.1


