Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B91C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqbYPdC+pzdSRXmHEIhagjUyGTTzN7gMcr6zGrguEvA=; b=4MV8RLo5ORTvAW03dUu95yAU3s
	crn/k0/NPrqGLj+XM+jD6qCDKZOlF6SgA1On3Z0KYAwCH5QBZHH8EdM8iYxroXpKj5TDTQe7KzIwT
	AlWQ4ZN9LQpG82Got1J6UCHttb6BmDZOXQSKdFLW28j+lH51Bh2wgdVxVdVlPP5aUpI9oVGQjG+cc
	UGiGlCnj+gljtx0ecD5LwIGUGH4A5B7W6VYfEkZ6Ny6J+5tBTVFplHJqxrorDZ18sj/ZiCgMxooLb
	Puime2ipL9CCBBrBHh1um7aWk3f+CHFr/H4FxfMxkYznmBOm5zAGoT8LVPjrKsQjSlne8WW0sko+n
	z5bLjxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGKmf-003Ijq-25;
	Thu, 21 Dec 2023 15:16:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGKma-003Ij8-0Z;
	Thu, 21 Dec 2023 15:16:23 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55372c1338bso989406a12.2;
        Thu, 21 Dec 2023 07:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703171773; x=1703776573; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqbYPdC+pzdSRXmHEIhagjUyGTTzN7gMcr6zGrguEvA=;
        b=iHf0WTYiX9oDYCUViclrNbFc+W8NC/jbNpkXJab6AIMD/N98J60pY/eyqWyMfMS5u4
         pBjd+2R89ZCVFxm+6IZ/w/32GQeZd76jrX3Seq/b6Ts+YJu85BBJh3zl3q+3onMxfWvr
         BNBuLUaJFEvd5B/7GiKWN3d9Vy9fQppAk5bBT34OzTx3o9ny1Et892lA4atr78UZbdOJ
         5YAWvXEvwLBhcKCEnJrENkNtw1v81vHlb0PrjWEVV7fIJDiiwlZTG1fVEcnqfC+3WbJ5
         Yr8nwAcU4GKIHWSj0PbjIyG0ISpJ+yJ5iw2RAUAQqrAwOyuV39yF3toi7U5zOtRbkc5u
         XByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703171773; x=1703776573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqbYPdC+pzdSRXmHEIhagjUyGTTzN7gMcr6zGrguEvA=;
        b=vh4zLovcRf+wsn8S3LDWtpq/VwXTg6jfohb7o89b63mChv4oQKBXFAbMSjTCkXESWz
         rcHC3g/WLGzYVhS5s+jkdGt3EvpwObun7V4jvdzPTSqsocbCXXkN1O5/BYUKwSzuxYY6
         Lw8Xq5tT92a0OXB2H6Y86+FsMjFNtFkp8qoUyZpdUCYOLbgxdqdhdbNM2Bj3ruXR467z
         +DP0GZixDUCGIvkahstjJc6V14e/3wIV3KWAiNBeUsMIe1dwEG5N2vdJwdqqHCPF3UUp
         VYXH2OjJRiQ5UAQZEGFvfSp2nP3351CWx6kO5+AwgMcu+2mvSUjxp5KPS2hJm+N3kWYK
         h/Tw==
X-Gm-Message-State: AOJu0YwlZLQlA5y0wT+qK1u6PaXiMQO8+OjiYPTNSDn2Vq6OGYFgS6vv
	nUrnMIM+o/GVZYT5uhwpn28=
X-Google-Smtp-Source: AGHT+IHJjhFl8aucUSYY9VqO85+850iDGfZwpNYK/Qur+Y7lQw4rO6QDuDU6rtJXE5crDceVW8fznQ==
X-Received: by 2002:a50:cdcf:0:b0:553:d641:a662 with SMTP id h15-20020a50cdcf000000b00553d641a662mr1897345edj.16.1703171772730;
        Thu, 21 Dec 2023 07:16:12 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id o15-20020aa7d3cf000000b00553a094dd5csm1273484edr.32.2023.12.21.07.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:16:10 -0800 (PST)
Date: Thu, 21 Dec 2023 17:16:07 +0200
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
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Message-ID: <20231221151607.ujobhh4aet4obxdz@skbuf>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_071620_229933_F90E0F8F 
X-CRM114-Status: GOOD (  12.49  )
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

On Wed, Dec 20, 2023 at 07:35:39PM +0200, Arınç ÜNAL wrote:
> From: David Bauer <mail@david-bauer.net>
> 
> The MT753x switches provide a switch-internal MDIO bus for the embedded
> PHYs.
> 
> Register a OF sub-node on the switch OF-node for this internal MDIO bus.
> This allows to configure the embedded PHYs using device-tree.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Can you please not assign "bus" to ds->user_mii_bus unless there is no
"mdio" OF node? We don't need ds->user_mii_bus populated when it is
described in device tree.

