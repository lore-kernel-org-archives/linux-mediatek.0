Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D41BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0URnn1QFliijls9Vcgz4R6VDEImiGb6rDY+0xIGaayw=; b=cQ8ssBT8zJiJCeHG86RTJhhsr3
	qGpz7rksp6MEN5ue7odb9YJ0NCMkg5wbpoRGnOeHPpT9L66pWtsbhqKQnOhWkyLfBXmRpD3U2H1Q8
	n4qtygUJg3lf4u/p/NBv7b9HcNPhlgy9mwmqotp9IN1QfJSaJ1Qym34NrTzpCKBqK1GrZoY6Q0qQj
	PoFbuMRpPc9kUGdWBQ4KH3ciP7jJshAZ+e9U6cqH7LBFeFp4SM6okEDAUBJWcppywIrqz7qhN8Xgh
	2UsmtVARz89nfBmtTMj1d/E7z7yvM4TuEKrfyhog0jjefOIIygO4bDwMNR50kNkBgqsxakMR3Rax+
	GedgzeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6ZP-006G4D-Vi; Tue, 30 Nov 2021 17:05:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6ZL-006G3A-It
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:05:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CA1C3CE1759;
 Tue, 30 Nov 2021 17:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99524C53FC7;
 Tue, 30 Nov 2021 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638291924;
 bh=hphnhkSHJqskZN4ZuF98O5+cfuFGJ6VcXrVGP19KjW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=raSMytiymPsDF37jsefWpuEssrdKGFTnkc0xVsXg5OUDGyOTJmH108r+um0Y0ZLj2
 9J/4f2tVEDqbeGQw9MCJZDX+EuYKv8Napdelblosb4Plmhw9Yo/YvGA/qtK++xXjTS
 xeOiO/8xtYrDXHcRft8KyDrl37gbrIr2bUPUO1vsCRDqYp6otMcP0aecuFT+tbcvVX
 yf3xGtGLgC1KW9Ze4j2MJcfW/5MhaWWqwjMElX/w60CiVmkkCyoq0ggk92TxA1eIM3
 MLV8VvkyhfRAhrMJuCa2+FLEm1LIMzion8nkwMEkkWerTAzv7I4wh7w57PiETRADPu
 HKJN7VUvrn9Eg==
Date: Tue, 30 Nov 2021 17:05:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, daniel.baluta@gmail.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
Message-ID: <YaZZzSPQDz0vHRQY@sirena.org.uk>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
X-Cookie: Check your local listings.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_090527_848397_971B2DFE 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Type: multipart/mixed; boundary="===============8622926494841209937=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8622926494841209937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W5Gh1d/V7Wj5vuMq"
Content-Disposition: inline


--W5Gh1d/V7Wj5vuMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:

> To Geert's point, there may be an additional need to add a

> depends on SND_SOC_AMD_ACP

> There are also a set of

> SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?

Or put them in an if block (IIRC I thought they were which was why the
dependency wasn't needed but I don't know what I was looking at if I did
check that).

--W5Gh1d/V7Wj5vuMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmWcwACgkQJNaLcl1U
h9D5uQgAgM41glVdyKm2UPfvCs9Az0pVc/MIJufe1A5vkcXTuQx9PDfAr4gjWNHD
nIKNoikwGdj3FKLiM6jVSJuRMe5o/q63tokDrrNGBkwGyXN8jHNnlJL8ZuEDt2Y1
E2BlZaZPiVfO1K96M3xaRzEAivY52k1wp6k5EbtTGRQpW7X+TkGmF3v+ybdknZR8
Z84uqU6c60huQpTPHL9HQ5UOXLqKf5Ew/OJlEWkDRqziihmpgu/PLpNDqQDq/+tE
/bbHLPgrBs6GkGKGppCmGBgq0Bv55QXBPWeG76OFqKUGrkzCFQ5NVRNj0lL9c1hN
x2pXo3PKtOUT7+o1wcpmg5dAZmys8g==
=jZMX
-----END PGP SIGNATURE-----

--W5Gh1d/V7Wj5vuMq--


--===============8622926494841209937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8622926494841209937==--

