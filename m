Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C2CC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx9kINsbUZxfUnYArWQOWl7VUFzR5Zg4oUMkrilgvkU=; b=tas4Wf30iYkkc5fxfM3yRBHhbe
	6KVv2JP+Fyhrch1Wzh8iZyiErMRpVBTMXYa8GOdckSGmQnTwS9GEK3tOfH+E/QrXtpoSbzV53ybkr
	q7yCLyjCw2lKSYYDOZbUN7H/wts64t+0C2/fsyHQfUvGkr1vhYajAci5PCA6IORJSSoXW+jVmUsak
	yh7kcR7c4ViusReKTzvNVGyf9D4RUSArZYRD0dekboSJpTazJmYqurNdaZGgukRVnV0/R0k9qOn9S
	vCiZAK5BbwqTsO6R1Hcmrb9b3mtrHWG5lAvKU2x5YWsej+xMskppenHkosaohSZH0zwMGioIbs4TC
	qVinTLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3I0-00000002CHw-1qv4;
	Fri, 14 Jun 2024 09:32:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Hv-00000002CGk-2NQ1;
	Fri, 14 Jun 2024 09:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BC9061EE5;
	Fri, 14 Jun 2024 09:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75168C2BD10;
	Fri, 14 Jun 2024 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357522;
	bh=vq/hKXj8k3TXQ6CBXyolStxtljiu0fDBYD/cq4bFmRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dowkx4Wli/K0fxQuXPa9Ov4p8jq4KCLXebXQhTLM5C+aiOubAYAqt6VKGvEfTd+is
	 u1H5cT2n6PNIyOSwsRfQdqH8u3Ft3fyV9zHmquoyyb8BUFk+PERVN+tIV4ajqw8vsW
	 7RY/uftugQcGLKrN6adOWRZRq7HYsGiNvsG/NHATdB9mbrBWreXhWtLEtiVV/8DM6O
	 /vkRXKIZ9h/aVv+Tf83y0fRDuc/X49dFn9IxjzSMYU720OV2uuxRpCpBG/1DNhh+th
	 z0C+Kh+7fItagFuiZgbzOIl7R01Bac1D8IAu15pqxJKVOASbc5i9MjozYRBusaqX82
	 AGLEieEUdavxA==
Date: Fri, 14 Jun 2024 10:31:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeMD/ZPP93d62FnM"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_023203_694737_75580A25 
X-CRM114-Status: GOOD (  11.52  )
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


--SeMD/ZPP93d62FnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx

I seem to remember you had review comments that needed addressing from
AngeloGioacchino, why resend without addressing those?

--SeMD/ZPP93d62FnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsDg4ACgkQJNaLcl1U
h9AoDwf9Gw5El3fz0zRFzNFxxe/7UfRa8HACWErrPscsXGk4tslBOE3UwCx3bw4Q
6VnbJ45siXspBD7/Zjhjhi9lvAZlz6ucKm2glWijqZHLg9xmSBrRyEDb2G98FWlI
SMczNAxg5QXwBUnID0bua6y5ZOldZEAGl53t5KuXWRe0/Znwns2+gUpSt3MAoDp8
rPfYqUv2whvlBzGYmg6XlbTskN/c/+qpODFdThrx57aGRjxRoVc82kAmN814Gbc/
nqKrNhIYzQDYBwKB1cuDXatDavgYFA5FugzeuZ80Va5/ZiuMX7JLgMHeVGQJZrQq
Jbv+xbpMJ+ow5S6rLO0D2CcOA91DsA==
=TqJQ
-----END PGP SIGNATURE-----

--SeMD/ZPP93d62FnM--

