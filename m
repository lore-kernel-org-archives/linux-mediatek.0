Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlmYm/YUjwtQwHW0VauyhL8vF1Hw1MMsONjk6I2cK08=; b=QKtpJpctoiWYaVqSeEZJLhGHnY
	p4/oIRJZOpoQkxG1P/EDR43mibhNHQQ0rH89C0X0GeROf1tKBmfX797XOR1JUfPJCQH4HKrnVltMc
	rIEB607yxPj5A/m4EgAE8HjtMZozL+SyBVgIHjM1x1utXM0PPye3NZl972sh7eRWZTPirgxbvwTpV
	IXPAVr8yr8C95jeLN5mmLWmcf2LaHoeCf2TdlXFB36ZHFiLzsyzfNyWHv1yg0In3hvvg5iZzlB7pZ
	AyXCgeqoUI/FkUGEIUBSOTUJOJJw0doC0ziDTPOcndw3DG9+ws/yxpFAf5CoX1Lm6a0F16Q4CiyEE
	UOu+S00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myGa7-00BJvj-Kk; Fri, 17 Dec 2021 16:59:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFrT-00B6Dc-Pv; Fri, 17 Dec 2021 16:13:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4616462285;
 Fri, 17 Dec 2021 16:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FCFC36AE8;
 Fri, 17 Dec 2021 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639757614;
 bh=4wOYAtqEbK69OSQibt2ZtBO/menDZY2LaKMDtoqas4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SEwKpG70bMkEVxM261CxIJM2yLmgPuvIw8vFpWOZJZDJ4cw+8ZkCfuH/OEL6br4On
 PmfihrrIlryRrIlgKqwnLdsDN05HVFg4/pnwzsbMntKgyeJhTGOIw7bIyyH69K1Vbj
 yJkRTjJiaZhhlBOyvr1AntR+u60YGjRBKBjkCzhqBvW6yA9HkZUbHWkARG3F3SLsFR
 sOxUgi2SZIuu7QLsuGe7qbFRO0xv+EBdcHl+Oxp3mnUBQl2IDd9h79GTuJqNT7tC5u
 mIJ48aG+JfpXI4+o9JN8ZQDyuw44nu09Qq7pzNjixi5N3ixAeipEIb2NSzW2x3oO9d
 hVbG84eMo4NrQ==
Date: Fri, 17 Dec 2021 16:13:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isoc: mediatek: Fix dereference of null pointer while
 alloc fail
Message-ID: <Yby3Kk0SzEZwNkNu@sirena.org.uk>
References: <20211217152044.675428-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211217152044.675428-1-jiasheng@iscas.ac.cn>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_081335_927632_053080A6 
X-CRM114-Status: GOOD (  12.18  )
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
Content-Type: multipart/mixed; boundary="===============4135399162061851217=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4135399162061851217==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6+QGlVr4tfa7Dj9"
Content-Disposition: inline


--b6+QGlVr4tfa7Dj9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 11:20:44PM +0800, Jiasheng Jiang wrote:
> The return value of devm_clk_get() needs to be checked.
> To avoid use of error pointer in case of the failure of alloc.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

I'm getting really annoyed with this...

--b6+QGlVr4tfa7Dj9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8tykACgkQJNaLcl1U
h9DQJgf+LWui0F0zp3H7cavKZQQNOaoXP8fwZwuHoKfVx807JPO42fGl0JyJpARY
wilxOhyTo+iwRlL17k91DhtZtYaMt7DnVU/hdWwYVPAQKBYSch4CMeqSCpabufRy
R1Jb8aAe2/NNG0p5UYDfw6mMTvAs0OHR9skp8xwBm/dEB7nNdwoskAC6uAH9KwaX
fXP6830m0EJ0kLmWaMsr7w4+9uBsc/mmYGVdD+i1gFGF+yGPakNPn0o7Sa/k1uDJ
e/qr7XEeLlLiwPjVWozmUGY0nxn5PcX1vw81e4GbXexqAsWQ/nf48eoWuPKsC0Yc
o8nVrgDaNnWUpZMdBHw+VStMyzYBVw==
=Cnk2
-----END PGP SIGNATURE-----

--b6+QGlVr4tfa7Dj9--


--===============4135399162061851217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4135399162061851217==--

