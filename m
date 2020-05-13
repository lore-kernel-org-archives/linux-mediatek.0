Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD32C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D248F204EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="revWkol9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRrSmku+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D248F204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5gWIgUEpe6sepRbkFXGvHXeFJfLAbd2SEOpLy6CZdQ=; b=revWkol9XWoelg
	OcesSsqmvlFDute2VzeQa9fOw/wUMQcWc/5uMTZ+wXe3c8C0qf9UZOJMSmV5eoaY8fZ1SGzzF+t3c
	S5qUmbynGySYcLXSaczPu0BZvgYc61+1ltmT1qQO7rDEl+X3P1qUXDfwBykhS6fnilcdqpBor/MXk
	WtTnO5sjMf1HBieYGu6HYTWU/befFVt4VVvvzLCGZnAyC1BRZIVpaLHNDOXp0tmy0/YgwK5TjAEPp
	f8flQH/Lb1VG39XXzSQvNcyrOS8kVDLbN9q6QFGpz97z4GLQ0G5D/ZXh9icaUxR8SZizI0JthA6p5
	zfCYaQRb6/guJu+IXgsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYtaj-0002MF-SO; Wed, 13 May 2020 15:46:41 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYtah-0002Lr-39
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 15:46:40 +0000
Received: by mail-pl1-x644.google.com with SMTP id b8so6967918plm.11
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZpLfTJ8ouPn1kLlrjqtwRp0K+/L19gJd6qpBYWzECDA=;
 b=DRrSmku+pMUE7I5aKXew64Mot0IrIeb9PCHuJq6+qo97yJbCJLga8Ke8xBq09uwu06
 BPPyRAEXbIab5Aazm8Bg3dN5RPy1JnXqXrovQ1xtCRXucLeAFE4Kb4FvljMVxwiRwIpr
 fjptKNUYlAoey+dZ0GHhhKPmIUUcwaKxmItP9N/2Aah8VeYIAKMJf5Oxf8JW8gLJe58Z
 DPM07Vb2UKwpJriRvUtIeLxG8Nf0C9uNyCSKRrQTgXLgc9IHNrbdT4xllkppv1DIWrDY
 G5T87y/0Su+gho/65XBNIpbB7k79GynBcW4dU8Z0aoAOKFRntS1i1rL9PtMEJ7OMmRWg
 1odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZpLfTJ8ouPn1kLlrjqtwRp0K+/L19gJd6qpBYWzECDA=;
 b=WJ8z6DmzfY/thgQWtR1CEk9Wx8y3aLFOdeg/F7g+51hPqDsncMjTbh0/MQeXtBiJsJ
 qiK/W05TwK2gO21OYqxQ62SgONlzppZY5V0PcJ+Ojpi7GTCqCcfa1D083X7ib8Xpy0i/
 U4I/HZNQcTpaxOu/WzebxAU3/uqqhJPvTr8ymYreqZa38OA3AWU/k7cNLRFmHrNcbUE9
 aYI1fpeyUGHni/OMBzF8QmYxiQA3tGK+++yP0uS/xv0N5Q3h11FIN3C8NIyFGYdPoS/W
 1sN6UGgrdxpB7yGfLwgTAo4VfojiQ3oFkybuCMnT5n11A7HC2m42IC+xi1WwPRUYMLWC
 kB+w==
X-Gm-Message-State: AGi0PuYYknCDFARPRV1YeM+OUdom8OxQCxywFWboDhFn4+Je6rhzEitn
 y/ygXAqudieJLBNOdpFKN/U=
X-Google-Smtp-Source: APiQypKMlUWiqBRaHWFBOJTV400ENjbYiNsGf9BzVkD+tGtpP9xN2rvKp8Zc0+CtT4l9scsSwt/+lw==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr35015196pjb.155.1589384797829; 
 Wed, 13 May 2020 08:46:37 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g9sm84588pgh.52.2020.05.13.08.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 08:46:37 -0700 (PDT)
Subject: Re: [PATCH net-next] net: dsa: mt7530: set CPU port to fallback mode
To: DENG Qingfang <dqfext@gmail.com>, netdev@vger.kernel.org
References: <20200513153717.15599-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5d77da58-694a-7f9c-53fb-9d107e271d40@gmail.com>
Date: Wed, 13 May 2020 08:46:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513153717.15599-1-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_084639_163761_EAF1BEFC 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, riddlariddla@hotmail.com,
 Paul Fertser <fercerpav@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Stijn Segers <foss@volatilesystems.org>,
 Szabolcs Hubai <szab.hu@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/13/2020 8:37 AM, DENG Qingfang wrote:
> Currently, setting a bridge's self PVID to other value and deleting
> the default VID 1 renders untagged ports of that VLAN unable to talk to
> the CPU port:
> 
> 	bridge vlan add dev br0 vid 2 pvid untagged self
> 	bridge vlan del dev br0 vid 1 self
> 	bridge vlan add dev sw0p0 vid 2 pvid untagged
> 	bridge vlan del dev sw0p0 vid 1
> 	# br0 cannot send untagged frames out of sw0p0 anymore
> 
> That is because the CPU port is set to security mode and its PVID is
> still 1, and untagged frames are dropped due to VLAN member violation.
> 
> Set the CPU port to fallback mode so untagged frames can pass through.

How about if the bridge has vlan_filtering=1? The use case you present
seems to be valid to me, that is, you may create a VLAN just for the
user ports and not have the CPU port be part of it at all.

> 
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 11 ++++++++---
>  drivers/net/dsa/mt7530.h |  6 ++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 5c444cd722bd..a063d914c23f 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -810,10 +810,15 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
>  		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
>  
>  	/* Trapped into security mode allows packet forwarding through VLAN
> -	 * table lookup.
> +	 * table lookup. CPU port is set to fallback mode to let untagged
> +	 * frames pass through.
>  	 */
> -	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> -		   MT7530_PORT_SECURITY_MODE);
> +	if (dsa_is_cpu_port(ds, port))
> +		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> +			   MT7530_PORT_FALLBACK_MODE);
> +	else
> +		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
> +			   MT7530_PORT_SECURITY_MODE);
>  
>  	/* Set the port as a user port which is to be able to recognize VID
>  	 * from incoming packets before fetching entry within the VLAN table.
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 979bb6374678..d45eb7540703 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -152,6 +152,12 @@ enum mt7530_port_mode {
>  	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
>  	MT7530_PORT_MATRIX_MODE = PORT_VLAN(0),
>  
> +	/* Fallback Mode: Forward received frames with ingress ports that do
> +	 * not belong to the VLAN member. Frames whose VID is not listed on
> +	 * the VLAN table are forwarded by the PCR_MATRIX members.
> +	 */
> +	MT7530_PORT_FALLBACK_MODE = PORT_VLAN(1),
> +
>  	/* Security Mode: Discard any frame due to ingress membership
>  	 * violation or VID missed on the VLAN table.
>  	 */
> 

-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
