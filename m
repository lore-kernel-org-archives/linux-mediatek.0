Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1BCFD376
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlsTM8X40xseZoss4FmEjFSiPfPo4hKAiGVqNHsXGAU=; b=ptMtcf4tZqrgRKU2dV1XjlYrOA
	qLNgJNZRuUC2384A/ihaptW98s0g72x9nAL1J8tTrLzd7OWqrtHzifuFhSvJ1iQjqeLfpHbdbqM3p
	i1NAwXbAX//hu+nniNIzNKgvZeViQaY/LqA30ku1NVrjB7LkZldyYQ1hjTpGSCh0zqBFYAbSB5Z/P
	SujWOll5zO1MinVav8OZuzUoEOm562lbp0c96S5T3PD1RSiRC50g2Hb65WeH+RL9Eo666oveLc93L
	wIMLxRtC3ioWZr2Sm8kJJlRJrKCVCXRD6vjAjqTNXutncrp31nwzvpRsFR0/WtWZ45E3HWhU+NWx1
	PTAWIZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPcT8-000000028ez-397G;
	Sun, 30 Nov 2025 08:07:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPcT5-000000028e9-0Pd4
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 08:07:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779b49d724so4489265e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 00:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764490057; x=1765094857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xlsTM8X40xseZoss4FmEjFSiPfPo4hKAiGVqNHsXGAU=;
        b=V0FeOekn8Zbghw2p4U0DYr2sz7o+g80K5pJ296/r3U/GtT65gw7DP9CJlQ7aBU9F9/
         Gmrw5HtFZRZLl5rah9/g5nd2YycARYBSk4Z0ojuzn5jYtckS9La0oLQtMfhdoTNrIZvh
         Fu5GzwRKOhO7NaUfbTa7rMrjoO1X6/8hriiC+tabF7ovGFSeDXLAINZQPohKvodvWziv
         l29Dk8isvITDUb65pSUiVDfB+xnWPrxeQy/5q2U0jpKINCAp9BjcMt0C+wQ/RYsNoocI
         APC+QRnmGqXmGhdyLg7RZOt1quCFHDOOwxfei3jakjbefT+9fnrziTtCk3rqa5Wt2LkK
         qW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764490057; x=1765094857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlsTM8X40xseZoss4FmEjFSiPfPo4hKAiGVqNHsXGAU=;
        b=aKt5DEnHFKg7rwHsG9QbzqBY6mMw0MO2KFL1LKO/eYxuN98f1Y0W3shWOjC7+lBcP3
         cWW+Fx9zUMhaG7/xBc7H4XmQM7p9gjLwZB4iLKS3pwmOAtNlqSQgze9XDsuEdoM/FzNI
         Uwv/zw8Bigmbr3CxMFydJ/ZwQ6lkrQZX2jrvREMO/xDeEC3dm+7H9cZX38cPZxgizZyG
         /tOtHuLteHUoluIVAj/5yFyhha0GRdlDWypwcGdXIUqcsPEZabcO6IyVVuH+pFiazwLr
         BOHwK37vVrAtPOe33/OIgszkxe1ei7skOfdqaeezAORp0epuNPIDsyJaePUFXnNNoF7B
         zMeg==
X-Forwarded-Encrypted: i=1; AJvYcCVsg+Fa2+Lfvypmc2jRQldJCrVxtzPQndt3HIO8R0NJUzcVeB8MCAYl0KMOyCberSqbnSsQnw6wBctOWNYpsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwonP8TX0EyUot6lHjGsW2mR/SJOvf9GbRl6hdHutQRTG9lVo+q
	k4B0UtXyi9eOq7dHabY/x/HO3tSguT2Fcu3uHndOvZvRVRtlVjvjoxAC
X-Gm-Gg: ASbGnctHu+HZoXFaaIUiwsO3GRW1Nz9NlGuPorNqPX8rErPUggPvaVlK4ScTnxrIew0
	80k+pi4NbnKCVx8Rk1fVPAocneOoe74q1TszdOpEhwwpeJcYlxeMRMbCp/nt+ESiL/4kvFBQfMa
	p1QIrL2TPUbkNYv1muI9qJKIKI7L2Gx84udE1vFvYdjgraAmOa4xMV8AMkKaFsUNtF5RLLUbp20
	bCJ5p31K3SGoHcW68O6+TOQ30fcaQTFcwZOxXWXAmy64fxeoGio2lT0+dcciCXwCa+OvaOc22x8
	SH0q+QfEdORzj7A2SMq/XwX+6MJ/J112hTCxO/LFct4Gmb9EBJie8fa0zgd7BgOBmy7HkuPEgYl
	YdCvfFLEbiK8zixRyc5mdshAJOb5yCr7/H1wMoAaV++/r+u4f92Q+8bMqHYt8C+g/8iQE7wX3wx
	xFuw==
X-Google-Smtp-Source: AGHT+IFlU1lz0wAxOd6SVfn1aivlWfEl/Ou+5sEfrekzWHqCsdYXRmCmN0O23F/dtfV/GF8aZsAtOg==
X-Received: by 2002:a05:600c:628f:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-477c01bc376mr183264015e9.4.1764490056388;
        Sun, 30 Nov 2025 00:07:36 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:36d7:677f:b37:8ba9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040a9cf4sm134950185e9.1.2025.11.30.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 00:07:34 -0800 (PST)
Date: Sun, 30 Nov 2025 10:07:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251130080731.ty2dlxaypxvodxiw@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_000739_297063_9ABF363D 
X-CRM114-Status: GOOD (  15.22  )
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

On Sun, Nov 30, 2025 at 02:11:05AM +0100, Andrew Lunn wrote:
> > -		gpiod_set_value_cansleep(priv->reset, 0);
> > +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> > +		gpiod_set_value_cansleep(priv->reset, is_active_low);
> 
> I think you did not correctly understand what Russell said. You pass
> the logical value to gpiod_set_value(). If the GPIO has been marked as
> active LOW, the GPIO core will invert the logical values to the raw
> value. You should not be using gpiod_is_active_low().
> 
> But as i said to the previous patch, i would just leave everything as
> it is, except document the issue.
> 
> 	Andrew
> 

It was my suggestion to do it like this (but I don't understand why I'm
again not in CC).

We _know_ that the reset pin of the switch should be active low. So by
using gpiod_is_active_low(), we can determine whether the device tree is
wrong or not, and we can work with a wrong device tree too (just invert
the logical values).

