Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE562C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:21:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0CD2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RChgG6eA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0CD2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkgYDVKxWHqJoBL0UmLLTUwjjdkZiKQFuQUWZT3yU74=; b=RChgG6eALnvpHfp21uaTUvq2T
	W/lzffR3NvO0cWVgXDhq0sZ130me/g8OULC6Gwfuz1zWEDyZU7lsr5O5cKTVZBA/OBWd1zALzqMDo
	qTUkzg7j8U3roCISDFxnXFSjIRw+E8hW9e/nGcCn766gt6V/UUFqTqF6h7QycyemFpuQi0GhyIDZi
	nlY6XMut6yPNdjpw/ltUiJgx1lIJ2V4nt7JfeRKwNrRrpaRidQUvHNs93ZrJrHoyv/zxXgDEw55VJ
	CIHiG38qnLCD1Wh3HoiHOG4Wo1NdkCZlyS7UGYdS9qCsonR5V+ymZrs7GRN498Qszhmqd9qfyLuG0
	zEvy/upHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACPM-0000hw-Kx; Mon, 24 Aug 2020 13:21:08 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACPH-0000fP-KZ; Mon, 24 Aug 2020 13:21:04 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 00B6712824063;
 Mon, 24 Aug 2020 06:04:07 -0700 (PDT)
Date: Mon, 24 Aug 2020 06:20:52 -0700 (PDT)
Message-Id: <20200824.062052.523630350034926727.davem@davemloft.net>
To: sylphrenadin@gmail.com
Subject: Re: [PATCH V3] net: dsa: Add of_node_put() before break and return
 statements
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200823193054.29336-1-sylphrenadin@gmail.com>
References: <20200823193054.29336-1-sylphrenadin@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Aug 2020 06:04:08 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_092103_947433_34CE46CD 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Julia.Lawall@lip6.fr,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Mon, 24 Aug 2020 01:00:54 +0530

> ---
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

You only need one Signed-off-by:

You must not put the signoff after the "---" otherwise GIT will remove
it from the commit log message when I try to apply your patch.

Combine this with the fact that your change didn't even compile
properly up until even V2, I wish you would put more effort and
care into your patch submission.  It feels to reviewers like
you are just throwing this patch onto the mailing list without
much care or testing at all.

Thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
