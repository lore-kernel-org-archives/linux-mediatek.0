Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95917CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=; b=YTI4JzQDIdFWoAh+w+8XgQLnaj
	PgRp38nU5uI14c1Hd6j4fSd2XHkn0kK0/GhpEwG8oa1hszaaNqnxeGJUV9IXEB3hc3r65BfMhgX7Q
	HxXlw3xSSqNetnldwvtUnN4b107APesyYF73HKhhuTLGBhfQ+7ckYhshncuatr6vdtMoJK3pQBltM
	tsUrmf9C8VHGd3fFzwbnRobn8Qqy6SKhBXyeQL9JbxiTTHmEhxx97+fsQvSKXedNSZqIUYPRwt6Je
	/XX23G0uxIv1ZhPZU2FHT5VMupUvqv42WfM52uKDUKSwizQHJiBUTOdMCcO6ESYloYGd2hjzC5GCp
	oSfVYqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Fr-00000008heY-3LDc;
	Wed, 12 Nov 2025 11:43:15 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9Fp-00000008hdd-0Riv
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 11:43:14 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 28A293F85A
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762947791;
	bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n/MSd+zbMCfzIrmVWXN+ZUL9vBoJXEymwcYZFIywtZ3KVcXaqwFBoC9CfBCxjO4sS
	 oz5PolXXuvPci+JQgpdBsVLEi32AxdG1G+IKgjT0z7JSklx2BOXhc+xmzFqHCG/ERr
	 IolIzDBiuJi6/nsJF49/ME76ZTcGsVvbVGwbvpqlArnAI69NWmXJnDMzzDEG88l/kN
	 UFTlBDEmjmjZjBjNPNbGgSm+ek8bmt6D9a8Htsg9S5OsPL0oAW7RKchBpZrefvGbZF
	 b5p6lTZh3R0s+kAoe8BV7Od5V+Z2J5CeORU0prhuwSuJbC5mon59LIs3y9wgAbIpJC
	 +Ch8Xyd2c8dOAV/YFKL5F8nbc9k55cJEA79U0HfZZrhyeaELCBcCLxeVrFqjncYTt7
	 U16VjHelAQo6Gvsmd8APyqFn6EVwqJFrL+PuO0cZr8sJRRi5gPlvhCBmCeKfJP9xuO
	 w+EKWe1mrww+Yvk3Xx5yQDEkOAQ+qgLH+v8I+ihL5iDYDNd9aEFFotJ5J0ISr2cqZ9
	 99ZEbVuP2fpO+YkYMlriXmvow9LnEk9w0WDhovO4vsf84GH/8x+20CBzbFCHf2bra0
	 IIyd6L3neCdvNvi2yFTwGYXxv/f/wc0OyVm2B20ecCV5rSH7Njia9xieKdPsotGFAs
	 8OZrxEUa8Ij9VcSeGZHntIvo=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b70a978cd51so77286466b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 03:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947789; x=1763552589;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
        b=iT/zQcJ/+DsRL5327J6EHDT9r0RlnWs5GOS0QTsjFXOl0WCOH7Z+CzA89wyCSKEKMO
         ivF6KVshX1Wg7nIc0F+Dj2dkGGEWD0dkk8h+zKmr8p8EAMAnmmxJZt3oKve3kIyHUECL
         s8qV0OItMsBphSjTsZ/tODQh7IiDg4t2jEExJKHxUbvY//dGPkUe1qx8imO4m6lm1eQO
         8H/bigZBrMn+v+eDC0YfrFoz2HRwbOxTVeVE6X3P+9CGevTI0YEYbbWXeLVekCKNT5ZK
         5ooE0/ar0t7vu6z3T7hL5454N7+SDQfhWCUEXUtjGQq9qKQUwPN9PsEJWVwqFz5MxKSf
         WzBw==
X-Forwarded-Encrypted: i=1; AJvYcCWaQUA8s0ERxo7DQXuuTgJwZnM67h5/u4t/lkK8Tdu15A/0ett3OZ3VG2l4Nec2qtqjNEfILdA0AP/T5mdQ/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3ylc7QhJ0zALPkoTFF5blPWu+TEE4zUbNArL7w2z7KaVPR69
	hc2vhrQUvvbd+eJh+BWwjAwlkSRwdOJriChdHq18BAD53uj/1B5kNwVR/bUvxO70RpFUSemCHAT
	/L4jwv01j9U7LMJwYM753k0SOYfq1Kysy4tqsQAiFDY1PHWUicfoImqrHMnTZWQhR8JgPB5UWYp
	ZB0HGJY0+x6bItye2G3er2qocxdggezZ3ZSM0KsJ6nTqn+6geq07fS0ApZGXqhaq0s
X-Gm-Gg: ASbGnctehFCklZt34qC7q0tN1eH7N+jM0F35e/TeKbAJVR1NeFviwATytgFLATG9pEi
	BDNalfnJH9LkCYJLmmmPYDXWfv11Qpjlpx6TJ9zH5bnkrZ1lJsxN41igl0212XB8ceuK2bClLqx
	51nxNpmhPyPgUULBZ5CaG3dJ4MvnucETxGMDw6bglJ9PbIxFTcNPuxcGbxhDBlLZ5AcTi0YOoek
	oQAbyG1y9J1
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id a640c23a62f3a-b7331ae8bbbmr239079766b.57.1762947789519;
        Wed, 12 Nov 2025 03:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEACqB0mCN3EX0p95RUNEAUTyaZ39pandxW0+rdirFn7EUt3COrqPK8HKamiHijsSU/fq2Kt0hi/1uzUL2rjsY=
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id
 a640c23a62f3a-b7331ae8bbbmr239077666b.57.1762947789084; Wed, 12 Nov 2025
 03:43:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk> <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:43:08 -0800
X-Gm-Features: AWmQ_bkenMvacX26pAHg6nt10w-7MV8cO1nbkR5cqs-fMNBqO4TpuSWeehZ0dCc
Message-ID: <CAJM55Z9O3BTejaAnTH4nTXT3VcRU701BWdSusRNArt-9vkCFYg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/13] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_034313_265651_7969DE5D 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
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

Quoting Russell King (Oracle) (2025-11-11 09:12:23)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

