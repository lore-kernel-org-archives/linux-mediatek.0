Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C6FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13AD720720
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCFGy/ay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="BwWn/Xnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13AD720720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxV5/gVrWg9irT5uXzOwAeXtR0Cw8H85qQ8s7bz82Do=; b=lCFGy/ayRtk8zC+I2xY7H4LGQ
	OFJRd1JIMTgcNjJBgysv3RZZlFcppBSyN3144cvwsVceYHvazvp1I/zE/L6lfU+8PuWqwDYoXSUmF
	tHz7DFSrIXNRtQtJg+PJ3bbhclRZJThe16ExejhtIaUxhuHWX5KYT3LfWapUQhWbsB+t0jNyM6/bt
	paofV2Hb1prX/uVOAF9o8HmOBMY8YSVc4/gllhbnDwMX+ZPnchiBdSCPl+nv28uxzLwDYjmkxNX/h
	WmxylvE9UXp7P7t5L9LDx0lxRkQTBf8HeYSXmb7rD6vEPoz9gEHscbdAx9+wcFtJ6zELzRESkuT2h
	X1EBgAO2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcxE-0004qs-Bd; Thu, 09 Jul 2020 20:15:36 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcxC-0004pq-1T; Thu, 09 Jul 2020 20:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1594325727;
 bh=qjjKU85vWrmvdFue2XV3Qb2IIMAX9y66v6AoZZPoc2M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BwWn/XnhI2e7GoWIhW5k/9m566TlB7ALaOPJBr+6TojU7MTG4iw4LpmN+W4xdVvmW
 gcqwPRg33mJZeBN7BFB/gZfsTwLkfFN5GieRtINFJVm5AieZcryABdfIg0fVhsqw1q
 Ale42Ysxb7vKCn6iww7D4Bmf78gWdFApVmDzpf78=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.213.58] ([80.208.213.58]) by web-mail.gmx.net
 (3c-app-gmx-bap65.server.lan [172.19.172.65]) (via HTTP); Thu, 9 Jul 2020
 21:48:01 +0200
MIME-Version: 1.0
Message-ID: <trinity-487c0605-faeb-462e-a373-bc393ce3dbfa-1594324081639@3c-app-gmx-bap65>
From: Frank Wunderlich <frank-w@public-files.de>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Aw: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
Date: Thu, 9 Jul 2020 21:48:01 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200709134115.GK928075@lunn.ch>
References: <20200709055742.3425-1-frank-w@public-files.de>
 <20200709134115.GK928075@lunn.ch>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:n4zQntLiWUydrYDQKBFrQyQq/zGUb616R6yRiuIW4EkJfjq+54nieuV/hYKY/1qyo45o+
 T2AV17jN910J1AYgwwgjqWXNF94zV6gLBYMT9Hl4WOnfgtJTvXNzcnqT/xY+bj7KTOvcfPBe2qLH
 iufWNu521oC6dI9gX0kLgb9Ft7IHy4L3NXJ8+w0rSZudmHd/G3VMlJ4H2z+UG2OBzWIm2Q5L2Glg
 rZbzX/ZP8wO9W5+MuBod2H8YjmwO4CiGt4uOWYEiWOSID3DQ8+IH6TSyRDTaIzL/nUQZcmB2n/mo
 BQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:NfrO6qilQeM=:Ia9JJnIoEUdVh0NMjKHicv
 y+NYO7ihJOsnj0dOvVY1KJGVNTjNa05Fc5RlM7nS7CdivIjn8D+VEgYYgwqL8r6c0+VmjZxSd
 ZOfBYg2kuzEiQImyMrRVi7bf9p73Wtsfu9UB8jmJzOHL54uFU65K5T/1opPCns3RwQPh4DXuQ
 ezQ7jg57oZTiWwI/crjxR7o9h4XKVElooz3Qu1E/WZpGfXrCv9J8lGnsqGyJ+EfIsxNYXDP2u
 UlxPUaGmylNPK1KhoilDBkHzvs61VA9YxTN0xttGX3ynnblAGTLheN4bYz5c+4XQGf0NclKWH
 dOVkAnEjbnqvY0ruJ0HP6qAZirTwc/IaDdowhXzEgVLgMN2hTAJ5MKq/b95wfSdV5k18QKM91
 L8vuWz89UsUx2RXmed2SJQ2UG1BnCiiTGLYrUv9KibIKYY87czk5YS9d7E28mimNhlBoi5vy4
 4fHMhf8uLO8thJsSSiAM6RtvGsjiqecRokA9TpdMds4B884QKpAfzsi+ro654hTIVFFNhMd1v
 akvIwAJ0/YzC6qhmf2E3oWK8TT2V3S0nDhQwYTxE4D7EC2dp3UEQRhguiIJqbfhawiiptPhp7
 KA4e0YJTqnAgVwPC7EDyVIwAIEqS1JlYeS1/FiU7zZr3ZKQQgEg3APEEsT9hLkISpcQhd0/3u
 B2nQVVKZM4ALiC9cgMUBT+cZJW2WDUrNEJXvUeraWskoeb6TtqMRGOtgFh0KvCHyZy+k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_161534_312739_BF13A292 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Landen Chao <landen.chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Donnerstag, 09. Juli 2020 um 15:41 Uhr
