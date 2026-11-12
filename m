Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E70606A327
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YxfsvqZz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blh/yOuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m6vUZ3LR0Bl/r5MeX/A4FbQJiyioDH18V2IC79hgfy0=; b=YxfsvqZzMC2XJnir7M3q1UTaek
	csE4mZdVBtFyIjXtlxOjyP+BUYA9dBHdkfBMyB5k8X5XuKVAyk5iwhyOcX/l0aZJoUkL0CIDWgMwP
	ApFb0nLTfZ2aVWYmnYH3xW6iUdGbXnAgkm1QBsX2WdPP8+9ty7/Twn/+P28CpzU+mW9w7cD/HWzmq
	kcnLgi2CnzVodR9PHFgR43loubL8NnCryav4OKofvnSz2xrPUUVavStbGRY9g1egpNXi4D9UgsSmc
	XXBadTUX3X43I7x3EN4v9dQ9zP9sD+o4Ml9QPZwD0FFgf+wUXRlhMe2OdBhhZGpbmcpMW/j9mFuD/
	kYP6Obcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRmz-00000009TY8-2M4j;
	Thu, 12 Nov 2026 10:12:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRmy-00000009TXO-09W3;
	Thu, 12 Nov 2026 10:12:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 298A363AC1;
	Thu, 12 Nov 2026 10:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1BC8E1F00A05;
	Thu, 12 Nov 2026 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478335;
	bh=m6vUZ3LR0Bl/r5MeX/A4FbQJiyioDH18V2IC79hgfy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blh/yOuJpn/OjkRt/062TkdjYc3SCnLweis40rnFbiSAh8WIt5dI8Vnr+GMbVMXf3
	 qs7/kjJWcx6GPKbXJlXfrCXDfA87LEp0HrrhthbY+o3P77jKRkzZsEWCpo6STNpZ+H
	 eMlK7zwt59UbK/QMW8Ug/zjh8U/uMiYiHRckEUExUJI5Hnok6vINBYRopm2JTQ8aNH
	 Z0fpeTMB/uwTffFrp6HC+bxWB9Ihle+6TP6vaKwpCwbkzN9/xIdhZx4wiWBtI5uKOs
	 6eTaDbdPmHGA8OhkdEPp3qN5+Loipi2EvhKkWJQpr1kZ90Ov6nVYhEmbvjhcTlaSoh
	 gGBZ/nORmaVoA==
Date: Thu, 12 Nov 2026 11:12:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yanqing Wang <ot_yanqing.wang@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, yana06070@163.com
Subject: Re: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix
 device_node leak in mtk_star_probe()
Message-ID: <u6jz3rgrlwhlbhqwgi26lsa2knkwgjws6scbb6e3dq6bkjmudi@hiulukf72wrr>
References: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:51:30AM +0800, Xia Yan wrote:
> mtk_star_probe() gets the PHY node from the "phy-handle" property
> with of_parse_phandle(). The helper takes a reference on the node it
> returns. The node is used by of_phy_connect() each time the netdevice
> is opened.
> 
> That reference is never dropped. Every error return after the lookup
> leaks it. Unbind leaks it as well: the driver is devm-only and has no
> remove callback.
> 
> Release it with a devm action, registered right after the lookup.
> The error paths and the unbind path then drop the node through the
> devm cleanup.
> 
> Found during a code review of the OF node handling in ethernet drivers.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 

