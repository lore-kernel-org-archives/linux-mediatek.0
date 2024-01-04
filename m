Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F9BC47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//61JkAFmR4ja1MQYPV50hTEwRUwt59eOyo8emTzwoc=; b=hxybrGDvIaYxrsl476GWtLp+Kf
	QyYdMgyK0qgnhhfyKb6OglEfkeQfKoTGuOiq1AHHu+nuMUa9thfmUtHrsHLFP4DpBfeesQATxzCVv
	2TKY3m6kVIGnFEmf/JW3lkVAWrGuYJ8JVR9wFDOZm8hCwwxy0SqXZj+FPqzqKdvP5WKZFjwzTNtxa
	QGPQC7MvCBvaZddIOKgIC4GFfC3hcDi4jGb9zYxCiMGn3LHsKo8op2zZRYU7q/q2Ml221YxZwHliY
	GSebhP8wFYBLbvCjvO++yMFYL1llMJMQ3OQvcEp5AHWJbRbQghjsv04RsfZIr5lejNsnFeT5SSaA9
	67SyG0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPf2-00EUtr-0S;
	Thu, 04 Jan 2024 15:29:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPex-00EUsL-2Z;
	Thu, 04 Jan 2024 15:29:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55719cdc0e1so107801a12.1;
        Thu, 04 Jan 2024 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704382163; x=1704986963; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//61JkAFmR4ja1MQYPV50hTEwRUwt59eOyo8emTzwoc=;
        b=DOI+WH4fxO9Ov7aqdjfDLeVVogXa9AkSa8RynYWG0tS5V4+1pfXLXjajes61nSzbgY
         AQTMpVk84a/awUxhczAwaCSmxPY9JZEL9JrVeh7fMokgaSpj549j5s0+TiJuOLhII4vd
         Uh80ZsT8Zl2zcQwjEbf7rbqyvbeRMMTh74XrBCxHhYzzNdeqbwq0Rpzlc/RYi6rEaf4w
         8q8mjl0fvloVx2XeWMH+R+oeDXGouGoBKlD/vvFodgcw1bib5OvjZUnvy2tx+V/JXEjS
         VIw1kZcPSRNkYl2R4Jg3VMrku3vajHsQZk3AFFQSvUUFnklDkeojtHfvIkmdNq5DYLVA
         jnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382163; x=1704986963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//61JkAFmR4ja1MQYPV50hTEwRUwt59eOyo8emTzwoc=;
        b=N9SQDsmJ0nL28wQFrUO2354dGc7piiIAuZ0mbq3ZYlZyT5uCDlTAL5pEC4CdCPh428
         VUkjMcx0p55suc/PcQsCOLIVSj8qyvAv9/iJVsUkFrMr6MFgUOOe5XGRrlelSbRbmTI0
         Lff2dDr+gQv1pXrL+xDqbAelliXPVjnHklR9AKrid4n4wXaXvl5BgqGvIGBv/sqVEMnj
         pxEiZsoGC5OTJdzvGwNTKsoP7uAtBSlrTIEe9Cv/s7kvHJed59PZxsnojFVH+6gGoLOE
         0y/eGijBCFL6ywxVuryzDJ2lBK6fiey5P5vJ3CYyFeldxqCrHA5kS67kW3plmRWQKZ/b
         4PLg==
X-Gm-Message-State: AOJu0Yx1yD3UdZvjRpzuvnltD/TDXN/ES8epFMuxN3JUKQXp9yrx6ejx
	QGFb/sSS5IWVG+LTDX+YHps=
X-Google-Smtp-Source: AGHT+IEFGh6wzkj5OLLtZKwtP7/o8aS6I+L0Q/lrIXojf++vN1QSj7YEGQahqkI2+h3JUmXLtyaL9w==
X-Received: by 2002:a17:906:f247:b0:a27:2f12:94ab with SMTP id gy7-20020a170906f24700b00a272f1294abmr430597ejb.99.1704382162780;
        Thu, 04 Jan 2024 07:29:22 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id zv13-20020a170907718d00b00a26aeb9e37csm13066662ejb.6.2024.01.04.07.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:29:22 -0800 (PST)
Date: Thu, 4 Jan 2024 17:29:20 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: improve code path for
 setting up port 5
Message-ID: <20240104152920.gxzpv2ljvcuhdzvf@skbuf>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-6-arinc.unal@arinc9.com>
 <20231227044347.107291-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227044347.107291-6-arinc.unal@arinc9.com>
 <20231227044347.107291-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_072928_732822_F194FCBA 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Dec 27, 2023 at 07:43:45AM +0300, Arınç ÜNAL wrote:
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
> Therefore, mt7530_setup_port5() will never run from
> mt753x_phylink_mac_config().
> 
> Address this by not running mt7530_setup_port5() from mt7530_setup() if
> port 5 is used as a CPU, DSA, or user port. This driver isn't in the
> dsa_switches_apply_workarounds[] array so phylink will always be present.
> 
> To keep the cases where port 5 isn't controlled by phylink working as
> before, preserve the mt7530_setup_port5() call from mt7530_setup().
> 
> Do not set priv->p5_intf_sel to P5_DISABLED. It is already set to that when
> "priv" is allocated.
> 
> Move setting the interface to a more specific location. It's supposed to be
> overwritten if PHY muxing is detected.
> 
> Improve the comment which explains the process.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

