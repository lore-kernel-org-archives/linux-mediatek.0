Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D0C54FD0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 19:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B46720724
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 19:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byfegqY7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B46720724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChbdLoz7LlyuJUQGFvsfjK15qopyDqvsTduD6MEsO2U=; b=byfegqY7zS39jk
	+YAQ03S8GreGfjkt0uGLpdr3zmcIiLDlDSNfXe7zXqVU6UCX6gccBrvFfVK1yHUiT13kfacMNXVup
	OM/UekH0XcDUjJx/YQ0k++5a7SvYBnu5kGidTapegCG2zsEH05RtUpAVr5cuIM/FuMMmE9zbHZkWI
	hZJWFZR/o1SGxXCARikQIqVwsRZ47izxKqJhN0TbkJL0nIyDyWu+Wiz4CMV0gSHyfq07RvWdXja4a
	gOHihy97ipfiDJX1jNcG3E/TAXNO8WqQPnD67cAIve2DowDOFL6W7FUg5I/C66eKpusFYiGgFEldk
	wMGZbp+XgF352uS/6uVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRhbx-00018a-C9; Thu, 23 Apr 2020 19:34:13 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRhbo-0000zl-Aq; Thu, 23 Apr 2020 19:34:05 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EA79412776892;
 Thu, 23 Apr 2020 12:33:55 -0700 (PDT)
Date: Thu, 23 Apr 2020 12:33:55 -0700 (PDT)
Message-Id: <20200423.123355.1116107619410931438.davem@davemloft.net>
To: bloodyreaper@yandex.ru
Subject: Re: [PATCH v2 net-next] net: dsa: add GRO support via gro_cells
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200421134108.167646-1-bloodyreaper@yandex.ru>
References: <20200421134108.167646-1-bloodyreaper@yandex.ru>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 23 Apr 2020 12:33:56 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_123404_373744_7B8A857F 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: woojung.huh@microchip.com, andrew@lunn.ch, f.fainelli@gmail.com,
 hauke@hauke-m.de, linus.walleij@linaro.org, sean.wang@mediatek.com,
 linux@armlinux.org.uk, UNGLinuxDriver@microchip.com, claudiu.manoil@nxp.com,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 vladimir.oltean@nxp.com, matthias.bgg@gmail.com, kuba@kernel.org,
 linux@rempel-privat.de, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org,
 maowenan@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alexander Lobakin <bloodyreaper@yandex.ru>
Date: Tue, 21 Apr 2020 16:41:08 +0300

> gro_cells lib is used by different encapsulating netdevices, such as
> geneve, macsec, vxlan etc. to speed up decapsulated traffic processing.
> CPU tag is a sort of "encapsulation", and we can use the same mechs to
> greatly improve overall DSA performance.
> skbs are passed to the GRO layer after removing CPU tags, so we don't
> need any new packet offload types as it was firstly proposed by me in
> the first GRO-over-DSA variant [1].
> 
> The size of struct gro_cells is sizeof(void *), so hot struct
> dsa_slave_priv becomes only 4/8 bytes bigger, and all critical fields
> remain in one 32-byte cacheline.
> The other positive side effect is that drivers for network devices
> that can be shipped as CPU ports of DSA-driven switches can now use
> napi_gro_frags() to pass skbs to kernel. Packets built that way are
> completely non-linear and are likely being dropped without GRO.
> 
> This was tested on to-be-mainlined-soon Ethernet driver that uses
> napi_gro_frags(), and the overall performance was on par with the
> variant from [1], sometimes even better due to minimal overhead.
> net.core.gro_normal_batch tuning may help to push it to the limit
> on particular setups and platforms.
> 
> iperf3 IPoE VLAN NAT TCP forwarding (port1.218 -> port0) setup
> on 1.2 GHz MIPS board:
 ...
> v2:
>  - Add some performance examples in the commit message;
>  - No functional changes.
> 
> [1] https://lore.kernel.org/netdev/20191230143028.27313-1-alobakin@dlink.ru/
> 
> Signed-off-by: Alexander Lobakin <bloodyreaper@yandex.ru>

Applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
