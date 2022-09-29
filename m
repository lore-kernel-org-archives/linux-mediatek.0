Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8866C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhSbVF2Pz3782oiFyZckw8RCmejofe5RUHemVd1LhtE=; b=NWdNjw+2v/3zNNRTh+SJXNmR0C
	M/bPUC4GMdhp9j/5jzfCLel+Od0/l99iesO480hsBszNqVMo2zcbAgKLrMFKVEBBW/yN4fH1O1wy0
	xVxM39kPXGirtXbttkg+ULnA1cg3geDrUdcd36ACYwH/r0K9/ppduPN45eBQ1tLhPA2dU0qdNjwrC
	Z/wxW7oeJFcHWkiFhTeloCGXRF9oLuXKTHpxCJUxJMDCt+Re/B7ksV+NIjSE75ju0AETg+F2GjiDs
	a6cK2eXquKxnzG4SmUneJ0bTiOC7+GFP4To1cA+Fzubc8JmmVOMJLjZZ9hj67a7+VVwse6966UUH/
	+z9YR2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyGQ-004vLy-Nk; Thu, 29 Sep 2022 18:28:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyGD-004vI6-RK; Thu, 29 Sep 2022 18:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3685CB825AC;
	Thu, 29 Sep 2022 18:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D73EC433C1;
	Thu, 29 Sep 2022 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664476067;
	bh=peXm6EYz/EMFFA8zuW/FKucf85TPZxTNbaodSHoZ7Wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kv7xhea2uFIbwtuFQLZh9XSjU1NQfjbcVqi7NBdfo1YmhLPr/oFL/8Xy7h8nVd63Y
	 1QbyuerlojcUMR9UJXqyqMMe/stYLXuAEzjAn5YgYL+gSYYe2Mgq5Jy1q1QOi5phs9
	 LUXrQ/s2M+7o3FfgPVpda31wV2wVBaOYzo8yfTohR2fDzhGsJx5Pf63zWtPQKojM9F
	 jn5yUhRAxSZA/Yu9rBhiUcBtbQl8G7FuabZv9yLUhOJjlvUZ798HikAJYp4pUIjm//
	 HnqLKE0lE+TxmEdaYgq6OQOzGouYBxg3CmBkmarKcPIbw5qPRqYRZam7X/YTCqQye3
	 IoYyggPAxMHZw==
Date: Thu, 29 Sep 2022 11:27:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@kapio-technology.com
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
 Fourcot <florent.fourcot@wifirst.fr>, Hans Schultz
 <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit Cohen
 <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
Message-ID: <20220929112744.27cc969b@kernel.org>
In-Reply-To: <12587604af1ed79be4d3a1607987483a@kapio-technology.com>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
	<20220929091036.3812327f@kernel.org>
	<12587604af1ed79be4d3a1607987483a@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_112750_181706_09F1F050 
X-CRM114-Status: GOOD (  22.59  )
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

On Thu, 29 Sep 2022 18:37:09 +0200 netdev@kapio-technology.com wrote:
> On 2022-09-29 18:10, Jakub Kicinski wrote:
> > On Wed, 28 Sep 2022 17:02:47 +0200 Hans Schultz wrote: =20
> >> From: "Hans J. Schultz" <netdev@kapio-technology.com>
> >>=20
> >> This patch set extends the locked port feature for devices
> >> that are behind a locked port, but do not have the ability to
> >> authorize themselves as a supplicant using IEEE 802.1X.
> >> Such devices can be printers, meters or anything related to
> >> fixed installations. Instead of 802.1X authorization, devices
> >> can get access based on their MAC addresses being whitelisted. =20
> >=20
> > Try a allmodconfig build on latest net-next, seems broken. =20
>=20
> I have all different switch drivers enabled and I see no compile=20
> warnings or errors.=20

Just do what I told you - rebase on net-next, allmodconfig.

> I guess I will get a robot update if that is the=20
> case but please be specific as to what does not build.

The maintainers simply don't have time to hold everyone by the hand.
Sometimes I wish it was still okay to yell at people who post code
which does not build. Oh well.

