Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1012C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn7MTuccQB8AO3nxo6ArCG9xE/ImFLp3unk+n10M6yo=; b=PNJaOpkmlMcXJCnGtm8Oz0vAFU
	eaSSerITtZ7UwZs1NUzUCSXWW4QmLeGlOElQBZqpbp+F93km+TlEO7CMjIBzJ1xgzawEnu8gxx9u8
	EbJzOk7Hg03K/5RuMeL44aCDfxR2h2q/rYLiC1PEwgipLfNC34MJrhBXIhPyegYgMFhcI7JCREcvR
	lOYH4FTxwepLw6q7EH/Nmc8Jrjh5aSpNKMAvoem2YCWQ34cqwFE5RzHieZE3wT4xy4QjavpnWY7wa
	a2vbxhTMnwXDrae0b9YHe3Fd7vnziu1HbkTM6DAWhWLuLXLDAUXO+KsquBtBWdApYHNhvcQlnLiG7
	5ZZrykxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdXLK-004rHG-22;
	Sat, 18 Mar 2023 14:15:34 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdXKi-004r0X-1N;
	Sat, 18 Mar 2023 14:14:59 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id E41D018839C7;
	Sat, 18 Mar 2023 14:12:46 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id DB0C325002BC;
	Sat, 18 Mar 2023 14:12:46 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id D13B49B403E2; Sat, 18 Mar 2023 14:12:46 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id 1B3E49B403E1;
	Sat, 18 Mar 2023 14:12:46 +0000 (UTC)
From: "Hans J. Schultz" <netdev@kapio-technology.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	"Hans J. Schultz" <netdev@kapio-technology.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER),
	bridge@lists.linux-foundation.org (moderated list:ETHERNET BRIDGE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB test
Date: Sat, 18 Mar 2023 15:10:10 +0100
Message-Id: <20230318141010.513424-7-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230318141010.513424-1-netdev@kapio-technology.com>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_071456_638906_EA83A99B 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Test FDB ageing of user entry created by

bridge fdb replace ADDR dev <DEV> master dynamic

Use LOW_AGEING_TIME variable in forwarding.config to set a low ageing time.
Beware, DSA might not accept the ageing time you want. Check the
age_time_coeff value for your driver.

Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
---
 .../net/forwarding/bridge_locked_port.sh      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/bridge_locked_port.sh b/tools/testing/selftests/net/forwarding/bridge_locked_port.sh
index dc92d32464f6..dbc7017fd45d 100755
--- a/tools/testing/selftests/net/forwarding/bridge_locked_port.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_locked_port.sh
@@ -14,6 +14,7 @@ ALL_TESTS="
 NUM_NETIFS=4
 CHECK_TC="no"
 source lib.sh
+source tc_common.sh
 
 h1_create()
 {
@@ -319,6 +320,41 @@ locked_port_mab_flush()
 	log_test "Locked port MAB FDB flush"
 }
 
+# Test of dynamic FDB entries.
+locked_port_dyn_fdb()
+{
+	local mac=00:01:02:03:04:05
+	local ageing_time
+
+	RET=0
+	ageing_time=$(bridge_ageing_time_get br0)
+	tc qdisc add dev $swp2 clsact
+	ip link set dev br0 type bridge ageing_time $LOW_AGEING_TIME
+	bridge link set dev $swp1 learning on locked on
+
+	bridge fdb replace $mac dev $swp1 master dynamic
+	tc filter add dev $swp2 egress protocol ip pref 1 handle 1 flower \
+		dst_ip 192.0.2.2 ip_proto udp dst_port 12345 action pass
+
+	$MZ $swp1 -c 1 -p 128 -t udp "sp=54321,dp=12345" \
+		-a $mac -b `mac_get $h2` -A 192.0.2.1 -B 192.0.2.2 -q
+	tc_check_packets "dev $swp2 egress" 1 1
+	check_err $? "Packet not seen on egress after adding dynamic FDB"
+
+	sleep $((LOW_AGEING_TIME / 100 + 10))
+
+	$MZ $swp1 -c 1 -p 128 -t udp "sp=54321,dp=12345" \
+		-a $mac -b `mac_get $h2` -A 192.0.2.1 -B 192.0.2.2 -q
+	tc_check_packets "dev $swp2 egress" 1 1
+	check_fail $? "Dynamic FDB entry did not age out"
+
+	ip link set dev br0 type bridge ageing_time $ageing_time
+	bridge link set dev $swp1 learning off locked off
+	tc qdisc del dev $swp2 clsact
+
+	log_test "Locked port dyn FDB"
+}
+
 trap cleanup EXIT
 
 setup_prepare
-- 
2.34.1


