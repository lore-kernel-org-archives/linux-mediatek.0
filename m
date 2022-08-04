Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EA7C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCyPA/Z9WRgF3etRntFPxGw0L90aQdi82vXOxAegpZU=; b=Aqyt3ubsiAoWsOOrsU6cectv/w
	A8OXX4fxborKoMy4hLAVWMqBJtRnap29qeMoj3U8I7Nalt3Za+e1Exwo1U+34EtQBYbF9eCyMZYYl
	4OSYdKmYTcCJcGSeTQBiTYuUvQxfMa1lcXCN5gpjrP8tWJ8igZYFb2cvtHnzDakhtLp3DHaofH786
	D4PR0fcEWgJx9x8v/VWUwEzegiH6pjoFQdsON+i1pF2ZKKj+AoERo+ntF4rbDd8pKmamLHm2IArmA
	/jC1W4K5vZ2O3lGHAf9MF436uI/u9OboFwoHwlPqWgrabWTOSdW2wEUbOg5/8GiRN6VVmDX1cJTiT
	nhHPvjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJaAh-0060Y0-Ka; Thu, 04 Aug 2022 12:41:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJaAW-0060Sh-UB; Thu, 04 Aug 2022 12:41:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72CE9B82529;
	Thu,  4 Aug 2022 12:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F5EC433D7;
	Thu,  4 Aug 2022 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659616897;
	bh=Dc8h4lXPsmDxSsos/j+7yqEliVIW1p/oerQvtS7WdCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRsuPn65ESqnBp32JRUoDmuH6zGlK8xou9hyDdZflWicz2iUIEMP6HkB5NkWtbe/+
	 JWlXBjY7yczQBjyWx6Pft9+ePBzGnA+A68/lMKhv3d5ckL5zq3Yh2S1iS7c7XtH5PL
	 rHlc2GZbYX1lsjUNfLqdWFwhHAHZmAJkoZRLev7SKVHlGlfxdesblmNHkxpNURNwMa
	 ONnKlZzDU1JOAH8AJms/hZqoi4OvJ8RwxTSgm02gxSyPUGR/MuxFjWVpPvn3N7gEOG
	 4kt1RSAYu8ta0fpCR2JXy8G03nMZuzVnuv1LNZRleQv761DhK9hFagSMIBb7kHvxgp
	 KOeh8yDsATBRg==
Date: Thu, 4 Aug 2022 13:41:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
	daniel.baluta@nxp.com, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	project_global_chrome_upstream_group@mediatek.com
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
Message-ID: <Yuu+elYxBv3xZ1O2@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EPdOmWtiZ4ZH+2f9"
Content-Disposition: inline
In-Reply-To: <20220804091359.31449-3-chunxu.li@mediatek.com>
X-Cookie: Did I say 2?  I lied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_054141_164717_C6111B0A 
X-CRM114-Status: GOOD (  11.74  )
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


--EPdOmWtiZ4ZH+2f9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:

> +static struct snd_sof_of_mach sof_mt8186_machs[] = {
> +	{
> +		.board = "mediatek,mt8186",
> +		.sof_tplg_filename = "sof-mt8186.tplg",

The mediatek,mt8186 compatible looks like a SoC compatible not a board
compatible...

--EPdOmWtiZ4ZH+2f9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLrvnoACgkQJNaLcl1U
h9CJ+wf+NC3QV3rzYT893qKD9jkvsm37SLmwNK0cEbtOpP0ohpK2gakhRwXQzh+B
/wS1eGl0aXdtaxOkKueZwXQONVV7MsnuxuGXwyHFrcPwfuVICQPm1vQWwSLmBcS/
iUmtW8SSN++aMZwgYEUAJiFmbMDl5eH/gHTdn9y5dFi+9yQkE2Rw9uieV8eNfrZD
GBhv0YHtv687Q8VOL3FXafwlw5qruOIUYZ6ixEYoalp/rajx1CNxta++q+nse1KV
mDHHEdY4xb84FDeKV/VA8UTHICqp6NYIQgLoRyWkk7n1wPEvSebxTpGJJGoBVabe
RhAhhFa0pZfWYE5UBgEJ9BOpBQCsCw==
=zf1M
-----END PGP SIGNATURE-----

--EPdOmWtiZ4ZH+2f9--

