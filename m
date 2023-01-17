Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F54C67871
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HfdIqG8/Q0woghbu01MzM1vhtjvhCMDSUJ5G+aREKWg=; b=DrhNrBp9bH25c7ykI1ivIE8ETT
	iMtKO511viI/PiauwY8gDPjBA8H7OmjHMbzvgKW5/rd6gYABd6YdJ5jl+xspJyy0bFE0DA9oMKNmf
	tRmrILhkmw+Lhye8ttMcjIlenAeabus0AOQD4FzxqM+0HyVoglVQ7veP+slG9u/o1Fx9Y4HWRSiSb
	MVDtLZ6eEf+/DU6BAPdoBfVa5XD1jQr5ojKxHgxe9+qAV3L3l9hU0mo5SHD85E3rHSb95N+uiILCk
	jwOBKHwGxcdHZjGTU6uXQ0XfRjwzp7Bx8qo3551aDJJw66cizB5iZF0hZkZnm/PbQ/YUt14QGzR1N
	rbvOQYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrDc-00FWy8-5d; Tue, 17 Jan 2023 19:02:00 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrD2-00FWPm-U0
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 19:01:28 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 6717018835E1;
	Tue, 17 Jan 2023 18:59:12 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 55926250007B;
	Tue, 17 Jan 2023 18:59:12 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 4C2739EC000B; Tue, 17 Jan 2023 18:59:12 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id A051B91201DF;
	Tue, 17 Jan 2023 18:59:11 +0000 (UTC)
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
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER),
	bridge@lists.linux-foundation.org (moderated list:ETHERNET BRIDGE)
Subject: [RFC PATCH net-next 0/5] ATU and FDB synchronization on locked ports
Date: Tue, 17 Jan 2023 19:57:09 +0100
Message-Id: <20230117185714.3058453-1-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_110125_355063_CACC8A11 
X-CRM114-Status: GOOD (  16.37  )
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

This patch set makes it possible to have synchronized dynamic ATU and FDB
entries on locked ports. As locked ports are not able to automatically
learn, they depend on userspace added entries, where userspace can add
static or dynamic entries. The lifetime of static entries are completely
dependent on userspace intervention, and thus not of interest here. We
are only concerned with dynamic entries, which can be added with a
command like:

bridge fdb replace ADDR dev <DEV> master dynamic

We choose only to support this feature on locked ports, as it involves
utilizing the CPU to handle ATU related switchcore events (typically
interrupts) and thus can result in significant performance loss if
exposed to heavy traffic.

On locked ports it is important for userspace to know when an authorized
station has become silent, hence not breaking the communication of a
station that has been authorized based on the MAC-Authentication Bypass
(MAB) scheme. Thus if the station keeps being active after authorization,
it will continue to have an open port as long as it is active. Only after
a silent period will it have to be reauthorized. As the ageing process in
the ATU is dependent on incoming traffic to the switchcore port, it is
necessary for the ATU to signal that an entry has aged out, so that the
FDB can be updated at the correct time.

This patch set includes a solution for the Marvell mv88e6xxx driver, where
for this driver we use the Hold-At-One feature so that an age-out
violation interrupt occurs when a station has been silent for the
system-set age time. The age out violation interrupt allows the switchcore
driver to remove both the ATU and the FDB entry at the same time.

It is up to the maintainers of other switchcore drivers to implement the
feature for their specific driver.

Hans J. Schultz (5):
  net: bridge: add dynamic flag to switchdev notifier
  net: dsa: propagate flags down towards drivers
  drivers: net: dsa: add fdb entry flags incoming to switchcore drivers
  net: bridge: ensure FDB offloaded flag is handled as needed
  net: dsa: mv88e6xxx: implementation of dynamic ATU entries

 drivers/net/dsa/b53/b53_common.c        | 12 ++++-
 drivers/net/dsa/b53/b53_priv.h          |  4 +-
 drivers/net/dsa/hirschmann/hellcreek.c  | 12 ++++-
 drivers/net/dsa/lan9303-core.c          | 12 ++++-
 drivers/net/dsa/lantiq_gswip.c          | 12 ++++-
 drivers/net/dsa/microchip/ksz9477.c     |  8 ++--
 drivers/net/dsa/microchip/ksz9477.h     |  8 ++--
 drivers/net/dsa/microchip/ksz_common.c  | 14 ++++--
 drivers/net/dsa/mt7530.c                | 12 ++++-
 drivers/net/dsa/mv88e6xxx/chip.c        | 24 ++++++++--
 drivers/net/dsa/mv88e6xxx/global1_atu.c | 21 +++++++++
 drivers/net/dsa/mv88e6xxx/port.c        |  6 ++-
 drivers/net/dsa/mv88e6xxx/switchdev.c   | 61 +++++++++++++++++++++++++
 drivers/net/dsa/mv88e6xxx/switchdev.h   |  5 ++
 drivers/net/dsa/mv88e6xxx/trace.h       |  5 ++
 drivers/net/dsa/ocelot/felix.c          | 12 ++++-
 drivers/net/dsa/qca/qca8k-common.c      | 12 ++++-
 drivers/net/dsa/qca/qca8k.h             |  4 +-
 drivers/net/dsa/rzn1_a5psw.c            | 12 ++++-
 drivers/net/dsa/sja1105/sja1105_main.c  | 19 ++++++--
 include/net/dsa.h                       |  6 ++-
 include/net/switchdev.h                 |  1 +
 net/bridge/br_fdb.c                     |  5 +-
 net/bridge/br_switchdev.c               |  1 +
 net/dsa/port.c                          | 28 +++++++-----
 net/dsa/port.h                          |  8 ++--
 net/dsa/slave.c                         | 17 +++++--
 net/dsa/switch.c                        | 30 ++++++++----
 net/dsa/switch.h                        |  1 +
 29 files changed, 298 insertions(+), 74 deletions(-)

-- 
2.34.1


