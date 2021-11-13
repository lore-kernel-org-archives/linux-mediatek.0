Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ADBC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:51:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE6661073
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FE6661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFtAkhWQkTyuirphXixmZhFY6kH13uPEbx/kEkFBJAc=; b=MXqDTz6N821fUU
	nwQ9uW5X8cburbBRFGA7vc79HQyjfG0RuBulriZVPu0IvF47JSX2bIeLudNQ/2poURjOpjN3IfI7s
	NqbO5X9Hg/5ofKjpciWOtT0REBS36bc/c8Bf2Wi5VBGuAEw6qjtLivHxBawPXtzFlO/+ETCYRbe7B
	k7bh9D/BzmBZABsbX9KsPPiwD2vWHchJvhZ0oVuBmWWRV+yrFyqJGpT8XLe61jsh0RLbWLhrdU9tY
	EXiQyuyobIMyqQ3vlnB/vrvsLUhGPsu6dcG9otXvtW0fIAnsfEr/C4Ecq1MyEMyCMb3huYUuHmcXs
	wbEUiJ3uNxDjJ6EZRTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlol6-00COOx-KF; Sat, 13 Nov 2021 08:51:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mloku-00CONE-Ai; Sat, 13 Nov 2021 08:51:25 +0000
X-UUID: 62529c22b22d46cabe88aa9a4d71a251-20211113
X-UUID: 62529c22b22d46cabe88aa9a4d71a251-20211113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 621208852; Sat, 13 Nov 2021 01:51:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Nov 2021 00:51:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 13 Nov 2021 16:51:17 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 13 Nov 2021 16:51:16 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Rocco.Yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Date: Sat, 13 Nov 2021 16:46:36 +0800
Message-ID: <20211113084636.11685-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211109065526.16772-1-rocco.yue@mediatek.com>
References: <20211109065526.16772-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_005124_405371_B07C5D95 
X-CRM114-Status: GOOD (  28.17  )
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

