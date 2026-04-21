Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F34F8FA98
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNNpnXmhChBY9D0sH+a4YdWwThfUoA6af4qc1j3CSvE=; b=glq1gHczPunxgGIqwyI+t/a0sq
	Ae2+XIlrTVHrIfZoUB5UEwir+4yqBP+1vz0DuKvW6kIZDLqOKwRJeLp0vDjOpea+lhQRDzPzM4qWt
	ixpi02qwD6u/9Iq2TuukyRx8LIvQQ1bD/LwJpNMkKATK/UArq4Fc5z/DnPCf4SwCzvO2ecxo7PcGA
	kJzjVPb1BjTQ7b0eK86Cya9w7t8piRW4LWMsqjHIz+JA6YNScvH1gSk150QH2Q2FAtA1kRuatz61p
	i6Vofls7p8sU++7V2jI6EQb9Um2oln0sfHEqgr9G/tFn0n6A69XCCeehYrCy6nRiuF4jS165wPGpd
	ZcK3mKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQf-00000008ree-05Iz;
	Tue, 21 Apr 2026 15:54:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQb-00000008raS-47s2
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 15:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=sNNpnXmhChBY9D0sH+a4YdWwThfUoA6af4qc1j3CSvE=;
	t=1776786861; x=1777996461; b=nLO9zPwt97+otPIii85A8rLVPtZ6/1Q/Y1CBYCdU/RyWoCP
	MdzjYnxlcBcsPvlPfByiEleS68ZkZ8REJETFTbXW3Q2EEW67q0fPlo8oNizudNRb2iPceYSCp9gb9
	xDSLL6RFu4Ksuf1fdJRSvt7IFg2ZhZcw9WQ2j6J4E1CRmyg8a0+qf2zvpkKeuzzZ9ZfkxUXHH9rm4
	2JKoUxSuko3h3m46QuqW+pr3/749gYpy0Q+IIItOU0AHonbVfyi0DdedBiDspP6P2EX5bfJc1gVjP
	cRa91IB1RV6Hp2JysURgHNXBOvbvnlWLx84A1Fv6YEOLlGxfxTbYCqC6VFz2sBKg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wFDQO-00000005Jsx-0j48;
	Tue, 21 Apr 2026 17:54:08 +0200
Message-ID: <6facdf8e06bc107d68086ac8db3330def09aaa6e.camel@sipsolutions.net>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
From: Johannes Berg <johannes@sipsolutions.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "Christian A. Ehrhardt"	
 <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, 	linux-kernel@vger.kernel.org, Marcel
 Holtmann <marcel@holtmann.org>, 	linux-bluetooth@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Ping-Ke Shih	 <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,  Lorenzo
 Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>, Brian
 Norris <briannorris@chromium.org>, Francesco Dolcini	
 <francesco@dolcini.it>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 21 Apr 2026 17:54:06 +0200
In-Reply-To: <aeeFun4zdz360GCb@monoceros> (sfid-20260421_162828_161184_36113A7A)
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
	 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
	 <aeaMkfk_1t98e7SU@monoceros>
	 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
	 <aecu1ixyHP2hQvgE@monoceros>
	 <2d6e902083d693cdbb15fc62c6bf92db34fc734a.camel@sipsolutions.net>
	 <aeeFun4zdz360GCb@monoceros> (sfid-20260421_162828_161184_36113A7A)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085422_025329_C71A70CE 
X-CRM114-Status: GOOD (  24.90  )
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

Hi Uwe,

> > It's probably better for everything all around, including the various
> > automations that test patch series, if you just flip a coin, send these
> > to either BT or WiFi, and then resend the others later :)
>=20
> The first patch of this series adapting sdio_device_id is technically
> mmc material.=C2=A0

Right.

> However to demonstrate the upside of this patch you also
> have to look at at least one of bluetooth and wifi. So even if I drop
> one of those there are still two subsystems involved.

Sure, that's fair.

> And then in my
> subjective view it doesn't matter much if I involve two or three
> subsystems. Regarding test automations I would assume that if the
> bluetooth bot sees patches #1-#4 of this series it can do something
> already (involving either testing the series only partially or finding
> all 6 patches on lore).

Yeah, that's a fair assumption, except at least for wifi, the
automations (like netdev, the nipa software) only ever runs on series
that it receives completely, since everyone gets CC'ed on random things
too much and having the full series is a proxy for "should be applied
here."

> Having said that, I'm happy if the first patch is merged and patches #2
> to #6 are discarded by the bluetooth and wifi people. I'll come back to
> them once the first patch is in a release.
>=20
> > All assuming we get an ACK from whoever is responsible for patch 1 to
> > merge it through some other tree :)
>=20
> To make this more explicit: That would be Ulf as MMC maintainer.

I'm also happy to merge the MMC (with Ulf's ACK) and WiFi parts, though
that's even scattered with my sub-maintainers, but that just needs some
coordination... I'd just like to then have a complete series on the list
so I don't have to all the (build) testing manually.

If either BT or WiFi merge the relevant patches then we can sync via
net-next pretty quickly and get all of it done soon, if the first patch
is via MMC then it'll probably take a whole other release cycle ...

johannes

