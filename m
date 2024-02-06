Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638BDC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qnr+GJSNInkqH8X1ju6adNgWnWatfsE0zlg3RODTQs0=; b=MUzMoX3YjAWtCzgG1ply1eZ8Yx
	9kAn0outtfMrpMfz5yk9shl6t6zMWvj2SIBKoxecoroxcJRWwqOpDVsrt/eo+oPVPNvA+sCSbpVJS
	SobTRpC5TIZVVi2me+EMkujJIx9VP3B7tK/lIr8NCq0UPeFlluK3AWzi4tHwSoZjkXhE+M1lkjnbP
	GQuCL0WaM1BHEuV8f4DlWuQ+XcB7GzzQQ2mG3pUVavJP3jPkmkOHFt+TDvJxJSZl16YkJK8kECPE4
	vfVTJOx2oVKvCuLq65mcxDkz2KYcD1B4NkZPvKLtDgxgFVsxey8YAz2PBq1zMkLGROgH5SrFtWGZu
	M834j6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJ2Y-000000078ex-1eGG;
	Tue, 06 Feb 2024 10:50:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJ2U-000000078dJ-3vux;
	Tue, 06 Feb 2024 10:50:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a271a28aeb4so766618966b.2;
        Tue, 06 Feb 2024 02:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707216652; x=1707821452; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qnr+GJSNInkqH8X1ju6adNgWnWatfsE0zlg3RODTQs0=;
        b=a2TXpWM9407+PK0nZFb1mhw9e1pLsZYNFIw/ialbMHS0q00zAxA5ZiGZn9QflN466j
         co8OCDWg7Q/mP1EWMb10PNCMFZXQTpf3cwdKNQ64S36h+8VHCuIGCqToMm9g5FghIoP8
         yFIDrlYKIpOfl/7bXkqaBTutH/15g2GIXevQKP3ItKgzHLZwOn6VEdiBqc8qTBglc0cl
         yDej0n2soK0HjAAcL7zp/sjht04bIEMPrpgMI5shiKOj39/1zRr7G7mJFaWX9du3piqa
         rGIIf2lwGoie9FWIHC5a0cIlFjPtqAZWhb6ZVo2iUvp/42ib8fsC8b2bqxUixDF8QkfZ
         dmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707216652; x=1707821452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qnr+GJSNInkqH8X1ju6adNgWnWatfsE0zlg3RODTQs0=;
        b=J9nVPXCYQITFbk2T89XmxltenPu2D9c0cs8quWUUSQuqZiIIwhPLwrAcIfKYG3B5U/
         pqydtadx5Xb+lwGVpUFUlHgca3OUBHRhWtYFbIAh3pFPS3FmLeaziS5rIMWTNYAC61Rb
         haESIPyq9N6rkxnRMkEhNvmVsypOR6+1rbNd85iTT/GGQMPkInSc5Y6IZJXSegWHxoJy
         m11TYM7WXTCQtmBcUJ3EhB5reFNGiLdpSX8+xpYMs28HWL9lN5Y5PbVJTfRz1lX5F8yl
         S0X10OTVDDS6mu/VdTYeww+i542GgZajmlfDK1BGzyAfSwDmEKkvUskeT6xmhcPJdwPL
         iHhw==
X-Gm-Message-State: AOJu0YxJsk1X6gDGZisM5RnzKOaBWkWAYTPdSRFxla4knbAH4j8OSEl4
	LBKeZPUYyy6PLL8Qd0YjGcAufTVKam2TAZn3p+u1pZXvXLe3cWh8
X-Google-Smtp-Source: AGHT+IGlyLnVmMDl4xqY5qb83VRU3kc5wfWmjEfNRhqjThSnjCoW6EWAUgKBfbGftyvqOnAb7icUHA==
X-Received: by 2002:a17:906:31d2:b0:a38:187a:3281 with SMTP id f18-20020a17090631d200b00a38187a3281mr1130431ejf.70.1707216652035;
        Tue, 06 Feb 2024 02:50:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXg8riI/jLImZaU3s8trcrVtGeKUgOV3x8PYnmnuZhpOy+Hd0AOAwpieFrmC3OGwADCRqmEr7ERCoi+kXlaf2qldIFMJXukxFtSnOddFGeRjjmEdGRl+IgcCCq53JgCGQprcnVA3eZNtBIU42Q36O7PL/6OrwtcFZHVDcQIgw+8RupJec1zc9dr+SRB89pbGHqd3b1eh4EUCgJ36EAE2zbf9NpTxdrF0XF9AHnqzes+EbjTZKUMJDzfgkHZEhOASukiPHv8iqZBtLnVMlVexcvcK7XtIvmxJ1thctiBez3WP9Lv+EiruQaPFm5DUZhB83wi1h5+NYAYY//QpBjo7zfhDVQfJsjJexW7aUbLEfQLrW2rmoYA2xWFLwMUE6p3pa7Ewk4Oi0jJG5Sbozolp4e9/+ZOq60aIBpOX5OqVinAEyTQYjPymMlD2a7LZYKcMpqH/EJKAyqM1fbqdmGi01f1SRAN6ZXi2aWqSTHtHgrXEgq4ytZDVLXGe3sW1d/2uyHAXPqfhsajaoBOEDPh08XVXPjptuPhsmPi1g86VO7lX4eMbHGcWDsXQ0t/3LW+x6XjMU7Btp2jX7KPnE8NAIyQ2WOVfn8JDOSYO9DJYO55Yu++/FtfXY3CSySBshOnKw2yflJmuBeNJE3P4o950tm2rNo6IkH3XaXa1dXF5kSeTqdHEkOGLhC4D78RCI7lne1/VA==
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id tj10-20020a170907c24a00b00a354a5d2c39sm1005649ejc.31.2024.02.06.02.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:50:51 -0800 (PST)
Date: Tue, 6 Feb 2024 12:50:49 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH net-next v5 3/7] net: dsa: mt7530: simplify
 mt7530_pad_clk_setup()
Message-ID: <20240206105049.rldesxnyjs4dungi@skbuf>
References: <20240206-for-netnext-mt7530-improvements-2-v5-0-d7d92a185cb1@arinc9.com>
 <20240206-for-netnext-mt7530-improvements-2-v5-3-d7d92a185cb1@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206-for-netnext-mt7530-improvements-2-v5-3-d7d92a185cb1@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_025054_996948_124CFCFD 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, Feb 06, 2024 at 01:08:04AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This code is from before this driver was converted to phylink API. Phylink
> deals with the unsupported interface cases before mt7530_pad_clk_setup() is
> run. Therefore, the default case would never run. However, it must be
> defined nonetheless to handle all the remaining enumeration values, the
> phy-modes.
> 
> Switch to if statement for RGMII and return which simplifies the code and
> saves an indent.
> 
> Set P6_INTF_MODE, which is the three least significant bits of the
> MT7530_P6ECR register, to 0 for RGMII even though it will already be 0
> after reset. This is to keep supporting dynamic reconfiguration of the port
> in the case the interface changes from TRGMII to RGMII.
> 
> Disable the TRGMII clocks for all cases. They will be enabled if TRGMII is
> being used.
> 
> Read XTAL after checking for RGMII as it's only needed for the TRGMII
> interface mode.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

