Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28ECC54FB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBy2FynzJySNwoFbdoLCjlxvv36qfeTMfoj03QNsxyo=; b=stnGHj+JlESoemF5s/IAnYanr3
	dRsAqfGAahbsk1Rq7+bD6Fp5KmXWbFRHn1OALkVqWk5f+YktoaN0YAi7yhYCNzAEy28COReZ6lftg
	6K10bWh4bPkhI6byYO+jqNS8YmBfBuTMfZgiuL1PzbpZwbFMsVu12d//oZuzdCUoV88AzNcmOS84b
	IVfAqenzXXQzcEx0qJ5a9oHNbCLeJdScHE7sJ9lnnqST9lhj6HSanjPo75sQtKjJd+xF1QDek+ERW
	UO94qIofLoFXMteT8C5cbTwV5cw3m5XrjYHcXUIJk83RwhjR0zv8DNQp+zzmltWB1PbOBJ994iscb
	U81wN6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4j80-00AIvk-3C;
	Sun, 19 Nov 2023 14:50:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4j7x-00AIv3-17;
	Sun, 19 Nov 2023 14:50:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso2744117f8f.2;
        Sun, 19 Nov 2023 06:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700405423; x=1701010223; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZBy2FynzJySNwoFbdoLCjlxvv36qfeTMfoj03QNsxyo=;
        b=PBf7CuS3qxH9S0nsnruoorfrpWebeZTDjvhQJa8xiMWcn+cqx5U04QYPE8uh738qW2
         887LNBDgIiB1xV0RE7fieZuR1LKJsPQl27Wck21zH1T9FpMUABV0OCmM13tuqAsET+1J
         7qMDhMetvXq4lRGh77ALV5K0CPidONtnecESE4273NzNLEG8Xj6Gq3FLuYerYBsc9/b4
         ETSKCeWLYP9DwklfcLYq0kg0mEQqTIiDm6af5fvbEVaDgWoXjF5dlEA1TnRccKLgOFZE
         9KU4R/dY+yH51nY77tbsLtDpfAzU2/ycBYCiGMpluSOrApdpOSWf62VxWK6mxyN0u1Sj
         FQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700405423; x=1701010223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBy2FynzJySNwoFbdoLCjlxvv36qfeTMfoj03QNsxyo=;
        b=P2nZMR35IKqClBLyDM1vnUtnjEvgrZWFsL/f9qu3nGWyOHblO0bXgqC94pO3GJ9LCW
         C2d3V3eFAEnffA1ldYVw2TIhYl3U7YQEx9aI48b4v9PyU4cnvf1oOlqQEbYIw75m1u3B
         9LefKZQ2B2ix5iQDkkujdgcv25ffmspo85AHVJTAUQyP1CYRtG3kpugQCUDtoEORjuR2
         eBhO+2Hscst4t0/Y8C5K8LOwnXPbbgG6mt5zid2l8LelvRajnn1LlDpulBXHZkiBSGI5
         VYhIHbhVTsTsPuomoh+TGqux3lOr3z08zeZvRAXI39Gk9ENEcncAqpN8Ix7yg1aCSRYg
         9Opw==
X-Gm-Message-State: AOJu0Yxx0tAjUKJmk16GQut4HTgTzzWUyy8uM58KDoEzBJj3NkCYagqm
	dx5nQT0edS/8j7PZqkB31GQ=
X-Google-Smtp-Source: AGHT+IFhNrGV/AQm0viGUiqf/wW1h6qaQk1NwH4o8i5PU8ncxwa2CSxnIhrNxRFvNQ0LPFzLDJDNnQ==
X-Received: by 2002:a5d:5f49:0:b0:32f:7d67:baf1 with SMTP id cm9-20020a5d5f49000000b0032f7d67baf1mr3589905wrb.35.1700405422767;
        Sun, 19 Nov 2023 06:50:22 -0800 (PST)
Received: from skbuf ([188.26.185.114])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm6885022wrq.78.2023.11.19.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 06:50:22 -0800 (PST)
Date: Sun, 19 Nov 2023 16:50:19 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 03/15] net: dsa: mt7530: store port 5 SGMII
 capability of MT7531
Message-ID: <20231119145019.6gz4j4crwgyp46bf@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-4-arinc.unal@arinc9.com>
 <20231118123205.266819-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-4-arinc.unal@arinc9.com>
 <20231118123205.266819-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_065025_410516_ED41F3E7 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:53PM +0300, Arınç ÜNAL wrote:
> Introduce the p5_sgmii field to store the information for whether port 5
> has got SGMII or not. Instead of reading the MT7531_TOP_SIG_SR register
> multiple times, the register will be read once and the value will be
> stored on the p5_sgmii field. This saves unnecessary reads of the
> register.
> 
> Move the comment about MT7531AE and MT7531BE to mt7531_setup(), where the
> switch is identified.
> 
> Get rid of mt7531_dual_sgmii_supported() now that priv->p5_sgmii stores the
> information. Address the code where mt7531_dual_sgmii_supported() is used.
> 
> Get rid of mt7531_is_rgmii_port() which just prints the opposite of
> priv->p5_sgmii.
> 
> Instead of calling mt7531_pll_setup() then returning, do not call it if
> port 5 is SGMII.
> 
> Remove P5_INTF_SEL_GMAC5_SGMII. The p5_interface_select enum is supposed to
> represent the mode that port 5 is being used in, not the hardware
> information of port 5. Set p5_intf_sel to P5_INTF_SEL_GMAC5 instead, if
> port 5 is not dsa_is_unused_port().
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

