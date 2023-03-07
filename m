Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9BEC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylf/mq//lzVCs2kUwljoL1tKekI4ibQM03In0NCDXLs=; b=hpnMV2l1ioCQ+vtV8vM2hBxGzM
	1RDlFo30+aYtAPh4H45ggkaDjKDjkxNqeY+lXdgMWEHK1YM6njpqn40xm5HOUph0COfmhNFJ0r1Su
	/FtB0yZMuM9A8xjEW8CeAnVD88t5vPbpCsxqDebszB7jkp0K+aiizZ1IAoXceU8WpTs3LCQUUBYim
	UDRxYbtGodQXb0M37deMBjzIUBBQRIf3M9nZhHov50mnPGawxkw3jrVtZAH2+dWkjfq6Ubba/eghQ
	PFP5aHu14ezih6KaUUNE5wwTTxrBVrBWVRY8ggImgz+el4a1IfbDp/sRzLMHyuAQEZBeSQkGjYWUw
	27M1eFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVe9-00HV9J-RT; Tue, 07 Mar 2023 11:38:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVdy-00HV5P-M7; Tue, 07 Mar 2023 11:38:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id k10so27050310edk.13;
        Tue, 07 Mar 2023 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678189051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ylf/mq//lzVCs2kUwljoL1tKekI4ibQM03In0NCDXLs=;
        b=qfmrPmJWAlfuCrezU2zfyKjyPn1k15H8+DCWstzdR9q7Zdiw4p9EkGmXZLB4rvVaxO
         M8aFDlQU0WuJpCglA1/MTurm/Fs9mO0a+9M0rnn9YBsCoecDZZdUCH1MKo8ioElHt93f
         LdvcbQrlXKmKTsXvH8qoi1c65T3TCx06by9wDB+/WdkF0dTci6q8qBJA1mEGeXcrmETM
         9walOuPtXw//rddNM/yep3yIj5xNMptphS89eB4FnFz220hagzMKv6bYNHwX7TwaiQVz
         9OuJYAvcafUDxLF1MLy+SH6LBdjtUEOuUysIHYZUbz/sp/4emVJ/sBewjMfBmXO+CS9m
         eRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylf/mq//lzVCs2kUwljoL1tKekI4ibQM03In0NCDXLs=;
        b=v4C4JVm+8zoYxg6+pYRTA0Ag8G5vIoXe65UC1Jfjrv1RhsWqi0NCLIztQRt3brtk5N
         D0KzR52uZKGxM/XCtORHUAIU0EoTR8CYEJqzdWJHPh4A18rMQEK2Ks3jd0Ry4Xq+hhlv
         JnJORWWj7lTDci5i1XpVB6j7CuOboKvrTYNE6gjwmR9jIg+Mpv28oO/tX2B4vGSf7c/p
         yaU/FP5pGJhxZ6mTElbDmh+yoqa5Xp6woY+jX/C52V5Jm/fai9IeUestAEwq8xflslZP
         z7iworcstHqMwPRdxttTrdm+eNHzEmQzvJWD4DaTBvJtWZxZZbUUt0rxuXFV28GfXAPL
         3/nw==
X-Gm-Message-State: AO0yUKWqA8Bg6e7fG0Bm18jD7VFK4mbTv03tRTgNR3Q0E1DNozPv2Yyd
	HYHz3q5sXhGiXyTQydafOv4=
X-Google-Smtp-Source: AK7set+q9vyTDat0wK16qtvlKptYHYpRS/dTB7ZGYkMsDFFHqZU8dAjrdZF/YlQjZziUdW9i2UzcXA==
X-Received: by 2002:a17:906:1317:b0:88d:d304:3433 with SMTP id w23-20020a170906131700b0088dd3043433mr14026907ejb.67.1678189051410;
        Tue, 07 Mar 2023 03:37:31 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm5939973eja.152.2023.03.07.03.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 03:37:31 -0800 (PST)
Date: Tue, 7 Mar 2023 13:37:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
Message-ID: <20230307113728.4lg6xqfhj5szcpd3@skbuf>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
 <20230304125453.53476-1-arinc.unal@arinc9.com>
 <20230306154552.26o6sbwf3rfekcyz@skbuf>
 <65f84ef3-8f72-d823-e6f9-44d33a953697@arinc9.com>
 <20230306201905.yothcuxokzlk3mcq@skbuf>
 <a8ad9299-1f9f-e184-4429-eef9950e22d8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8ad9299-1f9f-e184-4429-eef9950e22d8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_033810_750950_1FEDD7AA 
