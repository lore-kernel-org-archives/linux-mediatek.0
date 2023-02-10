Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A533BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fb0wKEc3mmbdGMSXDzSrYj5qYNI0XKkPSAyyWf1uEgk=; b=NG/u+hSGMJQrrISXEjjSPE2zEm
	8JwyGrt2nLdidXG7L2QI3lEIVB/AERCo0Suq+pT3VOrvQ9QANyWBMM7RIQntzr/0hn7RxhBnFOoCi
	7bVROgh1JaWNJtNEIYR1fDbam3PBXX87Gwjui4fi+MdcAuqBG3RXmVENjfWlH1Y1Q4bOELQUPOL0K
	pRzJJUGl19ARryBJDmuyGnptPCoLk10EOYkIoEHg8JlRLQUW/AAA3mgNsbbtCFnCrT5gt0F6r/BAE
	CgHMr+PBtP1X40HPfoQKRYkMRui/jilFFEpcO+SIbHeANiZdytqM3IIKy4WRr3W5YY5qzfMN7L6hm
	/ZBc6JZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQYNn-006yzs-NE; Fri, 10 Feb 2023 18:44:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQYNd-006ywH-13; Fri, 10 Feb 2023 18:44:18 +0000
Received: by mail-ed1-x532.google.com with SMTP id m8so5435492edd.10;
        Fri, 10 Feb 2023 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fb0wKEc3mmbdGMSXDzSrYj5qYNI0XKkPSAyyWf1uEgk=;
        b=V2rNVBt9iSWj+cz1hVbKyDY8zaFUGybNt0tLkCUxm9oj2mQWP125DqQC/q0fV/gH2G
         0e0kxdVMYEiCtFuS5px5N56DHlP+7hcADcQDehAEGqHkJ5cPjZNCGc5Kf8SEQ65INvFj
         UyQELoT18ps5Y8wG8aiFsb0dMvkuWfhJ2wrHFnZxKI/njeDeY1nXPz757rMYlJP+Ff0Y
         AfzEgkGsJA49TZNHHJyqkhZq4pfCh7Ld+5X468mo93X9S7vH0mwoyDlVqc0njUk7ocKn
         0Kl4z1eR3sOuI1vKQFvRv4wIRazEOwPX3XdFEaaTDvwVE46xw3Hd7XPWgqrxyiPrf2wR
         lR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb0wKEc3mmbdGMSXDzSrYj5qYNI0XKkPSAyyWf1uEgk=;
        b=qRS9bQreq1B/cUWijpDK+Gy+EDEVAHUF2WJX1loM8cWSBXwwxu+v9FLANXB//efD/o
         /O0otqOjMYX20LV2UJB855R18akgB4Iap9l9lov5rdeWwwDIe+moVvj+yCfOvCgm+gtR
         rBjgUndLoPFBQnN+XrBw8NwOUAFvaJM2mSl5AM6vptdVnm8mksSORhS6EDx2wkrMxmBx
         AUMe0QzofXSCppVtGhoeEFEaGzzpHB9KQZHtPJIiDYsCaCx5hYH7hTil64t+qtxS6WJ7
         Zh3r6x8OyTfWRBH7OM+xAQFjoArVZaVLltzkZpHiFEQk6iyYuHCUiADSBAgu9VAh3fxo
         9pzQ==
X-Gm-Message-State: AO0yUKWayPc9YFF+Y9eFMjkg1aqhboqBAx/cPRRGKdDC3425qqo0fz9T
	Qc7t3gzBQndZkTr1rp7bmtQiWIBNZYbGig==
X-Google-Smtp-Source: AK7set+eHoRfSH2DTpPtyrzwU+ly2GB8pWfMecLZ6SSAwjM/9Uie0c0NlUi95XZp7q87JdFil8BrBg==
X-Received: by 2002:a50:c05b:0:b0:4ab:2033:8c55 with SMTP id u27-20020a50c05b000000b004ab20338c55mr6498926edd.33.1676054652468;
        Fri, 10 Feb 2023 10:44:12 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id c25-20020a17090603d900b0087bd50f6986sm2749646eja.42.2023.02.10.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:44:12 -0800 (PST)
Date: Fri, 10 Feb 2023 20:44:09 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard van Schagen <richard@routerhints.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Re: [PATCH net] net: dsa: mt7530: fix CPU flooding and do not set
 CPU association
