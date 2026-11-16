Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC35606A322
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JOAeT/OZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RttVRPY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=; b=JOAeT/OZTT/CUdD9db6+yiApOQ
	RCCke75vlHR4ZlFzDQjD+Bffdf0KKoKyjvcXtHLzuzHp7HjAu2iHHx5RiEMYQ9FiZFdu0t5HmoUyD
	UdFTiNpkXz1QFi+oZHzmmOHcYNrqHEOsbAvA6xPZm91fN2WsB7PutRe7BHdLBvQTrBMBNCMQF1zvs
	vwLWzk8MMN7PD2TEhYRgIcnOJubj43AF3ke485AE3FbdP9CgldQbQYJ+8i4taBV4lVF2NTBhXVLjL
	LgTa5jhSMIr4qofccThrcHS+beapxqjsqhtrc1mgenM0B/MtOM2otUGf0QQ1Z2pKTXY5nmJvEuG9N
	kCYNE93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSziP-00000003HDO-0P1K;
	Mon, 16 Nov 2026 16:37:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSziM-00000003HC9-00DT
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:37:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1943282f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=RttVRPY/IraL+ZOZj0Z7FabonHAYI8hDdJwqXUUdNQWzm/2/DvcF6IiJUlv4gm3Y6Y
         tW49usBu22lLjR//8tBnY3fe8zGD2AFyuEtMonCMJ7jfixsWqOvIOkEsmABxLYz5oDlG
         V22CRt0UNfKjc33JsLJQkK9TY4nj1HNAc1wK2bLeWTeFVdIkHKqAsq8ATffWI6nVhMBn
         qZbHqsqzwzoGDBopp3FG47U9GhHbVzWE55LdIhouThkG0spHml2MBBFJK9FCNfv7RIE3
         ioMDC28N/BBwkLumCVRRX7bMoy9dzfYeTTpunUwYtuKd6qQoE+2TohJPCx54kVDS736E
         rX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=VN6FTMflILX+ridGV4qaKCb3QQm/yqbGLPII1JXCwF9Yqn/V6iu0Da53Stttu+6Wou
         h2l2hc3hkn7TUOd21BKwLwKozSNb+/G7ik1Y3O5s5FvFEeSymtWMadscE3V3OX9whZgN
         Be1VBIm+/V2jrUyV6UciIB+Tt7R973TmHamy4Mw+YQBOC2UDTM4p+u29jDRVFHJaHb6+
         uuNQ199xyO4AJm88dyEtsFdUbl54cdpoICxLaaXsBr1qswe9R5662cZnTRaF4dh8wEMX
         q3S7nWW79M9eBjxVBU0epxjEEP5vDUQPUMj6L0bJBuvnlfyRHgI1IdqIWflyoqZQU2h0
         U0Gg==
X-Forwarded-Encrypted: i=1; AL+hErFVGK9CgKo2ySo+I/th9AObhPG7UV9nBpCNJdKBUXNrYDtEBUlrj+0SqGO7RVEM1QQUi5VEeApdAixHys3fjA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PMKhT4eUDq8iEr+CSiR37erc5Qb0m0dbF78HqdC0g874QRc+4
	szmGz3uhoQEH06ntaPO6IMX+rhtbNDmBO7uFLLMxC/b07gzESczfnNr8
X-Gm-Gg: AZFdTZe1x8CKSGWljiPQX1Oacs9lVs8evPL7vbndNswPzEM6rr4vWhGJmDY/bQemPMx
	ZMNKe+DeOskv3dfLIbSswHk8yf/3HnlNjZKnk8bcOO/4QQt41maQECaup/M2ixm0yK70RXGVCNF
	oF9hhXiEaKRzm3AqTqLv4D6meC1ddWs3mauaYmPlS7+NQJkpadWHeXL7KdDEkLCed+ZKYwqTWtK
	Cu3RT4vBV/pLa3m432pYEWNwUFlPrWbK87Sd0qZI+9IeYsKC+MLPx3ZM0pEH7ErgO1gWkE3wblt
	HyVe14n/N+FOab6oR/uehzX1o3M7sm629tOoRrat0PsB2LHKQZE0axJ7PXoAzohaJ66WsBtahsW
	uDX07evbKyC/XLVBC82ut2r5QPqb90vzSUYFFfzbqLrfNbObej2ezmLwBmfmxUoBuxuOuML8uXb
	cHNBTtiyc+TCaJwaKpNHrlSxFpjXriYtw1S7ksbVN0hSf18Tucq3IrxKrs22pPBGwx+8X+FeYzQ
	Z7w3OPlO4L1GfhdR4EFeEPetXJcRt2IiwVnwGTK79x/8+jzHs+V0bzQsUcf9RxwdjMQVcXLfwZ3
	NhJVsLpdmi5T781AXpqcVMw7AcFcVqWwfWqR3rbTrDHfqeo13+qplmHXwnC9zGr10K+f3b8uvgc
	Zx0Tcz26enjhvh2ej
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083754_047917_CC277E77 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel

