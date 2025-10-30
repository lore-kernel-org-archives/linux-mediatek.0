Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F93ECCF9E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtEaYa1iUbHYZuiFjyNStW0JpT1u+frmT5PffaQMrbQ=; b=P2LSedcz5Wl6lGC2v9G4bdgisr
	sfWy/FrzUUwYO6LWocwZSVyiWsVYtSxsLHHHy+blVYa8ALPXh6rh/7cQhncvv1Jd8WqNCTFICRGWx
	hOUtsRRoGdIzf9b0/3GcYjZ0FtDxQgyzJ5v3cen7xnmb4wol2IgXwyvWAoFNpB7HVoSVcjugz3ydN
	96MAzR0vzOdbItF1cyn2UMm6vJw3FtwugLQmNusj4hVgZxXSFmToY4u/IYKC7z6xUdy9yS/Uj4jji
	Ip2fv/nNVO2J48zhMvs1TURg9wg8NRAPkDVH3w7z7NiI5wLgudIQZR+oBghG3mgTN/GSPms1gHoar
	9BmxRF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYSV-00000004gyG-1cfl;
	Thu, 30 Oct 2025 19:37:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYSH-00000004gw4-0aRT;
	Thu, 30 Oct 2025 19:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 107AC602CB;
	Thu, 30 Oct 2025 19:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F201EC4CEF8;
	Thu, 30 Oct 2025 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761853023;
	bh=cpZ1I3+S5/XVwqUT6dgPylr0jeq60xgFoi1myi53Tiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+pDSTItJF6/3r8htJ72319bDfdj0sbb6VzZL2M2S3fwN4Jlf52FgKJrt9+og5zB+
	 uwqx969gR4VBPP5s2oyyqdfaxcxMki/NiaKZuLzYcu/3PJMrodmbZaPKhs92Qn0ft7
	 TkMzFOa0nUS0shQDeb7nTCV52ULHGSCQLOEcPTWZfapvhk6flxqXeDbw3oh3camP+q
	 zVT5ZmqKaWJcvWR6UkQ82ZyIlBFjS8JKhcLMDMymVpC9DeW8WxbEG/I51oMxmGrGdn
	 reXRFb8eJUtYX3RpVmYOiyCwp7n7Hj9PdPEfxcQDx7eN+n98+7JxoFc9G02pDx1wJ7
	 94GJ+82cn8YyA==
Date: Thu, 30 Oct 2025 19:36:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 04/11] dt-bindings: pwm: Support MediaTek MT8189 evb
 board disp-pwm
Message-ID: <20251030-astrology-handcraft-f5dbd0d7447d@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-5-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MS9yLIDP8XDYgds"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-5-jh.hsu@mediatek.com>
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


--1MS9yLIDP8XDYgds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:36PM +0800, Jack Hsu wrote:
> add compatible string for mt8189 evb board dts node of disp-pwm
>=20

This commit message isn't accurate, and that makes me wonder if the
others are. This has nothing to do with the "evb board", this compatible
is for the mt8189, on whatever board it happens to be on. Please drop
all mention of the evb board from commit messages.
With it gone,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 68ef30414325..22712769518b 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt6893-disp-pwm
>                - mediatek,mt8186-disp-pwm
>                - mediatek,mt8188-disp-pwm
> +              - mediatek,mt8189-disp-pwm
>                - mediatek,mt8192-disp-pwm
>                - mediatek,mt8195-disp-pwm
>                - mediatek,mt8365-disp-pwm
> --=20
> 2.45.2
>=20

--1MS9yLIDP8XDYgds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO+VwAKCRB4tDGHoIJi
0iaeAP0d36mjcuHToJU3ymuF4OSb07S7VjuxPoFWiBn9oj3bUAD+Pu38NPa1oQI+
XbASB7XJkhq3c/nA1t7oZLhX6+1YtAY=
=Hxxe
-----END PGP SIGNATURE-----

--1MS9yLIDP8XDYgds--