On Tue, 2021-11-09 at 14:55 +0800, Rocco Yue wrote:
> In the 3GPP TS 29.061, here is a description as follows:
> "In order to avoid any conflict between the link-local address
> of the MS and that of the GGSN, the Interface-Identifier used by
> the MS to build its link-local address shall be assigned by the
> GGSN. The GGSN ensures the uniqueness of this Interface-Identifier.
> The MT shall then enforce the use of this Interface-Identifier by
> the TE"
> 
> In other words, in the cellular network, GGSN determines whether
> to reply a solicited RA message by identifying the bottom 64 bits
> of the source address of the received RS message. Therefore,
> cellular network device's ipv6 link-local address should be set
> as the format of fe80::(GGSN assigned IID).
> 
> To meet the above spec requirement, this patch adds two new
> addr_gen_mode:
> 
> 1) IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, this mode is suitable
> for cellular networks that support RFC7217. In this mode, the
> kernel doesn't generate a link-local address for the cellular
> NIC, and generates an ipv6 stable privacy global address after
> receiving the RA message.
> 
> 2) IN6_ADDR_GEN_MODE_RANDOM_NO_LLA, in this mode, the kernel
> doesn't generate a link-local address for the cellular NIC,
> and will use the bottom 64 bits of the link-local address(same
> as the IID assigned by GGSN) to form an ipv6 global address
> after receiveing the RA message.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/uapi/linux/if_link.h       |  2 ++
>  net/ipv6/addrconf.c                | 22 ++++++++++++++++------
>  tools/include/uapi/linux/if_link.h |  2 ++
>  3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/if_link.h
> b/include/uapi/linux/if_link.h
> index eebd3894fe89..9c5695744c7d 100644
> --- a/include/uapi/linux/if_link.h
> +++ b/include/uapi/linux/if_link.h
> @@ -428,6 +428,8 @@ enum in6_addr_gen_mode {
>  	IN6_ADDR_GEN_MODE_NONE,
>  	IN6_ADDR_GEN_MODE_STABLE_PRIVACY,
>  	IN6_ADDR_GEN_MODE_RANDOM,
> +	IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> +	IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
>  };
>  
>  /* Bridge section */
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 3445f8017430..0045de10f4b5 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -392,7 +392,8 @@ static struct inet6_dev *ipv6_add_dev(struct
> net_device *dev)
>  	timer_setup(&ndev->rs_timer, addrconf_rs_timer, 0);
>  	memcpy(&ndev->cnf, dev_net(dev)->ipv6.devconf_dflt,
> sizeof(ndev->cnf));
>  
> -	if (ndev->cnf.stable_secret.initialized)
> +	if (ndev->cnf.stable_secret.initialized &&
> +	    ndev->cnf.addr_gen_mode !=
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA)
>  		ndev->cnf.addr_gen_mode =
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
>  
>  	ndev->cnf.mtu6 = dev->mtu;
> @@ -2578,7 +2579,8 @@ static void manage_tempaddrs(struct inet6_dev
> *idev,
>  static bool is_addr_mode_generate_stable(struct inet6_dev *idev)
>  {
>  	return idev->cnf.addr_gen_mode ==
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY ||
> -	       idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_RANDOM;
> +	       idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_RANDOM ||
> +	       idev->cnf.addr_gen_mode ==
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA;
>  }
>  
>  int addrconf_prefix_rcv_add_addr(struct net *net, struct net_device
> *dev,
> @@ -3331,6 +3333,8 @@ static void addrconf_addr_gen(struct inet6_dev
> *idev, bool prefix_route)
>  					      0, 0, GFP_KERNEL);
>  		break;
>  	case IN6_ADDR_GEN_MODE_NONE:
> +	case IN6_ADDR_GEN_MODE_RANDOM_NO_LLA:
> +	case IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA:
>  	default:
>  		/* will not add any link local address */
>  		break;
> @@ -5798,7 +5802,9 @@ static int check_addr_gen_mode(int mode)
>  	if (mode != IN6_ADDR_GEN_MODE_EUI64 &&
>  	    mode != IN6_ADDR_GEN_MODE_NONE &&
>  	    mode != IN6_ADDR_GEN_MODE_STABLE_PRIVACY &&
> -	    mode != IN6_ADDR_GEN_MODE_RANDOM)
> +	    mode != IN6_ADDR_GEN_MODE_RANDOM &&
> +	    mode != IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA &&
> +	    mode != IN6_ADDR_GEN_MODE_RANDOM_NO_LLA)
>  		return -EINVAL;
>  	return 1;
>  }
> @@ -6428,15 +6434,19 @@ static int
> addrconf_sysctl_stable_secret(struct ctl_table *ctl, int write,
>  		for_each_netdev(net, dev) {
>  			struct inet6_dev *idev = __in6_dev_get(dev);
>  
> -			if (idev) {
> +			if (idev && idev->cnf.addr_gen_mode !=
> +			    IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA) {
>  				idev->cnf.addr_gen_mode =
>  					IN6_ADDR_GEN_MODE_STABLE_PRIVAC
> Y;
>  			}
>  		}
>  	} else {
>  		struct inet6_dev *idev = ctl->extra1;
> -
> -		idev->cnf.addr_gen_mode =
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
> +		if (idev->cnf.addr_gen_mode !=
> +		    IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA) {
> +			idev->cnf.addr_gen_mode =
> +				IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
> +		}
>  	}
>  
>  out:
> diff --git a/tools/include/uapi/linux/if_link.h
> b/tools/include/uapi/linux/if_link.h
> index b3610fdd1fee..fb69137aea89 100644
> --- a/tools/include/uapi/linux/if_link.h
> +++ b/tools/include/uapi/linux/if_link.h
> @@ -241,6 +241,8 @@ enum in6_addr_gen_mode {
>  	IN6_ADDR_GEN_MODE_NONE,
>  	IN6_ADDR_GEN_MODE_STABLE_PRIVACY,
>  	IN6_ADDR_GEN_MODE_RANDOM,
> +	IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> +	IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
>  };
>  
>  /* Bridge section */
> -- 
> 2.18.0
> 

Gentle ping on this patch. :-)

Thanks,

Rocco


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
