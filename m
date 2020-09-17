Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B0BC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:23:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBFD2072E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="crGqi6xr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F5hQbZ40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BBFD2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4X32CiKj7dGbX8EBvKtnCHzMTLu/uz/Szze3gzppo0c=; b=crGqi6xrVBP3fANEKCW750Gox
	zOi0aEaSc2DYoIQRgtQYq2XoKmN/4rl9oQ77U5+8poE5R7ogfmEfhoeyb4v+Kk2gt+0lxTp+i7gQW
	w2DV62gyEtwxAoRi8D+JGxBHB0vp23kKXe0b+6dFoYeKW0thTbxJWP4FgdJfLAj8G4NQT1Pd8kzBy
	pAZcH0ocYH3OfyuT48aoZgS4MfV9vteGMqiNGXvZdJI/aPQci4FIL2wMu5ODbMgI1fE4x9Goq8Do4
	cieKHwTv8HqeAXZ32SJxKoIYKql3ofKH/Bwe7Gh3dPGl9kY3gz5JcaPP9WR9LqAugA+C2Hnf2rfK2
	vg5iA/LRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoGL-0004jl-AD; Thu, 17 Sep 2020 07:23:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoGJ-0004ir-6b
 for linux-mediatek@lists.infradead.org; Thu, 17 Sep 2020 07:23:24 +0000
X-UUID: 536f3df8bf04468ebf1adf98e3e75aa2-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FFBgRG/w9F6541Vnrlj29ctbYfljgzD6Gp0xcai/yss=; 
 b=F5hQbZ403evBFJsNNZTXZBlAXFTMjqoNF1Duaew/EIDGCjWtn3603DAwPmdh6vjv64gpMDsFRdmQeSBIlR4RX4myRYXCWMqsM/WiFsJQ2OoC0hVTgobp+ZF65w3abMR+WzaZbhScQWj5blYUUZe2563rAMSS7nTnDk0+3flJuEU=;
X-UUID: 536f3df8bf04468ebf1adf98e3e75aa2-20200916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2118273137; Wed, 16 Sep 2020 23:23:11 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 00:16:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 15:15:56 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 15:16:00 +0800
Message-ID: <1600326959.11746.11.camel@mtksdccf07>
Subject: Re: [bug report] net: dsa: mt7530: Add the support of MT7531 switch
From: Landen Chao <landen.chao@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Sep 2020 15:15:59 +0800
In-Reply-To: <20200916143505.GA766413@mwanda>
References: <20200916143505.GA766413@mwanda>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_032323_444663_AA959D3B 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Dan,

Thanks for your review.
On Wed, 2020-09-16 at 22:35 +0800, Dan Carpenter wrote:
> Hello Landen Chao,
> 
> The patch c288575f7810: "net: dsa: mt7530: Add the support of MT7531
> switch" from Sep 11, 2020, leads to the following static checker
> warning:
> 
> 	drivers/net/dsa/mt7530.c:2298 mt7531_cpu_port_config()
> 	error: uninitialized symbol 'interface'.
> 
> drivers/net/dsa/mt7530.c
>   2273  static int
>   2274  mt7531_cpu_port_config(struct dsa_switch *ds, int port)
>   2275  {
>   2276          struct mt7530_priv *priv = ds->priv;
>   2277          phy_interface_t interface;
>   2278          int speed;
>   2279  
>   2280          switch (port) {
>   2281          case 5:
>   2282                  if (mt7531_is_rgmii_port(priv, port))
>   2283                          interface = PHY_INTERFACE_MODE_RGMII;
>   2284                  else
>   2285                          interface = PHY_INTERFACE_MODE_2500BASEX;
>   2286  
>   2287                  priv->p5_interface = interface;
>   2288                  break;
>   2289          case 6:
>   2290                  interface = PHY_INTERFACE_MODE_2500BASEX;
>   2291  
>   2292                  mt7531_pad_setup(ds, interface);
>   2293  
>   2294                  priv->p6_interface = interface;
>   2295                  break;
> 
> Does this need a default case?  Smatch thinks "port" can be 0-6.
Yes, it needs a default case to catch unexpected dts setting. "port" can
be 0-6 generally, but only 5 and 6 are valid cpu port.

Although, "port" 0-4 can also be labeled as "cpu" in dts, but no real
hardware can support this kind of configuration currently.
> 
>   2296          }
>   2297  
>   2298          if (interface == PHY_INTERFACE_MODE_2500BASEX)
>   2299                  speed = SPEED_2500;
>   2300          else
>   2301                  speed = SPEED_1000;
>   2302  
>   2303          mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
>   2304          mt7530_write(priv, MT7530_PMCR_P(port),
>   2305                       PMCR_CPU_PORT_SETTING(priv->id));
>   2306          mt753x_phylink_mac_link_up(ds, port, MLO_AN_FIXED, interface, NULL,
>   2307                                     speed, DUPLEX_FULL, true, true);
>   2308  
>   2309          return 0;
>   2310  }
> 
> regards,
> dan carpenter
regards,
landen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
