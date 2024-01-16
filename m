Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF4C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dW5FNf3SVxNKeXJ6KjqfCxnz6/Fif4OHJfNExviaSBU=; b=Q++HVzRu261FTNB0vZAkGc7xWk
	zr1e3vyDHkT8rHq8jFw/n2FaWRQVLBu4Fv7kOdZuXE0aJw3kZFQGeWt9W0NNb9UHeVDh2gX97qJHS
	CWeQESlTyzMm2dnz/BG2KykbMA7O3x6TpfRcQTwNV7SL85CAlzU9cs4wna99ZY23SxvYtvIhd7FBh
	njZfmns3tcQbMYg/ZW+x4a3K+M7iBQ+7e+N2kO6LAoPZwYPVjklePj+2tCAwmHxlEbCjCm97Cz4Ks
	HP/DIQijEP8/YlbUq/R/xxCXnxkF79scx8CEaJKjRyOpg5MqHHzI3YVSBtPX8o0AzJ9oW9frXl0jz
	gd1pKnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjmf-00CDo3-0b;
	Tue, 16 Jan 2024 13:47:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjmb-00CDn7-00;
	Tue, 16 Jan 2024 13:47:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so11838006e87.0;
        Tue, 16 Jan 2024 05:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705412829; x=1706017629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dW5FNf3SVxNKeXJ6KjqfCxnz6/Fif4OHJfNExviaSBU=;
        b=CULe5M0k2sMoccreyqUATGt8Fd8qWEvvcZPer+f4IxA2jRJ5D4IDASFQklDUfPP7Qx
         cZxCv/kUfQzIvTyKloAbE/IaZ8geM6uTdjygnj7txqNSnPLEptuSQOvItlcQN5lK1Nq1
         hnUyltZF/SA/zFcCOkugTymFz8qurbqDeHgnJTIcSuxeOK/PC8OisFd6OfPqFMYuV0bF
         WVCwx0bj/sBQO2ZFibWragR+gSIOTef40Va6mln4J68n7f/4hYscO+fhGSZI4Q0ekQqa
         WH6Scvic9CWKWft2dgLU4Ysyo8fV2wRHC3fWR8GMaABj1f0uRpSSco3FDoBC+aJg9GTj
         RowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705412829; x=1706017629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dW5FNf3SVxNKeXJ6KjqfCxnz6/Fif4OHJfNExviaSBU=;
        b=nqj8bbdqK2QF1omvZU0I8LDnKQYIMy2CzMNsOUijvrNKGL/22c/UpvUeTvS4fgAVdo
         IyTNXh6e46M3xp5YCtZf4enj4N3ESx02AyOaRtVXBMJIN1gZcGqTe3Re4/zssZ9ug/Au
         RoM7YcqmRewieajY+sLESAbqtED6iFVJ5sMB21zdbDKk5U3X+S4knIm9HW/r59QYfSWU
         jv5wCoHq8iFahoRp3Dj1WM9CN/nWRbW0qTit5XlyzS81smCyBnckwTDJi0xhJJnGwfAi
         fJ4pUh6h32i16rQej8yYZ7CawVkt7ORkejFHZJf3qZEpXhoEbX8iKk3IbvYlSTD1xq/u
         8YLw==
X-Gm-Message-State: AOJu0YwLZ2CjqivDFnTQva1CEK7ajqhC5W2h3ffyxVDp7kLUcxK+IZq9
	W3m/6zb8Q8eHmb9SytnN23k=
X-Google-Smtp-Source: AGHT+IHKRlj+eXp66CDmv5XZ+8z5Yxa8Fx1bURNMREH+HS2jVniBejbf0RJ6hAQJU1DNZXvvI/xejw==
X-Received: by 2002:a05:6512:3f2a:b0:50e:b2ac:829a with SMTP id y42-20020a0565123f2a00b0050eb2ac829amr2482333lfa.32.1705412828757;
        Tue, 16 Jan 2024 05:47:08 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id ca13-20020a170906a3cd00b00a2c869be22dsm6192739ejb.143.2024.01.16.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 05:47:08 -0800 (PST)
Date: Tue, 16 Jan 2024 15:47:05 +0200
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
Message-ID: <20240116134705.mw2a2twoakw5b7jq@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-7-arinc.unal@arinc9.com>
 <20240115213720.vxlumsjwrjdkqxsl@skbuf>
 <7f59d9e6-1653-4a8d-910d-5922452bb9e8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f59d9e6-1653-4a8d-910d-5922452bb9e8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_054713_038312_2ED4536B 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Jan 16, 2024 at 04:09:18PM +0300, Arınç ÜNAL wrote:
> Do you mean by internal port that the port does not have MII pinout? Port 6
> of the MT7530 switch do. It is possible to have an external PHY wired to it.

Yes, this is what I meant by internal port. It seems I was wrong to
assume it is always connected to GMAC0.

How is the selection done between internal and external wiring?

If external wiring to a PHY is possible, shouldn't the driver accept all
4 RGMII variants with phy_interface_mode_is_rgmii(), because the delays
specified in "rgmii-txid", "rgmii-rxid", "rgmii-id" always pertain to
the PHY, and thus it doesn't make sense for the MAC to not allow the use
of the full spectrum?

> So it would make sense to design mt7530_setup_port6() in the sense that
> dynamic reconfiguration is possible.

Ok, you mean to keep the dynamic reconfiguration possible rather than
redesign to disallow it.

> I've tested to see that the core operations for TRGMII does not interfere
> so no need to undo them when the interface changes from TRGMII to RGMII.
> 
> I'll do below on this patch:
> 
> 	if (interface == PHY_INTERFACE_MODE_RGMII) {
> 		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
> 			   P6_INTF_MODE(0));
> 		return;
> 	}

Ok.

