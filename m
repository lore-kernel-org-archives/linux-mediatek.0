Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36AC624D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=; b=2MwkVt1EiiA3ynTTUz9Oij5xky
	fop1ajxCA4R0HutSkR2rDG6DrjVeV8xcKGNB9qommoX5hXhv7WuXyVH6rCUKqa8NaRCuZaUOpq0u9
	eQ1rI3ijO3nRo1SLde37jAuOZ71iJtaKRctLFFpY//oSpIXT/qLi2QpB/NdsMRmfatq/rom6Qs2Qx
	CLhSsntvFLVMAgSJHul2iBb3UD72sXtDeTA2gy0/1gUmy1Y4NxqmqROLX+zBMzeznoCXffh6knkeS
	hJKdaB9qz0vI9c3WyQ4uxzWZr3Qdt1hlpyPvf+MpUbWM+C9ruUhgDgRVHQlGrqAMqo0SM7PXWn0EI
	xAYi5f5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVx-0000000DG2d-0oH4;
	Tue, 01 Sep 2026 19:51:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVt-0000000DG0l-3WY8
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 19:51:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-482fc3327fdso216122f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292278; x=1788897078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=HLoPqXAoAYqm/B40st+VRjBzU0pfYwjKCqRAZmxbZ/ovZ2tZiq+TXXnYMy+6Hy/L1I
         nH+uWpf2OSkCuZ0cQ1cLxaGsnaIchSXjbwRWvxuQ5A+yTOzFclE0zdRopzi27xFGHxmG
         PvHxMU3W36wSwDStJljBCKAxjZxeMkffmVcAQsh16WBUmLkaeFCq6tX6/YLQ5s0A5zS+
         ZoVz9vQEiPMteIvysNPFBr3sHcj9qkyhDcIJuQs8YcqumRd16FPEf4qrV/ZeF05dbN37
         Ye1LiPhl8tqLR7z+QUassfUVOr1rY106GOnrkTgKA3HUXyn5IjLrq87CAvQZsE6eRR4i
         FY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292278; x=1788897078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=ERrRhV9XF+9CbhiQjDAsAKl+8rHuGn6Jz5uBORUIfQOjkoKm6t+DXQ63j2eUKdT98d
         BQ0nc1TLL3UFm6KrjP3JS6mq2/C/IsO1r3nC/pM9k3wfOTq+wyqbvXdsmq4YWCG9AAPa
         csOWk/xhFMpR07xAYhyzWySpbjKhJLJSjjFRYGEJB89GxRNE3UDGxM7yvXVn//0vLaeD
         njzsqQyqylbsd/AVo0ob9AM9QTeX7lgP+xLNlVxMiHghUykEwXchaPWEM+iUpyqccOrL
         Frp9KfKb+ryb2r8A1kjouHWPLQkZz0AzNiVrDfAlntaxK8M4Jqw8p0jS/IrSMblSRjHe
         rK8A==
X-Forwarded-Encrypted: i=1; AKwUvByojIQ0Vo18cmcY1eOUoYUdMpS4mKWWpNojIm3U6NKON6xO5ZiWWrvBnx99VYnJ+VKtay1egDwNmmg3JCRkeQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mA0ml1TkyAGQ0iCcHXzbad4l0/boGUSFniEjQfSF4SPIUzQGfC
	kHnRFsIa4ZgTGMEi/peE4EX3mOc/tW4RtzwDK2cHnSXw4K9bFYK4UIuW95mKrOmGYuI=
X-Gm-Gg: AYBFou3Yajmrtkn/tczp//vSnsIOBO1VmQu2PoHRO9ERUKhuFWa+L1iUVBtv9VA3rI1
	A4JCQGIu1OQxhxhN7OWr/zZZVGIopDkJ3plbhr2q2IpPjmaZwAIf16D3IJGGy2uQtaraWut6tF9
	pnUtuRhB0hl7+YpyixazyWqbRaRrrcF69sKp9uJeiq+S13zmkmXreF2tuQbgu/WRYArr7ehZv9+
	VQ7V61Z+VmAOjvalhODQfUsyHUjPMcaQrktjfqfYYjXIT+59d6uYyp/CgYM49WCXLSZfsQtR2et
	JVXglWSbT4nTL6UCrXRndRoliwXFlCdr/uHV/xVjKJDu7yFfJfpvmALewpmbFwaSPO+IlFX0RGj
	Zi8oXSYCtgiiwGsJRr8v7J3QapPhKGe7+XFTiepXs3jb0nWfjbyFOSIyNva3hRuJq3EonrMB+k9
	bhOXzyCnPu3mTGCrW+3XLFBdB4sD+0WkT1IULcGnYo9c0h9y0Izg==
X-Received: by 2002:a05:6000:648:b0:484:4189:6b09 with SMTP id ffacd0b85a97d-48441896b75mr15334529f8f.17.1788292278109;
        Tue, 01 Sep 2026 12:51:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm1316681f8f.35.2026.09.01.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:17 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:12 +0000
Message-ID: <20260901195112.37184-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-3-f@lex.la> <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125121_929093_41DAD03D 
X-CRM114-Status: UNSURE (   8.76  )
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

> For a 'net' patch, I think it makes more sense to restrict the lpi
> interface to the chip revisions with support confirmed.

v4 will gate lpi_interfaces on a per-SoC capability bit, so only chips
with a confirmed LPI exit get it and the rest keep the current
behaviour.

MT7981 is confirmed on my bench: with tx-lpi armed the PHY's MMD 3.1
shows Tx LPI asserted by the MAC, and thousands of LPI exits at 1G and
100M against a BCM5720 lost nothing. Details in the v4 cover.

Qingfang, which SoC did you validate the wake-up values on when adding
EEE? That would be the second entry.

