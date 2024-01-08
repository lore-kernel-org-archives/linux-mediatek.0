Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D922C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIBng4JuVPQpSbSQKIOiqlRMBF+3n9xAglfgloRNirA=; b=BKBQciAYD+8R9NtsWYpghp2MuG
	UQP6zruYh2qPzqqReK+e5cGcppsGcOd7tmNeVjTo4xNdLxvqz2kXXbj6dQLSa+Qse3dMUQT/OVF96
	GDB2B7yrTTvPXw2fYNquVAtjvfX9dsbu+xWJW8IHbGxf46+vDfVBokuiUHJ5q5Kukh20EuaTJOn6m
	qnAacJCd0fZSTnXsL2mHTL1vFQSWqSAFhzZTGG2dbNISG7WZncrTYaW52kEesMkwYSaFhpU5lk6Tx
	qGIZziLuh4pTw0KxhEyYHl61IJjf8mxdnDPc5b+EH1lqMBpXpBBBire2OLXH6Vfv+yhXgXU3YuKJF
	bE0OjHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnMZ-004fOT-1L;
	Mon, 08 Jan 2024 11:00:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnMW-004fMz-0W;
	Mon, 08 Jan 2024 11:00:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b5155e154so22144995e9.3;
        Mon, 08 Jan 2024 03:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704711604; x=1705316404; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIBng4JuVPQpSbSQKIOiqlRMBF+3n9xAglfgloRNirA=;
        b=MN0qpR8BsdbrTxtNcfTJHTzLIeoMaUO7Z5lUTCRlKY5fEpw8G3m3gieWrZwryc87V4
         xsf8i3J6Q+aoKpxf8XqhkjV9XtyQaCFoL3sQugvGvPx5WaKdRjjckqIgLp1UoxkfsiH8
         kJebRq6dVzuYmwETBJ2+NlX3LO9WXkdewW2BTTHE77MEKuQMBCv9yz8T73l5EX78L17H
         exCKNLIg8uVFHXWkmvoR/W0lpQLa+Wi4YY6Rxvpum13/qC+o04w03RFr+vO3OUm5TdYU
         PqNII8NurW3qGLYfZcDjL4fC79GLQ+5A7keoPAb9gT33dDSKm0IGaS7PgBcHxLFTnd8f
         F7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704711604; x=1705316404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIBng4JuVPQpSbSQKIOiqlRMBF+3n9xAglfgloRNirA=;
        b=Uv77FA42QpFDGsh6R0+abHdXf9PqXJoy9mAKThssb6thygxk/XMYgE6aAg7avPtUWA
         gcvR//qPoevKjBlfqBU1iPuuqWh+OtWvU5pwezfjCPErrhnY8bTgahOu3t76l+48Yh7n
         LkmF9d8/iUhtIJGDlA7OMnM+P/toclx2+67uX+2L34RL2CTX47EkO8St7lzpuWkWxFyl
         bBWDIhXSduLUIXV8z5NHhNSz6x25RmrEd/SrMOB45t4ZdqESNATmY64mOcJ9ebVGgfpM
         Q8pq1jfSps9PwQ9D620RDGNx9p0xNJP3JRC0UtremRxsVxlF4nZe+ztWPqw1GVUFP4Df
         XCKQ==
X-Gm-Message-State: AOJu0Yw/LDC6uESlZN2LAxS0uaH5uDYI/a0aJUlYWxdw3nXlEdUs3ZXG
	pLxO4Kw4FUjpEZwtq0JRKv0=
X-Google-Smtp-Source: AGHT+IEBWswSSTqUHQXeLimviaDVaUJBgApY2+RCvb65xSh5e8GhQ42o2NbrzJxniyY9J45B/T0DXw==
X-Received: by 2002:a05:600c:4e4b:b0:40e:44ad:2e47 with SMTP id e11-20020a05600c4e4b00b0040e44ad2e47mr874588wmq.185.1704711603527;
        Mon, 08 Jan 2024 03:00:03 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b0040e486bc0dfsm1924827wmn.27.2024.01.08.03.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:00:03 -0800 (PST)
Date: Mon, 8 Jan 2024 13:00:00 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Simon Horman <horms@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
Message-ID: <20240108110000.aujqhlufehngtkjj@skbuf>
References: <20240106122142.235389-1-arinc.unal@arinc9.com>
 <20240107195241.GB132648@kernel.org>
 <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_030008_199580_7676759C 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, Jan 08, 2024 at 01:22:18PM +0300, Arınç ÜNAL wrote:
> > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > index 391c4dbdff42..39d7e7ad7154 100644
> > > --- a/drivers/net/dsa/mt7530.c
> > > +++ b/drivers/net/dsa/mt7530.c
> > > @@ -2153,17 +2153,25 @@ mt7530_free_irq(struct mt7530_priv *priv)
> > >   static int
> > >   mt7530_setup_mdio(struct mt7530_priv *priv)
> > >   {
> > > +	struct device_node *mnp, *np = priv->dev->of_node;
> > >   	struct dsa_switch *ds = priv->ds;
> > >   	struct device *dev = priv->dev;
> > >   	struct mii_bus *bus;
> > >   	static int idx;
> > > -	int ret;
> > > +	int ret = 0;
> > > +
> > > +	mnp = of_get_child_by_name(np, "mdio");
> > > +
> > > +	if (mnp && !of_device_is_available(mnp))
> > > +		goto out;
> > 
> > nit: I think it would easier on the eyes to simply
> > 
> > 		return 0;

Actually "return 0" leaks "mnp". An of_node_put() is needed.

