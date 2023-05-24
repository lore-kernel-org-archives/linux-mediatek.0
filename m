Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185A3C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuWZGCzkbOMRI3DKUsjT1bBZX5K7moJ19ldgpCy0JvM=; b=LeooUpRLWfPqAxuubm2rTIbexZ
	19/ADfBdCBA/9MMKoP+VDAgJv3QtKcMicVRgcCnxKXhQ/X1DrZeqc+xUrg87oZy4kQKGmgWQY9Av1
	4z2UrSiyWWRRECnYLOAh0LT0LC56z0zl+aV73N2nufboPE+w6Ni53ZpTrfzQF46TF7Mj9of5O6dO4
	sY19/7nfHsHaCaKfXURf9JtP2ObbIWyuVzQXLtTiZYWf6jXI3TFh/x3KWnvP3XGocl+16JdvFlXVA
	6GZyMOFbyTAlZ567y0Cp98gwh6uElq3wK0Wnf8L+1TF6cySxoMMrtE9lbepAAdWyzdJZadHY/uVkh
	tNTjjtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sOO-00ECh2-22;
	Wed, 24 May 2023 17:35:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sOL-00ECeh-2r;
	Wed, 24 May 2023 17:35:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-510d9218506so145912a12.1;
        Wed, 24 May 2023 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684949714; x=1687541714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UuWZGCzkbOMRI3DKUsjT1bBZX5K7moJ19ldgpCy0JvM=;
        b=UshDxhlZwL2RlsRgWuaG05N4herwcLHOO9gWXg/zppo1pzZCQnkOQ+SWBL8hqPHspS
         OOtWES1GFmpmKAZO2RPtmxNwV9enRAHPTe9LsWkO2/UVv4ZPF9oCt/jQfOmR8lW3irro
         D5tBZJTdwBTW9OWhrLg2fEH+WJLA4k97Hp7cEWR4m9EJZ0LTfm3g8IrX2gY+apmywGyy
         Aq7194GZarDb3AApZTuFTgSQNYaTcVN20dhn72DFej0x0vglISKOH9KddxSDAuDwDnMT
         glXhmymOYMV/Vyo9/r/jmEgTQAIZ20uJr+sCo6/89V8+73LoerVm2oN+scqnj3FWGuCc
         BT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949714; x=1687541714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuWZGCzkbOMRI3DKUsjT1bBZX5K7moJ19ldgpCy0JvM=;
        b=kmO9pqslXX2rynYpEvGAXDZZxbD6S6GAWIeVhCxZBnlPZlqq7SHS9Y4KkAG5u2Vttu
         0G2synayR1vKYcqyEF2M65t+RwUzbah7twvZFkMUDVbhlAxFo5O2XFybB78Tolh9CkGc
         Ut82cjzu3Wgkl+H+Q80FCqngfwJuFX7/fYKk4Yt3WO9OkPeoI2ar4BN4HnnsBqQYgq11
         O7/S0pGE4DqB1GjvqhnTCslKCs3JIznHke85ZDLSiW8BRxsTDqXvLc9GWjpNUpj0+5KX
         dU4nvMHqC9hxd3J3HWQgE0AXFr2iPIXFcY24fxNxK6V6hLA6lg4efx3y/29QOBxi6q+W
         F8Pg==
X-Gm-Message-State: AC+VfDzMt0cpPsaCDPs/7J6I0S9aVHof27XqlykrsHB9MJpYngCilJ65
	sfLXUF45b1gYDaVdXNGnT14=
X-Google-Smtp-Source: ACHHUZ4CfH5rQekEpwKDf2dB5IQ2z7oJye5kqwJnfqfNUSqS4UHLVKcqhDT7i5TpD/mqssXnLShN+Q==
X-Received: by 2002:a05:6402:453:b0:504:a3ec:eacc with SMTP id p19-20020a056402045300b00504a3eceaccmr205970edw.4.1684949713669;
        Wed, 24 May 2023 10:35:13 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id ba7-20020a0564021ac700b0050bce352dc5sm126542edb.85.2023.05.24.10.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:35:13 -0700 (PDT)
Date: Wed, 24 May 2023 20:35:10 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 06/30] net: dsa: mt7530: improve code path for
 setting up port 5
Message-ID: <20230524173510.xvq434ekaee4664m@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-7-arinc.unal@arinc9.com>
 <20230522121532.86610-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-7-arinc.unal@arinc9.com>
 <20230522121532.86610-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_103517_926372_2BCEAE88 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:08PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> Currently mt7530_setup_port5() from mt7530_setup() always runs. If port 5
> is used as a CPU, DSA, or user port, mt7530_setup_port5() from
> mt753x_phylink_mac_config() won't run. That is because priv->p5_interface
> set on mt7530_setup_port5() will match state->interface on
> mt753x_phylink_mac_config() which will stop running mt7530_setup_port5()
> again.
> 
> mt7530_setup_port5() from mt753x_phylink_mac_config() won't run when port 5
> is disabled or used for PHY muxing as port 5 won't be defined on the
> devicetree.
> 
> Therefore, mt7530_setup_port5() will never run from
> mt753x_phylink_mac_config().
> 
> Address this by not running mt7530_setup_port5() from mt7530_setup() if
> port 5 is used as a CPU, DSA, or user port. For the cases of PHY muxing or
> the port being disabled, call mt7530_setup_port5() from mt7530_setup().

So TL;DR: mt7530_setup() -> mt7530_setup_port5() short-circuits
mt753x_phylink_mac_config() -> ... -> mt7530_setup_port5() through the
stateful variable priv->p5_interface, such that port 5 is effectively
never configured by phylink, but statically at probe time. The main goal of
the patch is to undo the short-circuit, and let phylink configure port 5.

It is worth stating that we know phylink will always be present, because
mt7530 isn't in the dsa_switches_apply_workarounds[] array. Otherwise
this strategy would have been problematic with some device trees.

> Do not set priv->p5_interface on mt7530_setup_port5(). There won't be a
> case where mt753x_phylink_mac_config() runs after mt7530_setup_port5()
> anymore.

The bulk of the change is difficult enough to follow. I believe this
part could be done through a separate patch, and the rest would still
work.

