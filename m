Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1C7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 21:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ddfhd8XwpJplivFsJcCTYCRWaroeD5Sk1QzcIWWbS0c=; b=YtT16wCllbTq/x0ddjDll+/Nqe
	4JqOZTZvF6UHE7i2GE+iuBZS1pt8YbUAAIXKYEBDZ8vR5S/c5eXiY0apxZVYe4VDPXI24DgFMdSww
	7avanmYJSXn2fkr10OgzaYpFB8c7ikKNVRQ+7v2ZbSNBrhexHYOMupHo0UQsdK5EotnNUadZwYIcV
	CpJcx5EomvUoBk10t90IF5zucuZvv/3y2HJ1M338tRqX0AG6Eybnfu15JgGOp5gY3ZjPLM9IGODU/
	D7fUfOYKYPA1nk/FytWBpq7GAVTHBAFKGlSip1Kk1Y2ilsCWfYVrM+yMtNwKqv2oLz/ENXrHgtwtO
	XtEtz7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9Zc-000cZb-JQ; Mon, 07 Nov 2022 21:22:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9ZS-000cX5-0g; Mon, 07 Nov 2022 21:22:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id l11so19635906edb.4;
        Mon, 07 Nov 2022 13:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddfhd8XwpJplivFsJcCTYCRWaroeD5Sk1QzcIWWbS0c=;
        b=Vy+4wxJA858HcqoCK36dhDhINBXnhv2nNfAeudikvcqnMjt4BeCjjPNOutf2MHEISB
         rKnZa/bY+ndMJsOY+D9hqnnFJj7SVekwqfY7YUzgvyZnC2WFkL749Fqcvw2Ua7yddi58
         J6VIqP+D9q0qWbMsDy6/Szyr+JjA8lByTCbKEbR/SbeWxHVT1ATRe//GcFKGfKLGNwCk
         WtS5mG9Y+Uq4IA2KxpKxFDZNNNaB2m9+1qDhGs3TuBKJlW75KGc5Zi4EAuBUoxdpzFMy
         qW7IInIrO9+7KZCObQPN7q0BRVaj6cf6HDk3e2Pb1jF5aW4VwTPxS6Xu8Dybb2d4v7CN
         LIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddfhd8XwpJplivFsJcCTYCRWaroeD5Sk1QzcIWWbS0c=;
        b=VjJ8zGTiY/c5gxYfXfJCtPH/0vR33S9Oj3j3hk4OkR5WCulqbJbK3L5zg3p0HR9bSp
         SKGTV09QmtyI+j+BF06amQYzwRgZSVR3IXLY/ZJYV7fGGCR4m+BhrbEFa4ZRb2ozc+jj
         SrAD9G1JPZq4hybR5cyXEH4hLD+A1+hgcQnqRG27jar9ybf53LR4FusNzosBHz4Ujapc
         Ty8NCucndUfmjhsOiv5Pb7AeF9/IYaLzp9zq5rCbulMK+Sxb/ai4pl4ITvf4nThZoi7e
         jCqV2+NZkeypjAmsdKg+jeM8XLzirBgKIuLBg2dM5NEeeNbjXHOxWEbo/2l85XqLXBLe
         gmRw==
X-Gm-Message-State: ACrzQf2uLoVbD1nFDppnErDWt/GJSCdf2pcvmR+yukzXtHro6j2qTMfY
	kwIvpYWVCA4pcJdaJ2V2Q+k5gJKVBzm5UQ==
X-Google-Smtp-Source: AMsMyM547z9exzJ4wJkpKqv+MqMTl8XFdxtr/iBjb4PZ9RziUaFERL6bJernT2uTQc2z4uSNEne6xg==
X-Received: by 2002:aa7:d5c1:0:b0:459:2515:b27b with SMTP id d1-20020aa7d5c1000000b004592515b27bmr843867eds.338.1667856135756;
        Mon, 07 Nov 2022 13:22:15 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id m19-20020a056402051300b00459cd13fd34sm4615155edv.85.2022.11.07.13.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:22:15 -0800 (PST)
Date: Mon, 7 Nov 2022 23:22:09 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] net: dsa: tag_mtk: assign per-port queues
Message-ID: <20221107212209.4pmoctkze4m2ggbv@skbuf>
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107185452.90711-5-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107185452.90711-5-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_132218_098838_45A320C0 
X-CRM114-Status: GOOD (  16.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 07, 2022 at 07:54:43PM +0100, Felix Fietkau wrote:
> Keeps traffic sent to the switch within link speed limits
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  net/dsa/tag_mtk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index 415d8ece242a..445d6113227f 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -25,6 +25,9 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>  	u8 xmit_tpid;
>  	u8 *mtk_tag;
>  
> +	/* Reserve the first three queues for packets not passed through DSA */
> +	skb_set_queue_mapping(skb, 3 + dp->index);
> +

Should DSA have to care about this detail, or could you rework your
mtk_select_queue() procedure to adjust the queue mapping as needed?

>  	/* Build the special tag after the MAC Source Address. If VLAN header
>  	 * is present, it's required that VLAN header and special tag is
>  	 * being combined. Only in this way we can allow the switch can parse
> -- 
> 2.38.1
> 

