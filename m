Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FA0C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NX3sCNOh0ED9p71133Qk1RKXP6AygCB/B6GJLxt724=; b=bwH38Q86x0OCnoBKv07uhiAw9O
	QsWC4Cecaj2AS3jmO3QIeUU5h2zMHxkdOsAXvvPqAr7RL9Mjb8w6IB7vbMZBKxX6lUH9+LHN9FCBc
	5bp66DBhZbDu9I4aYl2e7u/niq85fRaKFQPbQK2v/gS/zufuXO6lwj+FOdyp/xhcLZXi8HqpqwJIk
	w5Iiqe2pbgGE7GxGc1clFY+9zxRjWC2mmBAIJwICLtibgwUPIcJJERAdB5gjERcDGFd4F4bprtvH+
	rLpCxo3n/4B4iP5HkKyTLyu/9ZtUB/egJWDEXvotGlQKZrCxfbWHD+wcy2LrPTqhkgX1OYCdrbDM3
	Hk4zL0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPax-00EUNV-1m;
	Thu, 04 Jan 2024 15:25:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPau-00EUMp-1v;
	Thu, 04 Jan 2024 15:25:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a28005f9b9cso72444366b.3;
        Thu, 04 Jan 2024 07:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704381912; x=1704986712; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1NX3sCNOh0ED9p71133Qk1RKXP6AygCB/B6GJLxt724=;
        b=BGtpD7LleNJolRndtlGzDQqBSMu+SfJnoSth/Ea/v9YTODMeCS0zMKt8Fx3tc5VAiK
         AwAHOmYOh2eCNqFsllN8bzrzehZs/K/FLWCHxL6FmujS/Wmkn9I2TSJwc10L+KdQG5xS
         RpGii5vHqrCHfAuLplMcxC6d/Eu1iWLAmfKvB1065+9Fj97ESp0ROcn0XeqDtIjHDcgN
         Rv5/cHADwk36E4DlOuuAfy9KtqkEnLrhEzxcwmu3nS5r3GDrsyBqXBCepkmXwnsBzb1j
         gKwwn7QNO1pfGrnWS/NNfpRediwZOa8MwsjLghP+RbpbgHAqg0XptSykJP2p9bwrxHJV
         FpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704381912; x=1704986712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NX3sCNOh0ED9p71133Qk1RKXP6AygCB/B6GJLxt724=;
        b=Pjh/oO/2vAlZpKqb9bYUaX2Ja5/vJ3cphGTRf/9w687Vilp2fD9t6//bNxmuwB6MQU
         zpzHgopU5aF1d8aQ+TewcOhD7yHPeQ02kuh+J0Qrns82FEEtozYOhkKEsZlXZYJ0t6Lw
         4KWk5eZoR/9LnIXVri65UxlsYHtZVjetiATDHeIKMlmasYzMzJs07HtUN8UQA1hx3aVz
         GpqeF0ZxIaEWh4WUoA8vWwmZrLhy945cjqCSBzZ7lUbU06X/4JLpVGTlwMRFMTEh6Hdp
         ohrlC69X5YE9ZsZgcX+IS0zLooNbTftysvXxMhmVgksxcdrlxhOzSeVE8EHoKMznrkxz
         ESDQ==
X-Gm-Message-State: AOJu0YwZ6kHEkjyy7IB2mxHZp/CRdtTxtBtADzPZQjZjiVgYkXsHOABZ
	4za8wXvJmwkDpalMKIemc7Y=
X-Google-Smtp-Source: AGHT+IF5LYbHLGyB9BUopyv0gdjS+WBokyR9trbGqCfXuxoIRLry/U7C9toUg2NmeG6KQ8XjELG+oQ==
X-Received: by 2002:a17:906:4882:b0:a26:b88c:42c2 with SMTP id v2-20020a170906488200b00a26b88c42c2mr370974ejq.93.1704381911381;
        Thu, 04 Jan 2024 07:25:11 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id zh14-20020a170906880e00b00a28e5c875f8sm587686ejb.219.2024.01.04.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:25:10 -0800 (PST)
Date: Thu, 4 Jan 2024 17:25:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 4/7] net: dsa: mt7530: improve comments
 regarding port 5 and 6
Message-ID: <20240104152508.nde2nzw4pvcjlov7@skbuf>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-5-arinc.unal@arinc9.com>
 <20231227044347.107291-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227044347.107291-5-arinc.unal@arinc9.com>
 <20231227044347.107291-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_072516_658414_8DCE39AC 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 27, 2023 at 07:43:44AM +0300, Arınç ÜNAL wrote:
> There's no logic to numerically order the CPU ports. State the port number
> and its capability of being used as a CPU port instead.
> 
> Remove the irrelevant PHY muxing information from
> mt7530_mac_port_get_caps(). Explain the supported MII modes instead.
> 
> Remove the out of place PHY muxing information from
> mt753x_phylink_mac_config(). The function is for MT7530, MT7531, and the
> switch on the MT7988 SoC but there's no PHY muxing on MT7531 or the switch
> on the MT7988 SoC.
> 
> These comments were gradually introduced with the commits below.
> ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
> 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
> hardware")
> c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

