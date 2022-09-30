Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C917C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIWuS6ZX2OTJKZwiTl1kmXzJEit649z+HlAAwELuJAE=; b=miPFul+KXajI+GfroZ6xoaZvLS
	cF8mCq7eYB2QS/AsxRjCbLB75Wjfg1k9gH5A/G4hhMLt6s7sgiZDrKDJy/Qc5+9eqJL3kMOHDP2Fw
	z00In/LXez3CGWPi38WOBSRWBlpfh4iBT47tuuW5n06RJdjSHh3iBKF70SJAhQFhtE2DYKrY144Pf
	T0RGmYwXRmYZ+Vp7TzAzfktSfFPbE0UHDxGoCjim2MCRtYIm1KKvEc1Dc08T8S4AR2F+0eEyh3MGa
	EBh3padOCVv21I98eD7szkMF1HxTTcdNOyk/8DUU6g2dcpVEzuxHMLRpBzk8UML5Pc0yIU1jH2oIh
	2csF5WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe8nW-007MOU-D6; Fri, 30 Sep 2022 05:42:54 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe8nL-007MJj-8E; Fri, 30 Sep 2022 05:42:44 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id D4E701884C74;
	Fri, 30 Sep 2022 05:42:37 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id CC22E2500370;
	Fri, 30 Sep 2022 05:42:37 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id BB3929EC0010; Fri, 30 Sep 2022 05:42:37 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 30 Sep 2022 07:42:37 +0200
From: netdev@kapio-technology.com
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
In-Reply-To: <20220929112744.27cc969b@kernel.org>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
 <20220929091036.3812327f@kernel.org>
 <12587604af1ed79be4d3a1607987483a@kapio-technology.com>
 <20220929112744.27cc969b@kernel.org>
User-Agent: Gigahost Webmail
Message-ID: <ab488e3d1b9d456ae96cfd84b724d939@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_224243_469280_71CC9304 
X-CRM114-Status: GOOD (  16.99  )
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

On 2022-09-29 20:27, Jakub Kicinski wrote:
> On Thu, 29 Sep 2022 18:37:09 +0200 netdev@kapio-technology.com wrote:
>> On 2022-09-29 18:10, Jakub Kicinski wrote:
>> > On Wed, 28 Sep 2022 17:02:47 +0200 Hans Schultz wrote:
>> >> From: "Hans J. Schultz" <netdev@kapio-technology.com>
>> >>
>> >> This patch set extends the locked port feature for devices
>> >> that are behind a locked port, but do not have the ability to
>> >> authorize themselves as a supplicant using IEEE 802.1X.
>> >> Such devices can be printers, meters or anything related to
>> >> fixed installations. Instead of 802.1X authorization, devices
>> >> can get access based on their MAC addresses being whitelisted.
>> >
>> > Try a allmodconfig build on latest net-next, seems broken.

Obviously my method of selecting all switchcore drivers with sub-options 
under menuconfig was not sufficient, and I didn't know of the 
allmodconfig option, otherwise I would have used it.

So the question is if I should repost the fixed patch-set or I need to 
make a new version?

Anyhow I hope that there will not be problems when running the 
selftests, as I have not been able to do so with my system, so there can 
be more that needs to be changed.

If anyone needs it, here is the compile fix patch:

diff --git a/drivers/net/dsa/qca/qca8k-common.c 
b/drivers/net/dsa/qca/qca8k-common.c
index 0c5f49de6729..e26a9a483955 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -809,7 +809,7 @@ int qca8k_port_fdb_add(struct dsa_switch *ds, int 
port,

  int qca8k_port_fdb_del(struct dsa_switch *ds, int port,
  		       const unsigned char *addr, u16 vid,
-		       struct dsa_db db)
+		       u16 fdb_flags, struct dsa_db db)
  {
  	struct qca8k_priv *priv = (struct qca8k_priv *)ds->priv;
  	u16 port_mask = BIT(port);
diff --git a/drivers/net/dsa/sja1105/sja1105_main.c 
b/drivers/net/dsa/sja1105/sja1105_main.c
index 1f12a5b89c91..526177813d53 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -1938,7 +1938,7 @@ static void sja1105_fast_age(struct dsa_switch 
*ds, int port)

  		u64_to_ether_addr(l2_lookup.macaddr, macaddr);

-		rc = sja1105_fdb_del(ds, port, macaddr, l2_lookup.vlanid, db);
+		rc = sja1105_fdb_del(ds, port, macaddr, l2_lookup.vlanid, 0, db);
  		if (rc) {
  			dev_err(ds->dev,
  				"Failed to delete FDB entry %pM vid %lld: %pe\n",
@@ -1952,14 +1952,14 @@ static int sja1105_mdb_add(struct dsa_switch 
*ds, int port,
  			   const struct switchdev_obj_port_mdb *mdb,
  			   struct dsa_db db)
  {
-	return sja1105_fdb_add(ds, port, mdb->addr, mdb->vid, false, db);
+	return sja1105_fdb_add(ds, port, mdb->addr, mdb->vid, 0, db);
  }

  static int sja1105_mdb_del(struct dsa_switch *ds, int port,
  			   const struct switchdev_obj_port_mdb *mdb,
  			   struct dsa_db db)
  {
-	return sja1105_fdb_del(ds, port, mdb->addr, mdb->vid, db);
+	return sja1105_fdb_del(ds, port, mdb->addr, mdb->vid, 0, db);
  }

  /* Common function for unicast and broadcast flood configuration.

