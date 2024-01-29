Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005EDC47DB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekRXlRD9sMYvDhkEUn4vNmGp7PidTrPzm1ir271L0uQ=; b=oYMQ+ttyXY6CFDmV/ZIn3EAO3J
	+0Vmn5FBd5vMnBLk5qkE1nPF+3w20xfIb7K8p/6WrAVKRFlKCE2aJFiX+mVGhxweFnkhGvJsXwQXN
	iUHlG+CvdpcxDmKsYLHWjJ4QYbmUdOSH68oxHHCzVH4UiMO6PsFAfiejjkwh6kafzAs+BSY2FLNWH
	RXCxkmIxpux9jDPDY9RrfDLcAd+5rPmnaEM0SULh6GofVhEyBV9QaDEHHVLUteHOucoAaxif7awoa
	t8yQfPZ7TPy027qpbDfdKNxw+DbpqnJDyl3PRANywlSGeUBMfD2bugN2e7t46p+N/7M5/ZXS7uzVj
	eURxxwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUUM-0000000DUKX-2Pkk;
	Mon, 29 Jan 2024 16:28:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUUJ-0000000DUJt-2VkE;
	Mon, 29 Jan 2024 16:28:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a350bfcc621so301994166b.0;
        Mon, 29 Jan 2024 08:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706545678; x=1707150478; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ekRXlRD9sMYvDhkEUn4vNmGp7PidTrPzm1ir271L0uQ=;
        b=FB0ZCpzZxTE4dhcN8wLPXY/TzYrvlmUuGrXnyLEkI7GbOmIXMlF048wx9kzo+cjN4r
         PAdVRafOuqCp9ZQwkcq0Ld0Uq7IFGNp8SVZJphb8jjxZq9lIc97dxdDJ7q+fBQNHwUYy
         aNmjY2/H9jIKXycbvSxnCgnvwq82KHv4SSsjXMuYlqsyryt7V7sx1u//1PEs+TJpWxtd
         Scw8wFG451nSon1sIEQBS2oNOBRUnYebtj5xKd0gXSUbIor283zn89Ctfl1fr9ipmeww
         geKHIn2AFKq3FNdNbAr5acQtPWr81P1oorlJeDGqk+rrq6uomv4PSz2CSkFt0kjOzWa0
         ZFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545678; x=1707150478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekRXlRD9sMYvDhkEUn4vNmGp7PidTrPzm1ir271L0uQ=;
        b=LZOg1P5iz5WRpQGCGq+M8LlQsZMNM3paS8MLrs5lSCAOqFua/xdmKAtZxJo1Ygm9sO
         bvKEwleQ6P6I22di3mR+HpSoE/6AVSb92rxnnkCgKRuJs+p1VkvHmthecCVcEAu7Irq3
         g+3DCAoT0k/Ctfpv7et0pi9aX4ueGt6JpziGiH1oNeUnSPMfy90Yb5EUILR2yKFYM/fc
         3l/4NMxjkqG8PegAJvA3XixxA3TMoBeXE7omIByYdqXkcD9312dD6/9X2x7+tlX3dolr
         LwzHDomZzy6+n+IbAHnFK3vE7I23xVcHIZG4melUDFzbIN//mJLrjzf39BxvtFC3klkS
         8KEg==
X-Gm-Message-State: AOJu0Yz9Dj2IN4gD4o4hNM1ljKOnZm4lMf9gt4Q/dM9MF1RuYmduppa3
	O+jizYfybwFZ81vTriY1I15Tbf9Tl0h3Kq49ELeoQg1IAMt4rezW
X-Google-Smtp-Source: AGHT+IEfp1ng4c16rTEjqdb1pWuJos1D0ck6ThBr47sPROdD23LYtXmEIBt7ZDzRCiDCnIKranZbGQ==
X-Received: by 2002:a17:906:28c4:b0:a26:90a0:696e with SMTP id p4-20020a17090628c400b00a2690a0696emr4775654ejd.41.1706545678086;
        Mon, 29 Jan 2024 08:27:58 -0800 (PST)
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906068b00b00a2d49132dc3sm4037147ejb.197.2024.01.29.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:27:57 -0800 (PST)
Date: Mon, 29 Jan 2024 18:27:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20240129162755.j3q3wxtovzv4sh3i@skbuf>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
 <20240129125241.gu4srgufad6hpwor@skbuf>
 <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_082759_660081_E6CD6EE8 
X-CRM114-Status: GOOD (  19.99  )
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

On Mon, Jan 29, 2024 at 07:22:28PM +0300, Arınç ÜNAL wrote:
> On 29.01.2024 15:52, Vladimir Oltean wrote:
> > On Mon, Jan 22, 2024 at 08:35:57AM +0300, Arınç ÜNAL via B4 Relay wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > Running mt7530_setup_port5() from mt7530_setup() used to handle all cases
> > > of configuring port 5, including phylink.
> > > 
> > > Setting priv->p5_interface under mt7530_setup_port5() makes sure that
> > > mt7530_setup_port5() from mt753x_phylink_mac_config() won't run.
> > > 
> > > The commit ("net: dsa: mt7530: improve code path for setting up port 5")
> > > makes so that mt7530_setup_port5() from mt7530_setup() runs only on
> > > non-phylink cases.
> > > 
> > > Get rid of unnecessarily setting priv->p5_interface under
> > > mt7530_setup_port5() as port 5 phylink configuration will be done by
> > > running mt7530_setup_port5() from mt753x_phylink_mac_config() now.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > 
> > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> > 
> > I hope this moves the patch set out of the 'deferred' state.
> > 
> > ---
> > pw-bot: under-review
> 
> I still see deferred. I guess I'll have to submit this again. :/
> 
> Arınç

Please wait for a few more hours for one of the networking maintainers
to have a chance to see this and ask you to resend, if necessary.