Message-ID: <20230210184409.e6ueolfdsmhqfph5@skbuf>
References: <20230210172822.12960-1-richard@routerhints.com>
 <20230210172822.12960-1-richard@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210172822.12960-1-richard@routerhints.com>
 <20230210172822.12960-1-richard@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_104417_114999_CB7E690F 
X-CRM114-Status: GOOD (  31.45  )
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

Hi,

On Fri, Feb 10, 2023 at 08:28:23PM +0300, arinc9.unal@gmail.com wrote:
> From: Richard van Schagen <richard@routerhints.com>
> 
> The original code only enables flooding on CPU port, on port 6, since
> that's the last one set up. In doing so, it removes flooding on port 5,
> which made so that, in order to communicate properly over port 5, a frame
> had to be sent from a user port to the DSA master. Fix this.

Separate patch for this. I don't understand the correlation with the
other part below.

FWIW, the problem can also be solved similar to 8d5f7954b7c8 ("net: dsa:
felix: break at first CPU port during init and teardown"), and both CPU
ports could be added to the flooding mask only as part of the "multiple
CPU ports" feature. When a multiple CPU ports device tree is used with a
kernel capable of a single CPU port, your patch enables flooding towards
the second CPU port, which will never be used (or up). Not sure if you
want that.

> 
> Since CPU->port is forced via the DSA tag, connecting CPU to all user ports
> of the switch breaks communication over VLAN tagged frames.

Here, I understand almost nothing from this phrase.

"CPU->port" means "association between user port and CPU port"?

You're saying that association is forced through the DSA tag? Details?
Who or what is the DSA tag? Or are you saying that packets transmitted
by tag_mtk.c are always sent as control plane, and will reach an egress
port regardless of the port matrix of the CPU port?

"Connecting CPU to all user ports" means assigning PCR_MATRIX(dsa_user_ports())
to the port matrix of the CPU port, yes? Why would that break communication
for VLAN-tagged traffic (and what is the source and destination of that
traffic)?

> Therefore, remove the code that sets CPU assocation.
> This way, the CPU reverts to not being connected to any port as soon
> as ".port_enable" is called.

Partly to blame may be the poor phrasing here. AFAICS, the port matrix
of the CPU port remains 0 throughout the lifetime of the driver. Why
mention ".port_enable"? That handles the user -> CPU direction, not the
CPU -> user direction.

> 
> [ arinc.unal@arinc9.com: Wrote subject and changelog ]
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Richard van Schagen <richard@routerhints.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Missing Fixes: tags for patches sent to "net". Multiple problems =>
multiple patches.

> ---
>  drivers/net/dsa/mt7530.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3a15015bc409..b5ad4b4fc00c 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -997,6 +997,7 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  {
>  	struct mt7530_priv *priv = ds->priv;
>  	int ret;
> +	u32 val;
>  
>  	/* Setup max capability of CPU port at first */
>  	if (priv->info->cpu_port_config) {
> @@ -1009,20 +1010,15 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  	mt7530_write(priv, MT7530_PVC_P(port),
>  		     PORT_SPEC_TAG);
>  
> -	/* Disable flooding by default */
> -	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
> -		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
> +	/* Enable flooding on CPU */
> +	val = mt7530_read(priv, MT7530_MFC);
> +	val |= BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port));
> +	mt7530_write(priv, MT7530_MFC, val);
>  
>  	/* Set CPU port number */
>  	if (priv->id == ID_MT7621)
>  		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
>  
> -	/* CPU port gets connected to all user ports of
> -	 * the switch.
> -	 */
> -	mt7530_write(priv, MT7530_PCR_P(port),
> -		     PCR_MATRIX(dsa_user_ports(priv->ds)));
> -
>  	/* Set to fallback mode for independent VLAN learning */
>  	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
>  		   MT7530_PORT_FALLBACK_MODE);
> @@ -2204,6 +2200,9 @@ mt7530_setup(struct dsa_switch *ds)
>  
>  	priv->p6_interface = PHY_INTERFACE_MODE_NA;
>  
> +	/* Disable flooding by default */
> +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK, 0);
> +

Shouldn't mt7531_setup() have this too?

>  	/* Enable and reset MIB counters */
>  	mt7530_mib_reset(ds);
>  
> -- 
> 2.37.2
> 


