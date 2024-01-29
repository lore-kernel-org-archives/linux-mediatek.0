Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41732C47DDB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM4YB6LCgMy5ymqGCGttDra+rFM6PL6B99ciN1rAFa8=; b=XQ/aKgldF8x9CgCdNnynfIhiv5
	SOSF0eBaqQEwaJ3TDcp8kl+grBQ9KkwzrEoXLS3XsmCn4LlBLfmB536/y7ulrMVoYR2Fhf+0Tjm8n
	zGHsGhSYEqgyO2xO3kkoPir1yQpF2VMG8sxRU8paUJMVbNkvznAiFZeD40EFOYebMyRmZJzhL2f5j
	R8B50ojd+u1fYUTCwz1JuoxtNoPkNDjagHSmnk8tq3e9ADRunOh53d2Bfi6SpA4vBfqlteE0gJ1jV
	AZWw4VNnTXzFd6iQCT4/6pyw9MR+pzcuY5nt7JsOpHNohiPzK+OaO67gc81KjYS0IMlPV4cOI5saY
	hCg1BqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUri-0000000Dbwr-3w3z;
	Mon, 29 Jan 2024 16:52:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUrf-0000000Dbv8-1dqq;
	Mon, 29 Jan 2024 16:52:08 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so339543666b.2;
        Mon, 29 Jan 2024 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706547125; x=1707151925; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zM4YB6LCgMy5ymqGCGttDra+rFM6PL6B99ciN1rAFa8=;
        b=k1LskrkM0eO6W7MDVklBqs2p8CVUXyn6IY2P5ulilOJpOcStuHBv6b6gIu3xRUGNBh
         fDC/9/euifCG7SBfgaIXB6ZcNvBRnbN41/5NOn14fanl1a4oBGX5rwb9cCa+W6O50/A4
         lvI+QhRDjrV7oyU2sLC5qJf5QanrE1r0OQl0u0Kr3jSlL6SfEy3XQQKO/ag+Y4TFfCoc
         Ndp/bRM5ztMIybMBosZQtoqKbMOVET7ZmgR3mcUcIREzQwqDXhLFOFAcNFDPg3LUiEVt
         Oy9QgU9rnHGH/TAtcWC1d9sRZQ1Fqz1rpydJRe/x/OmfyhFi1Je/gL+96defzijZdqgU
         6wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706547125; x=1707151925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM4YB6LCgMy5ymqGCGttDra+rFM6PL6B99ciN1rAFa8=;
        b=WlOKuMgfFriW1ML8OAoOjFuRmSdc/nuRKemlJtbUu8tT3bWLIY3Oxw8i6qb99Lg1l8
         vZSQeJiuoZqKUusxXK+xOXzXrDrnRRY7I9eakxUmDuM4yXYPsqMGz8cK0SO9XfP2IDy+
         INYy3rYFnWiWgVKJhkDF3H+ZF9pZEFT8smG3xpXgRudQyLl9CtH7pJQbiBSXW1KCAueb
         olY+OKRK/FQRYdRiXcpkmw2uTA+2EAQOFsF/tgMbKSigzTN3O7IhF/EyDy9B8f3aP5bC
         3zMXs1mCbz0T323bubWMYgnDYay5RRHxFIb36vevyd8FItQqOMBRbPhS/GRZOEq827DA
         EAAw==
X-Gm-Message-State: AOJu0YwTzP07jkT60O/aC23XCyNAhxxCd4hVZNvUELgNSLkg3x51nHWz
	Td6bME7aIlbafn9zcUQactuvC2FBbkE6y6QbPXPuRsWX8JSrENvH
X-Google-Smtp-Source: AGHT+IGzq420DAFCukci9yVevy/O8K89kJMfsj41fc6AhgCNtdQXFjC0TQnH1aHeeatKT04gl1lHJw==
X-Received: by 2002:a17:906:b48:b0:a35:cd66:3e32 with SMTP id v8-20020a1709060b4800b00a35cd663e32mr1692079ejg.35.1706547124675;
        Mon, 29 Jan 2024 08:52:04 -0800 (PST)
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a35a659cab5sm1616032ejc.179.2024.01.29.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:52:04 -0800 (PST)
Date: Mon, 29 Jan 2024 18:52:01 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
Message-ID: <20240129165201.s4oiuk3sxtk6zcsw@skbuf>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
 <20240129125241.gu4srgufad6hpwor@skbuf>
 <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
 <20240129083152.34d899cd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129083152.34d899cd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_085207_449550_5A739DAA 
X-CRM114-Status: GOOD (  14.32  )
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

On Mon, Jan 29, 2024 at 08:31:52AM -0800, Jakub Kicinski wrote:
> On Mon, 29 Jan 2024 19:22:28 +0300 Arınç ÜNAL wrote:
> > > I hope this moves the patch set out of the 'deferred' state.
> > > 
> > > ---
> > > pw-bot: under-review  
> > 
> > I still see deferred. I guess I'll have to submit this again. :/
> 
> Took me an hour to fix the mailbot:
> https://github.com/kuba-moo/nipa/commit/6766e97e72ac91ffb42ed2259bc8e2ace446d0ef
> email is the most quirky thing ever.

Ah, so it was my neomutt encoding email as base64...

I see Arınç's series is now in the proper state, thanks!

