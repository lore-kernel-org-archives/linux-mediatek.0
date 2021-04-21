Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FB4C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 21:19:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B898F6140F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 21:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B898F6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z22NSrAbZoXaqAGmLHKC56sKB7nRZ25LaVqK7lJtqJY=; b=hG4QAadHUKYX/eBvCVO69cPvT
	PSulrPVoKdb4ElGrZCC1kf43NWD0CdXcIJ9jjTGR3YqYbcm6/+8nK+c80U1viwROlDvqUDY8zoQZj
	T77GxWOeB0hu/MqpblvISea4ScWzOvlYu63Kmmcz4JUtJeUo9rGS9HJ6RfwfNaLiAY8SsDSl/9pT8
	oegODEts+8764zfUZoxCOgRjWGBEV39521zull05tQUPAzcRQ9jxx5wPkjy351TWcebOnUrEgoglL
	4RfYY56Aysg93fRLVwCn97E+/ax73+M3adVvzd9zWRVEMPT6VM6wNhs3ZFee7OfFysk5eZg/xg7D/
	hfCz6hdIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZKG1-00FDQS-CF; Wed, 21 Apr 2021 21:19:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKFn-00FDPc-Mz; Wed, 21 Apr 2021 21:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=/zCIIFL1GCBgRmLE1MQYC8dpYz/9OyAnNShFhPOZZ4s=; b=M/XgBfy40Ttj36QD8yT8IoMtan
 RD4rAlIoA1fVI88ggJVkiFPbKATzxpRsF5JYySE7dgThJ9ghT0sOwLii3bvp0wHj+F/1Gq+rLJlPW
 822Dl5FSanE2G2eS6wza6s2p+SrPF8Hn5CEF+jNcA/hPIWvlSY0KRD40Zi1KE/2NvC0tnIKUsrHMC
 cwUVX0jztSgyd05UiKb10Dl407p33sVGezETNYDiD5qIhvaIwGmAceBMR8MKcr8DXjM8KC8C4E/Uz
 4H2TXlgN724jtKI+P/zxw+J6bJzHuwBrnkULm/zlY+9hE0R6YrKxxmdlp30+Y8hKldxuaTYh6PJzF
 D3cZmAiQ==;
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKFk-00DCPp-VM; Wed, 21 Apr 2021 21:19:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id x20so10023138oix.10;
 Wed, 21 Apr 2021 14:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/zCIIFL1GCBgRmLE1MQYC8dpYz/9OyAnNShFhPOZZ4s=;
 b=fklLY53GY2HezmGnoaro/Sgc6Dz0WbjTyOZArd8+HY6T+4w41s5cb7ppkUizyjZ0+2
 RrzYAOSKmnNcG4N/Xtt6e3dnXIN0DPB+LCR/j/yfxn8wA1UmKzd/jH/2r208+sFRxI3G
 dy/AaBvWCXpMQ+rA8To1/bRBVf/N6uaBc5HpFpdzt01gySPE3N6ypzmkqjcJV0g9fFCl
 Cd38s3ZiiGK35FyDny/mqE4Fau1+HTVL9V+XCl4h782fiV8ZwsMHwVba89w0pFWHRVBy
 RSSsTGW5W4Rpkr6bpFYbciStXW+iTL+exjW886zI03AGYjbk2fdHuDx4oiLK8HJmuKtD
 6r4Q==
X-Gm-Message-State: AOAM530G9av5eWm0mrBdgfuooH4vZl+1+ay7Y7GF0w0IDfg4392zkkDS
 1x5Litmp7dDtab0XrDHHKg==
X-Google-Smtp-Source: ABdhPJyjoWEzjl9qveDytM3botwyCf+n/PmFgLRlcEgYx6IDU0UzqnFaGinghjGAzmRkrdgFAO9y/g==
X-Received: by 2002:aca:408b:: with SMTP id n133mr8194678oia.13.1619039959996; 
 Wed, 21 Apr 2021 14:19:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w23sm153439otl.60.2021.04.21.14.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 14:19:19 -0700 (PDT)
Received: (nullmailer pid 1637631 invoked by uid 1000);
 Wed, 21 Apr 2021 21:19:17 -0000
Date: Wed, 21 Apr 2021 16:19:17 -0500
From: Rob Herring <robh@kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Ungerer <gerg@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: mediatek: support MT7621 SoC
Message-ID: <20210421211917.GA1637579@robh.at.kernel.org>
References: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_141921_035444_B00CAC7E 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 18 Apr 2021 20:42:53 -0700, Ilya Lipnitskiy wrote:
> Add missing binding documentation for SoC support that has been in place
> since v5.1
> =

> Fixes: 889bcbdeee57 ("net: ethernet: mediatek: support MT7621 SoC etherne=
t hardware")
> Cc: Bj=F8rn Mork <bjorn@mork.no>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-net.txt | 1 +
>  1 file changed, 1 insertion(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
