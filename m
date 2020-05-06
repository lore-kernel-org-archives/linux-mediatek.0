Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9430C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 19:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1122186A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 19:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VavIW5Av";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8Rz9G6A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1122186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw9j8wCzHKoNNapuDrSHnWheu9bz8GilJp3lp3Z/y3s=; b=VavIW5AviqmJPu
	EqPS2SYEfdRyf++dzlgPJFcnsvOpightBuOInNQ9WVKluLVSWRA1Xg2DF1HJ4OFuQEW16sPt3MNuq
	BnEgPCxjcuocz8ZTglKCwZJgQ5qiNckLqh3/d4VuF0NqtNn1km051zqHetP2hckXXkvazF+p4VK8w
	RrE/Vk++HQD8ZDPTN+e7s9WkqQRxz3WUZEBV187CR5zCo/YcCq1bbFi4zw7Jbkmng905eAvOZrL+1
	dNT9cLMf6NBiZQrgOw1ObB+8WQemdtZnM3L4YVydYus0o7ks1tGLLb+FAzIIjLwQacjE1i8EatKRz
	OJjss0suqNwm+4rh05OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWPe2-00029m-KC; Wed, 06 May 2020 19:23:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWPdl-0001sY-K7; Wed, 06 May 2020 19:23:34 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4A7720870;
 Wed,  6 May 2020 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588793012;
 bh=HT+hCyDDnp3A+m/VSXJaYiGdp3Y+AgCoLB8fV/ljk2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B8Rz9G6AEtJsXLDcU5SN0axbD1UiixoRkMRXpd+reYcH1nNAqljAPm1kqXl6a62Fx
 OfeHQq8+PvUnHXBkkYxLMR98TSp6iVizYFtDu1jSTWBCot46PEfXlbDMCwIGKaB1gi
 IpcHIfbJG1bhaZlyPlunRqaMIf7V2DyCO+3weANQ=
Date: Wed, 6 May 2020 12:23:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Leon Romanovsky <leon@leon.nu>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200506122329.0a6b2ac4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CALq1K=Lu0hv9UCgxgrwCVoOe9L7A4sgBEM=RW2d9JkizHmdBPQ@mail.gmail.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <CALq1K=Lu0hv9UCgxgrwCVoOe9L7A4sgBEM=RW2d9JkizHmdBPQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_122333_692238_77241580 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 6 May 2020 22:16:11 +0300 Leon Romanovsky wrote:
> > +#define MTK_MAC_DRVNAME                                "mtk_eth_mac"
> > +#define MTK_MAC_VERSION                                "1.0"  
> 
> Please don't add driver version to new driver.

It has already been pointed out. Please trim your replies.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
