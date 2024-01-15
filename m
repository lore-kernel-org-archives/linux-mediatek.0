Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F5BC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpZXuxTCll8YyBXk7ascc8Zs2wHnoSmMilYdgRpGMyg=; b=GBG4DZT9mP130xJhQziOyya/fB
	HBpYWZsnHt46LStH47FK+uTTZhT2Je42+IBdwBDpk3rR+gDIs66jjL4xqssPH3Q7BHQX2Kih2Kfsm
	WDkWSzfiLvo66k4G5InIXM/prmn9Pj6bW8Aqb80rlnsi5Yyv8XVHisvlirtDO64sPl1BrYGR17a9J
	+6lDIzwK/nwK18/STfR+8nVoyZPo7EIjMycTr6Zormsycoqc90uAH035/ZOqVzdWj5Ka+XD7ycLHl
	SahDPgYRgyboCB5hR427JYnxS8nJ+2AlwlPzu/VRESrPkZE/iedkE8dYOj8rqunlUylj9aJhhnJcb
	/S30tLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUe8-00AEf4-2R;
	Mon, 15 Jan 2024 21:37:28 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUe5-00AEeb-1m;
	Mon, 15 Jan 2024 21:37:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a28da6285c1so1650139466b.0;
        Mon, 15 Jan 2024 13:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705354643; x=1705959443; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bpZXuxTCll8YyBXk7ascc8Zs2wHnoSmMilYdgRpGMyg=;
        b=hRwj1vrIoVSuqJf0F0BnmQhjlGjsG4V04a9xvBY2je8KdzukhnNPI2W3vNpBGkJ64S
         o2jgbSk7tjb1WUK8EmQXCvOd6YlB8okKu3lozJ4QzdmNBDDNanra7D0oKPsiLWHjlgM1
         r6HVEVXsVyXgBXjjxvMDiSlcUKxvJLyBsjECyxR/2cavDdmPCi/jrigpIoTdPyy5AGni
         orpEIliwS8lUybDBgb4cxxL+6eFI4zvgjPuMIdnE1+eh5a6g/GRSzxmRgxrJnT5L9uyQ
         dq1P6GFwd+l90rzlZsYzd6LmgTY+QEwtFm0cdaWWc/bkBhbEKqKjyO4JcdATUwIMJFVg
         wsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705354643; x=1705959443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpZXuxTCll8YyBXk7ascc8Zs2wHnoSmMilYdgRpGMyg=;
        b=qxQeGleZqpZTyBxGpam/DOtOIE7mkd+tdzf71SAr9MydL//TKQWlzS5mKrjxcqeRuq
         xb4jFg3gXAL8da2N2x6erl5QWi+zPBGnNl9ZBQ+uybl42kjE4dY/7Grk6CVKb748T46B
         6TgW2RmcxHudRAc4r41J6Q4JAFia2YlDIJi7tixZOXSAHin/yzSb61ml8dCTavO1zalG
         N2A/PlNrNgqDGSFYXxfVzezwVnC8yyWs/p703pLkOGCS3wFj5aPPkNwxxZTqEmCOeKI+
         oexm/JM1SwTsd6ckXGHXipTEwkN1jMKsCYFsLF5W5IAfVWlOAYsGcCrMvaIq7slb04RH
         d9og==
X-Gm-Message-State: AOJu0Ywt1V/OcrA7YWBaxp+yX5RAI7YfjobN/ipZrd0yQyapaPt8Yh85
	GOyAFEG3JckNDnUQfsvMQrY=
X-Google-Smtp-Source: AGHT+IE10fMtaUsiAYNb4EjOpfYRAmVcn8WrWtsDg/nQyoNok54YoiMAF7YZfJtVLHXZAjFBrmuKEQ==
X-Received: by 2002:a17:906:bf47:b0:a2c:f62d:a598 with SMTP id ps7-20020a170906bf4700b00a2cf62da598mr6138308ejb.0.1705354642880;
        Mon, 15 Jan 2024 13:37:22 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id c17-20020a170906695100b00a26e53be089sm5690286ejs.44.2024.01.15.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:37:22 -0800 (PST)
Date: Mon, 15 Jan 2024 23:37:20 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net-next 6/8] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
Message-ID: <20240115213720.vxlumsjwrjdkqxsl@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113102529.80371-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_133725_597222_197DB558 
X-CRM114-Status: GOOD (  18.42  )
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

On Sat, Jan 13, 2024 at 01:25:27PM +0300, Arınç ÜNAL wrote:
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3ce4e0bb04dd..3a02308763ca 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -414,72 +414,56 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
>  }
>  
>  /* Setup port 6 interface mode and TRGMII TX circuit */
> -static int
> +static void
>  mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> -	u32 ncpo1, ssc_delta, trgint, xtal;
> +	u32 ncpo1, ssc_delta, xtal;
>  
>  	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
>  
> +	if (interface == PHY_INTERFACE_MODE_RGMII)
> +		return;

It would be good to add a comment here which states that the port comes
out of reset with values good for RGMII.

Also, there's a built-in assumption in this patch, that dynamically
switching between RGMII and TRGMII is not possible. This is because
phylink mac_config() is not necesarily called only once immediately
after reset, but after each major_config().

The fact that the driver sets both PHY_INTERFACE_MODE_RGMII and
PHY_INTERFACE_MODE_TRGMII at once in config->supported_interfaces does
not disprove that dynamic reconfiguration is possible. Normally,
interfaces for which it doesn't make sense to dynamically reconfigure
(they are wired to fixed pinout) have a single bit set in
supported_interfaces. Is this switching something that makes any sense
at all, given that port 6 is internal? It's not something that phylink
knows to do today, but if this is theoretically possible and remotely
useful, someone might end up wanting, in the future, to revert this patch.

