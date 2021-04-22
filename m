Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D39C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 16:26:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6A061209
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 16:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6A061209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CbpX1bCc9QTnvhtXBjorJx/3W4tUphCMJ4MGJvxabjw=; b=F5vVIkwTHiHSuUl5JrExGs/W5
	pYEoN+TlGHqifnzEloXU3v3o0dNUXCsp6kK2kANhOulk5ohSksYVRQnXYkFZQ5BUK0ydW0b+QVSO5
	tZeJ8RoCMn7/sWrQ2UvFANUNmGDWWfMNWYD3zaqrAi98n6KwYjeLP2rFY7eirQnTSYnb+k3SqUCKe
	PBJ5gEgL63nxDvufe94PCocfO/CdoSsd25x3wkxPW8wd5wvulAh/Nk/SP8fbnWhuq54sP89uujOSZ
	VfKwGZ0CsDe3jSWW1ly+1s7vOhaKgwtz47vYeJT2foPmXvc454okyaLmcLsfmRdHI8vHF5EGMN5W8
	TAt5Jr28w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZc9o-00H3pi-9d; Thu, 22 Apr 2021 16:26:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZc9d-00H3ov-5a; Thu, 22 Apr 2021 16:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=gVybRWJFc5lywM3Z+b8dBIeE9ingG17eKCymsC5C6IA=; b=EZHaxcXcyOZVS+oAXw5fOn2rgo
 TAKlK6TrLGDAaiWp1AvvxEgnc0RaYpB7MNA7NGru92O2Kj++66/lCtBrZuPI2F8lPqf/IB5SxxZdg
 9eaYhfKVOq7WjQyYvbXCHZqitaYRGQ8JTlhrErLOmhXj7QaMHLB9PTUzQN+nMJdx0CMaTiauUN4tk
 dQ7ebZBVtguGmUjGJkIDRGpsQoydTrGhhv17vktR14C1TzPJfRp13yY6SpeuPuHjhvjK3E4RiS6xR
 Rd9l4LQPLwBmGf3RwCNQdOmTrMPLjULWv5eZicCwG+pEWzfOVuy84CjBs1qlSZhrOTWDzmQXYmPVf
 iR5JLy/Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZc9a-00DqFJ-PK; Thu, 22 Apr 2021 16:26:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED2BC61417;
 Thu, 22 Apr 2021 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619108769;
 bh=I2WaeiJyXXVput4O2vCSGgTUD62VIg+b5/9OZeNer4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ddbkm6nULFik6lQwyUg+f/HHVor/75WN2z3nfh4Oo6zHjiWZxu5/VAtCyW0ZGJKSJ
 LF/ux71hVBLC17FtLb/EmvHw9zQ86i6Ut0OztUwIODFKyTMcs60pwj7LU7M6JGbnI1
 z0y/Tl3WJESFarWx6KK2gVHPlYO6xI7a2dwEkc3wapcCL0pcj4w2guHsKvRQ0mn/oS
 jNT+pMOdh/CH1RfeQXiWCuD5R5bYhssn96MvoR699jvn23c256fBLaReArtohsEOPS
 cwAnXiPoxL1iqmCt7LuL2gMHZP0iJ/LYMOPJJWwsisXxcZqIFcGB6I7jdrNdLFFyF3
 5MaLju2cAyIXQ==
Date: Thu, 22 Apr 2021 09:26:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 12/14] net: ethernet: mtk_eth_soc: reduce
 unnecessary interrupts
Message-ID: <20210422092608.6b8ed5ff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210422040914.47788-13-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-13-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_092610_907760_D6E1435F 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 21 Apr 2021 21:09:12 -0700 Ilya Lipnitskiy wrote:
> @@ -1551,8 +1551,9 @@ static int mtk_napi_rx(struct napi_struct *napi, int budget)
>  		remain_budget -= rx_done;
>  		goto poll_again;
>  	}
> -	napi_complete(napi);
> -	mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
> +
> +	if (napi_complete(napi))
> +		mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);

Why not napi_complete_done(napi, rx_done + budget - remain_budget)?
(Modulo possible elimination of rx_done in this function.)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
