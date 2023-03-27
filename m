Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B809AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQM0d8N3ey8wKoxPg/KHHUAGDUaZlSpT4hCWm1bIuNQ=; b=Tv5eH00aCCHPO1Um7yeyYPXJJ3
	LmURkrVjm2MPdJ0Cwl9/KnyQ2IZaENCWt/w08KsfLnyxu/xjcPWxLTndR+0es6wEb48Ue2j9IfOWS
	hCwKc7H700yhnYEYv5m4YTCL/TMEigj+O33xg4WtSgcYNWVHOzSTv5G+rR8Ts4ghF5QALig0guWzF
	Qg++4SvnxHtF9fbinhxx/bOBMbCXoIYLhWcxbZWTVzM52Au17+x3WQ0p3E0pq7mf/H011Jkd8wWav
	tytgo7R0ppZPTiG4Bgf4Vqj+fwHG6zfqGVfNY/jF/eERbxPXeIQVUUwN8J2Jz91vd+BdRztcXkz/z
	3TBgPWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpGw-00Bdow-0b;
	Mon, 27 Mar 2023 16:00:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpGs-00Bdmz-0b;
	Mon, 27 Mar 2023 16:00:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q102so8073320pjq.3;
        Mon, 27 Mar 2023 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679932830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQM0d8N3ey8wKoxPg/KHHUAGDUaZlSpT4hCWm1bIuNQ=;
        b=Rggi0Md2110RpNFGa0P3wsEHmxvU81M3yeTIAOtvOXisj4v9LprR0CrMthEZrV32e1
         M/8YtzepHzMUkLlvOEujXBCmdZXfYBCOVZ2RXFr56231OHDocq7oA52EgJiXboR3OeTk
         lhzdE1l4PTEHadZb4zI8cnP6W9ZMQkGyrzZTz8dTkXEFepbaicmStgCdrVg/3MPrwtC0
         VqOuWOZnw5BzNPPJ573D58iV02sa3C/fLYjbV8xcxpG4+0CyhYMKw0OKiCM8hHwlUAjI
         LeZ9D5994F2qOWawmNDny+Y5xMxI8KvLKTeZDakTHny/iq3YwHZZpo02iSuGWso/whqD
         HN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQM0d8N3ey8wKoxPg/KHHUAGDUaZlSpT4hCWm1bIuNQ=;
        b=gPzvx2bm3ClXHvHX+3vC3tZTyfdXwNxOZym5/D/sISo3LMrmvHMjLyCxuxnKoOsAnS
         mKba0MksoISDViAVtK/VaBst5w6z9l2qAsMf9xyYB73WexTTsucZK79xrrjLAzujGwWZ
         o+/3qbFVKNqq3OxxtOFqmNJTsxKznTFisnNPNioWE6q5VummxsYckZ49m6wsW+SyYPmI
         ffw9rRm7kfkRi0dJLDW+P8e68LDkmyI1SZHbl8In2j+eL20GlyfHIvGpMdsUMOfEWytV
         tWtZLrJwk/yAw/nUqjVw0XpDvG/p/HWlPE/5ttw18iNjZo/Z9VDClHc15zjllUP9PbI/
         Jfdw==
X-Gm-Message-State: AO0yUKUEx8xU0le4oaSS9WLiTNsxy2H58n9EAd9F+USTHTw/HxQ5c9A3
	xRmonSa6KQzyeq7TIJ2kRcKqLLpyhHmYPA==
X-Google-Smtp-Source: AK7set+qSF5b/VIEJkiJCwzshpgszJ/3NObsXzlCnvLlK7UGPX/xAWkGoHJ5HRudXeHxOYXgAmW+Nw==
X-Received: by 2002:a05:6a20:bca8:b0:da:e44f:5284 with SMTP id fx40-20020a056a20bca800b000dae44f5284mr8801308pzb.30.1679932830335;
        Mon, 27 Mar 2023 09:00:30 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b0058837da69edsm19252637pfd.128.2023.03.27.09.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:00:29 -0700 (PDT)
Date: Mon, 27 Mar 2023 19:00:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230327160009.bdswnalizdv2u77z@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-3-netdev@kapio-technology.com>
 <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87355qb48h.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_090034_244463_FF687D6A 
X-CRM114-Status: GOOD (  25.39  )
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

