Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF608C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 21:22:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CEC20770
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 21:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgAJgNds";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF9NC+kf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9CEC20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e3mPj/Cploq29/caroJVnUeXmbXuiaiETdxMCL5mqlw=; b=dgAJgNdsgsI7NdrprFpvogDb9
	uswpXSmmTd2W7j7eJ4KmJGq4urBLE+kTsj5dXC9ZNUQccg5kx/bXZqvmlfpWj5AV9Ek8ZwfLBP1yY
	QAOg6o0oSx2wW1kW31hJ7USR4vL46r0ZkA0Y8ukDmsR9cm4DH8o7GE6+RIiEgMVoYv+6pQ0i99iYK
	B2qnm2v3ZRLqlzl0Nox7ExEYs5s8scVFll8YH+9iqXhwoZostNGd/w/qpop7vJyAQnO2AvbnsSJCk
	Im90Cc/xgtZrOEkUyyt668cD05kop/uFHXPzPSn6Ni1KcqBZ/cj0OLvTNuakzUuvL3TOdxz2LeaHS
	mJsyzjlyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIesf-0003Iu-LD; Wed, 16 Sep 2020 21:22:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIesb-0003IK-Lb; Wed, 16 Sep 2020 21:22:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id t10so8372575wrv.1;
 Wed, 16 Sep 2020 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rZwJCenpJW1FFkhwXKCJoTS7EbTuiQatdTV3wO3465M=;
 b=lF9NC+kfAULQDzJUeIysMGpU1qmq1uc9cI0WU7ORfR1EU2dLqnh94+0r7StcST6C9p
 br7r/ZmCqXP2ymM4AVq1cinWHtmFK5vh3JULY3m8eB6v/V2CRWr1fL5O9R96OiXUcFEY
 eyFkuJT1gJtJUl0vTpqMzdszq0AMAFJhuNduH4SgHXLhSnJTNS8nVuV9F5+MfurVxEJ/
 G2AlSOMo4/OhGgHvgVKc9ezZwZOknpRQnDxsDCcu9COQpeplvBWnhWOtTF/CS4fmzszO
 xDg4PltxpWlXG2I2IY0Vmx/1agW+6vdK6++hromHbLgQFDnTZ6QKXGtJFu1F6E/QuyL9
 wxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rZwJCenpJW1FFkhwXKCJoTS7EbTuiQatdTV3wO3465M=;
 b=OioBIIQbMaIDbZnTA29/SlFXNLcUlLrCZg4WyQiJ1dBrA9Hasqj0K+5psUCJgoSqMi
 qjk74dVGeO7xC+sDe6fisM4C91tMEOf7we1mZccWUc0kNHsVDIP8mIdRqTwlfTJck3rN
 SfhsjLLHPfO8nolzRey7ctVcrnRNvcKW7HQQqkFpPXsrgTunUJyHMwGy6Q/mxGHBHW1c
 3XGOyvqotEAn80uKahT3/4ywCNxy2SvOmeg5Up4gcXLCdAHszM0F2+KEPRdGqKTqNJSb
 YGzdOk63nJCS3mxHAnSWYWEYrFUY2Tc1rQ8Wr42FSjb1LY6nRpdg6OTWB4yZ/D2Isqi/
 QcJA==
X-Gm-Message-State: AOAM531a0Dd2kcA33Iuc9x0kyKEV50f+46SPy979XlNppvZW6nG9vD9O
 2YjIxksEbXuWURsMXJEX6Ts=
X-Google-Smtp-Source: ABdhPJxKuwijj5bY37fOmOmdBmn1qD4Bk+KgvLkkEPSn5wxYikUVEInLjb1qrj8IlMvKQsfEROjXhw==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr6367417wrp.384.1600291336432; 
 Wed, 16 Sep 2020 14:22:16 -0700 (PDT)
Received: from lenovo-laptop
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id t15sm28380498wrp.20.2020.09.16.14.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 14:22:15 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date: Wed, 16 Sep 2020 22:22:13 +0100
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] net: dsa: mt7530: Add some return-value checks
Message-ID: <20200916212213.v2xqqj3ep6v452eh@lenovo-laptop>
References: <20200916195017.34057-1-alex.dewar90@gmail.com>
 <e46ec744-ec6a-e53a-03e8-1c75c910682f@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e46ec744-ec6a-e53a-03e8-1c75c910682f@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_172217_730544_A987E117 
X-CRM114-Status: GOOD (  12.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Alex Dewar <alex.dewar90@gmail.com>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[snip] 
> >  
> >  	/* Enable Mediatek header mode on the cpu port */
> >  	mt7530_write(priv, MT7530_PVC_P(port),
> > @@ -2275,7 +2279,7 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
> >  {
> >  	struct mt7530_priv *priv = ds->priv;
> >  	phy_interface_t interface;
> > -	int speed;
> > +	int ret, speed;
> 
> Don't do this. Instead, declare each variable on its own line. In this case,
> speed before ret.

Good point. I'll do this in v2 :-)
> 
> Thanks
> --
> Gustavo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
