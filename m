Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710BAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 23:57:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB9E206F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 23:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozCT1Lwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB9E206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f76Pa4M9cOPrTISdytVoJlmENv3zPZ0MWUZV5rgPz8A=; b=ozCT1LwaIGi/nHSEmwBBLtdB7
	gxtorwyahADZlB2egalui5yGKti1/+JhN9+okHS7Y6yqveCVfIf8KgRRdvsJZp1qWWnZSUhwIR3Vf
	LPSQGgIt3JPpbR+aFM854UC8Y3CHHKO0+FP6mKpUgqsSPeW+vnL5Bii6litkMzH82TTXeZyWxU9Gl
	x6Tq3YOMxpEOKt1AyUDVMF31nHW0xsup9bPDa1WUB6h53jDU9DVr4IZ7W1AFMUEKY+g0LT7eJ1jEf
	zzxNsxgcQSJjFYrChFDXpVBmjqRgB7fRVIJq+YVXxborh4LdJiyzULfi7LZZ4bx/on49NZYIY6xIr
	9xDNiZs6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1IQ5-0008FX-3t; Thu, 30 Jul 2020 23:57:05 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1IQ0-0008ER-SU; Thu, 30 Jul 2020 23:57:01 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 13449126C2B42;
 Thu, 30 Jul 2020 16:40:13 -0700 (PDT)
Date: Thu, 30 Jul 2020 16:56:57 -0700 (PDT)
Message-Id: <20200730.165657.817406443198525975.davem@davemloft.net>
To: frank-w@public-files.de
Subject: Re: [PATCH v4] net: ethernet: mtk_eth_soc: fix MTU warnings
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200729081517.4026-1-frank-w@public-files.de>
References: <20200729081517.4026-1-frank-w@public-files.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Jul 2020 16:40:13 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_195701_185403_E8FF3018 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: andrew@lunn.ch, landen.chao@mediatek.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>
Date: Wed, 29 Jul 2020 10:15:17 +0200

> From: Landen Chao <landen.chao@mediatek.com>
> 
> in recent kernel versions there are warnings about incorrect MTU size
> like these:
> 
> eth0: mtu greater than device maximum
> mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA overhead
> 
> Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set the MTU")
> Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v3->v4
>   - fix commit-message (hyphernations,capitalisation) as suggested by Russell
>   - add Signed-off-by Landen
>   - dropped wrong signed-off from rene (because previous v1/2 was from him)

Applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
