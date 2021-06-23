Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2560C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 17:20:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931E5611C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 17:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931E5611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUdFrT7UKfnQtsO+XZRqxPGGgr2M4KRhv7hAlypB6sA=; b=ysiYSpL5qlRhER
	eJf6y4ar1i/7uRRTR+Z6mhJYt+PDSn4fOagbm7S/70We2aSydxIMPm1XCUT/pAmTA3OjOMnqGZQ9Z
	ec+ykb6x0MZTgVhJLcUU5JgddDqLjDm7Q3+hAg9nazJmX0OUMeYXxmzoxKMd3t9+ei2xPGfhcbOVl
	Pn3bL1/Uxk/1SifTrS7EieAeSKJ7dLobqb7dX7m/377lhnrLQdTL05PzkoJ204cIqIMtEAKURsw6Y
	rz+SMxEAGotQxgg+uxdLowNC1KNGqPdXdPrStHpYz2Fyzbdqrif/VE64OiQ9dFc+WDo+boCeXFrTZ
	D03rlq3vSJmnDXo+74ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw6Xo-00BNJa-Ul; Wed, 23 Jun 2021 17:20:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw6Xa-00BNFz-MD; Wed, 23 Jun 2021 17:19:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B18E611AC;
 Wed, 23 Jun 2021 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624468794;
 bh=jKyYAR836m83Pum8UbxthFZqnbIkz8NbuPp5frmUkn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T45psABiJrEhVhCqb/ImjGcszfmX9w0eT/d7Q3FDPdnROLpNDzU1UkMmmWaRZy9zt
 Dnt1TbJrrblELZToRz0uD/hQsrJ6BE3gMWzEjIMzVqiCuwWTuWdh7R6COLdC/O/NGo
 7hITBfKI54HEKuPawPDHOOxH4fmzoLRX8I94aQLU=
Date: Wed, 23 Jun 2021 19:19:51 +0200
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
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Message-ID: <YNNtN3cdDL71SiNt@kroah.com>
References: <20210623113452.5671-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623113452.5671-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_101954_805096_9C775E51 
X-CRM114-Status: GOOD (  15.71  )
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

On Wed, Jun 23, 2021 at 07:34:49PM +0800, Rocco Yue wrote:
> This patch add the definition of ARPHRD_PUREIP which can for
> example be used by mobile ccmni device as device type.
> ARPHRD_PUREIP means that this device doesn't need kernel to
> generate ipv6 link-local address in any addr_gen_mode.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/uapi/linux/if_arp.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/if_arp.h b/include/uapi/linux/if_arp.h
> index c3cc5a9e5eaf..4463c9e9e8b4 100644
> --- a/include/uapi/linux/if_arp.h
> +++ b/include/uapi/linux/if_arp.h
> @@ -61,6 +61,7 @@
>  #define ARPHRD_DDCMP    517		/* Digital's DDCMP protocol     */
>  #define ARPHRD_RAWHDLC	518		/* Raw HDLC			*/
>  #define ARPHRD_RAWIP    519		/* Raw IP                       */
> +#define ARPHRD_PUREIP	520		/* Pure IP			*/

In looking at the patches, what differs "PUREIP" from "RAWIP"?  It seems
to be the same to me.  If they are different, where is that documented?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