X-CRM114-Status: GOOD (  23.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 07, 2023 at 02:26:08PM +0300, Arınç ÜNAL wrote:
> Port 5 as CPU port works fine with this patch. I completely removed from
> port 6 phy modes.
> 
> With your patch on MT7621 (remember port 5 always worked on MT7623):
> 
> - Port 5 at rgmii as the only CPU port works, even though the PLL frequency
> won't be set. The download/upload speed is not affected.

That's good. Empirically it seems to prove that ncpo1 only affects p6,
which was my initial assumption.

> - port 6 at trgmii mode won't work if the PLL frequency is not set. The
> SoC's MAC (gmac0) won't receive anything. It checks out since setting the
> PLL frequency is put under the "Setup the MT7530 TRGMII Tx Clock" comment.
> So port 6 cannot properly transmit frames to the SoC's MAC.
> 
> - Port 6 at rgmii mode works without setting the PLL frequency. Speed is not
> affected.
> 
> I commented out core_write(priv, CORE_PLL_GROUP5,
> RG_LCDDS_PCW_NCPO1(ncpo1)); to stop setting the PLL frequency.
> 
> In conclusion, setting the PLL frequency is only needed for the trgmii mode,
> so I believe we can get rid of it on other cases.

Got it, sounds expected, then? My patch can be submitted as-is, correct?

> One more thing, on MT7621, xtal matches to both HWTRAP_XTAL_40MHZ and
> HWTRAP_XTAL_25MHZ so the final value of ncpo1 is 0x0a00. I'm not sure if
> xtal matching both of them is the expected behaviour.
> 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index fbf27d4ab5d9..12cea89ae0ac 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -439,8 +439,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
> >  			/* PLL frequency: 150MHz: 1.2GBit */
> >  			if (xtal == HWTRAP_XTAL_40MHZ)
> >  				ncpo1 = 0x0780;
> > +				dev_info(priv->dev, "XTAL is 40MHz, ncpo1 is 0x0780\n");

In the C language, you need to put brackets { } around multi-statement
"if" blocks. Otherwise, despite the indentation, "dev_info" will be
executed unconditionally (unlike in Python for example). There should
also be a warning with newer gcc compilers about the misleading
indentation not leading to the expected code.

Like this:

			if (xtal == HWTRAP_XTAL_40MHZ) {
				ncpo1 = 0x0780;
				dev_info(priv->dev, "XTAL is 40MHz, ncpo1 is 0x0780\n");
			}

> >  			if (xtal == HWTRAP_XTAL_25MHZ)
> >  				ncpo1 = 0x0a00;
> > +				dev_info(priv->dev, "XTAL is 25MHz, ncpo1 is 0x0a00\n");
> > +			if (xtal == HWTRAP_XTAL_20MHZ)
> > +				dev_info(priv->dev, "XTAL is 20MHz too\n");
> >  		} else { /* PLL frequency: 250MHz: 2.0Gbit */
> >  			if (xtal == HWTRAP_XTAL_40MHZ)
> >  				ncpo1 = 0x0c80;
> 
> > [    0.710455] mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
> > [    0.734419] mt7530 mdio-bus:1f: configuring for fixed/rgmii link mode
> > [    0.741766] mt7530 mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> > [    0.743647] mt7530 mdio-bus:1f: configuring for fixed/trgmii link mode
> > [    0.755422] mt7530 mdio-bus:1f: XTAL is 40MHz, ncpo1 is 0x0780
> > [    0.761250] mt7530 mdio-bus:1f: XTAL is 25MHz, ncpo1 is 0x0a00
> > [    0.769414] mt7530 mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> > [    0.772067] mt7530 mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
> > [    0.788647] mt7530 mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
> > [    0.800354] mt7530 mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
> > [    0.812031] mt7530 mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
> > [    0.823418] mtk_soc_eth 1e100000.ethernet eth1: entered promiscuous mode
> > [    0.830250] mtk_soc_eth 1e100000.ethernet eth0: entered promiscuous mode
> > [    0.837007] DSA: tree 0 setup
> 
> Thunderbird limits lines to about 72 columns, so I'm pasting as quotation
> which seems to bypass that.

That seems to have worked, but shouldn't have been needed. I've uninstalled
Thunderbird in favor of mutt + vim for email editing.. although, isn't
there a Word Wrap option which you can just turn off?

