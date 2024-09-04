Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8175CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xko3AdnDwXu1UPoPnl6WxfrRj7WMJuxp0Ni5HvaBX0o=; b=Rn80P5P7BIW9YwHazwtBbd3gAs
	2qPfd/fqd2+mQrbLgdOqlxs1Uf1D624zEYPCCTjOfKyNtfaVpWblz3n45EPDuoWRz7eydjN9JeZIl
	7mNOP/Uu7xI/wafQ/k2JHU26Bm1Iq4dcdBauv1q+yr7kh6vz0JVTR0a9DMarNKFC9mh3Wm5kfb8UI
	cl7oEIv5DoeyiswEdIOuNEZ4Hx1fDENmM2slSS0KhV9Ldp/vvi2oPoCVoFCrBbwp1Bs9+VunCmHXi
	f7j97B6i1N3Gdd22wQ1zEpA/Rczh3H128Z2/BOLmFsmXjl60WsjAfg/WlUG+YHz2twdNTeB7jX4y4
	VhdLjOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slnqi-000000042og-1Lqr;
	Wed, 04 Sep 2024 11:06:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slnqe-000000042oJ-3ov0;
	Wed, 04 Sep 2024 11:06:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso5717665e9.0;
        Wed, 04 Sep 2024 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725448011; x=1726052811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xko3AdnDwXu1UPoPnl6WxfrRj7WMJuxp0Ni5HvaBX0o=;
        b=UcwjE99qtyZVaafMz/Pwii3621er8omctfa242JiqznYBkuST3xEENtqEk7naDuP5f
         OUwoTH7f3fQ8PB+TdRaDw9yD8e2lV1nzaq/toRwTWEqfCEE6N6l3fjYol6Qah1gcvMSQ
         RKm9pDGJgLE4xmPRwoHcoBKP38NxP3veN+cj4azKrKUcg9e/UPAMDt3PSb3Nc6q9EZ+c
         +thekwswop1vT1ZfMuYvxfR7bMYWLNqrA5A3gfqBiMlBYC+7+E4eCNgSYYfh+MnHaHJP
         r4tgXBsGk/Zmh/mEPK62fbwEMbXJaol5rkIyS+wbYj6liTr9Zn00qCVCbCnttE5LalTs
         Hdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448011; x=1726052811;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xko3AdnDwXu1UPoPnl6WxfrRj7WMJuxp0Ni5HvaBX0o=;
        b=cYjW2+duufPqZTLZzSn1CpGs/bMg1qsryNanpCEmmSnj1akD4sREQ26JVjMiDBpu2C
         gLQ9avH6SOZJAahVPJ/SqCyrLtCn7Y1UJoy5rMTO8Ambqlt5MGbpp/0ggio5S597IGZ4
         Gl9IQUiv2kUYe/kX2+1YOquW4mI/JmWC5NBAv81MlYh0y7bvySLPsVmOK+N10YWhZEN1
         bZSXURFZkKeYu3jIs2jLvyiWrxbx0CV8fXSlaw2D+Od1lDZJd0seZbTO/7q2ZWJajSyv
         c1tDU7reUAsgOYi0Y1nzNVpzsWGihJMebQHAaXok/O/HJBLo3+H7O2RiQgxaHI/Nzllx
         zaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4n86/D6rT1+lsOXTIUDZ2+ud33kWVhhsVJR50BJfUOlNxOr9oDpBEpubLJ1+8AxOaqskcYINp9oTatoMZZcA@lists.infradead.org, AJvYcCWdOoYP6vcYyvI0jHEvgvFVcQgYk0ZiqjMEWU1OCGYBKOcr44U8d1l4F9EduP65kGEgkIakquy3D+g8VadUJBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhAWxL0KnMaUNvt8Jm2O94Ia+tekF3Ko8RCPWcUsKGvasc0mP1
	DR+nkiaFCyI2TBHpAbau7MKSnR0MRkoju9aaedrv4cfk7WT/bYW5
