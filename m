Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892ECCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=; b=UXIGv1ouYBDCwEjunmwMoIpmd+
	nNeVSLLvehA+n9Dzem4gF17JECVoziuFXKaSuIsm6wI16V4KDV3cORKdo6rYi6Cl/vectdAEp4EXd
	8oPKPwQow5CM51E7+IetlqYdDUnLpXZIbUVebhWZqVB8YBkHXOq29NJmKxLE9/ECVnWVt+tAVAMTf
	ps8bVvD17+pPjS1qBSfVPN/oN5Ex6bQjL30qdnGF66yjRxPCl3HQVsE4Ez7dan+EH/egWOETCNzAq
	3/oJTKN6+wjH4+4k42yIjvFvRbFBPUQBAEgTg74E6NEDDMEuaXk8PJ/Pe/dBjhIaeBeVlYFawkFqB
	bn2llFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9F8-00000008hY1-3QFT;
	Wed, 12 Nov 2025 11:42:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9F6-00000008hXM-1BzD
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 11:42:29 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F28FD3F917
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 11:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762947743;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sc54x3MkVSwGkLeHcjTfQKQAl4yX/22bViLmjlrrKR7MDOe3OvBzquhZdJ3h6LeCY
	 mE/T26W31wjoaCwPV8g8KXf+IX+vjY98qTgwm1xD62Kz6yAesy6LC97JnGC/g0XIhU
	 1bopwFkOOY68Lo4eWC3KPner2GAadJZ/4gZ1tuOfppsNk9XQ4Uy2ZxvJbBn0VZhSCF
	 E+4mpxb8a05FOw4Xg2rY+ibCt30nvfsnfuxiLWOXEqWDD+lyIE3J3LIov4I5/wf9zd
	 eaaByaAA+FuWrOb/aSoZ4jzqkHqpMfnIOuWcRHoN0U3EpRm+QjNr2HFgq6o8TEEO3q
	 TKsO0LXQbm7OvmCjbihq3zXPqi2sAj932qC+C8bZeRCa/kTliqSAU/HVnKs0jZp6tH
	 p8AJ8AppXnImo9osI/r4IY2/qhTv8rHSoJZTjQ6q/CYLpxv6UxxnCtJgAZREm4AcM0
	 ymJz6gZRkKx+QtTAYdctU3xQROFCwfQAbuTUScpSvK1M5s5UP+dxdiGMPXZj4UXrgQ
	 SxPvQsQiBYwjnSAxg9einIDfbcgvyYk464NFCimsX1acRRvzGvqeoqevJ+j1AfDhEK
	 J27UDzQDJTgY1/6jZG+IClmiVIMAJZTqg3y5OgoITM6rr0o2lmF4uuKiKdfCwOgGOS
	 62hQZOhIi13WJLbRKsx5rN8E=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b721aa1dac9so70597266b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 03:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947741; x=1763552541;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
        b=gz5ltiAuUjrTGu9UIuEiEcXP3rejA0zkgzNZck+mHkVvHChAuGAB/G0zukYPozkqDQ
         GU6pczxorPd2eaP0DFNrWyomrhQqSoDLcy9oBYeC8pVvWxZoBSaaax5soweHY+/5nx3f
         9GBwLl62xZVN7VJJETvukzC6FzWbcCwYyHjib1SIascrSaeAnTjhL3OJsdaUZmMJIvJ1
         707kWgW9z03i6Hpd6vn4f4AHH1eSIjS1mGW2lsRfihtkNCUNq+bT41CukwtTuuK3EErU
         BtvTyt3ECAtEJyTzkoyUtQ+lLlejqb8/LEXug6vG8GpHbtWP2FfiYhHlSx8dw29IF1CV
         0HYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmtREneHCgYqRFW0wa1nt7Dti6bAThjYAdv1OGQ+QjjuAwFKijm6g8nlKhPV9mdr6H5pCE+NaaSbpT1jrZTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM5z7C/WozDE+vatU1y/HPGGX36nuBPnrEcTQq+SIGGXYy6Esn
	cm4iB7BxqnyZBF5gPKS+9bzEe1chYXE0NpFNBTUxF98PqmObRZjH2h/qklM2GaUpFBuv1DCcTeX
	lYlB/Yx6xEGk79GsxbMQm9PCu4g839O43yoZl3chgOJcG3+Y+4tWd6CepyIKTkPwxdxxwP2S4JX
	l4J6EXjoqI77iXfVlBhg+/sJft21OIzZvrL5uZY01gFhMMFmYdptlu6FrdqDgjWYmy
X-Gm-Gg: ASbGncuMrW41mVdum8Eptf2P32e0mnCyVqw0S+0wDh7IC7ywTPXVyjESTIDWrcWlK5c
	+TgwJCm+EktkD9wRYo+eD52wNGuXUPzLA49tp9VfSwPdrWoVEYLp4Dx1WYT7IzVGW4iryIhrc3I
	pifZ3HPKpDHpjWiG0uXJVttQqisz63MotD4VYsFh8xHJaGhvY2Hi+6xfalLV/EyJ1LpWwwHB59s
	x7BFtN1SS9j
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id a640c23a62f3a-b731d591ea2mr705786866b.19.1762947741631;
        Wed, 12 Nov 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3IO/2NlBrJx08X6rQMz6PNqtbjwKXovV+gvszbh/YA3hqiRZ0MYX2aiKQ9RBTBWOP5/34tQ/P9NV3zbKqZg=
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b731d591ea2mr705783766b.19.1762947741276; Wed, 12 Nov 2025
 03:42:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk> <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:42:20 -0800
X-Gm-Features: AWmQ_bnZR2XzkbNxNxbSAGVNFuRIk1DnPVqrA09Ovj5R5d5xHcMFQU01wJP-xi8
Message-ID: <CAJM55Z91wvTonahi=8SaGcHAXVrYEpQCzsH0qfecSoFeiBoZCg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/13] net: stmmac: starfive: use
 PHY_INTF_SEL_x to select PHY interface
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
X-CRM114-CacheID: sfid-20251112_034228_657970_ECF81CE1 
X-CRM114-Status: UNSURE (   4.49  )
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

Quoting Russell King (Oracle) (2025-11-11 09:12:18)
> Use the common dwmac definitions for the PHY interface selection field.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

