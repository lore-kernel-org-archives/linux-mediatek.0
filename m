Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5978C761AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgXQ38nFmCt03RIhoEWzT+O1IRQrnX5UaoYuVRV+Ngk=; b=dnayt1rsidCX8McnTwQycF7DUl
	WeBrJIHiFfJJQ1fBGQq7nrB4VpOM/yT/FuZ7srSa/YkbYAzr0vIAllcr4Mvf/CTg00+s4wZ9ha6zB
	wcB0l+4sl7FD3Rl+lT5e1gg2vYlFfxaXcJeSqPGs7HlYhiZtX0kIweG8wMYT4wAtLc05hd2VJItEs
	QaOqbjIKzawFUhi9Qk6dvHFAbAZl443AMGesjswmaZ02VtEALLzbDaPvAwHMQWv8UUgzkoIQtTFjf
	pmDZKEVtylaaSOEG4wrgaGUR/9670xwUgvbZ0gmjDOf1cQT/6rxoOosLMPJj34hCVRAcbwimIDDI2
	fQPzgDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phA7o-00EkwK-2E;
	Tue, 28 Mar 2023 14:16:36 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phA7m-00EkvU-0s;
	Tue, 28 Mar 2023 14:16:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cn12so50390057edb.4;
        Tue, 28 Mar 2023 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680012991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AgXQ38nFmCt03RIhoEWzT+O1IRQrnX5UaoYuVRV+Ngk=;
        b=UccGLVY8aF5GrsZxcYM4gYSkKtnsrizHORYCcD1SC9BNSCK8Y73HDUjAub1ECaS+l6
         rDtb0Vf6Z90VRRaotlbuCWeinvAPenWTEwlD0xB9Tj0Fs+ubQvCvQHlX46+3EFFTTtfq
         doWEX6OTOqQTQ8SzxPMfV71dBjgD9XQL6uwHY3l0/yQVrsMY0ATfTHCVYrlzaEoMGhCZ
         Tsyt9GJnSsXTVQAIm0YeqL6r7blXUVIJPpDpFLlJ6AYYOIAhmClYp2r9zN3rpcvYzaPh
         0p2wmqYdNTc/MphMvvr3S/VhznoSUYiTygm+1MEtvloYmEybAFbXFv9ihZugYWzS5gaO
         J6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680012991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgXQ38nFmCt03RIhoEWzT+O1IRQrnX5UaoYuVRV+Ngk=;
        b=ie2dGhiTMoEVyOr5o+WNXcoss7I/Nmp+kQ+C6fHXAezQXe2ohbrXDxJUWROaU+up8x
         QXQ1OBq0tLubpOzsrZWDnuDUgWuyfsBIsq8rAv3sT57QdgAF2oV2JrNVvyRemjLg4PM+
         pPLCbuGkOF6PVi2dGiDXrbWK3796lBIc3NpMvmYIw76GI/EQNGB5h3CLgCXB0xf5ibmJ
         d83IFjQaPOGC0/WLD82JayVlkF13tMkAzH8r75b+TTPnPKtdR7QXrptwXFx//LlQdTw9
         Cos55rwBVUJg/wg3Y6zhTZmciAxAoY1wAxBX5O6CdmZmAVXF0D/sXC2bb6Dc0SdzgH9N
         3a3w==
X-Gm-Message-State: AAQBX9eiMXEdf2zuctDNq27/d1wYEGyqzHRoY0NNrwipcUG8jKDJ+olu
	N7AjeXt/6cgUuXqMWqXozTI=
X-Google-Smtp-Source: AKy350aJWYjsszzYhUL0PG8dKnI+Yf+TIxCMuHt140T1o8FjgTI3qFPkWjkkkVUq44n1faJ1y+AfoA==
X-Received: by 2002:a17:906:f6cd:b0:92f:b8d0:746c with SMTP id jo13-20020a170906f6cd00b0092fb8d0746cmr15874361ejb.20.1680012991394;
        Tue, 28 Mar 2023 07:16:31 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id h13-20020a170906110d00b009333aa81446sm13671380eja.115.2023.03.28.07.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 07:16:31 -0700 (PDT)
Date: Tue, 28 Mar 2023 17:16:28 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver
 for MT7988 SoC
Message-ID: <20230328141628.ahteqtqniey45wb6@skbuf>
References: <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCLmwm01FK7laSqs@makrotopia.org>
 <ZCLmwm01FK7laSqs@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCLmwm01FK7laSqs@makrotopia.org>
 <ZCLmwm01FK7laSqs@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_071634_308788_32FA5B1E 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Mar 28, 2023 at 02:08:18PM +0100, Daniel Golle wrote:
> I agree that using regmap would be better and I have evaluated that
> approach as well. As regmap doesn't allow lock-skipping and mt7530.c is
> much more complex than xrs700x in the way indirect access to its MDIO bus
> and interrupts work, using regmap accessors for everything would not be
> trivial.
> 
> So here we can of course use regmap_read_poll_timeout and a bunch of
> readmap_write operations. However, each of them will individually acquire
> and release the mdio bus mutex while the current code acquires the lock
> at the top of the function and then uses unlocked operations.
> regmap currently doesn't offer any way to skip the locking and/or perform
> locking manually. regmap_read, regmap_write, regmap_update_bits, ... always
> acquire and release the lock on each operation.

What does struct regmap_config :: disable_locking do?