X-Google-Smtp-Source: AGHT+IHUMikIomgVAajePk5PmkHaQSWCkSEU4DQdow9b2O+jbzsNIiZOILgd/MoiMo4W1w4+DjhFag==
X-Received: by 2002:a05:600c:4e8c:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-42c9548d081mr14423945e9.28.1725448010702;
        Wed, 04 Sep 2024 04:06:50 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-16-250-236.retail.telecomitalia.it. [87.16.250.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbf00e095sm161231175e9.13.2024.09.04.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:06:50 -0700 (PDT)
Message-ID: <66d83f49.050a0220.3d273e.b096@mx.google.com>
X-Google-Original-Message-ID: <Ztg_RsH5rep8cwuN@Ansuel-XPS.>
Date: Wed, 4 Sep 2024 13:06:46 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-2-98eebfb4da66@kernel.org>
 <20240903153353.GZ6858@google.com>
 <66d72ea9.df0a0220.21f5f.029f@mx.google.com>
 <20240903164218.GC6858@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903164218.GC6858@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_040652_974722_1DDF848A 
X-CRM114-Status: GOOD (  36.83  )
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

On Tue, Sep 03, 2024 at 05:42:18PM +0100, Lee Jones wrote:
> On Tue, 03 Sep 2024, Christian Marangi wrote:
> 
> > On Tue, Sep 03, 2024 at 04:33:53PM +0100, Lee Jones wrote:
> > > On Sat, 31 Aug 2024, Lorenzo Bianconi wrote:
> > > 
> > > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > > 
> > > > Add support for Airoha EN7581 GPIO System Controller which provide a
> > > > register map for controlling the GPIO, pinctrl and PWM of the SoC.
> > > > 
> > > > Schema define cells for both gpio/interrupt controller and PWM.
> > > > Moreover it provides a dedicated pinctrl node for pins and config
> > > > definitions.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
> > > >  1 file changed, 433 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > > > new file mode 100644
> > > > index 000000000000..a9080c7f50f9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > > > @@ -0,0 +1,433 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Airoha EN7581 GPIO System Controller
> > > > +
> > > > +maintainers:
> > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > > +
> > > > +description:
> > > > +  Airoha EN7581 SoC GPIO system controller which provided a register map
> > > > +  for controlling the GPIO, pins and PWM of the SoC.
> > > 
> > > This whole thing is just about pins.
> > > 
> > > The MFD portion of this submission doesn't do anything.
> > >
> > 
> > Hi Lee,
> > 
> > thanks for the review. I think you missed the other series as it was
> > requested to use MFD implementation due to shared register map.
> > 
> > > Please rework this to omit the MFD driver.
> > 
> > I'm a bit confused by this you mean in the schema? Putting PWM property
> > in a pinctrl schema looks wrong to me :(
> > 
> > > 
> > > After just a glance, it looks like simple-mfd _might_ work.
> > 
> > Simple-mfd works if register map are well defined and you can have
> > something like
> > - parent define the whole register
> > - child can user reg property to register offset and subsection of the
> >   parent register
> > 
> > Here it's all mixed and scrambled and also it was requested to have a
> > very simple node that include both pwm and pinctrl property (cause that
> > is how the HW register block is designed and schema must reflect HW)
> > 
> > Hope you can understand these reasons.
> 
> Thinking very quickly before I have to rush off.
> 
> Have you considered syscon?
>

Yes it was considered and proposed but it's not suitable for what it was
suggested from DT guy. A syscon implementation would require adding
child nodes with compatible (to probe driver that way) and that got
rejected.

The main reason is that it's wrong to create .yaml that describe how
the driver structure works (mfd + child nodes with compatible) instead
of describing how the actual HW works (single register map that expose
both GPIO/PINCTRL and PWM)

-- 
	Ansuel

