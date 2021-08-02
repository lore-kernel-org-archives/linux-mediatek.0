Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C74C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB99560527
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB99560527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMTFi2ZQ1SF3Ii0fqViK/zLETTx7d+b5TeOxxmtmTHI=; b=Q1uEu+1LoWc8tA
	jNdazh+opeO4YSX0UbmsTsJklx/WU2A1tnOfbVTjh4v2hn2Q5UMdhQuPSI8COvORhW025bVaOMCCO
	fJmzg5fL7/H/bN7U5HANbVY44RYYrA0bx7D7QWM5HJpvUd2Ak9PUKolcpIHGjlrfcCo03jOn2B/jy
	fU0aMMFrZBSN6hvaUhj1UuGWRj6s2wfh/AZcsKqrKpRrbqBhTSK1DZlIiUG+y6BEguaXhuCPPMH2J
	JOioGy1+VVDf3jl6ZDRpumX9DksYl45YYicpzLgeHi0C9sl49x5EsfGhwOUVPl8qmkGZH7slpgwht
	yh/ZNlZ2perUFFv9Qywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAYEa-00GSlE-9c; Mon, 02 Aug 2021 13:44:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAYEG-00GSfE-Ge; Mon, 02 Aug 2021 13:43:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id x11so30053342ejj.8;
 Mon, 02 Aug 2021 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q3LMLHUiJgMv1kBej5JGB879UzZgEmTMwjmj9nvqpWc=;
 b=gHbazKLYudEs+w+lX0U7K9hhRGdnhsn/KcpXhThORDMW3TyJSP3iStfdLH4IZcD/KE
 dWtA8BrrCZn8gGZ4PS8uDQdZIiHbJLYKoGJ6J2h2u2H2ML+69vEb1Ir0m3Vn14v16SkR
 TKrW5qITrEz9rIvsy5UqEEURLSEredQJhscto4GzmdZ7xQAyEbE8tU+FNVhmh3ML7iUc
 rq6IVBHpcBMisSS9yeOZO9xmcYujWaH/X3hEFGbBBVQ0fWK+3muiSFTPtUMyJSrxEmiV
 4YZ2pNkIB3VO7C1lghjUihRb1VoUWdXDZoIs2GyL/2B9clA6NDLezCKwtqQjDn3iB9rY
 cPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q3LMLHUiJgMv1kBej5JGB879UzZgEmTMwjmj9nvqpWc=;
 b=Ekz52qHMuNX9C4T+ZMyqXpj/S7rdvo1Jor1cdtufVuUrYzOZ+bCuB4J1kt/VaU3bk7
 /qxRfbAnvtd51BgpedWWLEafn6o8FecNjFFjUx/yDXkZ5t0+WkbmobZHNRjEUy0HG8EI
 yOT6zltLnzrHUShi7fu3apVX7ipvHFJHcPxLpzjkMXkWYTLjYUWlLoB7mdcV88nk7W1R
 S3KbUJGvk+tSq4k7SZmsyTeV9exfNhLoKKWMJm83VJhzX1Cvfy2NgDimFB5cgKoTrSat
 5mlb3QJRO2DlKvaq/9eq3hanGDLRo6lONiIfOSDjxQGxUpEgoRd6DWPxQqMJot/N0gxs
 qndg==
X-Gm-Message-State: AOAM5320O5kPdDFdkkZddcP4/XjEw832bb8FPb9RIQ1OfHMxam1QsNQ7
 OZl0mnpSXgozNlLXAFRXmEM=
X-Google-Smtp-Source: ABdhPJw6vCmkFlF6kE0P2ErCDImL+4aRsa1VJAzRVkcEAF3Ce6rnneVKlUR57hGKi6X6whoXtcRaRw==
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr3596232eje.165.1627911817933; 
 Mon, 02 Aug 2021 06:43:37 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id b2sm6130288edr.16.2021.08.02.06.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:43:37 -0700 (PDT)
Date: Mon, 2 Aug 2021 16:43:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Message-ID: <20210802134336.gv66le6u2z52kfkh@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731191023.1329446-4-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_064340_638741_363AF732 
X-CRM114-Status: GOOD (  18.25  )
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

On Sun, Aug 01, 2021 at 03:10:21AM +0800, DENG Qingfang wrote:
> As filter ID 1 is used, set STP state also on it.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 3 ++-
>  drivers/net/dsa/mt7530.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3876e265f844..38d6ce37d692 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1147,7 +1147,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
>  		break;
>  	}
>  
> -	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
> +	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK,
> +		   FID_PST(stp_state));
>  }
>  
>  static int
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index a308886fdebc..294ff1cbd9e0 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -181,7 +181,7 @@ enum mt7530_vlan_egress_attr {
>  
>  /* Register for port STP state control */
>  #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
> -#define  FID_PST(x)			((x) & 0x3)

Shouldn't these macros have _two_ arguments, the FID and the port state?

> +#define  FID_PST(x)			(((x) & 0x3) * 0x5)

"* 5": explanation?

>  #define  FID_PST_MASK			FID_PST(0x3)
>  
>  enum mt7530_stp_state {
> -- 
> 2.25.1
> 

I don't exactly understand how this patch works, sorry.
Are you altering port state only on bridged ports, or also on standalone
ports after this patch? Are standalone ports in the proper STP state
(FORWARDING)?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
