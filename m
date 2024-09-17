Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCDAC36009
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo5sELNbAXHvkmpprjboASXSMTjwUqE9i4e0JykCvsM=; b=wALHIJlhL/2h1qFnGoMqH5b16/
	92DrURpmjHQPAJbwSWt/N4KZ11px/PZFWRBp0xBkv+DCZme0XXXmOPzDQ2dB56EG3+8gKymRKwdtP
	xv7Qhgech+azWX4A9BrdWqo9Wz2gDVWJ6jtYMsDX6EZTokU1jzyge36rQ2PwQIVlWmxnS0DR3RJOZ
	PYwvSJKWj7r0GoN/qYBgNwW25ja9q1n9Hm8P9yCVzFvTOgZTbS47uHVr+/WZpxhmcxZHzpiEeyPbN
	5QAvN1WJcJFys5BkS2/OLvl1u9v+TIgRUXlRDh6q/pzpULK16YM6YW+iXf1CTnLo+O+sZhXFurShW
	9fX1Uh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVWD-00000005wuf-1Oh3;
	Tue, 17 Sep 2024 10:33:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVUc-00000005woL-45f0
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Sep 2024 10:33:12 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7J3Y0fw3z6K5qJ;
	Tue, 17 Sep 2024 18:31:21 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
	by mail.maildlp.com (Postfix) with ESMTPS id 100041400CD;
	Tue, 17 Sep 2024 18:31:28 +0800 (CST)
Received: from china (10.200.201.82) by frapeml500005.china.huawei.com
 (7.182.85.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 12:31:14 +0200
From: Gur Stavi <gur.stavi@huawei.com>
To: <alexander.sverdlin@siemens.com>
CC: <Mark-MC.Lee@mediatek.com>, <UNGLinuxDriver@microchip.com>,
	<alexandre.belloni@bootlin.com>, <andrew@lunn.ch>,
	<angelogioacchino.delregno@collabora.com>, <arinc.unal@arinc9.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <bridge@lists.linux.dev>,
	<claudiu.manoil@nxp.com>, <daniel@makrotopia.org>, <davem@davemloft.net>,
	<dqfext@gmail.com>, <edumazet@google.com>, <f.fainelli@gmail.com>,
	<gur.stavi@huawei.com>, <kuba@kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lorenzo@kernel.org>,
	<matthias.bgg@gmail.com>, <nbd@nbd.name>, <netdev@vger.kernel.org>,
	<olteanv@gmail.com>, <pabeni@redhat.com>, <razor@blackwall.org>,
	<roopa@nvidia.com>, <sean.wang@mediatek.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Date: Tue, 17 Sep 2024 13:30:41 +0300
Message-ID: <20240917103041.1645536-1-gur.stavi@huawei.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <c7a52a818c1ae49ad7e44bb82fcea53d7f53d6e0.camel@siemens.com>
References: <c7a52a818c1ae49ad7e44bb82fcea53d7f53d6e0.camel@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.201.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500005.china.huawei.com (7.182.85.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_033135_178035_755BB6D3 
X-CRM114-Status: GOOD (  13.83  )
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

> Hello Gur!
>
> On Tue, 2024-09-17 at 11:10 +0300, Gur Stavi wrote:
> > > @@ -1594,10 +1592,11 @@ void dsa_switch_shutdown(struct dsa_switch *ds)
> > >   	}
> > >
> > >   	/* Disconnect from further netdevice notifiers on the conduit,
> > > -	 * since netdev_uses_dsa() will now return false.
> > > +	 * from now on, netdev_uses_dsa_currently() will return false.
> > >   	 */
> > >   	dsa_switch_for_each_cpu_port(dp, ds)
> > > -		dp->conduit->dsa_ptr = NULL;
> > > +		rcu_assign_pointer(dp->conduit->dsa_ptr, NULL);
> > > +	synchronize_rcu();
> > >
> > >   	rtnl_unlock();
> > >   out:
> >
> > Hi, I am a newbie here. Thanks for the opportunity for learning more
> > about rcu.
> > Wouldn't it make more sense to call synchronize_rcu after rtnl_unlock?
>
> This is indeed a question which is usually resolved other way around
> (making locked section shorter), but in this particular case I thought that:
> - we actually don't need giving rtnl lock sooner, which would potentially
>   make synchronize_rcu() call longer (if another thread manages to wake up
>   and claim the rtnl lock before synchronize_rcu())
> - we are in shutdown phase, we don't need to minimize lock contention, we
>   need to minimize the overall shutdown time

But isn't shutdown still multithreaded?
10 threads may have similar shutdown task: remove objects from different
rcu protected data structures while holding rtnl. Then synchronize RCU
and release the objects.
Synchronizing RCU from within the lock will completely serialize all
threads and postpone shutdown whereas outside the lock multiple
synchronize_rcu could run in parallel.

