Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB763C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:28:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E59D610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 00:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E59D610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7qYCudLy66U2+nnfgjvgHH0W6m3cZTPCGM7QrIuWp3w=; b=FLHzvuMjCZLCBDBREBEl18cbE
	ttkjejiNsmp+cX8KZLpYQrOAE3kmsOvQPFlARTzwRp7YKIthQIYO66JD3Cew0isZYtYw3QJfxBcw5
	dCYqews7ux4i9HMcxOrjeDvO3GQVOmBp62YoH5KUJDfiNWDQegDqhamS+8YYHsa2iFl+nlD7zin79
	UpN1SwwU39zF+UbYBs3Y8toor8IZ0eZrcNSWUWPvmd+NJipT7V3POLM/+uEkHAmXdxOxTl1wcrt+3
	7PxO5YRcJ/e+Mqt03Lrtxy2azrV6Zsz7D4gC/95Y7ksV7HM5J49jjFKl3seKh2a6awo7ihUc6OI0C
	L5sphWkWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXCLI-000EMm-2N; Fri, 16 Apr 2021 00:28:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCL2-000EKe-6R; Fri, 16 Apr 2021 00:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FOVp2vLeDvr6lFLmtBoFt0aZDikdGSXpWTA9M3w3T1M=; b=3JPhbq7gIv4TAVKMjuDxPaRjCH
 mriQDx+vUJuKj49Dwa1abfHDliV9Q85rWnJL/yoZrVJFR3Ls/kkUzGy2RuzG+zjOPMV4ffLADJ454
 7Rpa0mSY3ze6HQjx1I4fNYU9BikpAwKiia7KLr8WL9zDN2ge6+coRSEbffzTRl4XK7z5Hdm0z53x5
 y49oyqlxrARiq8vRkz2E+yWVxYQYXigsMpbVhQL3eQgDxQ+ygM0vjfCLkDytUUPqVz1+8yqE+SYRC
 FyuKy4oJmGDNVXGVlC9uCbjWwRTSj6GXtR17kqDMMOvnCsc/3ZmMyzhqlDKbRVSm52jE0sEP2DxIg
 mDI91BPA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCKz-00908E-S2; Fri, 16 Apr 2021 00:27:59 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lXCKr-00GzPZ-Ea; Fri, 16 Apr 2021 02:27:49 +0200
Date: Fri, 16 Apr 2021 02:27:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next,v2] net: ethernet: mediatek: ppe: fix busy wait
 loop
Message-ID: <YHjaBWdMzrhajq2Q@lunn.ch>
References: <YHjH3DxteZrID2hW@lunn.ch>
 <20210416001148.333969-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416001148.333969-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_172757_922461_ED7DDEFA 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, Apr 15, 2021 at 05:11:48PM -0700, Ilya Lipnitskiy wrote:
> The intention is for the loop to timeout if the body does not succeed.
> The current logic calls time_is_before_jiffies(timeout) which is false
> until after the timeout, so the loop body never executes.
> 
> Fix by using readl_poll_timeout as a more standard and less error-prone
> solution.
> 
> Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
