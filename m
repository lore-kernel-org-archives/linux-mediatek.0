Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE7BCD11BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pc7KuvZEkEXee9YsdMONJ1CGa3iph135HTOqXv9OL0=; b=aMhBggcSB2M+Zj1O18AddCeQKT
	y10nw06VapZqEfimdRULF8WdCWToBjhB1dGTRE5o+K8brk/oEHTUH0GajVoRNMThUDaNEdgSjGQMq
	7Z7rkDn4BDlCou7f9u9X/GPTNjSTZwDv+rybHZ7Ik4pH0/2v/rT/YFLHvo/Kh8t3ErZRcL3ZtLo+B
	YJKKWOe58Gkfg+Sv/vadlVC1JLk8jtDOdEMwv8H74FFododzPyyaO07a8eAyQTCJAd7CKy6UYm5Ml
	gGReuTrt64+g4Jrx8GuZMYw7jwYMnQ9eoXqMK2ui5Pq2VjG+S6O1wiJ8oGWeXcEkXEHknOY7vH1U5
	fWzHh3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbvv-0000000DGd1-0Ee4;
	Tue, 19 Mar 2024 16:03:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbvr-0000000DGbT-1WJG;
	Tue, 19 Mar 2024 16:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32138CE0EBB;
	Tue, 19 Mar 2024 16:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34885C433C7;
	Tue, 19 Mar 2024 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710864196;
	bh=+voahnlPtlKXWhIdh6ZvbBRDSKewT58b6XkwLBATBs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQykNv4jqSVsGqK7aButH1nz5vVakQLEs5Kfy7VWh4LHBww3lx17IDdArNeqelGju
	 dr2Upwk/dUYfRldBc1J8dhYssWkC+ERTcRQ4b5VL52xNw3VDIgkf8IsBU01wLfxZ3c
	 +ZV8ldv7aumnK10StnNpTYEdW7n/g5H06W5NBQ/8=
Date: Tue, 19 Mar 2024 12:03:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, 
	Russell King <linux@armlinux.org.uk>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <20240319-uppish-idealistic-giraffe-e17cb4@lemur>
References: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
 <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
 <ea889226-3649-4f74-8c38-67c459e4ea4d@arinc9.com>
 <20240318-quizzical-raven-of-plenty-ef21f5@lemur>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-quizzical-raven-of-plenty-ef21f5@lemur>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_090319_817260_A7F8C1CB 
X-CRM114-Status: GOOD (  12.91  )
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

On Mon, Mar 18, 2024 at 02:01:58PM -0400, Konstantin Ryabitsev wrote:
> > It looks like my branch name was too long again. b4 0.13.0 cannot handle
> > branch names that are too long. I'll keep it shorter for future
> > submissions. It'd be great if Konstantin could provide a specific limit.
> 
> It's not really b4, it's the web endpoint and the version of python it's
> running. I hope to fix it soon by applying the same workarounds as we ended up
> doing for b4 itself.

I've deployed the version of endpoint that works around this bug. Hopefully,
you won't see it again regardless of the message-id length.

-K

