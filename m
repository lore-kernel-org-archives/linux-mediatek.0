Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4513FC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 13:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5766128A
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 13:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5766128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3QxsgsVDllK1MpnvPcjiLICuO1eRO6UFaRk4EsP3jA=; b=R/JOUxWFyUKTBXysL9SvxL8FHf
	dDYrMZmU0P66pyTBWuXmVnlXUPyRvdp+rmuBBdx2C9yc1dZjEhey/fnfjR1OT7JjzJCUecLYTND3l
	4xmCZuXMsL9MsxUfMphT768j/QY/BIhT3Ko1UVGksCAcfJgeeyx57cFIGw1CSLR8DG7t90M1lPFbA
	gwjW24K0UQT8clxhub3Nww24VY49a0a2iJOKizBor7Fwgj4wB1gn1tlvmOSVfgPSX38xx/TgGNHmx
	rbkABQUu6JIWW0JvI9pjvtkksmAVG89cgC+bk6lIxVUmutzf+4u+OxL9H9ZQuI+u+V0q4EvN6tMrn
	5kJZgU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsQZ2-00AWfn-Cp; Sun, 13 Jun 2021 13:54:12 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsQYp-00AWdv-He; Sun, 13 Jun 2021 13:54:01 +0000
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
 by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsQYh-000NnB-6r; Sun, 13 Jun 2021 15:53:51 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 by asmtp012.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsQYh-000JXF-4H; Sun, 13 Jun 2021 15:53:51 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
Subject: Re: [PATCH v1 2/2] net: ethernet: mtk_eth_soc: Support custom ifname
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>,
 Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210613115820.1525478-1-code@reto-schneider.ch>
 <20210613115820.1525478-2-code@reto-schneider.ch>
 <20210613122043.GP22278@shell.armlinux.org.uk>
From: Reto Schneider <code@reto-schneider.ch>
Message-ID: <aa7a15cc-761f-00b0-5582-a8045d8f30ed@reto-schneider.ch>
Date: Sun, 13 Jun 2021 15:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613122043.GP22278@shell.armlinux.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_065359_640185_EFBD5C74 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Russell,

On 13.06.21 14:20, Russell King (Oracle) wrote:
> Please don't use strncpy() - this is a good example why strncpy() is bad
> news.
> 
>   * strncpy - Copy a length-limited, C-string
>   * @dest: Where to copy the string to
>   * @src: Where to copy the string from
>   * @count: The maximum number of bytes to copy
>   *
>   * The result is not %NUL-terminated if the source exceeds
>   * @count bytes.
> 
> Consequently, if "name" is IFNAMSIZ bytes or longer,
> eth->netdev[id]->name will not be NUL terminated, and subsequent use
> will run off the end of the string. strscpy() is safer to use here.

Thanks a lot for finding this (embarrassing mistake) and pointing me in 
the right direction (did dot know about strscpy).

Will send v2 soon.

Kind regards,
Reto

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
