Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB2C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ST7qAZyUrUnu6C0b1n65WZJxUtV/xJSKyTsGfRXsQQ=; b=WWinf7a9Zhaowfub6rIxAy2Ize
	akdhvGH8BwyKuBnj22d6BggkjO2Twp0VXFeypStq2nil+CylF1vSVRM8ineaf4QpTq8uE0m2uw3Nq
	wB02iD/NQX1vGnn0/c8Kw7aIs+3HeZ4273JEBA+u+6J+gDDaTr4X08F8yzoyPZ35fn0SyvAsIEHgb
	nNt9sR0J8lN6aeoBFJt7vy2kL4/yR9/FsiqyVmi3wWs3Fq1s4DAZVoU6Bt64cpIqmvHpsFOEA2jJg
	zfHiury/hlBde9bEAV62HzSw/qNbK3GhYqv2Pc3FtcN7qonUtiK8lng6XmGZHsDTGu/DixbWidFWS
	PKdDwKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piWFX-009zBa-00;
	Sat, 01 Apr 2023 08:06:11 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piWFT-009zAk-12;
	Sat, 01 Apr 2023 08:06:08 +0000
Received: by mail-lj1-x235.google.com with SMTP id x20so25349154ljq.9;
        Sat, 01 Apr 2023 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680336364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ST7qAZyUrUnu6C0b1n65WZJxUtV/xJSKyTsGfRXsQQ=;
        b=OX9c9pq7jnMlmww6eCQy8E8DF55OrCoH3HuIZh184Ou5PTYdQU2dacd+IoxRlFm15b
         wWzPw7RNpZi8y4fS8lzLQdnCl64yP8FNPEh4logBq5RCgl1q/ggwwUKkFV5IdgpTJyFC
         XMgu0SPxPePqN32LI6Z4lqR907ZUQpVU4fFIG+CfZnmA2D5zMIF0EFLHWj84mXmI5mzO
         td6DLKS6PzgzPQZBgG7zBG71MpJmmSi5NZuN1ysgBXWDRWEcs5HoqiVZnf8S54Zl5qKl
         lLppefThuZyEOxtNbfYsbidT+//tNSdMAccBMCFCDb/9WIAs+Sm6XoRlLZBVSzKl83gT
         nbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680336364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ST7qAZyUrUnu6C0b1n65WZJxUtV/xJSKyTsGfRXsQQ=;
        b=lx4mkh+A9h+sQT92IcEgvF9oKubOFJGvk/WubWPK3GbhRzEBaeyQgbL2f7C7LDdPQH
         LjCIhy20/SVRub+O1nsBWc/vlJP6oGQ5L0p7P0JrIdQ5rCiObDBzc4O6SUEReTr8kN8s
         gxnw7Wu4X52v4c2Rii+fSAmk7xFLPHIVTeiU3f0pK2UiHrnUguUXhKMKn3ENy2gdcCZp
         OXUghopaaObwQjN4YgYMx7Mw/S3iAnie2qYxQOJTD2MFAhFyMJOK1Ll8i3lohR+jXBQS
         PXQyqXWS0R+b6hHeN4Wad/h9nm1vJUXey8pjyJVJP5ETprKes2rO4or9KArnYAmZISpz
         tXMQ==
X-Gm-Message-State: AAQBX9elYhLD2ICunkpfuuIPcDHZcKq7MEf38sk51nzb8EuHYv4d1Yu4
	nM3DjB3HaG8GkGsAXOdxPOXofJTDrj4jcDg48/s=
X-Google-Smtp-Source: AKy350ZUaKV33EBurp3zv7o2fsJ4r1rVorZJ0CUdpHaYPqLPuvQOPZJ/bV7evNA8N5hP31voe9eVfor77FwKucCZFw8=
X-Received: by 2002:a05:651c:150f:b0:293:4ba5:f626 with SMTP id
 e15-20020a05651c150f00b002934ba5f626mr5975912ljf.2.1680336363546; Sat, 01 Apr
 2023 01:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680180959.git.daniel@makrotopia.org> <fef2cb2fe3d2b70fa46e93107a0c862f53bb3bfa.1680180959.git.daniel@makrotopia.org>
 <6a7c5f81-a8a3-27b5-4af3-7175a3313f9a@arinc9.com> <ZCazDBJvFvjcQfKo@makrotopia.org>
 <7d0acaef-0cec-91b9-a5c6-d094b71e3dbd@arinc9.com>
In-Reply-To: <7d0acaef-0cec-91b9-a5c6-d094b71e3dbd@arinc9.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 1 Apr 2023 05:05:51 -0300
Message-ID: <CAJq09z6Y-vKhkDUs6-KC-+JZXs9faQZh1k3nq92fC6RbpQeGgA@mail.gmail.com>
Subject: Re: [PATCH net-next 14/15] net: dsa: mt7530: introduce driver for
 MT7988 built-in switch
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_010607_399451_16BE4F16 
X-CRM114-Status: GOOD (  13.68  )
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

> >> The mmio driver could be useful in the future for the MT7530 on the MT7620
> >> SoCs or generally new hardware that would use MMIO to be controlled.
> >>
> >
> > Sure, it would be a bit confusing once we add support for MT7620A/N (if
> > that ever happens...), then CONFIG_NET_DSA_MT7988 would need to be
> > selected to support this ancient MIPS SoC...
> >
> > If you are planning to work on support for MT7620A/N feel free to suggest
> > a better way to name the Kconfig symbols.
>
> I don't plan to but Luiz may. Onto my suggestions.

I did start a branch to bring mt7620 ethernet+dsa upstream, but since
I burned my test device's serial port, my mt7620 and rtl8367s dev days
are over. After me, I wouldn't bet someone else will invest the
required amount of time that mt7620 needs just to support an outdated
SoC. Its internal MT7530 still only supports FastEthernet, so to have
GbE, you need to add a second switch connected to its single Gigabit
RGMII port. If you need GbE, you can just use an mt7621.

Regards,

Luiz

