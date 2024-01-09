Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F605C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/VFtkk/ucqnh99jzVnmo2J+UR5Re9UDBkOsyqDC/dE=; b=LpA+CPSDMRpmmxMszxWh+eNfgX
	Nf4MuN8ym9ZJM3oXVUS2qOMb01oXj+i4ZiXwT8moGJEpV5ePygWUY9WO3QG3Jh9Vs8Zmw/ARYj2B5
	fc7FztaruVn8U7C4lhUM0qEtWTRVMVmSXjiEq3+Ko7+4btjj6Bo3nMDdJUdJF8/0cqB8IL0c7yfzL
	ccopyfuhfUplWHhLcN6cvm7Z7inDrc+XzVnLX29T9z5xnF3eGFA/GmAdUNPpgvqPtEUEh0noP24E+
	Bo2d2rzdVpcPCbBJMPHICs5mUV2MpLdv8yN6P6hEt5CYBnnmL720T10Ie4G5FSPR/AmxKkXqlYqAM
	2f24dIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNDY6-008b36-1K;
	Tue, 09 Jan 2024 14:57:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNDY2-008b2V-0c;
	Tue, 09 Jan 2024 14:57:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3376ead25e1so1554551f8f.3;
        Tue, 09 Jan 2024 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704812264; x=1705417064; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/VFtkk/ucqnh99jzVnmo2J+UR5Re9UDBkOsyqDC/dE=;
        b=Xd4N9nYePrBGIgBOsi1E1omWNqTv4t2j8h4lIDjBDNSQGRJFjCZ/5TrxNGJcmfpqly
         kkN/GPv9fnX6OdV4XEa32+JPSIB6X2H/wWwN+Z5uKYFAOKczXGRgsHNeVqvTKdyI6cOx
         YkWqoZp3k53li3HUporFWPCu6JzW8bI0oXavR6gWwCkh2jbDagY+V6e7Uk4+9zKg/CO+
         YZvBYjNXMuupt02gR5v8I2LPQJRAO4OOomQo/6J/MZ/+8RQC576wH2cxDbYX4SoEa/NR
         EpzXc55ELxUnV/RcOG7S3mTgPDP0/ud8JNwp0Tp7VN2On1WJhbEaQQYfJIxP5OonhhUy
         zYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704812264; x=1705417064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/VFtkk/ucqnh99jzVnmo2J+UR5Re9UDBkOsyqDC/dE=;
        b=JdLLlAZs7/P/KIq5ERsNmztSbIszEwF1z0dI6z1H7QNgWOuQPaCH9H35YC8F7U/8lg
         IMZFXukwCxqbdRvSZOZoETNl9tqt8rjNAC9+5WHJ2CQP/CP8OtPe40m5Tfyo2U+meWmg
         F9v/oI3XWPwGAz8aCMC3aIASMsUdaoNHnx6J9A3VgErKF/eUixeySdrBdYl2XpkvgA2n
         l5R49gr43HoNnSCsnm0gonm5J7mxMj7S4T5vCOuzuEobfRHXO+Z4BD1kd0h7CSS73tGX
         2BEO+xmVDwwMU0kX2fUrN08K1dKKoaDjJVv1rVlWPfsmoeOD0t0KkCZCaJlQe/4HBBC6
         vgKQ==
X-Gm-Message-State: AOJu0Yxp5Ng5ba5Fto/oQLCSiwhmaLBj+FzWWUKNboqY7gP8feGnqCml
	+LR626Lb9qoHMh0epCxVhDY=
X-Google-Smtp-Source: AGHT+IHvw+zUv0tbFrbcMHcF+359BznhxW6lojKfp1wWvoyVPlvRm1aoDo5+9dNMvPzBMZdkFdHVWA==
X-Received: by 2002:a5d:4911:0:b0:336:7d79:ee5b with SMTP id x17-20020a5d4911000000b003367d79ee5bmr555992wrq.59.1704812264091;
        Tue, 09 Jan 2024 06:57:44 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id y16-20020a056000109000b003365f5e87f4sm2614139wrw.95.2024.01.09.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:57:43 -0800 (PST)
Date: Tue, 9 Jan 2024 16:57:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20240109145740.3vbtkuowiwedz5hx@skbuf>
References: <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_065746_791260_4EBAC054 
X-CRM114-Status: GOOD (  28.77  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 06, 2024 at 08:01:25PM +0200, Arınç ÜNAL wrote:
> I must be missing something.
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 7f9d63b61168..05ce3face47c 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2325,7 +2325,7 @@ mt7530_setup(struct dsa_switch *ds)
>  			if (phy_node->parent == priv->dev->of_node->parent) {
>  				ret = of_get_phy_mode(mac_np, &interface);
> -				if (ret && ret != -ENODEV) {
> +				if (ret) {
>  					of_node_put(mac_np);
>  					of_node_put(phy_node);
>  					return ret;
> 
> $ ../smatch/smatch_scripts/kchecker --spammy drivers/net/dsa/mt7530.c
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      drivers/net/dsa/mt7530.o
>   CHECK   drivers/net/dsa/mt7530.c
> drivers/net/dsa/mt7530.c:469 mt7530_pad_clk_setup() error: uninitialized symbol 'ncpo1'.
> drivers/net/dsa/mt7530.c:895 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
> drivers/net/dsa/mt7530.c:895 mt7530_set_ageing_time() error: uninitialized symbol 'age_unit'.
> drivers/net/dsa/mt7530.c:2346 mt7530_setup() error: uninitialized symbol 'interface'.

Yes, well _now_ it is a false positive, probably because smatch cannot
determine that when priv->p5_intf_sel has been set to P5_INTF_SEL_PHY_P0
or P5_INTF_SEL_PHY_P4, "interface" should have been also initialized.
But it doesn't matter, you can ignore a false positive. I'm also seeing it.
Although you should check whether treating -ENODEV as a hard error is fine
and won't cause regressions.

> Just so you know, I intend to remove this whole PHY muxing feature once I
> bring changing DSA conduit support to this subdriver. I've got two strong
> reasons for this.
> - Changing the DSA conduit achieves the same result with the only overhead
>   being the DSA header included on every frame.
> 
> - There can't be proper dt-bindings for it as the nature of the feature
>   shows that it represents an optional way to operate the hardware, it does
>   not represent a hardware design. Overall, the implementation is a hack to
>   make it work for specific hardware (switch must be connected to gmac1 of
>   a MediaTek SoC, no PHY must be present at address 0 or 4 on the MDIO bus
>   of the SoC. It should rather be configurable on userspace. Which will
>   never happen as it is specific to this switch and the changing DSA
>   conduit feature is the perfect substitute for this.

Is PHY muxing a "true" switch bypass, or is it just a route through the
switch for all packets coming from GMAC5 to go to phy0 or phy4? If the
latter, I agree that dynamic conduit changing is a more flexible option,
not to mention the user space tooling is already there.

Are there existing systems that use PHY muxing? The possible problem I
see is breaking those boards which have a phy-handle on gmac5, if the
mt7530 driver is no longer going to modify its HWTRAP register.

> 
> Let me know if you've got any suggestions that can get rid of the warning
> without reworking the whole code block. Otherwise, I'm just going to ignore
> it until I get rid of the whole code block.

The obvious way would be to leave the initialization to PHY_INTERFACE_MODE_NA
there. Or to just ignore the warning.