../drivers/net/dsa/qca/qca8k-common.c:810:5: error: conflicting types for =
=E2=80=98qca8k_port_fdb_del=E2=80=99
 int qca8k_port_fdb_del(struct dsa_switch *ds, int port,
     ^~~~~~~~~~~~~~~~~~
In file included from ../drivers/net/dsa/qca/qca8k-common.c:13:
../drivers/net/dsa/qca/qca8k.h:483:5: note: previous declaration of =E2=80=
=98qca8k_port_fdb_del=E2=80=99 was here
 int qca8k_port_fdb_del(struct dsa_switch *ds, int port,
     ^~~~~~~~~~~~~~~~~~
../drivers/net/dsa/qca/qca8k-common.c: In function =E2=80=98qca8k_port_fdb_=
del=E2=80=99:
../drivers/net/dsa/qca/qca8k-common.c:818:6: error: =E2=80=98fdb_flags=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98tsq_f=
lags=E2=80=99?
  if (fdb_flags)
      ^~~~~~~~~
      tsq_flags
../drivers/net/dsa/qca/qca8k-common.c:818:6: note: each undeclared identifi=
er is reported only once for each function it appears in
make[5]: *** [../scripts/Makefile.build:249: drivers/net/dsa/qca/qca8k-comm=
on.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:465: drivers/net/dsa/qca] Error 2
make[4]: *** Waiting for unfinished jobs....
../drivers/net/dsa/sja1105/sja1105_main.c: In function =E2=80=98sja1105_fas=
t_age=E2=80=99:
../drivers/net/dsa/sja1105/sja1105_main.c:1941:61: error: incompatible type=
 for argument 5 of =E2=80=98sja1105_fdb_del=E2=80=99
   rc =3D sja1105_fdb_del(ds, port, macaddr, l2_lookup.vlanid, db);
                                                             ^~
../drivers/net/dsa/sja1105/sja1105_main.c:1831:11: note: expected =E2=80=98=
u16=E2=80=99 {aka =E2=80=98short unsigned int=E2=80=99} but argument is of =
type =E2=80=98struct dsa_db=E2=80=99
       u16 fdb_flags, struct dsa_db db)
       ~~~~^~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c:1941:8: error: too few arguments =
to function =E2=80=98sja1105_fdb_del=E2=80=99
   rc =3D sja1105_fdb_del(ds, port, macaddr, l2_lookup.vlanid, db);
        ^~~~~~~~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c:1829:12: note: declared here
 static int sja1105_fdb_del(struct dsa_switch *ds, int port,
            ^~~~~~~~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c: In function =E2=80=98sja1105_mdb=
_del=E2=80=99:
../drivers/net/dsa/sja1105/sja1105_main.c:1962:56: error: incompatible type=
 for argument 5 of =E2=80=98sja1105_fdb_del=E2=80=99
  return sja1105_fdb_del(ds, port, mdb->addr, mdb->vid, db);
                                                        ^~
../drivers/net/dsa/sja1105/sja1105_main.c:1831:11: note: expected =E2=80=98=
u16=E2=80=99 {aka =E2=80=98short unsigned int=E2=80=99} but argument is of =
type =E2=80=98struct dsa_db=E2=80=99
       u16 fdb_flags, struct dsa_db db)
       ~~~~^~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c:1962:9: error: too few arguments =
to function =E2=80=98sja1105_fdb_del=E2=80=99
  return sja1105_fdb_del(ds, port, mdb->addr, mdb->vid, db);
         ^~~~~~~~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c:1829:12: note: declared here
 static int sja1105_fdb_del(struct dsa_switch *ds, int port,
            ^~~~~~~~~~~~~~~
../drivers/net/dsa/sja1105/sja1105_main.c:1963:1: error: control reaches en=
d of non-void function [-Werror=3Dreturn-type]
 }
 ^
cc1: some warnings being treated as errors
make[5]: *** [../scripts/Makefile.build:249: drivers/net/dsa/sja1105/sja110=
5_main.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:465: drivers/net/dsa/sja1105] Error=
 2
make[3]: *** [../scripts/Makefile.build:465: drivers/net/dsa] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:465: drivers/net] Error 2
make[1]: *** [/home/kicinski/linux/Makefile:1852: drivers] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:222: __sub-make] Error 2

