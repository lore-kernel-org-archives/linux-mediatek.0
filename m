Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506FDC3064D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdKXQzF6n5GNQnVJhivYyEb9noS/SiRU88xQ2RfPAr0=; b=Q6xoDyulKWPbY1MUZhWS0CdFWz
	qQGXGL7xvZwLTP3YpMGKjMOgMb5zkIFransfy24fAswkxavdSjgE/4ULg/8WMIX4IhUJ4Y6Ap0Akl
	bgJwKX1hW400+Y9mlfk3lBS9NonGV71UZdLQ9EI7B2EwK4/XfCKIk9d5Rc08k5uL6+v18OkZg18tS
	T+D7XKAyfb4oum37THZuake3SMulL6tuJN+wQ88Ke1q+lpjBsNFt4wLJYpzFzaT49fCQK2MWmssNy
	SUMbKRNl452QZCBv1lpCWncFwrD80GidvsjCLpgNzZa4Vet90iP7M7MigkqMkhTvLQw2FQ6x8QdCM
	VM6rcNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7a8-00000003HYr-48Yo;
	Tue, 25 Jun 2024 14:55:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Zu-00000003HQy-0m5J;
	Tue, 25 Jun 2024 14:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D575CE0174;
	Tue, 25 Jun 2024 14:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293CBC32786;
	Tue, 25 Jun 2024 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327323;
	bh=66tqkQVIjQ3KifxJzurd/IM9a92dtSlu7LD3ir/MsYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5Rf+4Xw8E6hHZ+Orx/3Jw0L6hsHClLa8LH5YCUFGwvRYqzR3vrI23ejTfOMTvnBw
	 DK0c40J/Aa98/W+ijABbMyIXE/q3nvCldvthZ6kG2O0+bbxNahvOUGwlWe1qTjTIb9
	 A6o6UW+fzfLf14WrYR6KmY1Je1wLej+bW/hws8/4Ayg9OL0QtVpQ4fLLGJAiWlnMy3
	 5BL2VHQKSrVx3A6qIwEjE8zJbLBHkNunqRwilT6a56uB85YXDpIjKygs+Lx7hCOcZ1
	 l3V/3MAq7BrDemnZfX+5gOvrFMU+dOTxZKFHX12641cjBDNFH/Eu6e1M9FzQfBAcoz
	 dqmOE6ljF9EJw==
Date: Tue, 25 Jun 2024 15:55:17 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
	gustavoars@kernel.org, henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com, djakov@kernel.org
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
Message-ID: <8b34897a-416a-4ff4-82a8-c37849d706ec@sirena.org.uk>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
 <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
 <39ed7b8c-b19a-40de-9b30-a731ac83ad20@collabora.com>
 <2e8a9cf2-2bc0-45d8-b6c1-e3a9441d5641@sirena.org.uk>
 <f855f6ec-f0f7-467a-9823-d19706574408@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybfvhfwy3rgiDyzm"
Content-Disposition: inline
In-Reply-To: <f855f6ec-f0f7-467a-9823-d19706574408@collabora.com>
X-Cookie: Results vary by individual.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075526_561244_C3B4F5D8 
X-CRM114-Status: GOOD (  11.22  )
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


--ybfvhfwy3rgiDyzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 04:51:56PM +0200, AngeloGioacchino Del Regno wrote:

> The interdependency is for soc/mediatek commits, which depend on:
>  - Interconnect commits (which Georgi picked already); and
>  - Regulator commits

So the regulator stuff works without the interconnect and vice versa, no
build deps or anything?

> And... you reviewed the patch in the previous merge window :-)

I simply don't provide tags for things I expect to go via my tree.

--ybfvhfwy3rgiDyzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ62lQACgkQJNaLcl1U
h9AudAf/W50XJ088Y6eXx3Vma3D22WxaI/Uw4qotmwWBWYHpqgxdEOOCvgf2FFjK
yF1i60d2zIF+vBTMm3jXo0NMBUxW+8M+60MOsDvZS0POPxkdko2+MOt8NfJlPpnO
16wz8lIR+oc1YFphmh4o3bgjsxXwbzyjVskjs0bBOWGRNllftiKZMUgQdg/aCbQu
grhS1n1AEKA7Q13ahMWrwh39gkRn51t3KPmAdwhy9j70XCHgSaNALEj7vOYIVnPR
QTPQn8bldlUAjUEmXdcL5Hgz1T1aRCOQAM019+IqWGTv8NPTi94IrWojfBZ02swb
4thLhUOHqd8mP01SIQjYM20dQOaW3w==
=lhMt
-----END PGP SIGNATURE-----

--ybfvhfwy3rgiDyzm--

