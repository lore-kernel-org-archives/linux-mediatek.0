Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50096C00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 05:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXDllftD4QyDeHUS/2Bf32lao56WYMz9aqKNaMzbgow=; b=t2n8x3BjB8OFwa2tNWdLpea+Qk
	kA1dX8ZYV/JTMgzAeCFcx+MRzVoRrwE/XlSdlVeProMtCBkjXDaPnTQG+gAiC7O43twiDkzLVZMSN
	CpoIjTwhbzl+zkX/zZMaGJqqefZ4hzoiaeEIWA58ftRUD0banHtBnDef+6N3pe0YZVvDoWb75qplr
	y/o3mytkB21zVtFiJZIzvDHIYxKYBEGjjnMEqG6JjRrcjP173EBvjPVC5VnhP3eu+c9hdb1JZVJcT
	ngKCi7mgrUgf9adFtJp8P99YFgQ4SXlIjeGTdcXbUhcrJCi6yM26CNKRTQI411tVkV/6duscBcEhI
	TP8dq3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvNX-00Aosl-9q; Mon, 08 Aug 2022 05:32:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvNL-00AoTQ-17; Mon, 08 Aug 2022 05:32:28 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1659936741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yXDllftD4QyDeHUS/2Bf32lao56WYMz9aqKNaMzbgow=;
	b=l/5g3LBSyqvi5Gjq24ubCHcG7qabOObZZ8TLuSHVu2BIS/VvakzjFtEQzYJYQ0lDr+avMs
	7ha3lBTXkBnoZ8oWULns3TlaqjljCBjGq+WL03HR0ADPqlEiEWZvI/x/SOW+FVa1UDqex7
	QtPg0TFpK7O5ymQK226DLAuGBh9h9uc+2WvyRYBko+ntO6EUGXioGIjWrdL6ODchFkrPBA
	1q38Gh9yFYqx3jzDx0SvzialxaNYXmqKisF81Dc9IuxkXl4ikfpPK3Dqt7uTDWyH9hdKZJ
	iGZDBuriYVlgNQyTi3vtvqCbdOMerfu7sbWIqYzFg3d5Bkn0EBdaZXPSSYf9FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1659936741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yXDllftD4QyDeHUS/2Bf32lao56WYMz9aqKNaMzbgow=;
	b=E3qbUOAt5/fCLiyUb7VbZKltnLl6fdQbVp8zwrGHw4tcKTuoetrcDyMMnH9thcn2pMs8d8
	Bcn/GPkyAKeOPQAA==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gene Chen
 <gene_chen@richtek.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Eddie
 James <eajames@linux.ibm.com>, Denis Osterland-Heim
 <Denis.Osterland@diehl.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 11/11] net: dsa: hellcreek: Get rid of custom
 led_init_default_state_get()
In-Reply-To: <20220805154907.32263-12-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
 <20220805154907.32263-12-andriy.shevchenko@linux.intel.com>
Date: Mon, 08 Aug 2022 07:32:19 +0200
Message-ID: <87pmhbxpuk.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_223227_254138_F057FE4A 
X-CRM114-Status: UNSURE (   7.61  )
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

--=-=-=
Content-Type: text/plain

On Fri Aug 05 2022, Andy Shevchenko wrote:
> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmLwn+MTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgrNzEACnffyzXSC3y5NLX9wOxrvEQH/DTqkA
DHNJ4NaHmLifJPoqkqY1sRe4pxQFV9KDhKMC+qThd8MRDy06JgCEFjbyeM5RqI5i
V2OF0kF4iX9cZ9e6FE+Tw3usDLSMuTUZiFgQqGD4FfKExaa1ARa7e1ODhrlOcQm3
qwv++kbeU/tao2jCnVdhiKfkT68fuBY9wnfRdul0bjiDv5x9olsrktbDvJTKCsC3
kAF/cfOQBv6f1Q06OMr1wCskw1Je7dGFehq5FkjtZ5xWZoIPpLkV858nI4rfn+DO
M6AxtrnZMr8KJAir4YhU1NDvYGSrL5wQv3nqc/NJoaeUkg8nj0wVqeXuIsgsznBC
BkH0VJ0RHtENu6p4NKCJaGnjW5RNPDmZu8CeanDhtTDAnhkhnfhe8t1Y8+pTa2Lk
mdaolZRJf7N+E/nKx9RiKkHh7goa5xrzVRHkIgYKwWb/Zu8z7I3uhhQiYfzVgC60
Jpscye/KxPMt/bc82k3Rn5iUaqd64KKLuF0K0p/1zV7I0XbcYHK33M0IiI3cz8Vx
xdMA1JoNz1zTR/SSgkjObfO2m/Xk+bUkk9LHjBONUhBrsK4UPcLlO3baUgVhk2vs
+p4DC2UHEV3jzSH9G0cMJHhgJEej2hnp5qcp2Ij3F19ywVEbEmgSkTnZbUXu/rPh
i4tkTsGrGWwQhg==
=o6fN
-----END PGP SIGNATURE-----
--=-=-=--