> Von: "Andrew Lunn" <andrew@lunn.ch>

> > +	eth->netdev[id]->max_mtu = 1536;
>
> I assume this is enough to make the DSA warning go away, but it is the
> true max? I have a similar patch for the FEC driver which i should
> post sometime. Reviewing the FEC code and after some testing, i found
> the real max was 2K - 64.

i tried setting only the max_mtu, but the dsa-error is still present

mt7530 mdio-bus:00: nonfatal error -95 setting MTU on port 0

but i got it too, if i revert the change...mhm, strange that these were absent last time...

the other 2 are fixed with only max_mtu.
@andrew where did you got the 2k-64 (=1984) information? sounds like orwell ;)

-95 is EOPNOTSUPP

as so far, commit 72579e14a1d3d3d561039dfe7e5f47aaf22e3fd3 introduces the warning,
but the change is making it non-fatal...so i need to adjust my fixes-tag.
i guess the real problem lies in this:

bfcb813203e6 net: dsa: configure the MTU for switch ports

it looks like dsa_slave_change_mtu failes because of missing callback in mtk_driver (mt7530 for mt7531 in my case).

net/dsa/slave.c
1405 static int dsa_slave_change_mtu(struct net_device *dev, int new_mtu)
...
1420     if (!ds->ops->port_change_mtu)
1421         return -EOPNOTSUPP;

i added an empty callback to avoid this message, but mtu should be set in hardware too...
here i will ne some assistance from mtk ethernet experts and mt7531 driver (from landen chao) to be merged first (after some needed changes)

--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2259,6 +2259,12 @@ mt753x_phy_write(struct dsa_switch *ds, int port, int regnum, u16 val)
        return priv->info->phy_write(ds, port, regnum, val);
 }

+static int
+mt753x_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
+{
+       return 0;
+}
+
 static const struct dsa_switch_ops mt7530_switch_ops = {
        .get_tag_protocol       = mtk_get_tag_protocol,
        .setup                  = mt753x_setup,
@@ -2281,6 +2287,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
        .port_vlan_del          = mt7530_port_vlan_del,
        .port_mirror_add        = mt7530_port_mirror_add,
        .port_mirror_del        = mt7530_port_mirror_del,
+       .port_change_mtu        = mt753x_port_change_mtu,
        .phylink_validate       = mt753x_phylink_validate,
        .phylink_mac_link_state = mt7530_phylink_mac_link_state,
        .phylink_mac_config     = mt753x_phylink_mac_config,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
