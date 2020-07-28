Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DCBC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 14:14:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53ABB206F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 14:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1CVnKwuq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53ABB206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CI23rokdVZVX9CobuZcmzOhdjUqOyhmzDpge2k0X5Y8=; b=1CVnKwuqX6KYXOsxhn4N7NuxG
	Xi1PFN+qLOjOWfpP1lUYRzsxRHBvnQqNv0dyPziMMr6gAV5wYlX3MnMrXcImhCgBMBC3SBNoS5k51
	CLRlvvwax4StSs5x8AKjdP7aFgEav9y0no+KmnE7BZlKzWn3pASwnFb/hTMCsKm1Oqn3JJasiGKf5
	GGxl0Ch8f+ZTC+tv+oA6nWz9I+Za1Ec+QuuurDb7RD5xzw5dn6roDlTYFDrII4gnFXhyUqTaodxfq
	Wamvx2xUSlz8RLFC8G9RnyQjXAV03O+qB10Gv/gThwwOYh451fg8YIQM6hHmDLUMEIhJz69+2x40P
	mEq0P0CuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0QN7-0006k0-J8; Tue, 28 Jul 2020 14:14:25 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0QN5-0006j1-Ad; Tue, 28 Jul 2020 14:14:24 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k0QMs-007I2f-6T; Tue, 28 Jul 2020 16:14:10 +0200
Date: Tue, 28 Jul 2020 16:14:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200728141410.GG1705504@lunn.ch>
References: <20200728122743.78489-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728122743.78489-1-frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_101423_391602_3DA926AA 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 02:27:43PM +0200, Frank Wunderlich wrote:
> From: Landen Chao <landen.chao@mediatek.com>
> =

> in recent Kernel-Versions there are warnings about incorrect MTU-Size
> like these:
> =

> eth0: mtu greater than device maximum
> mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA =
overhead
> =

> Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set th=
e MTU")
> Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