On Mon, Mar 27, 2023 at 05:31:26PM +0200, Hans Schultz wrote:
> On Mon, Mar 27, 2023 at 14:52, Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > By the way, there is a behavior change here.
> >
> > Before:
> >
> > $ ip link add br0 type bridge && ip link set br0 up
> > $ ip link set swp0 master br0 && ip link set swp0 up
> > $ bridge fdb add dev swp0 00:01:02:03:04:05 master dynamic
> > [   70.010181] mscc_felix 0000:00:00.5: felix_fdb_add: port 0 addr 00:01:02:03:04:05 vid 0
> > [   70.019105] mscc_felix 0000:00:00.5: felix_fdb_add: port 0 addr 00:01:02:03:04:05 vid 1
> > .... 5 minutes later
> > [  371.686935] mscc_felix 0000:00:00.5: felix_fdb_del: port 0 addr 00:01:02:03:04:05 vid 1
> > [  371.695449] mscc_felix 0000:00:00.5: felix_fdb_del: port 0 addr 00:01:02:03:04:05 vid 0
> > $ bridge fdb | grep 00:01:02:03:04:05
> >
> > After:
> >
> > $ ip link add br0 type bridge && ip link set br0 up
> > $ ip link set swp0 master br0 && ip link set swp0 up
> > $ bridge fdb add dev swp0 00:01:02:03:04:05 master dynamic
> > [  222.071492] mscc_felix 0000:00:00.5: felix_fdb_add: port 0 addr 00:01:02:03:04:05 vid 0 flags 0x1
> > [  222.081154] mscc_felix 0000:00:00.5: felix_fdb_add: port 0 addr 00:01:02:03:04:05 vid 1 flags 0x1
> > .... 5 minutes later
> > $ bridge fdb | grep 00:01:02:03:04:05
> > 00:01:02:03:04:05 dev swp0 vlan 1 offload master br0 stale
> > 00:01:02:03:04:05 dev swp0 offload master br0 stale
> > 00:01:02:03:04:05 dev swp0 vlan 1 self
> > 00:01:02:03:04:05 dev swp0 self
> >
> > As you can see, the behavior is not identical, and it made more sense
> > before.
> 
> I see this is Felix Ocelot and there is no changes in this patchset that
> affects Felix Ocelot. Thus I am quite sure the results will be the same
> without this patchset, ergo it must be because of another patch. All
> that is done here in the DSA layer is to pass on an extra field and add
> an extra check that will always pass in the case of this flag.

If mv88e6xxx is all you have, you can still sanity-check the equivalent
effect of your patch set to other drivers by simply not acting upon the
"flags" argument in mv88e6xxx_port_fdb_add()/mv88e6xxx_port_fdb_del(),
and disabling the logic to treat Age Out interrupts. Then you should be
able to notice exactly the behavior change I am talking about.

In your own commit message, it says:

Author: Hans J. Schultz <netdev@kapio-technology.com>

    net: bridge: ensure FDB offloaded flag is handled as needed

    Since user added entries in the bridge FDB will get the BR_FDB_OFFLOADED
                                                        ~~~~~~~~~~~~~~~~~~~~
    flag set, we do not want the bridge to age those entries and we want the
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    entries to be deleted in the bridge upon an SWITCHDEV_FDB_DEL_TO_BRIDGE
                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                        existing drivers do not emit this
    event.

    Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>

diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index e69a872bfc1d..b0c23a72bc76 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -537,6 +537,7 @@ void br_fdb_cleanup(struct work_struct *work)
 		unsigned long this_timer = f->updated + delay;
 
 		if (test_bit(BR_FDB_STATIC, &f->flags) ||
+		    test_bit(BR_FDB_OFFLOADED, &f->flags) ||
 		    test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &f->flags)) {
 			if (test_bit(BR_FDB_NOTIFY, &f->flags)) {
 				if (time_after(this_timer, now))
@@ -1465,7 +1466,9 @@ int br_fdb_external_learn_del(struct net_bridge *br, struct net_bridge_port *p,
 	spin_lock_bh(&br->hash_lock);
 
 	fdb = br_fdb_find(br, addr, vid);
-	if (fdb && test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
+	if (fdb &&
+	    (test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags) ||
+	     test_bit(BR_FDB_OFFLOADED, &fdb->flags)))
 		fdb_delete(br, fdb, swdev_notify);
 	else
 		err = -ENOENT;


A reasonable question you could ask yourself is: why do my BR_FDB_OFFLOADED
entries have this flag in the software bridge in the first place?
Did I add code for it? Is it because there is some difference between
mv88e6xxx and ocelot/felix, or is it because dsa_fdb_offload_notify()
gets called in both cases from generic code just the same?

And if dsa_fdb_offload_notify() gets called in both cases just the same,
but no other driver except for mv88e6xxx emits the SWITCHDEV_FDB_DEL_TO_BRIDGE
which you've patched the bridge to expect in this series, then what exactly
is surprising in the fact that offloaded and dynamic FDB entries now become
stale, but are not removed from the software bridge as they were before?

