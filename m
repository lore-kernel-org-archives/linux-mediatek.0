Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CE1CEB2C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nr5hbOYIkwoOlayguWjvC9MQ2szrKavTbvZIwtsLT4E=; b=v15vpoz5lItsS13M+hEmUTWvcd
	rGiYyO94gJaMpZwMnK3JUgnhmcnxiSJARDaZTpIJgg23QGODnrKe5EprJuEv7QAssKSANFKB4VlV+
	4HA8Hgkl09cGywCPM+5b2d8PH5C3feGyhwIW3dpKo2hKK4G9EDehOYRql90KFCjmOm5sbkZFkVNBH
	uDwdMH+6T/0fUFmWuM7DktnIcSFs553dHXJqRlEF03l28NLUMINa+7xmAkRz3ryf0ojSOJv3s4ZU9
	0nLnusK/hkJcSLWRb12kHwy9SHjQ7kIVuA4VPuGJPejlv7LQ/GE+R9IbZCUn4A3JKodtF2vH3+ae3
	PtAicEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNnR-00000000sPT-25iV;
	Mon, 30 Sep 2024 21:19:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNmC-00000000sIw-41Q9;
	Mon, 30 Sep 2024 21:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0B84A41667;
	Mon, 30 Sep 2024 21:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D75C4CEC7;
	Mon, 30 Sep 2024 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731071;
	bh=WrSj9ZX1B9V/JIXDijhV3zCe+pdwc5wf2BlVfULS1Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JC/rlRHfg1dx2NVHc3sB43rF+KNlK58NjQoGSF8Meg87Sty/HLR2CC/UPffukU47F
	 fuMmtxsO0deqroK2QQNfxus1waaXd7FK+b/U/j8N85R2oDksfSabmB5GDty2vmyY5C
	 TvAtpfV3Cv7vJdgvJDtOn1fFGfH86GI8+ZE9v2YjVxpJegQD6unJGh5TYmZD+vmhnb
	 rNWtdqTM6oITJUqjSZGe6q4wCluFz8HZXsFQJt+Bql/n5nnQj9zBvFZKct5Q/CnBsv
	 zaupxRDPFDQ6T9vwG70PCTrxOELjIDtEUxEScK/p6DLNf8QAifgYSnOBvpDFY37SVx
	 dyo9g9lSdg7Tg==
Date: Mon, 30 Sep 2024 22:17:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v9 0/3] Add of_regulator_get_optional() and Fix MTK Power
 Domain Driver
Message-ID: <ZvsVfQ1fuSVZpF6A@finisterre.sirena.org.uk>
References: <20240930044525.2043884-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fps6D/pTHz3w7/40"
Content-Disposition: inline
In-Reply-To: <20240930044525.2043884-1-wenst@chromium.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_141753_148544_0F853366 
X-CRM114-Status: GOOD (  14.01  )
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


--Fps6D/pTHz3w7/40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2024 at 12:45:20PM +0800, Chen-Yu Tsai wrote:

> Patch 1 adds a new of_regulator_get_optional() function to look up
> regulator supplies using device tree nodes.

> Patch 2 adds a devres version of the aforementioned function at
> Sebastian's request for the two power domain drivers.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-of-get-optional

for you to fetch changes up to 36ec3f437227470568e5f460997f367f5446a34d:

  regulator: Add devres version of of_regulator_get_optional() (2024-09-30 01:11:41 +0200)

----------------------------------------------------------------
regulator: Add of_regulator_get_optional() APIs

Add of_regulator_get_optional() APIs, which can be used by generic code
to improve integration of regulator management helpers for their users.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      regulator: Add of_regulator_get_optional() for pure DT regulator lookup
      regulator: Add devres version of of_regulator_get_optional()

 drivers/regulator/core.c           |  4 +--
 drivers/regulator/devres.c         | 39 +++++++++++++++++++++++++++++
 drivers/regulator/internal.h       | 18 +++++++++-----
 drivers/regulator/of_regulator.c   | 51 +++++++++++++++++++++++++++++++++-----
 include/linux/regulator/consumer.h | 37 +++++++++++++++++++++++++++
 5 files changed, 135 insertions(+), 14 deletions(-)

--Fps6D/pTHz3w7/40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb7FXwACgkQJNaLcl1U
h9DV0gf+PbBLTWiI3UueE2aB67kwX91wx/qmPQxjrWVV++hT8uZ9AnmUou6nd9xd
yRV87qVjzGK+5Qgrwku1B3I1lqkRwD//fkO9vs7bm32+JhQkhVc+nFe9DknkdZCy
vNHtjaiLQBA6d0ylVnVhGVZxi3OTfAgv++OABCc+o9GfIerkYE7zvg0xmi4ixcxz
DSdLDcpMcoW6L757WEZbuCEX4JPShLiO/MSo0z3ccGE2O73Lp/PqsyQaZhDmKDPA
dd8DsTJ+ciIUYoiYAcFi+YJ3MqAbLAPTf674zHXsWpF3wdvWieif/dXRic+K3cFG
sx/kycHc3xptypkZwFtZDCVgt/IJTQ==
=4qpn
-----END PGP SIGNATURE-----

--Fps6D/pTHz3w7/40--

