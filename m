Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 13:21:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F4F64DC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 13:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F4F64DC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xAZ1j9lGvzWh2b8nqoxcIxvTTyAXQJ6mgxWHFQXIqY8=; b=27lhtay5T+AIA9G6IiJO0Rs4g
	UxuOMZUEWtCi15OpFsWTnl+gBUOjpwl4d8pvwYx63NkhRmcrlaRhy421Af1ACYB/GWlHEHhMgrh4x
	1gq/LxT1/Ojw6anPABwe8iXmXbzbJVnZ8vnGjBlSOjjI/8OUWI/9fjGaE2Up0VH66i5b/DZDaTRuP
	pwSsyJ06lcn+M+RO7aXp3ltyfA0eMtmfzTBDvUUdfWX7hDGu4aHgGzGAAK5354zTdGKPQSg68nhtd
	C63pfpXeZvs7hQndfA7Oia4JhkUufSpcdIU8/WqKRdXaD3f5aByj+/VZMBeJNh4SZkwOQ5s8JzKxU
	zGZ8eSVAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7I6N-0001CP-G6; Wed, 03 Feb 2021 13:21:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7I6I-0001BS-Rf; Wed, 03 Feb 2021 13:21:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 362F864E38;
 Wed,  3 Feb 2021 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612358499;
 bh=Da4M1bnf1Wqx12eiTUgDdPCdruKdDYCPyv3ytTn0Apk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtcpod9ME1FXG3N24V04PY+nY2vROgeKptqjMgrKti7aX957Ip/v3YdTpvJ00yNjq
 nBOLzSyyCh2P1ugeIJgKeXGK8iydKO6UEiic5I3j1xi3mAxqe2cnGZtBCyXI/dFcp6
 jrfveRwAYmW6TLrEdhnXMk2HNOZkveYa+9TWUrOPs/cv2PEncnBW5NvuBOSCRg0csq
 8AQfaQ0q0bL/+t4p2DM6y9dZgxvzXIf/ahDi1Sh5JjWMHQh3JMjvlxXfnFlGUILQ5+
 lAWbazIcoLd0mCEMhXtrkIPIhgncPxyiRGLQswOj6N3vju/SgRqvJ1GRV2Fe5TVXJT
 PHeM32wXPna2w==
Date: Wed, 3 Feb 2021 13:20:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Argus Lin <argus.lin@mediatek.com>
Subject: Re: [PATCH 0/2] Add mediatek MT6359 accdet driver
Message-ID: <20210203132051.GC4880@sirena.org.uk>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
 <1612335462.9202.1.camel@mtkswgap22>
MIME-Version: 1.0
In-Reply-To: <1612335462.9202.1.camel@mtkswgap22>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_082143_054832_6FF664E3 
X-CRM114-Status: GOOD (  13.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiPeng Chang =?utf-8?B?KOW8teeQpuaciyk=?= <chipeng.chang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>,
 Jaroslav Kysela <perex@perex.cz>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jack Yu <jack.yu@realtek.com>,
 Shane Chien =?utf-8?B?KOewoeS9kei7kik=?= <Shane.Chien@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============5420142047663942251=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5420142047663942251==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 02:57:42PM +0800, Argus Lin wrote:
> Dear maintainers:
> Can you reply to me if any opinion?
> thanks

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

IIRC I did review this...

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAaozIACgkQJNaLcl1U
h9CrKQf/acfnUSuQONwN1RT/hy5GX9WSF9RkgE8dip0te22amV9V/s7zWzNqGtcA
4CaPqT8pSNN975HVcr388zMgdi/wa7g3n6nnGYWcIlFwVncCuxcGiUqxMzqqKk8p
xAPDqZibzPj5RWoFkNdJo9QLiKi04GGNPliTcHRYxrvFtr5m8MZRLQI7yRIUjOT9
pxe+CscoJ8p3Gadbi4ZH95aRDIqy//hStJKHn2YRW5vXlCNJkbXKRE78iWJo4//4
Ll2vLjZeS3fBxflFSkk8Tqcl6LhN5zp1Le/6qE1oHVWmRiKTqPc1irYFKs1iBZI/
1ioNJnhOryevfmraD/TUdCB+xN3z3Q==
=Hlk7
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--


--===============5420142047663942251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5420142047663942251==--

