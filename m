Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950DCD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISNCe7A+FUFRQrYWDzQXFgYmnv5S2HKSoaxxW+Wl/8c=; b=PrQJBew941/yGIJSmUawsNHn6s
	i++4yrYQGtW2b54oXnQUGqxHBpywY1EjQlPuzuoZo+GtmufUZnXMqHovXFQXcTnHwzHNRlDn6ZyWZ
	mbxkJbFuMlN2mHBAATMolaRujy7SDIg0LZTMwoG28yUrfDMVXu7zv22UjX2UZSzUhuOP4Qkt2dcYF
	r9zgE98mm9/4ZyewRfnYX7nII7mpphayvD+/mWKGjuqdpDjbl6ChgL5EWkE7lk0uwRbabjdGY7KGh
	1fc2d0Qnz+mJ/yfA4AkmQz+KFq0mKy26Aq2Z7jRNIODeDu80/CLPLpeUQWrULgDRdlBw2uvqtvEb6
	0bvC5ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd3Z-0000000B0d0-0Wp0;
	Thu, 13 Nov 2025 19:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd3W-0000000B0bF-3MMS;
	Thu, 13 Nov 2025 19:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3A6F4371B;
	Thu, 13 Nov 2025 19:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D74C4CEF8;
	Thu, 13 Nov 2025 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062349;
	bh=ISNCe7A+FUFRQrYWDzQXFgYmnv5S2HKSoaxxW+Wl/8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBqgS/2Cjg6RLcB6X5aXeHLFuegJpxBvVmJ/mjs14PxXHikeSW3lbQR3khWvF3EQW
	 VNj9Xko9BqYUFse0+0HRKuSOOHL22Lr1mnDTohMn81e3sxMTpVdjBPN9S4Hhzkho4t
	 v9OJdMDPG9xi3RDBRvnEUvo4HGRDJUZT/DtpqRjQhIIYBf9srVbb0eKe/h8rguziy1
	 MBS27oTkCkKnL9hqU9O423zMRALevTaePYJL5DUH8DOZK89w+qZRUVeUAwW4LLQOvA
	 2Zg+Hgc918nK+VGdnab0YPU91XUiuVDPIqYETy+FfN/EZuqRj+hFXzmWnk7kU2KYXx
	 3SPHa01N7dBcw==
Date: Thu, 13 Nov 2025 19:32:24 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, sean.wang@mediatek.com, vkoul@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/8] dt-bindings: dma: mediatek,uart-dma: Allow MT6795
 single compatible
Message-ID: <20251113-reusable-possum-068bf281efec@spud>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
 <20251113122229.23998-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxOFVMazaNEs56YG"
Content-Disposition: inline
In-Reply-To: <20251113122229.23998-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113230_852974_66C57EDA 
X-CRM114-Status: UNSURE (   5.33  )
X-CRM114-Notice: Please train this message.
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


--ZxOFVMazaNEs56YG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZxOFVMazaNEs56YG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYySAAKCRB4tDGHoIJi
0vA5AQDPZ8SkT+MGHGW10MCGgDFHOn76yQ+Xv1rPa5kB1xYp4AEA3wBhxsfGCMXK
2VK9p+6Z/lt2r+6wvn7kMd8dIzOr8wE=
=Khkl
-----END PGP SIGNATURE-----

--ZxOFVMazaNEs56YG--

