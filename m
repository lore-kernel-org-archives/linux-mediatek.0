Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7CCD342C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0Me2Dz9gz4W0QEKvHP7gmEyiPwUNnBm3/obBtPnSDY=; b=d48VJBgQYL/quiZ/0D1/t0GEQ5
	M9h/4P617mQyHYV9jmy9Z1JFdXssAPDF9NbAUEgrCPO9spDCWqgAlgF1S8IsOMiDsSv0FiSr/EdXa
	/Lz8ujywwWP4JDmCK4hJN3EQnXo13nyUJv8mTsexWy5oMpBioMri5tMneZdgo/yLb9i3kXxZzjT8m
	mi1ne81AjCTtYwRNwTvL9WgJqpVG1GWUYjD1Q1amGxud94J+znIut9DgL9AhQ6pmGKly/oXR9gItK
	38XKDFCHX/LnMrXDsXD2aqiglqhQBchzoTwKxshbGC49C1CQt+KB+VXvb2C+Ch1BWs8Fh0VLDc2Xi
	3TVkRT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZB8-00000000RpL-1ey7;
	Wed, 06 May 2026 10:08:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZB6-00000000RoZ-4554;
	Wed, 06 May 2026 10:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA27540728;
	Wed,  6 May 2026 10:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B330C2BCB8;
	Wed,  6 May 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778062107;
	bh=nZfzghg9raBxGwuKMfOIWHSA+G1JIUmQ1fcBxRlBfWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFkGu383UAaW75R93fVSjEMMqQxImk1WhOeGq3XmlMxt3RERxCCOKdijAT1RgWjwe
	 NFjFSQngx3fbEzsXhnmCnXPtSylbKo9eCMB+/LRQuBa0CcExkEyZWs0RgjPaXMuwhl
	 eJ59DOUK79ncDdnxtDrKxY6BhzuUfjrhrspnaSoR/WmLGuGYOIBOZEwcsEbn+2fKQq
	 xC+abC70rOGVB21uZSMyBO7wohlbnIoDcgGfIUdfxOX0zV+m58rS2m8QXHy61U92i+
	 wPkQx+daa9KbhlV/w/3PvD+t9QVJi4QwlKwjXeZ+uD8foC+z9XaE5Tp+z5L7dEB0MX
	 a3qn6yw6o+Yjw==
Date: Wed, 6 May 2026 12:08:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506-energetic-azure-pig-2b6ec4@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bm3tokjqjresnbu6"
Content-Disposition: inline
In-Reply-To: <20260505140516.1372388-5-ketil.johnsen@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_030829_054245_BF1C1FED 
X-CRM114-Status: GOOD (  23.27  )
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


--bm3tokjqjresnbu6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

Hi,

On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> From: Florent Tomasin <florent.tomasin@arm.com>
>=20
> This patch allows Panthor to allocate buffer objects from a
> protected heap. The Panthor driver should be seen as a consumer
> of the heap and not an exporter.
>=20
> Protected memory buffers needed by the Panthor driver:
> - On CSF FW load, the Panthor driver must allocate a protected
>   buffer object to hold data to use by the FW when in protected
>   mode. This protected buffer object is owned by the device
>   and does not belong to a process.
> - On CSG creation, the Panthor driver must allocate a protected
>   suspend buffer object for the FW to store data when suspending
>   the CSG while in protected mode. The kernel owns this allocation
>   and does not allow user space mapping. The format of the data
>   in this buffer is only known by the FW and does not need to be
>   shared with other entities.
>=20
> The driver will retrieve the protected heap using the name of the
> heap provided to the driver as module parameter.

I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
better in the device tree and lookup through the device node? heaps are
going to have a node anyway, right?

This would allow you to have a default that works and not mess to much
with the kernel parameters that aren't always easy to change for
end-users.

Maxime

--bm3tokjqjresnbu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafsTGAAKCRAnX84Zoj2+
dscNAYCT5tPA6wlA50913tROdb0/8GBVIaNWCZzIVCmmtw6XdanUV+Ek43qdrnbM
nAndNMcBgJJ8V9DZNE2zzCU0FXXXjTfOFOjGy0zdjmyQH3dGoy80XCbxq4XUI4fe
u8+zbKdHWA==
=zppB
-----END PGP SIGNATURE-----

--bm3tokjqjresnbu6--

