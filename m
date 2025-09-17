Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AD3CA0EE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 10:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=; b=WjqsZpmdYpt93hf/jWm1yZkgpi
	uEjBGf1aMZx+e6k6AgXE8Jui0ZJumlrbCtVjaBpsBO2OCmdwyCPZ/uItHPh7ShUxFmhqLBss1/EFR
	w4xBTsYxsL2/3Llbec7r3dx3ZJUyLlgwvwP9YqlrBXJE0sMBG0Na0lHWdRXx76A+QmEftC88fq2/N
	buiMDhOqQh1EywXZi3BI4GJxZZbO6O/NWAfHoTSMY3xY8m49jdJH+nHWM1+Y1SNZUojER7Fk5fAH7
	oIaYvCdZUegCt0gF41CxYHZQNU42VtyO2MXc/Adu7wKoFzOY2ODSBemNTlrlDT8Qe5wWVk3Uz1s5L
	tWL8O8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp8E-0000000AvC2-3Wtq;
	Wed, 17 Sep 2025 10:11:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp8C-0000000Av9M-0dmd
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 10:11:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45de185bf68so5730065e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103878; x=1758708678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=;
        b=NG6z1QLbz1boEgGuDGxjajYrCllA9V6zdLW2Js+TDgUhTcYO4XUop4harVwwlS/fWn
         y6S0tymTXCHRMi++gGydI0hgAUtZpLDk7Cj1wSqC/oc7ef3hWKeTSR7WHCvkY9PjgLTQ
         Z3rQXAUt58vKnrZOjKTJof+2KMEJ5QbDDl/p2tmS+zCbLI/MuVLOVSqA57Gdm7RUBipi
         pMAXblxi/kyrFtYfApU3ppFQqowL+fhy3E8067YvYiYZzD+hI62nBO5uZRhNtc0HXr5R
         vsZXNDH1Z6saws1huF4ouqi2lg1AS9DClT5wnjmEERRVaTw8u7YVzCAz9vjCOrSy9QWN
         HNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103878; x=1758708678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFlgCXptLNgS0oUFv7P/jnH+n8Ia5ZxafQyZ/H5sxnA=;
        b=ijoTXYqaH5+Emn+Lez//9SYJGXQoIBs37diwVxuAxUY0cOSk6sHNX7036S6CZaA4LY
         evILXsRSeGJ/sN3h2BB1owF86Xv5XoJFU+Ys4HI1jpWw8qstdYfnu8F+yNBYGVDjkl66
         iA2UQm74jnQQNv3YjrXLRcssY2vkKde/bM/lQFOsvJCZJWmCFGGCwBLYODDV2RwSBQol
         PSZ7EhxhE6qEYCTY2S5OIM//gAfSkNqPu002DKnWpXkv4GlNwf+jV95dnKxRx6dDH6XU
         +648+rm3mNj0ftayLpFPbpHAyXF4KljrtfJ5OHo3Rj9TYACveWJyBfsE/B9hks2Df7rI
         7Eow==
X-Forwarded-Encrypted: i=1; AJvYcCVYpUWwtdk3Qa3BRnwXmJEJtruu7KlfubkcpDwVaoLxe2EvOQVHX9IgOLo/wuKMTIB2OMsNBWAbitYTDN5lpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi9eu+0alsC2sdAED/wunqTahBE0r1s5laDoQ9pJCF0aU026JC
	R6GnQPGXnjEYswQcfMrzVAYePYnJLWfC9GbjSDbFiQmMMR+JrB+NokpN
X-Gm-Gg: ASbGncsjpDsDqp/+N0Pd14fJlUXz5egS82oxWFE5hMJbYM5COkXVzwJkseXkEQcmByC
	qUa87A6+cNE6+Y5Igfg2htc3Ci/2tvevdCzG8VP8mj0Hr9U0DLS+LtEzvK0v6NPghavTWIg8SqE
	hNGfQwWimjuiekkLq312En18S59x1DJ58i7ENOMGdLPsdml5TIGwlYF5yw9nEtaYS6lA/AaQL1M
	0S2zVrvAFCqus0Qbu84yq+Om9xkBwcKOdmjcBj1+odiWUgwswWD8NSosj/gMho05xxqcnPngHKz
	qKp88mksTgMlVDUL++0cP0qBdrwna/govO5ZAGdiGVrBNrYXA+WPogMVYfruHwYJuT/yLOD8DKZ
	eshzQo3w36sMNtb8=
X-Google-Smtp-Source: AGHT+IEGAWHbOGCVA8E1ghCrTfok0wf8HrSSu83uqpK5rtG+yvptJ+uZiWuJFaorxUfrNpWZkT3p1g==
X-Received: by 2002:a05:6000:400e:b0:3e9:e2cf:cda2 with SMTP id ffacd0b85a97d-3ecdfa5ad4fmr599670f8f.8.1758103878166;
        Wed, 17 Sep 2025 03:11:18 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ece0fba34dsm1092120f8f.9.2025.09.17.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:11:15 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:11:12 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 6/8] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20250917101112.555jzhzlmpkhgmh5@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031120_201169_CE80A1CF 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Sep 15, 2025 at 12:45:42PM +0200, Christian Marangi wrote:
> +static int an855_regmap_phy_reset_page(struct an8855_core_priv *priv,
> +				       int phy) __must_hold(&priv->bus->mdio_lock)

s/an855/an8855/ throughout this file.

