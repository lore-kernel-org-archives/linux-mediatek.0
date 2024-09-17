Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD9CC35FF0
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bGHeAgwQgGz5DTakOhU0IsRpF+QjXsnShxPZucbazc=; b=yMMs/+uEm/mbcb4c3fK1oQ0c9q
	cLoMRaqLFDBen9vucP/ivEeiwykBZqrkr/kp8rzkKRpYtINOs0jVusbzTyihxW3xJ2kfuelon5z6N
	hl/a6dyg6fTEkg4IGjtPt1AhX+vMMcUIDiH7QXo5val63UQ4oAJxydId6Ay/MlGJ4oNM59sv8vrNA
	92EZisZLGDUXZzgaXCKqLR3dmC6oiDvDRMkZes4WI9W2Te9+Fyew2/1Hm35TMseAWeIRppW7nFbgf
	rvrCP81K1JpKj0XXapWEX/9zz8j9GyVQheQl3aei/vcbxjTKv9RXm2j65O/P9M7d9eOxq8oZqe+EG
	oicgH3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqTJW-00000005fEO-37Id;
	Tue, 17 Sep 2024 08:11:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqTJT-00000005fBN-3xHY
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Sep 2024 08:11:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7DyJ0GDsz6K5rH;
	Tue, 17 Sep 2024 16:11:36 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
	by mail.maildlp.com (Postfix) with ESMTPS id A9B4A1400F4;
	Tue, 17 Sep 2024 16:11:42 +0800 (CST)
Received: from china (10.200.201.82) by frapeml500005.china.huawei.com
 (7.182.85.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 10:11:29 +0200
From: Gur Stavi <gur.stavi@huawei.com>
To: <alexander.sverdlin@siemens.com>
CC: <Mark-MC.Lee@mediatek.com>, <UNGLinuxDriver@microchip.com>,
	<alexandre.belloni@bootlin.com>, <andrew@lunn.ch>,
	<angelogioacchino.delregno@collabora.com>, <arinc.unal@arinc9.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <bridge@lists.linux.dev>,
	<claudiu.manoil@nxp.com>, <daniel@makrotopia.org>, <davem@davemloft.net>,
	<dqfext@gmail.com>, <edumazet@google.com>, <f.fainelli@gmail.com>,
	<kuba@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lorenzo@kernel.org>, <matthias.bgg@gmail.com>, <nbd@nbd.name>,
	<netdev@vger.kernel.org>, <olteanv@gmail.com>, <pabeni@redhat.com>,
	<razor@blackwall.org>, <roopa@nvidia.com>, <sean.wang@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Date: Tue, 17 Sep 2024 11:10:56 +0300
Message-ID: <20240917081056.1644806-1-gur.stavi@huawei.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910130321.337154-2-alexander.sverdlin@siemens.com>
References: <20240910130321.337154-2-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.201.82]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 frapeml500005.china.huawei.com (7.182.85.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_011156_143903_FEC899A7 
X-CRM114-Status: UNSURE (   7.60  )
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

> @@ -1594,10 +1592,11 @@ void dsa_switch_shutdown(struct dsa_switch *ds)
>  	}
>
>  	/* Disconnect from further netdevice notifiers on the conduit,
> -	 * since netdev_uses_dsa() will now return false.
> +	 * from now on, netdev_uses_dsa_currently() will return false.
>  	 */
>  	dsa_switch_for_each_cpu_port(dp, ds)
> -		dp->conduit->dsa_ptr = NULL;
> +		rcu_assign_pointer(dp->conduit->dsa_ptr, NULL);
> +	synchronize_rcu();
>
>  	rtnl_unlock();
>  out:

Hi, I am a newbie here. Thanks for the opportunity for learning more
about rcu.
Wouldn't it make more sense to call synchronize_rcu after rtnl_unlock?

