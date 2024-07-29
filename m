Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A426C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKU0+6XQvE45shRp6oaLQnN0VhMCLZCW6ebTfIiQyNw=; b=aI1KgH8vGwkW6YB2CZCVKQ3RZm
	ultzzA2XXX+rwAALrHAO2yiz1WP+yfacJFyjJSAxE5dZiERNtftAihNS43rHomw3c9H831uSQw2sN
	9nBDe8aU1dEFTfE9mrllpumImemuaGFglqvdDOsIR7vn72IiJ6jBvziBuIqeji0LxYUeP+QxF81dX
	a+GSZY0060Km/ODPLCI4kLHUllizhvukcBqn8XECXzuaAFi/qCoeXkgu2cVki2I0aMH63vgrWj9H2
	vCcoxmoA0Ef2nYlzUx+/UtVHY7tPkxcetowa7wLbqzG0qk0YmM/wZ/twpztJ+SevOcjlHUFPxmNQd
	2AO53T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNyk-0000000AxTb-05kZ;
	Mon, 29 Jul 2024 10:51:46 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNyg-0000000AxRq-1PGI
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 10:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722250289; x=1722855089; i=spasswolf@web.de;
	bh=UKU0+6XQvE45shRp6oaLQnN0VhMCLZCW6ebTfIiQyNw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H6l7e0ngedySH2ri9PuAssVZli8MpOzeYijRMGHTjQYYLxQStp0URHKI5hJfgPCJ
	 hhyzVfOaMm9UCwA/gm6rBulgMPT5lqcl7M+ooQ5PgrXwHL5QHfwdmDPFpUbd3pKzJ
	 bHvXh1QDCFS8kWDCIUea00ED0Hq7suGhLZUhG9+2SYMLl0aXt6oiehupHhmCBf/77
	 PdlUQVHQ1sWOklywUpjPMLPU82T7K4Ogj8WUWHYnbmdVx0GPZYjrrLSzaHtj8dj2G
	 qDjFHr42vBsi9poBbkrV44Yx1muycrGtO8fR1eFDmKg4l+2H7EK3+Oal0GNeTZ3Ue
	 YpeLuKA+YR26UtZ2vQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9431-1sATl011fD-011Pg1; Mon, 29
 Jul 2024 12:51:29 +0200
Message-ID: <81a6dad7119069d446a982d1c7da4fff5726d26b.camel@web.de>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
From: Bert Karwatzki <spasswolf@web.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>, 
	sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com,  linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Mike Lothian <mike@fireburn.co.uk>,
 spasswolf@web.de
Date: Mon, 29 Jul 2024 12:51:27 +0200
In-Reply-To: <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
References: <20240718234633.12737-1-sean.wang@kernel.org>
	 <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j1RMugOP/j6u4SMk77QS9vWWp21YeqQCRRQR5w5sswoDnCS/HGf
 TMRB+c5xM73+mk9qC985oAETAFekn7Y2yYxa6hwcZrEo7TuxR3Mlz6lDdMzmPuVMmt7j1fY
 J++Nb5l8kB9rv1OFTc9GfG/VT9zb4KpjGpjI56i0hZf+uv6FP0JoMHeq6/t0wTJ2J4LKdTf
 fe7ar0YtWt0RpbcG1MRRg==
UI-OutboundReport: notjunk:1;M01:P0:U8jKZwb7VWw=;kuRLRAvfIPSTU9UccI3eB9yRjgm
 EAgFfyM//5gc2yiXQ+Nmm9bSootVdj77T5jnNCSJIb0Jv+/U9xb7mcOHWRGXcXQBtcD2nuC6V
 dUXDXpwwyc7cxzklNHyCDOLELs/qeHpya+Jzj+djCi+H2fVSP8Y2n+n6Ot7jItKDhfjU+Q6Ym
 Qm8L/xhq8T0CaHfG3i/wvjLI0FE2XkWXLAzQr/WPaoRhK8WujjZRAc8yTD/nTz5oot7koFave
 y6haNdXpO8CA7aUiwrE3KrEFn2YMxZ4+MHsqzHFIB6k2Ag7bQpdDP//0LybgsXCTKHPks6OIZ
 PdaCvdNsSqcAcTtp1+MxcdMiZCjGKDIkOuuVWt+nWEibLFoXRXWU52s5872x1ZtEAXxJ5sidg
 R7dlQY86JjlnhinVHYsgfhyuqF3lHedZzo56HdH4T5y25Vb5bOLeNca0wb12ola2hK5RvwBaM
 890ZHWfhOFRUq+ZeLG034Idp5n8d8X+kX9mGGcBbc4xIgzJtLPKZskI1Xrfv3sSdcogeRUTH3
 DS/ZchbGQs7WuSMoiV6TjOkwmIVD3exWSkyA1R+M08iAHbzvKbNzZImtFBOFtYlfveECHOrSX
 47sMsVxVCRr0+CBgzVvsJU64SfY6crSH4Pu5VK9JK7dbAbTodsM0R2220xTaZ40x0KFcW2D4M
 b3O76BrC2VvXR1cnyHN5D7wOQG5iX+lVkf92QB4JUhbgH4mTrImmxPyxX+z1qw81ixEEninFJ
 RoGTjaCTIYRlUogJ8gp86HxyZo7HOdSCivzPIiQieNZHh+M+6IyyGGkVc+us7crFUivshQky3
 1+p3zp+i/+KXiR8d8DDR+PFw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_035142_762663_024CB277 
X-CRM114-Status: GOOD (  11.01  )
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

Am Mittwoch, dem 24.07.2024 um 11:36 +0200 schrieb Linux regression tracki=
ng
(Thorsten Leemhuis):
>
> On 19.07.24 01:46, sean.wang@kernel.org wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Fix null pointer access in mt792x_mac_link_bss_remove.
> >
> > To prevent null pointer access, we should assign the vif to bss_conf i=
n
> > mt7921_add_interface. This ensures that subsequent operations on the B=
SS
> > can properly reference the correct vif.
> >
> > [...]
> > > Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add
> mt7925_mac_link_bss_remove to remove per-link BSS")
> > Reported-by: Bert Karwatzki <spasswolf@web.de>
> > Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca31=
88c3742c7effd102e.camel@web.de/#b
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
> TWIMC, Mike (now CCed) ran into the problem and on bugzilla confirmed
> that this fixes the problem:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219084
> https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz3=
7Bmh2iw@mail.gmail.com/
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

Unfortunately this NULL pointer dereference made it into linux-6.11-rc1.

Bert Karwatzki

