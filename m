Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37861C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS6kMs+u9yaM8ffbjosYMxdgJboVzMiJqPmKQK1XNCQ=; b=q6pn6b7xIPTy0Vy6UOJT58h9yj
	0W98K7wYBJOIQNoXBGQSRrCXJ+DOkBbn9/B8rpOp9H9wyyby4vmlm1R0BR/IoGEXbI55h5ACGD6Ou
	1crsF06aKRtg0jJ2WnjPnv5YCLR9wXMDCTOR7mGYLVWVie2ymyrCiL5xgrKSGDIO1yKV2pf+ZbtVl
	VszPjhPX2HsDuH++Y0+mZwdMXtuOr4flkFKXyrAljqtlTKAoYE5V6q1bvmuIcnO/QgnC24j5NS4aZ
	8t4MBVbyvhuT1TFjcl0n2tLQtYWi1w8zKQLUEJVoxTdT3i/GJ/zRCuH0kbj2zv1GeDDilOBk9WMpk
	WFlfghGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2apl-003DT8-1s;
	Fri, 26 May 2023 17:02:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2api-003DQi-0v;
	Fri, 26 May 2023 17:02:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso172459366b.2;
        Fri, 26 May 2023 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685120546; x=1687712546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SS6kMs+u9yaM8ffbjosYMxdgJboVzMiJqPmKQK1XNCQ=;
        b=FYcJg0QRD45Vj7/k3uaWJMQtzn9rB2pItBRDJkRbTotkXsg4f5QYHx0yOXaV1zcA2R
         KzGQ1jCP6N3cX0T757RcOsr7vj1fBnAIjWTpRkIhMFsWvhXrgaz9Wwn3jTgl8Jct9Dnf
         kxy2z5mX++KMGhTonEZKso80z5qhGVbwhvNdN5ZBh1FmjPLubRIbmIFp9U/uu6rdbhqP
         f04eF7x47WIvMjZobgdsM3Yd03n5uqRrELll9hTawVeoXfKKpiZIHeKw/rqKZk2o3OPX
         iAo0Rh+v9s7VLHqxx3HEWMSBWp3QlXNLSroFHB7tZvALUXsrWseavTVEU8tZwwCpiqPc
         mRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685120546; x=1687712546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS6kMs+u9yaM8ffbjosYMxdgJboVzMiJqPmKQK1XNCQ=;
        b=ZqCaISbGhaNo5FmHsSABz4yTsrjVHRCj5OnL2BDU/bWDIdbImPGz9aCFnHlAuTxkQu
         895uNqZSViXevq6GMtWg80czFSuP77mJLARgv9fjKEu8yHvbppNVk/M2S+OXycwlOnET
         889QE3bVFtENQfQRnzUhtF6713P94DTwxG0Q93/DnfYB23IN7vZGOcQzpqiJzI2Cnk9n
         7oFKLD5L6JeBNYMEy8gTFvl+CX9vLgvpsNwNGb+YS/XxlGxYx2GYPDFwmRDIsQk7B+px
         dbL3IuOCBP3jTrYsxyDUUuEpVa9u8gaNiv+ShwiBBMJ0FRxQ+PygC1QoBqFylC9h3nuN
         cv6w==
X-Gm-Message-State: AC+VfDzOVU3/3dyj/XsaLY9lvXmrVAfPuJxj+oWyDxajIgk9h0ZDRTkO
	oz9zpcyNb+/MP2jb0q6+dfk=
X-Google-Smtp-Source: ACHHUZ6RpU4KDLswYEExALywRUzB2t870g07ER7XqGgSAAKLHwX6vYLZhJ4U9D3LrLvFC7F3kYjJ8Q==
X-Received: by 2002:a17:907:743:b0:969:9fd0:7cee with SMTP id xc3-20020a170907074300b009699fd07ceemr2636652ejb.10.1685120546389;
        Fri, 26 May 2023 10:02:26 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id qw23-20020a170906fcb700b0096f71ace804sm2371847ejb.99.2023.05.26.10.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:02:26 -0700 (PDT)
Date: Fri, 26 May 2023 20:02:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 27/30] net: dsa: mt7530: introduce BPDU trapping
 for MT7530 switch
Message-ID: <20230526170223.gjdek6ob2w2kibzr@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-28-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-28-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_100230_323467_FCE4E591 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:29PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT753X switches are capable of trapping certain frames. Introduce
> trapping BPDUs to the CPU port for the MT7530 switch.
> 
> BPDUs will be trapped to the numerically smallest CPU port which is affine
> to the DSA conduit interface that is set up. The BPDUs won't necessarily be
> trapped to the CPU port the user port, which these BPDUs are received from,
> is affine to.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index cd16911fcb01..2fb4b0bc6335 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2223,6 +2223,10 @@ mt7530_setup(struct dsa_switch *ds)
>  	val |= MHWTRAP_MANUAL;
>  	mt7530_write(priv, MT7530_MHWTRAP, val);
>  
> +	/* Trap BPDUs to the CPU port */
> +	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
> +		   MT753X_BPDU_CPU_ONLY);
> +

If the switch doesn't currently trap BPDUs, isn't STP broken?

ip link add br0 type bridge stp_state 1
(with or without a userspace helper installed at /sbin/bridge-stp
for more modern protocols than the original 802.1D STP)

>  	/* Enable and reset MIB counters */
>  	mt7530_mib_reset(ds);
>  
> -- 
> 2.39.2
> 

