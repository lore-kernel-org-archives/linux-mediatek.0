Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B9CDE020
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6a3bqDo+U4pxk0SWof+/bNRjfqha9gLkB8Zcqr/+ZfY=; b=F/Cks1IaieLoPtxdi4J0zMICgv
	T6b/2LPSM+w2eP43HPaB2SigRdrBfI7HFmsqAy4ANws6+Uxf1Ytlt7CwfiYLWsY2B6GvN9pPRbf2F
	wdtGeMDK2VnwFQqrahxR4CxCE35SejgZGB3rJxWzjnPjEGI16/Ko7cYsTwep92ovJMk4DCXzwrjQT
	c9VkccVgxqs4Sq3ETXZj08o2zNHWUbxWGvnAWV8HkE3EP/+T3sCrBEmZWJJLFOmsa2QzKYMzsP6P0
	OmO1vwHcE9Mqa1w8Zwma5s8za/UrZvzju0V7gCVmrCew7zL2eKwTDGLm7ZB7RsiwkiZEvVLvpAVYI
	JG5DzSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1str1e-00000008qDv-04Km;
	Thu, 26 Sep 2024 16:07:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqzL-00000008poq-1dXD;
	Thu, 26 Sep 2024 16:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 356405C5EC7;
	Thu, 26 Sep 2024 16:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F23C4CECE;
	Thu, 26 Sep 2024 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727366705;
	bh=8oF862eULQ8YFoJtKU6F4+GDmwMiUNpW0n24amXJv4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7HvlSFAY1HpayQkyF0ijnpGCTEfRC6oQ8lepirwQIRabQuVyr4k7Zzcja9HKmqns
	 qEXlzEiGWQNyb51qNuW1buk6zlOnjz6AjfNry3FfJXnvsucsFAX/ef5PPnhepd0yTF
	 AkQa0VVTifqwh1JO7LbhkCMLBmV+zkDrKfABvzFZYYmbWmI2TZ76y0DzHzZZBCb6NH
	 gCrn/Dnjwp8evthCeCve3uNResHbQiJ1nsE7zcBoRsyruP478/CvfdqeM0NDg7o+v6
	 uW9mjXvFiPkh3cpANJ2YUsIu+sqww1y4UJATUIBGnX6jR+F4+CHmY4850FpHo2/tFz
	 QeSU6xNxdFMOQ==
Date: Thu, 26 Sep 2024 17:04:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Eason Yen <eason.yen@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Shane Chien <shane.chien@mediatek.com>,
	Hui Liu <hui.liu@mediatek.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add compatible
 for mt6359-codec
Message-ID: <20240926-smokeless-clobber-0fb8a1cdc7ab@spud>
References: <20240926092519.6556-1-macpaul.lin@mediatek.com>
 <20240926092519.6556-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gtFGL1RUPZo9Sk8n"
Content-Disposition: inline
In-Reply-To: <20240926092519.6556-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_090507_676144_8F7E47C3 
X-CRM114-Status: GOOD (  18.32  )
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


--gtFGL1RUPZo9Sk8n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 05:25:18PM +0800, Macpaul Lin wrote:
> This patch updates the audio-codec properties includes:
>  - compatible:
>   - Re-order the supported device items.
>   - Add 'mt6359-codec' to compatible since MT6359 PMIC has been included
>     in this DT Schema.

>   - Set 'additionalProperties: true' for 'mt6359-codec'.

Why?

>=20
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 40cabaf60d0d..ffb5848a96d5 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -104,7 +104,7 @@ properties:
> =20
>    audio-codec:
>      type: object
> -    additionalProperties: false
> +    additionalProperties: true
>      description:
>        Audio codec support with MT6397 and MT6358.
> =20
> @@ -112,8 +112,9 @@ properties:
>        compatible:
>          oneOf:
>            - enum:
> -              - mediatek,mt6397-codec
>                - mediatek,mt6358-sound
> +              - mediatek,mt6359-codec
> +              - mediatek,mt6397-codec
>            - items:
>                - enum:
>                    - mediatek,mt6366-sound
> --=20
> 2.45.2
>=20

--gtFGL1RUPZo9Sk8n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWGKgAKCRB4tDGHoIJi
0nLMAPwNICZFxiXu4ZhvDLmOlTakmKiEVOTVZu/0hCQuyldZZQD+LrT5WwoJnbMH
g+uamV5Vyo9o/jF8L1GRHbGmPCz4kg4=
=sQf+
-----END PGP SIGNATURE-----

--gtFGL1RUPZo9Sk8n--

