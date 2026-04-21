Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F43EF327C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1XYr9r2Q9xuv3Vej9XTSXH7J6VkMPzH3/V08F/9nAA=; b=RtGIQ10SkjUrs2C4en9dJ8/3ij
	QfPoCH7+63el09ftUC8VcR/ZTou0ZO6ewkS98IAUjJr7kxSECJ+VzCPuIkid/TXhi6SY+DX1fS7TP
	zZBwuxPznwTHEDvkaw5RwQq2PqmZe75WNi28DQ2mB1jHt+A8vPiuKf4PvDspySCJdI3B2FPzmmPIu
	TlJHB6tIZXNqSynnz8DtD7xnnmAIhPFfQwQH8vzuawQ1dIzW0UnORrbOhhX9pvjIz6iOaBvGUOQOn
	E/qKbN6DtVDYJX2MuuckagtBOg3+kmHCmNu49CrCujc0igdmYXtzlUumZkwVR2qyPflqo3Sf/Pykv
	OJ4m85UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6ww-00000008IHd-2ZGu;
	Tue, 21 Apr 2026 08:59:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6wt-00000008IHA-38V1
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 08:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=J1XYr9r2Q9xuv3Vej9XTSXH7J6VkMPzH3/V08F/9nAA=;
	t=1776761955; x=1777971555; b=h6blffoT6EvO9lY7y8H0Wk5ySCeqTZQz6x+vafxI3mht4yX
	HI1THLp3ph13h6H5lsP/ObPYqvcralzmq1lABUJhGigVq17JtQh0P88dQp/VsC3zP5TPaCP7qWFw2
	dvz2fUfmFo4XYEAWZOWoWyKACj4xsZiIvaMbsC/SfvDMPEh1hlT3LsW3zgoUN0lUm85JSDIU5IomL
	fAGOvVTg84jVNDYED2LUKnsVbneJ3gerHOkwaYQCFGwoL/r8pHxUylQdXA3hkpirKWYm/v1tqfwn4
	9476CF/qAQ31tNw8YGE1kYTDqyMBVp7YkzY+br7zwalvmF8FxHsAPlwSabrB10SQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wF6wj-00000004kyw-3B8o;
	Tue, 21 Apr 2026 10:59:05 +0200
Message-ID: <2d6e902083d693cdbb15fc62c6bf92db34fc734a.camel@sipsolutions.net>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
From: Johannes Berg <johannes@sipsolutions.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"	
 <u.kleine-koenig@baylibre.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Christian A. Ehrhardt"	
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
Date: Tue, 21 Apr 2026 10:59:04 +0200
In-Reply-To: <aecu1ixyHP2hQvgE@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
	 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
	 <aeaMkfk_1t98e7SU@monoceros>
	 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
	 <aecu1ixyHP2hQvgE@monoceros>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_015915_804936_FB9CE65D 
X-CRM114-Status: GOOD (  16.23  )
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

On Tue, 2026-04-21 at 10:12 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub)
wrote:
> >=20
> > We only received 1-3 of the 6:
> >=20
> > https://patchwork.kernel.org/project/bluetooth/list/?series=3D1082520
> >=20
> > Or is this on purpose, and we should consider the set complete?
>=20
> The remaining patches are for wifi. My expectation was that they go in
> via wifi+netdev once the first patch is in their base. But of course I'm
> open for maintainer coordination to let the series go in in less steps
> than I expected. If that helps I can also create an immutable branch,
> but I have no urge here, so if only the first patch goes in during the
> next merge window, I won't have problems to keep track of the remaining
> bits.

It's probably better for everything all around, including the various
automations that test patch series, if you just flip a coin, send these
to either BT or WiFi, and then resend the others later :)

All assuming we get an ACK from whoever is responsible for patch 1 to
merge it through some other tree :)

johannes

