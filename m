Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5QSL2KQ7I6Qbye6De1VwL36uZ19OhoWx467Nfxob8I=; b=4r05c0xCg2L81HDhDDqQ58ZkGN
	lv97778s6plIKAc+P8aYGIyKZv21cVsFlCNvxe5zxlht2WL0gtUZ2vBdGNg/jGvQXvI4rRG9shYX4
	Wq2GxrLQRyr+rOLswSOKnX2MIEe4oq9/sFKqXJ07LgWml1a927URT6tY4ih1d8bPaiZmLxhisAkE+
	PgddzGeNUFeFx+BsEC/3+cxLT/InJEfjUs7ZEmeo82AdFwGaFvTPqvnuSPHWFa1n3SI3PvTya2YwM
	q/+Qy/2S8BeBp9mldV/Iu+ZtpPoml13864tNrRGeWTh824G4cWhN+SCjCZ8fvc52uGpC9PjR77xgZ
	v8wgDLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx3m-002QuX-Ch; Fri, 03 Feb 2023 14:29:02 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwtr-002LlB-Pt; Fri, 03 Feb 2023 14:18:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id be12so5324765edb.4;
        Fri, 03 Feb 2023 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5QSL2KQ7I6Qbye6De1VwL36uZ19OhoWx467Nfxob8I=;
        b=oFKxvoCUuD0kdQrD8wLZOBSp4dHJc3BesofQGhdR7hhRNemcXWTuC9jlIJMSzYBv6J
         HWsVLvltQhLxb2O0lC8FYLFaeo7pyIwbRKuD1kaGN16r9MZtpHmd0/208Al5d8lgaehP
         SxTSa/gXboj+rMT6TaruMb4KyVGzEsJUU3gsAsCAhLnje1V8dMb5WDjsrieanlUJ+QnE
         fhimA7zv+xBh6GNsEu4+yeUz/94V0Uw2dAsEucDF//vkBtOWM36Y9NEwBd/KJ8cAqqYM
         /JMO04RD4Xz56hR45fxx6t+Mv9oW6qya25MeWIEpVcCq1h+xluL4//pKeBINs1uIow2l
         BNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5QSL2KQ7I6Qbye6De1VwL36uZ19OhoWx467Nfxob8I=;
        b=wIXSq80qpowFPvid1Ry2B9GxePSUjKqN+1KPm7fdPtIHyB6Up5pKtWx1vsvl+i0Thp
         uWtUZYMYhlxpo6WtsLwATKpAuPQhpbCv6ME3/QbKB1dtq3OZpidlWWdUG11J3sfyUb1x
         tIfpfTSyMuQ0EJF7ZXIUK+8Dr+vyKxiH98U7X35rBpttk/rJg9X23gL7T2Ng6Sn5T+hE
         Xx8aFKO3oY/8uRdtvBytrXCIPP/DmnSP6+7VWYmX7G4PZ8R8CdB3l9OOe6AWtOSBtf2v
         1/0MTg/tkuipI1apwXV5qsLWeIB9BEIe6fCoK2AemunoOAVmeTg6vsjIFG3foUiHLRb3
         0BSQ==
X-Gm-Message-State: AO0yUKV4578GiJrnHCkWW39nNYLEI8Tp8ksD+KT9Py20oMaITSy4WMOx
	njdm+wGXolfhMQNnyd9fQHVu2V4QOw9BAQ==
X-Google-Smtp-Source: AK7set/lqhJkKG1jhrlMZ7tsVU350vT6gguJgctsAvHm76Udi3CWQAiKtESaORNQaAbHnXKFxJ2QPQ==
X-Received: by 2002:a05:6402:124b:b0:49b:63ea:b5d8 with SMTP id l11-20020a056402124b00b0049b63eab5d8mr10962336edw.4.1675433923587;
        Fri, 03 Feb 2023 06:18:43 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906855700b00872a726783dsm1408158ejy.217.2023.02.03.06.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:18:43 -0800 (PST)
Date: Fri, 3 Feb 2023 16:18:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 1/9] net: ethernet: mtk_eth_soc: add support for MT7981
 SoC
Message-ID: <20230203141840.chljzf3opxbxyp33@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
 <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
 <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_061847_889959_ED828B16 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri, Feb 03, 2023 at 07:00:21AM +0000, Daniel Golle wrote:
> The MediaTek MT7981 SoC comes two 1G/2.5G SGMII, just like MT7986.
> 
> In addition MT7981 comes with a built-in 1000Base-T PHY which can be
> used with GMAC1.
> 
> As many MT7981 boards make use of swapping SGMII phase and neutral, add
> new device-tree attribute 'mediatek,pn_swap' to support them.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Phase and neutral? What is this, a power plug?
Since SGMII uses differential signaling, I wonder if this isn't about
the polarity of the TX lane (which pin carries the Positive signal and
which the Negative one).

I think there is room for a more general device tree property name than
"mediatek,pn_swap". The Designware XPCS also supports this, see
DW_VR_MII_DIG_CTRL2_TX_POL_INV and the comments in
nxp_sja1105_sgmii_pma_config().

