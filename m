Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9066FC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3fMS6vGtNlmEZteMKVTwMOKhjb7WLirh4B0WOh1xiU=; b=lbnjY1om4ZzqzGIhRpC2nj8UIq
	Z7QTtA7fF5y/p4pFNuHhzAKVl+dmDYNzXsUwKu+MvgZMlj91iANdpuasmNSlmqxdAvkT4oi16krH6
	7T/hQprlVL+XJYUiQapOeHPWPpWjy9S9ouFaKLHkQdzwBk8oGT7CLTvC57O7uCYfn+HczaRfbQ7Hw
	A7VBtE9Y249qoy6Dn7/1g7YRkQOFevHjWNBBCiUP+D18MrrhNlhsJ4fSIH4DFZNBPe02M78/r07JJ
	PVMXngfHx6rPpvF6Jp2VFNJCXfct8Owf5JcQP5Ywg/PnEGnGNR+eCvCTeoq0p6U+1EIOFeNnXGdgg
	oS5ymIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgJH-004Dxa-0E;
	Wed, 26 Apr 2023 14:39:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgJD-004DwS-0M;
	Wed, 26 Apr 2023 14:39:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94eee951c70so1157439666b.3;
        Wed, 26 Apr 2023 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682519988; x=1685111988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U3fMS6vGtNlmEZteMKVTwMOKhjb7WLirh4B0WOh1xiU=;
        b=QaFZNT6fNhNXKLHPDrFxEtroaaMbguLx43qCTMCyoUuNX2Ag1/Y92xZJp60AzURdk0
         dxIvq0SjOBv97cdPwEHj5HPEtjE+doViBSeQpUIUJfXtiTet7PoNCHbF4/Bxl+KRHUvx
         lV9lcl5lLTJuA0JaEITMtM1JVc5JF4oQTFpaTgB6MI4AJcR4RmkN+4Sae74M1c9J+vYv
         Q8Hk2Cy60n0SpC7qfJWQt0QxAkhdQ+op2RcyIYqHLCU55iobl0ZthHflxPRdAU0oiEwL
         lDCN0KToZa569MY6col+EPk0zJ3fs51uLh34iiD2xI9Cnh/kvF0cE6nJqing/uEwurKR
         N1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519988; x=1685111988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3fMS6vGtNlmEZteMKVTwMOKhjb7WLirh4B0WOh1xiU=;
        b=GEtTMiilxX7RBX4ILt8DLPKBDObxplcUISqnsxrWXfW9gTzNkG6HfG85d1eKF071bh
         S83Xa5zpiPhnQkYHSa2dD7I3IRKbdDgVPyiW+iD3h5TfiMvvLYLNH8tFQ/kz6avd+sK4
         BnwUPfvGmi/jBRTgw1HUupck5Tf8v2Lo49ZRL6CZCk2pB8rYR9m1AUv86BDh5Q5CD6CG
         nDAU3LU7S5unZNIPP7NIK6feWlQNz0lk8Oslg/qGo5ytxdNQtOeebaBAXftAbjjbJ5oC
         0UMMKIDDBn0Lxzq5e3P7yBvyaeVHKRKJMTnmlYV2MEFt+WiGCXp3xAUaAUonwzs+67Ta
         fGXQ==
X-Gm-Message-State: AAQBX9cbyLVqMoC5nfUjB6v85hffp7ACfVH84YQGZqArj2m0bParQXmX
	SutchTP9aJ4PpG7kQxSgXaU=
X-Google-Smtp-Source: AKy350ZO3Dl/D/t3V1YrnB4ch7JxvOvlsOl56w/4tw57jx6R8bv580ZQXGKSR3kO9256Hh1y6aicIg==
X-Received: by 2002:a17:907:8b87:b0:94f:21f3:b5f8 with SMTP id tb7-20020a1709078b8700b0094f21f3b5f8mr17218081ejc.21.1682519987596;
        Wed, 26 Apr 2023 07:39:47 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id qt2-20020a170906ece200b0094e1344ddfdsm8232330ejb.34.2023.04.26.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:39:47 -0700 (PDT)
Date: Wed, 26 Apr 2023 17:39:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next 04/24] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
Message-ID: <20230426143944.s5vmhloepa3yodrj@skbuf>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
 <20230425082933.84654-5-arinc.unal@arinc9.com>
 <ZEfsCit0XX8zqUIJ@makrotopia.org>
 <ce681fac-5f00-f0fc-b2cf-89907c50ee7c@arinc9.com>
 <ZEkiIQZsspBlDyEn@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEkiIQZsspBlDyEn@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_073951_149146_8458EB06 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 26, 2023 at 02:07:45PM +0100, Daniel Golle wrote:
> On Wed, Apr 26, 2023 at 11:12:09AM +0300, Arınç ÜNAL wrote:
> > On 25.04.2023 18:04, Daniel Golle wrote:
> > > On Tue, Apr 25, 2023 at 11:29:13AM +0300, arinc9.unal@gmail.com wrote:
> > > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > 
> > > > Introduce the p5_sgmii pointer to store the information for whether port 5
> > > > has got SGMII or not.
> > > 
> > > The p5_sgmii your are introducing to struct mt7530_priv is a boolean
> > > variable, and not a pointer.
> > 
> > I must've meant to say field.
> 
> Being just a single boolean variable also 'field' would not be the right
> word here. We use 'field' as in 'bitfield', ie. usually disguised integer
> types in which each bit has an assigned meaning.

"field" is a perfectly legal name for a member of a C structure.
https://en.wikipedia.org/wiki/Struct_(C_programming_language)
Not to be confused with bitfield.

