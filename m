Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA633C7882E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dveo4hxEkYa0QfM+j/lxJ05ymd8w4pLl6DdgOtEoiLE=; b=eArIL/jnyLd0kWMb/S2p4a6MQ4
	Y163PKDqw5Wkr4cHl2/9gNa+leSB4lMG8yVvLaSHCMHc40sz8Fb1yhsa6iCM1p/hrYmVgCSunNS9d
	XWZtrrl3ZGCBi/uE/KesuuohbbnlRu8TSjnIbueMDWOY8ma2scHWIr58iFKgwlrzEW9Jgp2JEBAIG
	ArNJd4T0wDm5kasBWjrngl6sHDFRDZy04MoaaevWzMTLQEBJ7FxyTYo++rsZyP+TtMIovGTi6S7nX
	E0MtFK42lHilbPTnrpzMK0x1va1O++Pd7zz1h1H9nxqVfO/sD3yJ6RnyDimjfj/eNaJZcQM6KtkSz
	Q3dYUkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srcSe-0000000C9VC-1zKY;
	Fri, 20 Sep 2024 12:10:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srcRW-0000000C9Mj-3IAe;
	Fri, 20 Sep 2024 12:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B9AC5C56AD;
	Fri, 20 Sep 2024 12:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78E8C4CEC3;
	Fri, 20 Sep 2024 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726834137;
	bh=Dveo4hxEkYa0QfM+j/lxJ05ymd8w4pLl6DdgOtEoiLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jF53a+nNNaE4e1rFkQxXGSP2HCmw0KAgztnLogKOJM241gdQCkwZzetbpk40xcHfU
	 i8kGbn3aIMAsyVE6uWJdj5s+Vwif+vST8JbsqSjvqeQZjj2f0l7HaO+3wimcQgF6nq
	 4UEKLXtMvGcWT9IJaOO3Lj5b4Nupjk+c81awNXvESu4O/VWKXzS3jj/0q24+WAImgE
	 wc1nhLAqRS4JAnOtYuEcZOP0KdNNiHWm4Fh9iPFEd5L6HCjA1FaKrY5U+BDZ/9Ogeb
	 ep943ptCeoVmm7ri/L43JI2LaRpnV2BhHhmLUCz+7sUtapO/l1KZWjL/eAASKjH11W
	 6qm95xrR9H77w==
Date: Fri, 20 Sep 2024 14:08:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 1/2] regulator: dt-bindings: mt6323: Convert to DT
 schema
Message-ID: <Zu1l1Tx7OeJ_Sw9z@finisterre.sirena.org.uk>
References: <20240918064955.6518-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WEu7YOiBPgD/ryln"
Content-Disposition: inline
In-Reply-To: <20240918064955.6518-1-macpaul.lin@mediatek.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_050858_886777_5911BCA4 
X-CRM114-Status: GOOD (  12.03  )
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


--WEu7YOiBPgD/ryln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2024 at 02:49:54PM +0800, Macpaul Lin wrote:
> Convert the MT6323 regulator binding from the old text-based format to
> the new DT schema style. The property "regulator-name" has been added
> as required property to reflect current usage in mt6323.dtsi.

Acked-by: Mark Brown <broonie@kernel.org>

--WEu7YOiBPgD/ryln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbtZdIACgkQJNaLcl1U
h9D6ngf/VZ7i9q1LeXU8VJ3HxrkMAX0WECwtWNu9qZxhaPiMOepEhNtSpPFkUAn+
++QnnA56FwzRbteydQ8KQAO5odIeuPue/fBbFYOyugnXuASOUrKPo9DrK0ndH3Tt
gL3J5neZq38dtz5E0/+lvB5V0OfzVOG0h19AaHiY9dsompN0NpZfiQteFhuJb/nm
o3Y5qYJc2fJg1fEUr+bW36AgyYutLsaCvL5Vqxp9B7kpxtkvnZTeLGM+NJtqMwCp
elPRl6clsrLyQQk1LrPLLGBqrrmsXoeUVRgpQccT5Bl2q5iNdEGZw81W7Dv+hv7c
232TH+zLfaBTiYpzLFHcD8BysoeOug==
=j0pA
-----END PGP SIGNATURE-----

--WEu7YOiBPgD/ryln--

