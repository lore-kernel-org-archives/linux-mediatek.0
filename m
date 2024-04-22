Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85C1C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 02:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzXmb+POP3i93NnWFRs4NFOVjHrZFZYEeB53ck3J/pw=; b=SZ3v7K5ogy5AfO0zyDdG4bFgK4
	WP8lOJM2qOo8kWVIavdberkCZb40tDNYPB3uw+DUrQTyposRSpXSdYjjXdOGQHh7XT4lHsVXnCVNV
	iLgYBMw50krG5RyxInUHWZGHwe5K3TrnqROsG3MxplCYIZU3BipzHoki4OlFOcGpjzc3JdCDscBiC
	KAneHGk3B5zgrkmSUsw7ULfPAWmDhVgk8U07tsFED7j/MPPkXDswJFJrkbCtKOUSTje1dtiLjDYyw
	Sm4tsC6wWfrrnNi4P1caHlA+mXAaqnda3oaqhcteQKbNw9DOHj0z2AgSM3o2B5BmhQ4ZYusai/b9M
	Zt3/ctNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryj3M-0000000Bios-0wfG;
	Mon, 22 Apr 2024 02:05:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryj3I-0000000Bin0-3z0Z;
	Mon, 22 Apr 2024 02:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 662F5CE0939;
	Mon, 22 Apr 2024 02:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2836AC113CE;
	Mon, 22 Apr 2024 02:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713751501;
	bh=fzXmb+POP3i93NnWFRs4NFOVjHrZFZYEeB53ck3J/pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJkoQaMdDrQ6K3nJ8klWuECeZXN34baayUPTnW8v9n8GNGYA0OWQkcFL4ZWA1Om3F
	 Yurvcu3N5OU3X6n/M+ScORwz/7rij/yHc3ALNI5ziFt+noi0tx3ivYUaBQoefUcARK
	 LljQU29DdFe6SB1qM/Q9pyb5qNTuqJGtvBosSE1tHx1VpAX6hXcHvfbijMyf73L+77
	 KtCykc2L4q7vPD5JsUAIy05lJBVyG4LFtE/+mFvhPz/OWNFiEwz/4uLHxxHmfQ8Le8
	 Wp+ILkzKXNjXCBi2h6lDwOQ+VbMsVFghyD78pyva1Blx5rtxsFJB/tOnUwpuKQ78mS
	 THwMtjbarHbWg==
Date: Mon, 22 Apr 2024 11:04:59 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v4 5/7] regulator: Remove mtk-dvfsrc-regulator.c
Message-ID: <ZiXFy8JgrpWtjxQT@finisterre.sirena.org.uk>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
 <20240418094134.203330-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HUoyRpzKwSxHqOzt"
Content-Disposition: inline
In-Reply-To: <20240418094134.203330-6-angelogioacchino.delregno@collabora.com>
X-Cookie: TANSTAAFL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_190505_211533_E0283A23 
X-CRM114-Status: UNSURE (   8.59  )
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


--HUoyRpzKwSxHqOzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2024 at 11:41:32AM +0200, AngeloGioacchino Del Regno wrote:
> This driver never worked, and never got even compiled, because it was
> missing the DVFSRC driver entirely, including headers it relies on!

Acked-by: Mark Brown <broonie@kernel.org>

--HUoyRpzKwSxHqOzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYlxcoACgkQJNaLcl1U
h9CN2Qf/aWyZJQvCpcJSwuOcFKIIUS/36lM8ghBa2puZ2HIcX4pDT0+I2BCj1axn
g/YdYFwOGG+kJKrYKvjsgG9+QksdByu+boaggr/9XBD/aL31FD1U2X1S2A3Pw0dM
JC22KGcr+WUkOLlY0zSAA6vwN3J4zGTRSc2E/MMFcOyWsfjqk6/H6WkSBd2HsdBa
K/ipgSismupevwK1oYCCE0Tn3qQfIcqWPZl5mWynzSbIEY4XQoIcw5JesWRcr0dy
MlC/01VnwtcOfqwh3YzMExqFA1TtY+ZzwhAL2h3ygGI/Ws/rprknS/cXKtdS8/TT
r3/k1UrYmf4aJfkxcU9Gg3pgbqTAHw==
=R6Nk
-----END PGP SIGNATURE-----

--HUoyRpzKwSxHqOzt--

