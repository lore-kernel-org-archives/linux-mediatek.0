Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB6E784BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf4ZNhuPTEn2Z+23t2mZfOO20aAgYvdXy8GsiBgu4PA=; b=uLtp1R7sn4OxdATiKLdEEaIpvo
	7MFm197qC3+p9FCsBxxx1StHq+XGbpAxhxPjSHGEPwW6numbzEitzMBaF9YfR3CQukYkrCcUvX/9j
	bmH8ILWAzpZUUhz/sgDrJW3mAiJeuBuBxLP6vg3VclVLhHF94nu1ZcxMMrHVC0cPrVGPtOwv6GYMY
	L13LGcmmqaxgh8VREXOJTEl5IfsLp9/sm6iO4V2HAYNXYb11udazZ426EKhVQjgulIFiki7HDL7Ay
	0/7YZdXDHfGkF2cHOPkvr5jmBiZ/fUq6Z40NXI0QO+Jr5NQIvReYAwyJzH0mEi1PGB/WS0+FCWcwW
	Lk7swn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKgU-00CyCj-1M;
	Mon, 02 Oct 2023 15:18:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKgS-00CyC0-01;
	Mon, 02 Oct 2023 15:18:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1709472966b.0;
        Mon, 02 Oct 2023 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696259884; x=1696864684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf4ZNhuPTEn2Z+23t2mZfOO20aAgYvdXy8GsiBgu4PA=;
        b=lWf4f1xdrZlZQp4Xeg2Sj571yHgK4dbm7bN1mImQnfdppXIvEAhY0PmntB+Rkra/um
         u7LLuPTarDjRyMP2Yce1s971HgLFQYDYBvEYLqDVEcAL6XomODlrpJKXoDE3HcmNOtsV
         nDRaUSP1FVbKjYU8zXpmxhacFGwqhL1SE8pgbCOyrkx6FzgGQyFWMLXv8Y63EHMVpKNM
         pzcReSxSMrNN88UliEbh2eA6+Ldz9KxhW+dMphZQ6IXZlqw++IuO7b6PLOLog6C8JfS2
         Wo8J0bAQ/jZj0+ePCtD+AhL2WTOr48kLbfJ7KVAuwJ7qhzjVkbk4BOvd/HZ9pjYTW+Wh
         k4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259884; x=1696864684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf4ZNhuPTEn2Z+23t2mZfOO20aAgYvdXy8GsiBgu4PA=;
        b=vBkZh6ASrQBKtydhpOo6ex/qOSukK9RXag3oqKmzozUpjU+rvQQyCt0mjc5Qfq5SRb
         DygoQvwOIhD2gWLKlzbtIhq/Q+Xd6+lq0qI3/1SE2IwcwdCqDePT3OLTF2MQlLhLHpeW
         +DqTstF1Js7DsaeIYG0UogY8fDin3n3DbcYH4dpui5xxdKZ5aBtQq3f4e9Zf2VpD0KSA
         FKz2KPMvewGXJSegT1MHYER9ooYJ+Lx5gCGfIpx9DaGLcFQ1V8rcCLPkrRm7pXzSFJcL
         aEh5oIvXjuEa+NORZXeJr9pUG4qmrCWGJSxJ6Siph/qqUEBeNfy5dQBsRPZHFUYlVFEj
         d60A==
X-Gm-Message-State: AOJu0YxTe3rfR+BPp6MjqEanxOGUF707ceYJO9lvgb3VKwMOvvdrP5R2
	loXkBoZKPN/U6E+mVTwEFR1rYkri9zw=
X-Google-Smtp-Source: AGHT+IE/ItgUGymnepNrrbl5yIUtcIkxs6IYv1D2G8pKdeZY3XS+nDz9H28wjwX8hTrvPzRxk75ZDA==
X-Received: by 2002:a17:906:10cc:b0:9ae:56ad:65a7 with SMTP id v12-20020a17090610cc00b009ae56ad65a7mr12407824ejv.45.1696259883385;
        Mon, 02 Oct 2023 08:18:03 -0700 (PDT)
Received: from skbuf ([188.25.255.218])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709062a4500b009934b1eb577sm17399795eje.77.2023.10.02.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:18:03 -0700 (PDT)
Date: Mon, 2 Oct 2023 18:18:00 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Ar__n__ __NAL <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt753x: remove
 mt753x_phylink_pcs_link_up()
Message-ID: <20231002151800.z7zcad2lw4jxjebk@skbuf>
References: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081808_062704_745B3752 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, Sep 27, 2023 at 01:13:56PM +0100, Russell King (Oracle) wrote:
> Remove the mt753x_phylink_pcs_link_up() function for two reasons:
> 
> 1) priv->pcs[i].pcs.neg_mode is set true, meaning it doesn't take a
>    MLO_AN_FIXED anymore, but one of PHYLINK_PCS_NEG_*. However, this
>    is inconsequential due to...
> 2) priv->pcs[port].pcs.ops is always initialised to point at
>    mt7530_pcs_ops, which does not have a pcs_link_up() member.
> 
> So, let's remove mt753x_phylink_pcs_link_up() entirely.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

