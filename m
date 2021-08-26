Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0FAC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:04:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD2D610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BD2D610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Okuhlmk3IioBFxCNp4JkTpdJWN83HspLpnD7prQCGWo=; b=T1n/DUhZFhRUDC
	UYyicCt5RmggEFqW7ByfV0RhNOBmpKCKsvijB+f42x8y1tfk32gBq5uLmXS6ZDklDoMwgu7AwK1xE
	c0SuPMlg6H4aHjtVW15m/G7PhWtJKdk4JYO4ZKA5qWwWm6d1F8CS+uDVcWBIzsuzjfKYZ1JkIquSZ
	z15lEBk80XrFA2d44iPpSzI95XrgCAjoPIy4XBLuAIGAdWndEsFUWjMZ7jORsmY+8XaGjSBnAraNd
	9bbZAV8mh54rR6R6QtrWWX/s52lDvfveqRYD4UFdfsJ2L8AZG4S6H5SM5vIQyxiqvS4HjfKE6Dr5r
	tRd6c5XD1L8n8n3OWIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ2sK-008jkl-Ob; Thu, 26 Aug 2021 00:04:08 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ2s6-008jgM-Sz; Thu, 26 Aug 2021 00:03:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n5so1952061wro.12;
 Wed, 25 Aug 2021 17:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KlyUydUojzLZ6p39N0u7umX9ajU71wqXxuDHFIBSfEU=;
 b=Dv6rvcAy935B8kJHZeiXg1EHaPpGS/ccJWcMk4XgNNtcK5Oeydjb2bNPjkQd1lXaIG
 8o+CcNDSyvnJUyWJoGzXTKOa213z8OK3xJroNWMa+lyzzv0G5+ql26itr/qPKAh/ewMU
 wndNGicDyUXxzr10DqhQNJYmbQkzWvdTBVOYRxVc0c/cixHw8AMiC/KytLiuWuzzuJz0
 qmjTm+1jk+qpoGEFqYso4XbtEeGp6TE+QmCUW8DDEvallXyAcVYZDkjfEAql8Kl6B1WV
 y4i6sdlbibCViJNqRMiV8M+lhWYKXg9oQqznY2t8Nti01xPQH3jkfSnO+mHMP2cTxDjq
 KAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KlyUydUojzLZ6p39N0u7umX9ajU71wqXxuDHFIBSfEU=;
 b=q8kGPq7S8pJBdbEOqv8ZtIyQQmj4jnpiklrT4SYvFl5Vg0y0OPrWE+FSN28sIeahUf
 UT8mZpV2dReB6inqmEc5vmm/7EHOmyqxZHnlMet9rzeAaNMfCJ774nwaV5OkK/8b5qSP
 ohyxL784A9nZcANimDzwo51YsxVvbe97C+vD9Wbtd0g3lkMYYDHJzTSda+XNKmjwb00k
 e7wUJN32pip9XB2knvCVZfYSoy28d0cXIZrK9cUEaiq8Ath7HTmRLOM5Vv/HFMqVX1Hf
 JZ8TKP2Lp9j/T/UvRoIKO7bgam/9OTSIpNn/AOUzX7ygzIpFzeBX87WHiLlmbOV2cOA3
 oYKQ==
X-Gm-Message-State: AOAM532Kh/wyZym5wOicw4kHx+nVms5S7dlXIjmClK/2pX6+H5Thzc1n
 tnj2LZmmzgcL3MmcH/odIKw=
X-Google-Smtp-Source: ABdhPJyxsFed58Wr4UAjdzzLGAYuNMTG0LWiYGwosZW+7Y6qfu8vac/6EBVf84Ot+pbxF8R+VrpZIQ==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr637031wri.185.1629936230707; 
 Wed, 25 Aug 2021 17:03:50 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id r8sm1353839wrj.11.2021.08.25.17.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 17:03:50 -0700 (PDT)
Date: Thu, 26 Aug 2021 03:03:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion
 on TX
Message-ID: <20210826000349.q3s5gjuworxtbcna@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825083832.2425886-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_170354_981740_31FCA6A6 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, Aug 25, 2021 at 04:38:31PM +0800, DENG Qingfang wrote:
> Advertise TX VLAN offload features, and handle VLAN tag insertion in
> the tag_xmit function.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  net/dsa/tag_mtk.c | 46 ++++++++++++++++++++++------------------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index 415d8ece242a..e407abefa06c 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -22,7 +22,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  				    struct net_device *dev)
>  {
>  	struct dsa_port *dp = dsa_slave_to_port(dev);
> -	u8 xmit_tpid;
>  	u8 *mtk_tag;
>  
>  	/* Build the special tag after the MAC Source Address. If VLAN header
> @@ -31,33 +30,31 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  	 * the both special and VLAN tag at the same time and then look up VLAN
>  	 * table with VID.
>  	 */
> -	switch (skb->protocol) {
> -	case htons(ETH_P_8021Q):
> -		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_8100;
> -		break;
> -	case htons(ETH_P_8021AD):
> -		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_88A8;
> -		break;
> -	default:
> -		xmit_tpid = MTK_HDR_XMIT_UNTAGGED;
> -		skb_push(skb, MTK_HDR_LEN);
> -		dsa_alloc_etype_header(skb, MTK_HDR_LEN);
> -	}
> -

You cannot just remove the old code. Only things like 8021q uppers will
send packets with the VLAN in the hwaccel area.

If you have an application that puts the VLAN in the actual AF_PACKET
payload, like:

https://github.com/vladimiroltean/tsn-scripts/blob/master/isochron/send.c

then you need to handle the VLAN being in the skb payload.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
