Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75185C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSwaKyieaNLBHJKwwcJJr26IlHtvVHUoS2b1gHR6/Wo=; b=yasjHRje/70XNw
	I1mRH7C/H8+/k3n4EySnRattQ8JgdFEMhQzs06jtyiZlv5eTejYTkdfJ44xS7voeGor2YxFTkQ558
	H30qw3trxTb62ln7TF1fAhxzguM6rtVuTxBUHsrSLb+UKYNQ5U2wcJyZIYRSPTHdxxpYGaZ6ZPBi7
	85yI7XI/dcJufbSXY5otYCN8ud6dMqvAcJa7AaMZjeQ7qbKYcw+vrBvH3H93RXzMznopS0AJvWd8q
	hJO8tdLaZX0SyNUwd0i3jwEuBphJWdo7k0aoe87fwM6fl823zbtg3DQKe76fu2SAXEzdKro0f4TE7
	Brp7pxC8wGDSCFaxLE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noP7V-001vop-QY; Tue, 10 May 2022 12:37:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noP7J-001viD-Ub; Tue, 10 May 2022 12:37:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id m20so32633779ejj.10;
 Tue, 10 May 2022 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cosidqETohHtF0bI5X8WaN3KLjN3jNK+X2ZAPFOKt/o=;
 b=q4WK37dxm2Rg4AHUGk7Wi4kVtwYOHay21u/XuI4XfzNMEyT71Bvff7CmdlnIImsooi
 L9KZIsHxZVuWcbld60k2dRE1nqPdvX9iUDQ/esPVHs7fcjwcgF7tkxvdGJpoR7XYudXS
 muSWsZuXTbqKGCFiSWFmdAHNrCg+ULsFjyrHjBA46B/e3zy9cUsu67O3uGCKSvgG133o
 4hrnYv3h1uEIGEvcaT4O2aifRc6c/kxWAjp3TYhEdZLe/7JVVeLFsV+lyb3uIBNdTlUH
 0kc5vhNXi72hrStZ8d+wUYkAQooUtteY91qjzO6B48GYNOdakRtplEzhT6qK2XZcu76a
 nlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cosidqETohHtF0bI5X8WaN3KLjN3jNK+X2ZAPFOKt/o=;
 b=E8RYMLo6W1SMSJfWVybQtYICV6/3w8YmA9ca945ZUjk/Z/B3uK9STzhCRNpa8uvMre
 ZvrpsKS5OeTWEVjc1DHWdJkkzvlgE8UqlcOvXiMoA6aWrAXj5eEJigOjiH1NEEalGCoQ
 Vt90dJ6Iyl+Nobpsw1CSqy5tDkGphFuELPqEjIhriljDy7r7fuK6cXmp3bW6jhM3Ihek
 OJ/Nc+ux2e0Qz8SSUtKHgp+xUT8yYhn0wA8PHKNKl2WIg34z16RhFRju5c6r4MVgso9p
 B78UulpQCWEONqCUBDBoZIGb68zDHTiKWZ2PX+vHVWYcNLVyyRQ1qM3uWZi45ZvhwLnh
 KDeQ==
X-Gm-Message-State: AOAM530FwjmiFlPV+DtcwxKVHkUdi5QmsenVN49a9yVBTTwjESU64b5R
 gBkfePZBnt5A6ylBRcvExgw=
X-Google-Smtp-Source: ABdhPJyvR8it5vxFmmtJtLeJIPRxLec58Z+2m8Tzbxt3mXDU6pHSDFlsyogmrno+6KSTWUzIH/zjyA==
X-Received: by 2002:a17:906:3ce9:b0:6ef:a8aa:ab46 with SMTP id
 d9-20020a1709063ce900b006efa8aaab46mr19291235ejh.579.1652186247272; 
 Tue, 10 May 2022 05:37:27 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 e15-20020a50e44f000000b0042617ba63c7sm7576578edm.81.2022.05.10.05.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 05:37:26 -0700 (PDT)
Date: Tue, 10 May 2022 15:37:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <20220510123724.i2xqepc56z4eouh2@skbuf>
References: <20220510094014.68440-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510094014.68440-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_053730_039453_CAF631BF 
X-CRM114-Status: GOOD (  20.46  )
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

On Tue, May 10, 2022 at 11:40:13AM +0200, Felix Fietkau wrote:
> Padding for transmitted packets needs to account for the special tag.
> With not enough padding, garbage bytes are inserted by the switch at the
> end of small packets.

I don't think padding bytes are guaranteed to be zeroes. Aren't they
discarded? What is the issue?

> 
> Fixes: 5cd8985a1909 ("net-next: dsa: add Mediatek tag RX/TX handler")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  net/dsa/tag_mtk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index 415d8ece242a..1d1f9dbd9e93 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -25,6 +25,14 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  	u8 xmit_tpid;
>  	u8 *mtk_tag;
>  
> +	/* The Ethernet switch we are interfaced with needs packets to be at
> +	 * least 64 bytes (including FCS) otherwise their padding might be
> +	 * corrupted. With tags enabled, we need to make sure that packets are
> +	 * at least 68 bytes (including FCS and tag).
> +	 */
> +	if (__skb_put_padto(skb, ETH_ZLEN + MTK_HDR_LEN, false))
> +		return NULL;
> +
>  	/* Build the special tag after the MAC Source Address. If VLAN header
>  	 * is present, it's required that VLAN header and special tag is
>  	 * being combined. Only in this way we can allow the switch can parse
> -- 
> 2.36.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
