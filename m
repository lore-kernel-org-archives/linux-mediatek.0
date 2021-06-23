Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E40BC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 17:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585A9611AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 17:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 585A9611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySaZ+HNvK9Xmg5mL14wVnroaCvNDw2pYvzkNPtvyddI=; b=PsxKtVUM1cwCSq
	kpIvSrSjOvEyWYWiHiuzOetw0rXsIq5irAD81D/QigmKDsG0b/vx3iiC2SZGoBZxCi+loxFvnwwVC
	B25VPonq+mfSpKjzOy0521VjBYmpzXt9Jbm+eGXQSYyKjKSkK7II/7/cBvAkXllpTZBV9whaVO61f
	YQuccSohszCKAYwzNLJfCP0tPu0aTgJd+jFdfCQumhNI/sjd1O1/6Gkeq63QrComXwSDipQH51BQb
	OR+NzeDHg1OG0VNANrQBzGtEKoJymX1wHy7QXkEc6wnpsdYxdNeWKe9mfR6JmfC0tcOqS3QuHkOyY
	qIl5uSnPGtqLys4L98SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw6cy-00BOAF-Rp; Wed, 23 Jun 2021 17:25:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw6ck-00BO7G-KB; Wed, 23 Jun 2021 17:25:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F90460FEA;
 Wed, 23 Jun 2021 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624469114;
 bh=bskff73XWWxpgTzfK/jxsxgtC9fuGF5fnf7xrQldBiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCpB9iw5B9xMuFtds+/77jyu3PUVIeGnJOh7aSkDfU+i9UFz1z++SvqO0NMGZPQSR
 OozYnLZViLOVukzCYAa1vdB2QayAFjbBSjJsv4kORIzf+UJ8e2ihfvZQTRbqxw6mxP
 bSSNEYQ6uVLgacK5Tz4kieKkqjnjWjStQE5LzC9c=
Date: Wed, 23 Jun 2021 19:25:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org,
 wsd_upstream@mediatek.com, chao.song@mediatek.com,
 zhuoliang.zhang@mediatek.com, kuohong.wang@mediatek.com
Subject: Re: [PATCH 4/4] drivers: net: mediatek: initial implementation of
 ccmni
Message-ID: <YNNudzDzzx7ZBwf+@kroah.com>
References: <20210623113452.5671-1-rocco.yue@mediatek.com>
 <20210623113452.5671-4-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623113452.5671-4-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_102514_746559_A6EF2540 
X-CRM114-Status: UNSURE (   8.33  )
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

On Wed, Jun 23, 2021 at 07:34:52PM +0800, Rocco Yue wrote:
> +EXPORT_SYMBOL(ccmni_rx_push);

Why are you exporting symbols that are not used by anyone in this patch
series?  That doesn't feel right.  Who needs this?

> +EXPORT_SYMBOL(ccmni_hif_hook);

Same with this, who calls this?

> +++ b/drivers/net/ethernet/mediatek/ccmni/ccmni.h

Why do you have a .h file for a single .c file?  that shouldn't be
needed.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
