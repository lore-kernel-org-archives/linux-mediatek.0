Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074F9C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lN0Yg0JRWF9rWx1AIEB0nSa4HfMfBnZ+uCfkhWx3pk=; b=xpcAxQwJ23MGK9mZcAZkyCwkoH
	ynP6MGTU+t6Kz+vWQqbCgo77FAFocnEkvh4AxwhinG0v1ETUHQ2nLLhYfWY243L554kIkdQ+1h0zS
	nlw3Q0sSiKL13CkE5Kz+q2hD/4CeBaXapFfvFT+QTxXpSdlytIy5vjx//ZqVT+BYj2uvfBHI9/yXE
	nthwPyzbzbmRr06W1OdIUyc4S8eSqUafApkrJq6wA341BuSYL9v8tPO83vzFC2CCvG26pE/kLPgZa
	jkgyNQFRgHN7Z6Rh4qvlFnGULRMC/TG3OeIlHo7uYoQsseF4hViTnge7lM+D2xir82BMxMq3Rp+2X
	0/lC3FSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZExv-00EHeF-SC; Mon, 06 Mar 2023 17:49:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEwK-00EGug-82; Mon, 06 Mar 2023 17:48:02 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1678124873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8lN0Yg0JRWF9rWx1AIEB0nSa4HfMfBnZ+uCfkhWx3pk=;
	b=PiDvaxw4LGrgfeWFLomToEp8NXOe127xR8zSD3xdD7fGjOODv4sckwrpJAEB88tlBkosFU
	nf6LP5VdmgBHRGVwa1jz51jWwzVGgRZsiIJSvY1nY4W+E0jx6jFLmRjXxndkQdy7f4ToNK
	/2yd6YCMRtQHSbt64qAOF1pjQYgtflD6W12UfgaUVV3pfTxHpY5jpqAMgD3wqJvAmZdNUk
	TDhu7T5Eo+bDYa1HllgrRtMl4Qa1F3FMyklmyhQn4sSPmh8r28NtGZGU7cKnFqGy2qtQiP
	At9OFLPA7Pm2BbHUjdQJpIkZtI8RbdF058x16bISYmOmfb00kzLASOY0WsAbnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1678124873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8lN0Yg0JRWF9rWx1AIEB0nSa4HfMfBnZ+uCfkhWx3pk=;
	b=ejETIPzH+UYpQsQdDQiRzE7D1rokyyVF4y27HoO9uGNVQmgJFYg6wLL2/QhqIOxHbMW615
	kjHmGjANoELoCKDQ==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gene Chen
 <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 11/11] net: dsa: hellcreek: Get rid of custom
 led_init_default_state_get()
In-Reply-To: <ZAYMvVR+6eQ9qjAk@smile.fi.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-12-andriy.shevchenko@linux.intel.com>
 <ZAYMvVR+6eQ9qjAk@smile.fi.intel.com>
Date: Mon, 06 Mar 2023 18:47:51 +0100
Message-ID: <87jzztbwl4.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_094800_486198_26350268 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon Mar 06 2023, Andy Shevchenko wrote:
> On Tue, Jan 03, 2023 at 03:12:56PM +0200, Andy Shevchenko wrote:
>> LED core provides a helper to parse default state from firmware node.
>> Use it instead of custom implementation.
>
> Jakub, if you are okay with thi, it may be applied now
> (Lee hadn't taken it in via LEDS subsystem for v6.3-rc1).

I think you have to repost this one separately to netdev, so that it
shows up in patchwork.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmQGJ0cTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgkrGD/i8jm+ezfthebeBq5NEe2fhRTOQSUEo
J6p8vlFqhXEQi6TP4fF7J+YwDABjyWsB3BuIavKZ4gYzpFYhr/aU8wfa/N1VxA25
XsUALOkexCOua3nBMN3k2M6Kuy3bdzDQpq1SSLQZV/qeC8KWS63vUxU2yf6kLTAn
tTKtX+dMS3UiwiafYX7VH8g7eX+0RnPUgjUnq7pSH6AqJqgmyusUfVt5Iox1KssI
BO/dvy7IJQHZITVrbOdhcLXgXgDbyxuozjhooH+TbfNM8FrD3Z78ag4vClZjiVqY
wzpPMApXSPrZ5uYlRySVxf94CAsvhZGj5jPWPfwV7/A+VVTpdMrqGO/5m+cDbS2q
qGOdebdC68nbZCnQEk1hewMSmTufzv6GnoMKNr62036+WPYFlshf0Ig5aWzm8e7Z
+/U03mXUN+bf5wqhjUqX5mhK7B9MFt85r2A+F45UB2t6wJxIBD6GXxCMd2gvI/95
vwQukHXYMTCOLxcBk8rq0miDM04D81+uXg3Jhr7r+S5cXu34a+jNvl9ENHb61aeD
QA/Ew9HZZ/Y//Ubj5S7It9qpsmb89new/UNDDr2DYYGppoN19b7YSvyibuGH0klC
56Oyvdz8EEkAVIZwXySPp+5l+Tj8oFeqTEMEKm0EGgEUEtwzmmRTTlikureoqkkB
F26RqCvsDG2T
=tkxD
-----END PGP SIGNATURE-----
--=-=-=--

