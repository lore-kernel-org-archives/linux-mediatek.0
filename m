Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVezsC6ZmeLiUL5Pzy7zCQZR72/k7mmP1SOZlNAVJ+4=; b=O+gQmO9ZEoRs1Po+Xqbg1y6uSX
	lL2U9RxPX7y+Tf5f2a8cvKUKLU2aHiUywRpb9PoJQkek/qwZFTtNlTmElN5a2m98qUPOU+aNQBL00
	C74tFbWsZim8/WHlXdWz9Qqo6gX4LFQ+zIeSvO5x5l1DoxKb7AS7zSm7/OBfK2lQlPtG//YFXO1Ql
	GxjlJobrhPnZsrVsgBJNruQhaIFBuxuJAypfCeDcJhXlDi5RQgPZjqLEOunyPuv7kPR8k0VU034Rz
	dIxDe51KDKDzzCVi2S+Bk0vMTCOsPcUsckillooJXBpxybulDhoS2nUIeuUT+D9ivVZak8ccbS/MV
	5/fFxSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvPV-003qpd-Pq; Thu, 29 Sep 2022 15:25:13 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvPH-003qi5-E4; Thu, 29 Sep 2022 15:25:01 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id CF1A418847F4;
	Thu, 29 Sep 2022 15:24:52 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id C88282500370;
	Thu, 29 Sep 2022 15:24:52 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id B9CA99EC0007; Thu, 29 Sep 2022 15:24:52 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id E30C09120FED;
	Thu, 29 Sep 2022 15:24:51 +0000 (UTC)
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
Subject: [PATCH iproute2-next 2/2] bridge: fdb: enable FDB blackhole feature
Date: Thu, 29 Sep 2022 17:21:37 +0200
Message-Id: <20220929152137.167626-2-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929152137.167626-1-netdev@kapio-technology.com>
References: <20220929152137.167626-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_082459_648372_D178CD5D 
X-CRM114-Status: GOOD (  17.45  )
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

The blackhole FDB entries can be added, deleted and replaced with
ordinary FDB entries.

Signed-off-by: Hans Schultz <netdev@kapio-technology.com>
---
 bridge/fdb.c                   | 7 ++++++-
 include/uapi/linux/neighbour.h | 4 ++++
 man/man8/bridge.8              | 6 ++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/bridge/fdb.c b/bridge/fdb.c
index 0fbe9bd3..2160f1c2 100644
--- a/bridge/fdb.c
+++ b/bridge/fdb.c
@@ -38,7 +38,7 @@ static void usage(void)
 	fprintf(stderr,
 		"Usage: bridge fdb { add | append | del | replace } ADDR dev DEV\n"
 		"              [ self ] [ master ] [ use ] [ router ] [ extern_learn ]\n"
-		"              [ sticky ] [ local | static | dynamic ] [ vlan VID ]\n"
+		"              [ sticky ] [ local | static | dynamic ] [blackhole] [ vlan VID ]\n"
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
 
@@ -493,6 +496,8 @@ static int fdb_modify(int cmd, int flags, int argc, char **argv)
 			req.ndm.ndm_flags |= NTF_EXT_LEARNED;
 		} else if (matches(*argv, "sticky") == 0) {
 			req.ndm.ndm_flags |= NTF_STICKY;
+		} else if (matches(*argv, "blackhole") == 0) {
+			ext_flags |= NTF_EXT_BLACKHOLE;
 		} else {
 			if (strcmp(*argv, "to") == 0)
 				NEXT_ARG();
diff --git a/include/uapi/linux/neighbour.h b/include/uapi/linux/neighbour.h
index 4dda051b..cc7d540e 100644
--- a/include/uapi/linux/neighbour.h
+++ b/include/uapi/linux/neighbour.h
@@ -54,6 +54,7 @@ enum {
 /* Extended flags under NDA_FLAGS_EXT: */
 #define NTF_EXT_MANAGED		(1 << 0)
 #define NTF_EXT_LOCKED		(1 << 1)
+#define NTF_EXT_BLACKHOLE	(1 << 2)
 
 /*
  *	Neighbor Cache Entry States.
@@ -91,6 +92,9 @@ enum {
  * NTF_EXT_LOCKED flagged FDB entries are placeholder entries used with the
  * locked port feature, that ensures that an entry exists while at the same
  * time dropping packets on ingress with src MAC and VID matching the entry.
+ *
+ * NTF_EXT_BLACKHOLE flagged FDB entries ensure that no forwarding is allowed
+ * from any port to the destination MAC, VID pair associated with it.
  */
 
 struct nda_cacheinfo {
diff --git a/man/man8/bridge.8 b/man/man8/bridge.8
index 40250477..af2e7db2 100644
--- a/man/man8/bridge.8
+++ b/man/man8/bridge.8
@@ -699,6 +699,12 @@ controller learnt dynamic entry. Kernel will not age such an entry.
 - this entry will not change its port due to learning.
 .sp
 
+.B blackhole
+- this is an entry that denies all forwarding from any port to a destination
+matching the entry. It can be added by userspace, but the flag is mostly set
+from a hardware driver.
+.sp
+
 .in -8
 The next command line parameters apply only
 when the specified device
-- 
2.34.1


